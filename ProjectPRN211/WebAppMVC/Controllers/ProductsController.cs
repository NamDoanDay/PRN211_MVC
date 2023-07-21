using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using AppLibrary.Models;

namespace WebAppMVC.Controllers
{
    public class ProductsController : Controller
    {
        private readonly IHttpContextAccessor contxt;

        private readonly SWP391_OnlineShopContext _context;

        public ProductsController(IHttpContextAccessor httpContextAccessor,SWP391_OnlineShopContext context)
        {
            contxt = httpContextAccessor;
            _context = context;
        }

        // GET: Products
        public IActionResult Index(string? searchString, int? categorySelect)
        {
            ViewData["CurrentFilter"] = searchString;
            ViewData["Categories"] = _context.Categories.ToList();
            ViewData["CurrentCategory"] = categorySelect;
            if (categorySelect == 0 || categorySelect == null)
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
            if (categorySelect != 0 && categorySelect != null)
            {
                products = products.Where(p => p.SubCategory.Category.CategoryId == categorySelect);
            }
            return View( products.ToList());
        }

        // GET: Products/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p => p.Shop)
                .Include(p => p.Status)
                .Include(p => p.SubCategory)
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // GET: Products/Create
        public IActionResult Create()
        {
            ViewData["ShopId"] = new SelectList(_context.Users, "UserId", "UserId");
            ViewData["StatusId"] = new SelectList(_context.ProductStatuses, "StatusId", "StatusId");
            ViewData["SubCategoryId"] = new SelectList(_context.SubCategories, "SubCategoryId", "SubCategoryId");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ProductId,ProductName,Description,OriginalPrice,SellPrice,SalePercent,SubCategoryId,ShopId,Amount,StatusId")] Product product)
        {
            if (ModelState.IsValid)
            {
                _context.Add(product);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["ShopId"] = new SelectList(_context.Users, "UserId", "UserId", product.ShopId);
            ViewData["StatusId"] = new SelectList(_context.ProductStatuses, "StatusId", "StatusId", product.StatusId);
            ViewData["SubCategoryId"] = new SelectList(_context.SubCategories, "SubCategoryId", "SubCategoryId", product.SubCategoryId);
            return View(product);
        }

        // GET: Products/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }

            var product = await _context.Products.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }
            ViewData["ShopId"] = new SelectList(_context.Users, "UserId", "UserId", product.ShopId);
            ViewData["StatusId"] = new SelectList(_context.ProductStatuses, "StatusId", "StatusId", product.StatusId);
            ViewData["SubCategoryId"] = new SelectList(_context.SubCategories, "SubCategoryId", "SubCategoryId", product.SubCategoryId);
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ProductId,ProductName,Description,OriginalPrice,SellPrice,SalePercent,SubCategoryId,ShopId,Amount,StatusId")] Product product)
        {
            if (id != product.ProductId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(product);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductExists(product.ProductId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["ShopId"] = new SelectList(_context.Users, "UserId", "UserId", product.ShopId);
            ViewData["StatusId"] = new SelectList(_context.ProductStatuses, "StatusId", "StatusId", product.StatusId);
            ViewData["SubCategoryId"] = new SelectList(_context.SubCategories, "SubCategoryId", "SubCategoryId", product.SubCategoryId);
            return View(product);
        }

        // GET: Products/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p => p.Shop)
                .Include(p => p.Status)
                .Include(p => p.SubCategory)
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Products == null)
            {
                return Problem("Entity set 'SWP391_OnlineShopContext.Products'  is null.");
            }
            var product = await _context.Products.FindAsync(id);
            if (product != null)
            {
                _context.Products.Remove(product);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProductExists(int id)
        {
          return (_context.Products?.Any(e => e.ProductId == id)).GetValueOrDefault();
        }

        public IActionResult Buy(int? proId)
        {
            int? userRole = contxt.HttpContext.Session.GetInt32("userRole");
            if (userRole == 0|| userRole == null)
            {
                return RedirectToAction("Index","Login");
            }
            
            return RedirectToAction("Create", "OrderDetails",new { proId = proId });
        }

        public IActionResult AddCart(int? proId)
        {
            int? userId = (int)contxt.HttpContext.Session.GetInt32("userID");
            int amount = 0;
            string insertQuery = $"INSERT INTO Cart (ProductID, UserID,Amount) VALUES ({proId}, {userId},{amount})";
            _context.Database.ExecuteSqlRaw(insertQuery);
            return RedirectToAction("Index", "Home");
        }
    }
}
