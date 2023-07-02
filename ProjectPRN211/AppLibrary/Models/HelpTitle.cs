using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class HelpTitle
    {
        public HelpTitle()
        {
            HelpContents = new HashSet<HelpContent>();
        }

        public int TitleId { get; set; }
        public string? Title { get; set; }
        public int? UserId { get; set; }
        public int? CategoryId { get; set; }

        public virtual HelpCategory? Category { get; set; }
        public virtual User? User { get; set; }
        public virtual ICollection<HelpContent> HelpContents { get; set; }
    }
}
