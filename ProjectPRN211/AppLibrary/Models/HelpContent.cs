using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class HelpContent
    {
        public int ContentId { get; set; }
        public string? Content { get; set; }
        public int? TitleId { get; set; }

        public virtual HelpTitle? Title { get; set; }
    }
}
