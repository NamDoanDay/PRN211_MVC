using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;

namespace AppLibrary.Models
{
    public partial class SWP391_OnlineShopContext : DbContext
    {
        public SWP391_OnlineShopContext()
        {
        }

        public SWP391_OnlineShopContext(DbContextOptions<SWP391_OnlineShopContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Banner> Banners { get; set; } = null!;
        public virtual DbSet<Blog> Blogs { get; set; } = null!;
        public virtual DbSet<BlogDetail> BlogDetails { get; set; } = null!;
        public virtual DbSet<Cart> Carts { get; set; } = null!;
        public virtual DbSet<Cart2> Cart2s { get; set; } = null!;
        public virtual DbSet<Category> Categories { get; set; } = null!;
        public virtual DbSet<ChatRoom> ChatRooms { get; set; } = null!;
        public virtual DbSet<Delivery> Deliveries { get; set; } = null!;
        public virtual DbSet<Feedback> Feedbacks { get; set; } = null!;
        public virtual DbSet<FeedbackReply> FeedbackReplies { get; set; } = null!;
        public virtual DbSet<HelpCategory> HelpCategories { get; set; } = null!;
        public virtual DbSet<HelpContent> HelpContents { get; set; } = null!;
        public virtual DbSet<HelpTitle> HelpTitles { get; set; } = null!;
        public virtual DbSet<Member> Members { get; set; } = null!;
        public virtual DbSet<Messsage> Messsages { get; set; } = null!;
        public virtual DbSet<Notification> Notifications { get; set; } = null!;
        public virtual DbSet<Order> Orders { get; set; } = null!;
        public virtual DbSet<OrderDetail> OrderDetails { get; set; } = null!;
        public virtual DbSet<OrderStatus> OrderStatuses { get; set; } = null!;
        public virtual DbSet<Product> Products { get; set; } = null!;
        public virtual DbSet<ProductImg> ProductImgs { get; set; } = null!;
        public virtual DbSet<ProductStatus> ProductStatuses { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<Ship> Ships { get; set; } = null!;
        public virtual DbSet<ShipInfo> ShipInfos { get; set; } = null!;
        public virtual DbSet<Shop> Shops { get; set; } = null!;
        public virtual DbSet<SubCategory> SubCategories { get; set; } = null!;
        public virtual DbSet<Tracking> Trackings { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;
        public virtual DbSet<UserAddress> UserAddresses { get; set; } = null!;
        public virtual DbSet<UserStatus> UserStatuses { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                var ConnectionString = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build().GetConnectionString("DefaultConnection");
                optionsBuilder.UseSqlServer(ConnectionString);
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Banner>(entity =>
            {
                entity.ToTable("Banner");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Desc)
                    .HasMaxLength(2500)
                    .HasColumnName("desc");

                entity.Property(e => e.Img)
                    .HasMaxLength(2500)
                    .IsUnicode(false);

                entity.Property(e => e.Title).HasMaxLength(2500);
            });

            modelBuilder.Entity<Blog>(entity =>
            {
                entity.ToTable("Blog");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.AuthorId).HasColumnName("AuthorID");

                entity.Property(e => e.BlogContent).HasMaxLength(2500);

                entity.Property(e => e.BlogTitle).HasMaxLength(2500);

                entity.Property(e => e.ImageLink)
                    .HasMaxLength(1000)
                    .HasColumnName("imageLink");

                entity.Property(e => e.Month).HasMaxLength(20);

                entity.HasOne(d => d.Author)
                    .WithMany(p => p.Blogs)
                    .HasForeignKey(d => d.AuthorId)
                    .HasConstraintName("AuthorID");
            });

            modelBuilder.Entity<BlogDetail>(entity =>
            {
                entity.ToTable("BlogDetail");

                entity.Property(e => e.BlogDetailId).HasColumnName("BlogDetailID");

                entity.Property(e => e.BlogId).HasColumnName("BlogID");

                entity.Property(e => e.Content).HasMaxLength(2500);

                entity.Property(e => e.ImgBlogDetail)
                    .HasMaxLength(1000)
                    .HasColumnName("imgBlogDetail");

                entity.Property(e => e.Title).HasMaxLength(2500);

                entity.HasOne(d => d.Blog)
                    .WithMany(p => p.BlogDetails)
                    .HasForeignKey(d => d.BlogId)
                    .HasConstraintName("BlogID");
            });

            modelBuilder.Entity<Cart>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("Cart");

                entity.Property(e => e.ProductId).HasColumnName("ProductID");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Product)
                    .WithMany()
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("productID_in_cart");

                entity.HasOne(d => d.User)
                    .WithMany()
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("userID_in_cart");
            });

