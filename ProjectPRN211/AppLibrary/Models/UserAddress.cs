using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class UserAddress
    {
        public int Id { get; set; }
        public int? UserId { get; set; }
        public string? ShipName { get; set; }
        public string? PhoneNum { get; set; }
        public int? ShipCityId { get; set; }
        public string? NoteDetail { get; set; }

        public virtual Ship? ShipCity { get; set; }
        public virtual User? User { get; set; }
    }
}
