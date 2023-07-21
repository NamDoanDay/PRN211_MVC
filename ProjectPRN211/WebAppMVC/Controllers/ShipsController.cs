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
        public IActionResult Edit1(int? orderId, Order order)
        {
            int statusNum =(int)order.Status;
            if (orderId == null || statusNum == null)
            {
                return BadRequest();
            }
            var orderInf = _context.Orders.FirstOrDefault(o => o.Id == orderId);
            if (orderInf == null)
            {
                return NotFound(); 
            }
            orderInf.Status = statusNum;
            _context.Orders.Update(orderInf);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult Remove(int? id)
        {
            var orderDetailInf = _context.OrderDetails.FirstOrDefault(od => od.Id == id);
            if (orderDetailInf == null)
            {
                // Xử lý khi không tìm thấy OrderDetail với Id cụ thể
                return NotFound();
            }
            // Xóa các bản ghi trong bảng Notifications có OrderID trùng khớp với OrderDetail.Id
            var notifications = _context.Notifications.Where(n => n.OrderId == orderDetailInf.Id);
            _context.Notifications.RemoveRange(notifications);
            // Lưu thay đổi trước khi xóa OrderDetail
            _context.SaveChanges();
            // Xóa OrderDetail
            _context.OrderDetails.Remove(orderDetailInf);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult Accept(int? id)
        {
            int orderId = (int)_context.OrderDetails.Where(o => o.Id == id).Select(p => p.OrderId).FirstOrDefault();
            var order = _context.Orders.Where(o => o.Id == orderId).FirstOrDefault();
            if (order != null)
            {
                // Change the "Status" property to 2
                order.Status = 2;

                // Save the changes to the database
                _context.SaveChanges();
            }
            return RedirectToAction("Index");
        }
    }
}