            modelBuilder.Entity<Cart2>(entity =>
            {
                entity.ToTable("Cart2");

                entity.Property(e => e.id).HasColumnName("id");

                entity.Property(e => e.proId).HasColumnName("proId");

                entity.Property(e => e.uId).HasColumnName("uId");

                entity.HasOne(d => d.Product)
                    .WithMany()
                    .HasForeignKey(d => d.proId)
                    .HasConstraintName("FK_Cart2_Product");

                entity.HasOne(d => d.User)
                    .WithMany()
                    .HasForeignKey(d => d.uId)
                    .HasConstraintName("FK_Cart2_Users");
            });

            modelBuilder.Entity<Category>(entity =>
            {
                entity.ToTable("Category");

                entity.Property(e => e.CategoryId).HasColumnName("CategoryID");

                entity.Property(e => e.CategoryImgUrl)
                    .HasMaxLength(225)
                    .IsUnicode(false)
                    .HasColumnName("CategoryImgURL");

                entity.Property(e => e.CategoryName).HasMaxLength(1000);
            });

            modelBuilder.Entity<ChatRoom>(entity =>
            {
                entity.HasKey(e => e.RoomId)
                    .HasName("PK__chat_roo__19675A8A93558FF4");

                entity.ToTable("chat_room");

                entity.Property(e => e.RoomId).HasColumnName("room_id");

                entity.Property(e => e.IsPrivate).HasColumnName("is_Private");

                entity.Property(e => e.Name)
                    .HasMaxLength(200)
                    .HasColumnName("name");
            });

            modelBuilder.Entity<Delivery>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("Delivery");

                entity.Property(e => e.Id)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ID");

