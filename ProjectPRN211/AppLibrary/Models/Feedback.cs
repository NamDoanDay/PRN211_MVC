using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class Feedback
    {
        public Feedback()
        {
            FeedbackReplies = new HashSet<FeedbackReply>();
        }

        public int Id { get; set; }
        public int? UserId { get; set; }
        public int? ProductId { get; set; }
        public int? OrderId { get; set; }
        public int? Star { get; set; }
        public string? FeedbackDetail { get; set; }

        public virtual Order? Order { get; set; }
        public virtual Product? Product { get; set; }
        public virtual User? User { get; set; }
        public virtual ICollection<FeedbackReply> FeedbackReplies { get; set; }
    }
}
