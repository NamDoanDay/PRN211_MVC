using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class ProductStatus
    {
        public ProductStatus()
        {
            Products = new HashSet<Product>();
        }

        public int StatusId { get; set; }
        public string? StatusName { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
