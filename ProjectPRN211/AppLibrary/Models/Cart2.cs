using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppLibrary.Models
{
    public partial class Cart2
    {
        public int id { get; set; }
        public int uId { get; set; }
        public int proId { get; set; }
        public virtual Product? Product { get; set; }
        public virtual User? User { get; set; }
    }
}
