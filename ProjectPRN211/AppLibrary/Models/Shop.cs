using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class Shop
    {
        public Shop()
        {
            Users = new HashSet<User>();
        }

        public int Id { get; set; }
        public string? ShopName { get; set; }

        public virtual ICollection<User> Users { get; set; }
    }
}
