using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class ChatRoom
    {
        public ChatRoom()
        {
            Members = new HashSet<Member>();
            Messsages = new HashSet<Messsage>();
        }

        public int RoomId { get; set; }
        public bool? IsPrivate { get; set; }
        public string? Name { get; set; }

        public virtual ICollection<Member> Members { get; set; }
        public virtual ICollection<Messsage> Messsages { get; set; }
    }
}
