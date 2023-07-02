using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class Category
    {
        public Category()
        {
            SubCategories = new HashSet<SubCategory>();
        }

        public int CategoryId { get; set; }
        public string? CategoryName { get; set; }
        public string? CategoryImgUrl { get; set; }

        public virtual ICollection<SubCategory> SubCategories { get; set; }
    }
}
