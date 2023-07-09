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
                return BadRequest(); // Xử lý trường hợp orderId hoặc status không hợp lệ
            }

            // Lấy đối tượng Order từ cơ sở dữ liệu dựa trên orderId
            var order = _context.Orders.FirstOrDefault(o => o.OrderId == orderId);

            if (order == null)
            {
                return NotFound(); // Xử lý trường hợp không tìm thấy đối tượng Order với orderId tương ứng
            }

            // Cập nhật thuộc tính Status của đối tượng Order
            order.Status = status.Value;

            // Lưu thay đổi vào cơ sở dữ liệu
            _context.SaveChanges();

            return RedirectToAction("Index"); // Chẳng hạn, chuyển hướng đến action Index
        }
    }
}
