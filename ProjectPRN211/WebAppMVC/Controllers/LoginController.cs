using AppLibrary.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Session;

namespace WebAppMVC.Controllers
{
    public class LoginController : Controller
    {
        private readonly IHttpContextAccessor contxt;

        private readonly SWP391_OnlineShopContext _context;

        public LoginController(IHttpContextAccessor httpContextAccessor,SWP391_OnlineShopContext context) {
            contxt = httpContextAccessor;
            _context = context; 
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Index([Bind("Username,Password")] User user)
        {
            if (ModelState.IsValid)
            {
                var userID = _context.Users.Where(u => u.Username == user.Username && u.Password == user.Password).Select(u => u.UserId).FirstOrDefault();
                var userRole = _context.Users.Where(u => u.Username == user.Username && u.Password == user.Password).Select(u => u.RoleId).FirstOrDefault();
                var userCheck = _context.Users.SingleOrDefault(u => u.Username == user.Username && u.Password == user.Password);

                if (userCheck != null)
                {
                    contxt.HttpContext.Session.SetInt32("userRole", (int)userRole);
                    return RedirectToAction("Index", "Home");
                }

                ModelState.AddModelError("", "Thông tin đăng nhập không đúng");
            }
            return View(user);
        }

        public IActionResult SignIn()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> SignIn([Bind("UserId,Username,Password,Fullname,Phone,Gender,Email")] User user)
        {
            if (ModelState.IsValid)
            {
                _context.Add(user);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(user);
        }

    }
    
}
