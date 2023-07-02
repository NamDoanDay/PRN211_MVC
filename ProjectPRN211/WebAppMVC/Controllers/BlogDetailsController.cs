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
    public class BlogDetailsController : Controller
    {
        private readonly SWP391_OnlineShopContext _context;

        public BlogDetailsController(SWP391_OnlineShopContext context)
        {
            _context = context;
        }

        // GET: BlogDetails
        public async Task<IActionResult> Index()
        {
            var sWP391_OnlineShopContext = _context.BlogDetails.Include(b => b.Blog);
            return View(await sWP391_OnlineShopContext.ToListAsync());
        }

        // GET: BlogDetails/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.BlogDetails == null)
            {
                return NotFound();
            }

            var blogDetail = await _context.BlogDetails
                .Include(b => b.Blog)
                .FirstOrDefaultAsync(m => m.BlogDetailId == id);
            if (blogDetail == null)
            {
                return NotFound();
            }

            return View(blogDetail);
        }

        // GET: BlogDetails/Create
        public IActionResult Create()
        {
            ViewData["BlogId"] = new SelectList(_context.Blogs, "Id", "Id");
            return View();
        }

        // POST: BlogDetails/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("BlogDetailId,Title,Content,ImgBlogDetail,BlogId")] BlogDetail blogDetail)
        {
            if (ModelState.IsValid)
            {
                _context.Add(blogDetail);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["BlogId"] = new SelectList(_context.Blogs, "Id", "Id", blogDetail.BlogId);
            return View(blogDetail);
        }

        // GET: BlogDetails/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.BlogDetails == null)
            {
                return NotFound();
            }

            var blogDetail = await _context.BlogDetails.FindAsync(id);
            if (blogDetail == null)
            {
                return NotFound();
            }
            ViewData["BlogId"] = new SelectList(_context.Blogs, "Id", "Id", blogDetail.BlogId);
            return View(blogDetail);
        }

        // POST: BlogDetails/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("BlogDetailId,Title,Content,ImgBlogDetail,BlogId")] BlogDetail blogDetail)
        {
            if (id != blogDetail.BlogDetailId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(blogDetail);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BlogDetailExists(blogDetail.BlogDetailId))
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
            ViewData["BlogId"] = new SelectList(_context.Blogs, "Id", "Id", blogDetail.BlogId);
            return View(blogDetail);
        }

        // GET: BlogDetails/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.BlogDetails == null)
            {
                return NotFound();
            }

            var blogDetail = await _context.BlogDetails
                .Include(b => b.Blog)
                .FirstOrDefaultAsync(m => m.BlogDetailId == id);
            if (blogDetail == null)
            {
                return NotFound();
            }

            return View(blogDetail);
        }

        // POST: BlogDetails/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.BlogDetails == null)
            {
                return Problem("Entity set 'SWP391_OnlineShopContext.BlogDetails'  is null.");
            }
            var blogDetail = await _context.BlogDetails.FindAsync(id);
            if (blogDetail != null)
            {
                _context.BlogDetails.Remove(blogDetail);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool BlogDetailExists(int id)
        {
          return (_context.BlogDetails?.Any(e => e.BlogDetailId == id)).GetValueOrDefault();
        }
    }
}
