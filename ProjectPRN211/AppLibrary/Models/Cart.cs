using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class Cart
    {
        //public int? id { get; set; }
        public int? UserId { get; set; }
        public int? ProductId { get; set; }
        public int? Amount { get; set; }

        public virtual Product? Product { get; set; }
        public virtual User? User { get; set; }
    }
}