                entity.Property(e => e.ShipInfoId).HasColumnName("ShipInfoID");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.ShipInfo)
                    .WithMany()
                    .HasForeignKey(d => d.ShipInfoId)
                    .HasConstraintName("FK__Delivery__ShipIn__5BE2A6F2");

                entity.HasOne(d => d.User)
                    .WithMany()
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK__Delivery__UserID__5CD6CB2B");
            });

            modelBuilder.Entity<Feedback>(entity =>
            {
                entity.ToTable("Feedback");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.FeedbackDetail).HasMaxLength(2000);

                entity.Property(e => e.OrderId).HasColumnName("OrderID");

                entity.Property(e => e.ProductId).HasColumnName("ProductID");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.Feedbacks)
                    .HasForeignKey(d => d.OrderId)
                    .HasConstraintName("orderID_in_orders_6");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Feedbacks)
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("productID_in_feedback");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Feedbacks)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("userID_in_user_3");
            });

            modelBuilder.Entity<FeedbackReply>(entity =>
            {
                entity.ToTable("Feedback_Replies");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.FeedbackId).HasColumnName("FeedbackID");

                entity.Property(e => e.RepliesText).HasMaxLength(2000);

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Feedback)
                    .WithMany(p => p.FeedbackReplies)
                    .HasForeignKey(d => d.FeedbackId)
                    .HasConstraintName("feedbackID_in_feedback");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.FeedbackReplies)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("userID_in_user_4");
            });

            modelBuilder.Entity<HelpCategory>(entity =>
            {
                entity.HasKey(e => e.CategoryId)
                    .HasName("PK__HelpCate__19093A2B26130374");

                entity.ToTable("HelpCategory");

                entity.Property(e => e.CategoryId).HasColumnName("CategoryID");

                entity.Property(e => e.CategoryName).HasMaxLength(1000);

                entity.Property(e => e.Image)
                    .HasMaxLength(225)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<HelpContent>(entity =>
            {
                entity.HasKey(e => e.ContentId)
                    .HasName("PK__HelpCont__2907A87E2875277A");

                entity.ToTable("HelpContent");

                entity.Property(e => e.ContentId).HasColumnName("ContentID");

                entity.Property(e => e.Content).HasMaxLength(2500);

                entity.Property(e => e.TitleId).HasColumnName("TitleID");

                entity.HasOne(d => d.Title)
                    .WithMany(p => p.HelpContents)
                    .HasForeignKey(d => d.TitleId)
                    .HasConstraintName("TitleID");
            });

            modelBuilder.Entity<HelpTitle>(entity =>
            {
                entity.HasKey(e => e.TitleId)
                    .HasName("PK__HelpTitl__757589E6F41F0067");

                entity.ToTable("HelpTitle");

                entity.Property(e => e.TitleId).HasColumnName("TitleID");

                entity.Property(e => e.CategoryId).HasColumnName("CategoryID");

                entity.Property(e => e.Title).HasMaxLength(2500);

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.HelpTitles)
                    .HasForeignKey(d => d.CategoryId)
                    .HasConstraintName("CategoryID_in_HelpTitle");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.HelpTitles)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("userID_in_user_5");
            });

            modelBuilder.Entity<Member>(entity =>
            {
                entity.ToTable("member");

                entity.Property(e => e.MemberId).HasColumnName("member_id");

                entity.Property(e => e.RoomId).HasColumnName("room_id");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Room)
                    .WithMany(p => p.Members)
                    .HasForeignKey(d => d.RoomId)
                    .HasConstraintName("FK__member__room_id__656C112C");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Members)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK__member__UserID__66603565");
            });

            modelBuilder.Entity<Messsage>(entity =>
            {
                entity.HasKey(e => e.MessageId)
                    .HasName("PK__messsage__0BBF6EE6F87C219C");

                entity.ToTable("messsages");

                entity.Property(e => e.MessageId).HasColumnName("message_id");

                entity.Property(e => e.Date).HasColumnType("date");

                entity.Property(e => e.Message).HasMaxLength(1000);

                entity.Property(e => e.RoomId).HasColumnName("room_id");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Room)
                    .WithMany(p => p.Messsages)
                    .HasForeignKey(d => d.RoomId)
                    .HasConstraintName("FK__messsages__room___6754599E");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Messsages)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK__messsages__UserI__68487DD7");
            });

            modelBuilder.Entity<Notification>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Content).HasMaxLength(1000);

                entity.Property(e => e.OrderId).HasColumnName("OrderID");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.Time)
                    .HasColumnType("datetime")
                    .HasColumnName("time");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.Notifications)
                    .HasForeignKey(d => d.OrderId)
                    .HasConstraintName("OrderID_in_Orders");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Notifications)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("UserID_in_Users");
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Date).HasColumnType("datetime");

                entity.Property(e => e.Note).HasMaxLength(2000);

                entity.Property(e => e.TotalPrice).HasColumnType("money");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.StatusNavigation)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.Status)
                    .HasConstraintName("statusID_in_order_status");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("userID_in_order_status");
            });

            modelBuilder.Entity<OrderDetail>(entity =>
            {
                entity.ToTable("Order_Detail");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.OrderId).HasColumnName("Order_ID");

                entity.Property(e => e.ProductId).HasColumnName("ProductID");

                entity.Property(e => e.ProductName).HasMaxLength(1000);

                entity.Property(e => e.ProductPrice).HasColumnType("money");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.OrderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("orderID_in_order_detail");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("productID_in_order_detail");
            });

            modelBuilder.Entity<OrderStatus>(entity =>
            {
                entity.ToTable("Order_Status");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Name).HasMaxLength(50);
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.ToTable("Product");

                entity.Property(e => e.ProductId).HasColumnName("ProductID");

                entity.Property(e => e.Description).HasMaxLength(2000);

                entity.Property(e => e.OriginalPrice).HasColumnType("money");

                entity.Property(e => e.ProductName).HasMaxLength(1000);

                entity.Property(e => e.SellPrice).HasColumnType("money");

                entity.Property(e => e.ShopId).HasColumnName("ShopID");
/*
                entity.Property(e => e.StatusId).HasColumnName("StatusID");
*/
                entity.Property(e => e.SubCategoryId).HasColumnName("SubCategoryID");

                entity.HasOne(d => d.Shop)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.ShopId)
                    .HasConstraintName("ShopID_in_Shop");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.Products)
