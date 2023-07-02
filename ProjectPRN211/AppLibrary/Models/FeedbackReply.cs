using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class FeedbackReply
    {
        public int Id { get; set; }
        public int? FeedbackId { get; set; }
        public int? UserId { get; set; }
        public string? RepliesText { get; set; }

        public virtual Feedback? Feedback { get; set; }
        public virtual User? User { get; set; }
    }
}
