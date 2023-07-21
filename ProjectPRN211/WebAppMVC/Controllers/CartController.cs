using AppLibrary.Models;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using AppLibrary.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Http;

namespace WebAppMVC.Controllers
{
    public class CartController : Controller
    {
        private readonly IHttpContextAccessor contxt;
        private readonly SWP391_OnlineShopContext _context;
        public CartController(SWP391_OnlineShopContext context, IHttpContextAccessor httpContextAccessor) {
            _context = context;
            contxt = httpContextAccessor;
        }
        public IActionResult Index(int? userId)
        {
            var cart = _context.Carts.Include(c => c.Product).Where(p=>p.UserId== userId).ToList();
            return View(cart);
        }
        //public IActionResult Delete(int? id)
        //{
        //    int? userId = (int)contxt.HttpContext.Session.GetInt32("userID");
        //    var cart = _context.Carts.Where(p => p.ProductId== id && p.UserId == userId).FirstOrDefault();
        //    _context.Carts.Remove(cart);
        //    return View(nameof(Index));
        //}
        public IActionResult Delete(int? id)
        {
            int? userId = contxt.HttpContext.Session.GetInt32("userID");

            if (!id.HasValue || !userId.HasValue)
            {
                return RedirectToAction("Index");
            }

            string deleteQuery = $"DELETE FROM Cart WHERE ProductID = {id} AND UserID = {userId}";
            _context.Database.ExecuteSqlRaw(deleteQuery);

            return RedirectToAction("Index", new { userId = userId });
        }

    }
}
