using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class Notification
    {
        public int Id { get; set; }
        public int? UserId { get; set; }
        public int? OrderId { get; set; }
        public string? Content { get; set; }
        public int? Status { get; set; }
        public DateTime? Time { get; set; }

        public virtual Order? Order { get; set; }
        public virtual User? User { get; set; }
    }
}
