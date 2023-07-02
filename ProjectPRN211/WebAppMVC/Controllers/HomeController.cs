using AppLibrary.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using WebAppMVC.Models;

namespace UniversityWebAppMVC.Controllers
{
    public class HomeController : Controller
    {

        private readonly ILogger<HomeController> _logger;
        private readonly SWP391_OnlineShopContext _context;

        public HomeController(ILogger<HomeController> logger,SWP391_OnlineShopContext context)
        {
            _context = context;
            _logger = logger;
        }

        public IActionResult Index(int? categorySelect, string? searchString)
        {
            ViewData["CurrentFilter"] = searchString;
            ViewData["Categories"] = _context.Categories.ToList();
            if (categorySelect ==0 || categorySelect==null)
            {
                ViewData["CurrentCategory"] = "All";

            }
            else
            {
                ViewData["CurrentCategory"] = _context.Categories
                .Where(c => c.CategoryId == categorySelect)
                .Select(c => c.CategoryName)
                .FirstOrDefault();
            }

            var products = from s in _context.Products select s;
            if (!String.IsNullOrEmpty(searchString))
            {
                products = products.Where(s => s.ProductName.Contains(searchString));
            }
            if(categorySelect!=0 && categorySelect!=null) {
                products = products.Where(p => p.SubCategory.Category.CategoryId == categorySelect);
            }
            ViewData["Products"] = products.ToList();
            var blogs = _context.BlogDetails.Include(b => b.Blog);
            return View(blogs.ToList());
        }

        #region MyRegion//CreateProductBlogViewModel
        //public IActionResult Index()
        //{
        //    var products = GetProducts();
        //    var blogs = GetBlogs();

        //    var model = new ProductBlogViewModel
        //    {
        //        Products = products,
        //        Blogs = blogs
        //    };

        //    return View(model);
        //}

        //private List<Product> GetProducts()
        //{
        //}

        //private List<Blog> GetBlogs()
        //{
        //}
        #endregion

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}