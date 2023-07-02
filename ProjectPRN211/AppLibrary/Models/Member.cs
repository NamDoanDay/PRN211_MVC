using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class Member
    {
        public int MemberId { get; set; }
        public int? RoomId { get; set; }
        public int? UserId { get; set; }

        public virtual ChatRoom? Room { get; set; }
        public virtual User? User { get; set; }
    }
}
