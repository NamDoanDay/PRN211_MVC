﻿using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class Ship
    {
        public Ship()
        {
            ShipInfos = new HashSet<ShipInfo>();
            UserAddresses = new HashSet<UserAddress>();
        }

        public int Id { get; set; }
        public string? CityName { get; set; }
        public int? ShipPrice { get; set; }

        public virtual ICollection<ShipInfo> ShipInfos { get; set; }
        public virtual ICollection<UserAddress> UserAddresses { get; set; }
    }
}