/*                    .HasForeignKey(d => d.StatusId)*/
                    .HasConstraintName("StatusID_in_Status");

                entity.HasOne(d => d.SubCategory)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.SubCategoryId)
                    .HasConstraintName("product_in_subCategory");
            });

            modelBuilder.Entity<ProductImg>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("ProductImg");

                entity.Property(e => e.ProductId).HasColumnName("ProductID");

                entity.Property(e => e.ProductImgUrl)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("ProductImgURL");

                entity.HasOne(d => d.Product)
                    .WithMany()
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("ProductImg_ID");
            });

            modelBuilder.Entity<ProductStatus>(entity =>
            {
                entity.HasKey(e => e.StatusId)
                    .HasName("PK__ProductS__C8EE2043BBC593CA");

                entity.ToTable("ProductStatus");

                entity.Property(e => e.StatusId).HasColumnName("StatusID");

                entity.Property(e => e.StatusName).HasMaxLength(1000);
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("Role");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.RoleName).HasMaxLength(20);
            });

            modelBuilder.Entity<Ship>(entity =>
            {
                entity.ToTable("Ship");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CityName).HasMaxLength(1000);
            });

            modelBuilder.Entity<ShipInfo>(entity =>
            {
                entity.ToTable("ShipInfo");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.CustomerName).HasMaxLength(1000);

                entity.Property(e => e.Note).HasMaxLength(2000);

                entity.Property(e => e.OrderId).HasColumnName("Order_ID");

                entity.Property(e => e.PhoneNum)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.ShipCityId).HasColumnName("ShipCityID");

                entity.Property(e => e.ShippingAddress).HasMaxLength(1000);

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.ShipInfos)
                    .HasForeignKey(d => d.OrderId)
                    .HasConstraintName("order_id_in_ship_info");

                entity.HasOne(d => d.ShipCity)
                    .WithMany(p => p.ShipInfos)
                    .HasForeignKey(d => d.ShipCityId)
                    .HasConstraintName("ship_city_in_ship_info");
            });

            modelBuilder.Entity<Shop>(entity =>
            {
                entity.ToTable("Shop");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.ShopName).HasMaxLength(1000);
            });

            modelBuilder.Entity<SubCategory>(entity =>
            {
                entity.ToTable("SubCategory");

                entity.Property(e => e.SubCategoryId).HasColumnName("SubCategoryID");

                entity.Property(e => e.CategoryId).HasColumnName("CategoryID");

                entity.Property(e => e.SubCategoryName).HasMaxLength(255);

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.SubCategories)
                    .HasForeignKey(d => d.CategoryId)
                    .HasConstraintName("CategoryID");
            });

            modelBuilder.Entity<Tracking>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("tracking");

                entity.Property(e => e.LastUpdate)
                    .HasColumnType("date")
                    .HasColumnName("lastUpdate");

                entity.Property(e => e.NoDay).HasColumnName("no_day");

                entity.Property(e => e.Num).HasColumnName("num");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.Property(e => e.Email)
                    .HasMaxLength(1000)
                    .HasColumnName("email");

                entity.Property(e => e.Fullname)
                    .HasMaxLength(500)
                    .HasColumnName("fullname");

                entity.Property(e => e.Gender).HasColumnName("gender");

                entity.Property(e => e.Password)
                    .HasMaxLength(1000)
                    .IsUnicode(false)
                    .HasColumnName("password");

                entity.Property(e => e.Phone)
                    .HasMaxLength(20)
                    .HasColumnName("phone");

                entity.Property(e => e.RoleId).HasColumnName("RoleID");

                entity.Property(e => e.ShopId).HasColumnName("ShopID");

                entity.Property(e => e.StatusId).HasColumnName("StatusID");

                entity.Property(e => e.Username)
                    .HasMaxLength(500)
                    .HasColumnName("username");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("role_in_Role");

                entity.HasOne(d => d.Shop)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.ShopId)
                    .HasConstraintName("ShopID");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("Status_ID_in_Status");
            });

            modelBuilder.Entity<UserAddress>(entity =>
            {
                entity.ToTable("UserAddress");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.NoteDetail).HasMaxLength(1000);

                entity.Property(e => e.PhoneNum).HasMaxLength(20);

                entity.Property(e => e.ShipCityId).HasColumnName("ShipCityID");

                entity.Property(e => e.ShipName).HasMaxLength(500);

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.ShipCity)
                    .WithMany(p => p.UserAddresses)
                    .HasForeignKey(d => d.ShipCityId)
                    .HasConstraintName("ship_city_in_ship_address");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserAddresses)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("UserID");
            });

            modelBuilder.Entity<UserStatus>(entity =>
            {
                entity.ToTable("UserStatus");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.StatusName).HasMaxLength(1000);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
