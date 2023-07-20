using AppLibrary.Models;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using AppLibrary.Models;

namespace WebAppMVC.Controllers
{
    public class CartController : Controller
    {
        private readonly SWP391_OnlineShopContext _context;
        public CartController(SWP391_OnlineShopContext context) {
            _context = context;
        }
        public IActionResult Index(int userId)
        {
            var cart = _context.Cart2s.Where(c => c.uId == userId).ToList();
            return View(cart);
        }

    }
}
