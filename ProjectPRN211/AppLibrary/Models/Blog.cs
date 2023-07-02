using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class Blog
    {
        public Blog()
        {
            BlogDetails = new HashSet<BlogDetail>();
        }

        public int Id { get; set; }
        public int? Day { get; set; }
        public string? Month { get; set; }
        public int? Year { get; set; }
        public string? BlogTitle { get; set; }
        public string? BlogContent { get; set; }
        public string? ImageLink { get; set; }
        public int? AuthorId { get; set; }

        public virtual User? Author { get; set; }
        public virtual ICollection<BlogDetail> BlogDetails { get; set; }
    }
}
