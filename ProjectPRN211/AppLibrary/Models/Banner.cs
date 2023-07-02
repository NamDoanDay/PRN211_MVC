using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class Banner
    {
        public int Id { get; set; }
        public string? Img { get; set; }
        public string? Title { get; set; }
        public string? Desc { get; set; }
    }
}
