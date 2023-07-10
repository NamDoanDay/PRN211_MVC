using AppLibrary.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace WebAppMVC.Controllers
{
    public class ShipsController : Controller
    {
        private readonly SWP391_OnlineShopContext _context;
        public ShipsController(SWP391_OnlineShopContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var productShip = _context.OrderDetails.Include(o => o.Order).ThenInclude(u => u.User).Include(o => o.Product);
            return View(productShip.ToList());
        }
        //public IActionResult Edit(int? id)
        //{
        //    var productEdit = _context.OrderDetails.Where(o => o.Id == id);
        //    productEdit = productEdit.Include(o => o.Order).ThenInclude(u => u.User).Include(o => o.Product);
        //    ViewData["productEdit"] = productEdit;
        //    return View();
        //}
        public IActionResult Edit(int? id)
        {
            var productEdit = _context.OrderDetails
                .Include(o => o.Order)
                .ThenInclude(u => u.User)
                .Include(o => o.Product)
                .FirstOrDefault(o => o.Id == id);

            if (productEdit == null)
            {
                return NotFound(); // Xử lý trường hợp không tìm thấy sản phẩm với ID tương ứng
            }
            return View(productEdit); // Truyền đối tượng OrderDetail vào View()
        }


        [HttpPost]
        public IActionResult Edit1(int? orderId, int? status)
        {
            if (orderId == null || status == null)
            {
                return BadRequest();
            }
            var order = _context.Orders.FirstOrDefault(o => o.Id == orderId);
            if (order == null)
            {
                return NotFound(); 
            }
            order.Status = status.Value;
            _context.SaveChanges();
            return View(nameof(Index));
        }
    }
}
