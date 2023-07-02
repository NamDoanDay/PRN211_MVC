using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class Delivery
    {
        public int Id { get; set; }
        public int? ShipInfoId { get; set; }
        public int? UserId { get; set; }
        public int? Status { get; set; }

        public virtual ShipInfo? ShipInfo { get; set; }
        public virtual User? User { get; set; }
    }
}
