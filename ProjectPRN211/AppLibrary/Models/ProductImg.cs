using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class ProductImg
    {
        public int? ProductId { get; set; }
        public string? ProductImgUrl { get; set; }

        public virtual Product? Product { get; set; }
    }
}
