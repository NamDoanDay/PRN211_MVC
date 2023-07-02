using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class Messsage
    {
        public int MessageId { get; set; }
        public int? RoomId { get; set; }
        public int? UserId { get; set; }
        public string? Message { get; set; }
        public DateTime? Date { get; set; }

        public virtual ChatRoom? Room { get; set; }
        public virtual User? User { get; set; }
    }
}
