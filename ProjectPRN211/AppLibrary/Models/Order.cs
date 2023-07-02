using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class Order
    {
        public Order()
        {
            Feedbacks = new HashSet<Feedback>();
            Notifications = new HashSet<Notification>();
            OrderDetails = new HashSet<OrderDetail>();
            ShipInfos = new HashSet<ShipInfo>();
        }

        public int Id { get; set; }
        public int? UserId { get; set; }
        public decimal? TotalPrice { get; set; }
        public string? Note { get; set; }
        public int? Status { get; set; }
        public DateTime? Date { get; set; }

        public virtual OrderStatus? StatusNavigation { get; set; }
        public virtual User? User { get; set; }
        public virtual ICollection<Feedback> Feedbacks { get; set; }
        public virtual ICollection<Notification> Notifications { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<ShipInfo> ShipInfos { get; set; }
    }
}
