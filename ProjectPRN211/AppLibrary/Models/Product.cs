using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class Product
    {
        public Product()
        {
            Feedbacks = new HashSet<Feedback>();
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int ProductId { get; set; }
        public string? ProductName { get; set; }
        public string? Description { get; set; }
        public decimal? OriginalPrice { get; set; }
        public decimal? SellPrice { get; set; }
        public int? SalePercent { get; set; }
        public int? SubCategoryId { get; set; }
        public int? ShopId { get; set; }
        public int? Amount { get; set; }
        public int? StatuxsId { get; set; }

        public virtual User? Shop { get; set; }
        public virtual ProductStatus? Status { get; set; }
        public virtual SubCategory? SubCategory { get; set; }
        public virtual ICollection<Feedback> Feedbacks { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
