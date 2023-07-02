using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class HelpCategory
    {
        public HelpCategory()
        {
            HelpTitles = new HashSet<HelpTitle>();
        }

        public int CategoryId { get; set; }
        public string? CategoryName { get; set; }
        public string? Image { get; set; }

        public virtual ICollection<HelpTitle> HelpTitles { get; set; }
    }
}
