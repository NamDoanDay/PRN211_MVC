using AppLibrary.Models;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace WebAppMVC.Models
{
    public class ProductCategoryBlogViewModel
    {
        private List<Blog>? Blogs { get; set; }
        public List<Product>? Products { get; set; }
        public SelectList? Category { get; set; }
        public string? CategoryGenre { get; set; }
        public string? SearchString { get; set; }
    }
}
