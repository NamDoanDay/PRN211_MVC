using System;
using System.Collections.Generic;

namespace AppLibrary.Models
{
    public partial class User
    {
        public User()
        {
            Blogs = new HashSet<Blog>();
            FeedbackReplies = new HashSet<FeedbackReply>();
            Feedbacks = new HashSet<Feedback>();
            HelpTitles = new HashSet<HelpTitle>();
            Members = new HashSet<Member>();
            Messsages = new HashSet<Messsage>();
            Notifications = new HashSet<Notification>();
            Orders = new HashSet<Order>();
            Products = new HashSet<Product>();
            UserAddresses = new HashSet<UserAddress>();
        }

        public int UserId { get; set; }
        public string? Username { get; set; }
        public string? Password { get; set; }
        public string? Fullname { get; set; }
        public string? Phone { get; set; }
        public bool? Gender { get; set; }
        public string? Email { get; set; }
        public int? RoleId { get; set; }
        public int? ShopId { get; set; }
        public int? StatusId { get; set; }

        public virtual Role? Role { get; set; }
        public virtual Shop? Shop { get; set; }
        public virtual UserStatus? Status { get; set; }
        public virtual ICollection<Blog> Blogs { get; set; }
        public virtual ICollection<FeedbackReply> FeedbackReplies { get; set; }
        public virtual ICollection<Feedback> Feedbacks { get; set; }
        public virtual ICollection<HelpTitle> HelpTitles { get; set; }
        public virtual ICollection<Member> Members { get; set; }
        public virtual ICollection<Messsage> Messsages { get; set; }
        public virtual ICollection<Notification> Notifications { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<Product> Products { get; set; }
        public virtual ICollection<UserAddress> UserAddresses { get; set; }
    }
}
