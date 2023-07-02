using AppLibrary.Models;
using Microsoft.AspNetCore.Mvc;

namespace WebAppMVC.Controllers
{
    public class LoginController : Controller
    {
        private readonly SWP391_OnlineShopContext _context;
        public LoginController(SWP391_OnlineShopContext context) { _context = context; }
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Index([Bind("Username,Password")] User user)
        {
            var userID = _context.Users.Where(u => u.Username == user.Username && u.Password == user.Password).Select(u => u.UserId).FirstOrDefault();
            var userRole = _context.Users.Where(u => u.Username == user.Username && u.Password == user.Password).Select(u => u.RoleId).FirstOrDefault();

            if (userID != 0)
            {
                return RedirectToAction("Index", "Users");
            }
            else
            {
                // Đăng nhập không thành công, hiển thị thông báo lỗi
                ModelState.AddModelError("", "Thông tin đăng nhập không đúng");
                return View(user);
            }
        }
        
    }

}
