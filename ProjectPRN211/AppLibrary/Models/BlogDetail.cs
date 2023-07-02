using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class BlogDetail
    {
        public int BlogDetailId { get; set; }
        public string? Title { get; set; }
        public string? Content { get; set; }
        public string? ImgBlogDetail { get; set; }
        public int? BlogId { get; set; }

        public virtual Blog? Blog { get; set; }
    }
}
