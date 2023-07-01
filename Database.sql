USE [master]
GO
/****** Object:  Database [SWP391_OnlineShop]    Script Date: 1/07/2023 5:36:15 PM ******/
CREATE DATABASE [SWP391_OnlineShop]
GO
ALTER DATABASE [SWP391_OnlineShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP391_OnlineShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP391_OnlineShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP391_OnlineShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP391_OnlineShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP391_OnlineShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP391_OnlineShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP391_OnlineShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP391_OnlineShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP391_OnlineShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP391_OnlineShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP391_OnlineShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP391_OnlineShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP391_OnlineShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP391_OnlineShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP391_OnlineShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP391_OnlineShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP391_OnlineShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP391_OnlineShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP391_OnlineShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP391_OnlineShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP391_OnlineShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP391_OnlineShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP391_OnlineShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP391_OnlineShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP391_OnlineShop] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391_OnlineShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391_OnlineShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP391_OnlineShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP391_OnlineShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SWP391_OnlineShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP391_OnlineShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SWP391_OnlineShop', N'ON'
GO
ALTER DATABASE [SWP391_OnlineShop] SET QUERY_STORE = OFF
GO
USE [SWP391_OnlineShop]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Img] [varchar](2500) NULL,
	[Title] [nvarchar](2500) NULL,
	[desc] [nvarchar](2500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Day] [int] NULL,
	[Month] [nvarchar](20) NULL,
	[Year] [int] NULL,
	[BlogTitle] [nvarchar](2500) NULL,
	[BlogContent] [nvarchar](2500) NULL,
	[imageLink] [nvarchar](1000) NULL,
	[AuthorID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogDetail]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogDetail](
	[BlogDetailID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](2500) NULL,
	[Content] [nvarchar](2500) NULL,
	[imgBlogDetail] [nvarchar](1000) NULL,
	[BlogID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BlogDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[Amount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](1000) NULL,
	[CategoryImgURL] [varchar](225) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chat_room]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chat_room](
	[room_id] [int] IDENTITY(1,1) NOT NULL,
	[is_Private] [bit] NULL,
	[name] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShipInfoID] [int] NULL,
	[UserID] [int] NULL,
	[Status] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[OrderID] [int] NULL,
	[Star] [int] NULL,
	[FeedbackDetail] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback_Replies]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback_Replies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FeedbackID] [int] NULL,
	[UserID] [int] NULL,
	[RepliesText] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HelpCategory]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HelpCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](1000) NULL,
	[Image] [varchar](225) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HelpContent]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HelpContent](
	[ContentID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](2500) NULL,
	[TitleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HelpTitle]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HelpTitle](
	[TitleID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](2500) NULL,
	[UserID] [int] NULL,
	[CategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[member]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[member](
	[member_id] [int] IDENTITY(1,1) NOT NULL,
	[room_id] [int] NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[member_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[messsages]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[messsages](
	[message_id] [int] IDENTITY(1,1) NOT NULL,
	[room_id] [int] NULL,
	[UserID] [int] NULL,
	[Message] [nvarchar](1000) NULL,
	[Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[message_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[OrderID] [int] NULL,
	[Content] [nvarchar](1000) NULL,
	[status] [int] NULL,
	[time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_ID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](1000) NOT NULL,
	[ProductPrice] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Status]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[TotalPrice] [money] NULL,
	[Note] [nvarchar](2000) NULL,
	[Status] [int] NULL,
	[Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](1000) NULL,
	[Description] [nvarchar](2000) NULL,
	[OriginalPrice] [money] NULL,
	[SellPrice] [money] NULL,
	[SalePercent] [int] NULL,
	[SubCategoryID] [int] NULL,
	[ShopID] [int] NULL,
	[Amount] [int] NULL,
	[StatusID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImg]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImg](
	[ProductID] [int] NULL,
	[ProductImgURL] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductStatus]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ship]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ship](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](1000) NULL,
	[ShipPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipInfo]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_ID] [int] NULL,
	[CustomerName] [nvarchar](1000) NULL,
	[ShippingAddress] [nvarchar](1000) NULL,
	[ShipCityID] [int] NULL,
	[PhoneNum] [varchar](20) NULL,
	[Note] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShopName] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryName] [nvarchar](255) NULL,
	[CategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tracking]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tracking](
	[no_day] [int] NULL,
	[num] [int] NULL,
	[lastUpdate] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAddress]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddress](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ShipName] [nvarchar](500) NULL,
	[PhoneNum] [nvarchar](20) NULL,
	[ShipCityID] [int] NULL,
	[NoteDetail] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](500) NULL,
	[password] [varchar](1000) NULL,
	[fullname] [nvarchar](500) NULL,
	[phone] [nvarchar](20) NULL,
	[gender] [bit] NULL,
	[email] [nvarchar](1000) NULL,
	[RoleID] [int] NULL,
	[ShopID] [int] NULL,
	[StatusID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserStatus]    Script Date: 1/07/2023 5:36:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 
GO
INSERT [dbo].[Banner] ([ID], [Img], [Title], [desc]) VALUES (1, N'slide-01.jpg', N'Women Collection 2022', N'New Season')
GO
INSERT [dbo].[Banner] ([ID], [Img], [Title], [desc]) VALUES (2, N'slide-02.jpg', N'Men New-Season', N'Jackets & Coats')
GO
INSERT [dbo].[Banner] ([ID], [Img], [Title], [desc]) VALUES (3, N'slide-03.jpg', N'Men Collection 2022', N'New Arrivals')
GO
INSERT [dbo].[Banner] ([ID], [Img], [Title], [desc]) VALUES (4, N'slide-04.jpg', N'Women Collection 2022', N'New Season')
GO
SET IDENTITY_INSERT [dbo].[Banner] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 
GO
INSERT [dbo].[Blog] ([ID], [Day], [Month], [Year], [BlogTitle], [BlogContent], [imageLink], [AuthorID]) VALUES (1, 11, N'Sep', 2022, N'Áo phông xám nữ, item mix đồ thời thượng', N'Áo phông xám là một item được nhiều bạn trẻ yêu thích. Khi xu hướng thời trang thế giới đang hướng đến những thứ đơn giản, tinh tế thì gam màu xám được đánh giá rất hiện đại, trẻ trung và là một trong những gam màu hot trend thời gian gần đây.
Với áo phông xám, chị em có thể biến tấu linh hoạt trong cách phối đồ, lên đồ ấn tượng mà không lo nhạt nhòa, kém nổi bật.', N'1.jpg', 4)
GO
INSERT [dbo].[Blog] ([ID], [Day], [Month], [Year], [BlogTitle], [BlogContent], [imageLink], [AuthorID]) VALUES (2, 15, N'Sep', 2022, N'Áo thun oversize chuẩn phong cách, ấn tượng', N'Áo phông oversize đang là một hot item dẫn đầu xu hướng thời trang giới trẻ hiện nay. Ngày càng nhiều các bạn trẻ yêu thích, ưa chuộng và đánh giá cao kiểu áo này. 
Một item đầy mới mẻ, phá cách và tính ứng dụng thực tiễn cao như áo phông oversize quả thực sẽ thu hút sự quan tâm của rất nhiều bạn trẻ.', N'2.jpg', 4)
GO
INSERT [dbo].[Blog] ([ID], [Day], [Month], [Year], [BlogTitle], [BlogContent], [imageLink], [AuthorID]) VALUES (3, 17, N'Sep', 2022, N'Blazzer, xu thế thời trang 2022', N'Với sự thay đổi liên tục, xu hướng thời trang luôn được cập nhật mới mẻ hơn, độc đáo, hiện đại và thu hút hơn. Những phong cách mới, xu thế thời trang hot luôn được mọi người quan tâm, đặc biệt là giới trẻ.
Không thể phủ nhận ngành công nghiệp thời trang đang phát triển rất mạnh mẽ. Không chỉ đơn giản là cách ăn mặc, cách mix đồ hay diện đồ theo phong cách yêu thích, thời trang còn là sự đổi mới, phá cách và tràn đầy sức sáng tạo ấn tượng. Vậy bạn đã có ý tưởng gì cho mình chưa? Cùng LeventShop khám phá ngay nhé.', N'3.jpg', 5)
GO
INSERT [dbo].[Blog] ([ID], [Day], [Month], [Year], [BlogTitle], [BlogContent], [imageLink], [AuthorID]) VALUES (4, 1, N'Sep', 2022, N'Mix đồ cho nàng ngày hè', N'Bạn có thể chọn những gam màu sáng như trắng, cam, be,.. để tạo sự trẻ trung, tươi mới hoặc những gam màu trầm tối như đen, nâu, xanh rêu,... vừa đem đến sự tinh tế vừa phong cách, thời trang.', N'4.jpg', 5)
GO
INSERT [dbo].[Blog] ([ID], [Day], [Month], [Year], [BlogTitle], [BlogContent], [imageLink], [AuthorID]) VALUES (5, 24, N'Sep', 2022, N'Áo sơ mi cho nàng cực trẻ trung và cá tính', N'Áo sơ mi vốn là một item must-have trong tủ đồ của phái nữ bởi sự đơn giản, tinh tế; dễ phối đồ và có thể mặc trong hầu hết mọi tình huống như đi học, đi làm,đi chơi, đi phỏng vấn,...Thông dụng - dễ phối - chưa bao giờ lỗi mốt là những từ có thể dùng để miêu tả về áo sơ mi trắng.
Là một item quốc dân luôn có sẵn trong tủ đồ của tất cả mọi người, những chiếc áo sơ mi trắng luôn khiến người mặc ngây ngất bởi hiệu quả thời trang mà nó mang lại: sự trẻ trung, lịch thiệp và phong cách.', N'5.jpg', 6)
GO
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[BlogDetail] ON 
GO
INSERT [dbo].[BlogDetail] ([BlogDetailID], [Title], [Content], [imgBlogDetail], [BlogID]) VALUES (1, N'Áo phông xám phù hợp với ai?', N'Không phải tất cả màu sắc đều phù hợp với tất cả mọi người. Tuy nhiên, gam màu xám lại là một trong những ngoại lệ bên cạnh gam màu hot trend đen, trắng.
Là những gam màu trung tính, tinh tế và hiện đại, không khó để những gam màu này là gam màu được ưa chuộng nhất hiện nay. Xu hướng thời trang hiện nay đang đề cao những gam màu đơn giản, trung tính nhưng có hiệu quả thời trang cao', N'aophongxam1.jpg', 1)
GO
INSERT [dbo].[BlogDetail] ([BlogDetailID], [Title], [Content], [imgBlogDetail], [BlogID]) VALUES (2, N'Áo phông xám phối với quần màu đen', N'Cặp đôi xám-đen chắc chắn là sự kết hợp an toàn mà phong cách “được lòng” nhiều bạn trẻ. Đều là gam màu trung tính nên độ ăn ý, 
phối áo phông xám với quần màu đen mang đến cho bạn vẻ ngoài hiện đại, tinh tế, pha chút hồi cổ nhưng vẫn rất trẻ trung, tươi mới.', N'aophongxam.jpg', 1)
GO
INSERT [dbo].[BlogDetail] ([BlogDetailID], [Title], [Content], [imgBlogDetail], [BlogID]) VALUES (3, N'Áo phông Oversize là gì?', N'Oversize Tee ( Áo quá khổ ) là loại áo có kích thước khá lớn, được phóng to vừa phải làm sao cho cân xứng ở phần ngực áo, ống tay áo và phần eo của người sử dụng.
Mục đích của việc tạo ra những kiểu áo thế nào giúp cho một số người che đi các khuyết điểm trên cơ thể và làm cho họ tự tin hơn khi ra ngoài.', N'aophongoversize.jpg', 2)
GO
INSERT [dbo].[BlogDetail] ([BlogDetailID], [Title], [Content], [imgBlogDetail], [BlogID]) VALUES (4, N'Các loại vải sử dụng để may áo oversize tay lỡ', N'Chắc bạn cũng đã biết đến một số loại vải phổ biến như 100% Cotton, vải CVC 65/35. Vải Tici hay là vải Kate.
Mỗi doanh nghiệp sản xuất đều dựa trên đối tượng khách hàng của mình để tạo ra những mẫu áo với chất liệu phù hợp nhất.', N'aophongoversize1.jpg', 2)
GO
INSERT [dbo].[BlogDetail] ([BlogDetailID], [Title], [Content], [imgBlogDetail], [BlogID]) VALUES (5, N'Blazer là gì và cách phối CỰC ĐẸP cho nam và nữ chuẩn phong cách Hàn Quốc', N'Áo Blazer là một loại áo khoác dáng dài, nó giống với áo khoác vest nhất nhưng đường cắt may tạo kiểu ngẫu nhiên hơn.
Được thiết kế dựa trên khoác suit có thể mặc phối với nhiều mẫu quần áo và trong nhiều hoàn cảnh khác nhau. Nếu chọn mua cho mình một chiếc áo Blazer thì nam hay nữ đều rất chuộng áo Blazer đen, Blazer màu be và áo Blazer nữ caro nhất.', N'blazer1.png', 3)
GO
INSERT [dbo].[BlogDetail] ([BlogDetailID], [Title], [Content], [imgBlogDetail], [BlogID]) VALUES (6, N'Lịch sử ra đời của áo Blazer', N'Blazer ra đời và thịnh hành từ những năm giữa thế kỷ 20. Những chiếc Blazer đầu tiên được thiết kế gần giống chiếc áo gió hiện đại.', N'blazer2.png', 3)
GO
INSERT [dbo].[BlogDetail] ([BlogDetailID], [Title], [Content], [imgBlogDetail], [BlogID]) VALUES (7, N'Các chất liệu thường thấy của áo Blazer', N'Không những đa dạng trong thiết kế mà chất liệu để may áo cũng hết sức phong phú. Có đến 7 loại chất liệu có thể được sử dụng trong thiết kế áo blazer:
Len hỗn hợp, vải flannel, vải dệt fresco, len cashmere, vải lanh, vải sẹc và vải thô', N'blazer3.png', 3)
GO
INSERT [dbo].[BlogDetail] ([BlogDetailID], [Title], [Content], [imgBlogDetail], [BlogID]) VALUES (8, N'Xu hướng áo Blazer nữ hiện nay', N'Hiện nay có rất nhiều loại áo blazer nữ thời thượng và sang chảnh, vừa thể hiện được sự cá tính, mạnh mẽ và phong cách hiện đại. Không chỉ mang lại cho phái nữ một vẻ đẹp quyến rũ
mà còn đôn lên dáng vẻ thanh lịch cho người mặc.', N'blazer4.png', 3)
GO
INSERT [dbo].[BlogDetail] ([BlogDetailID], [Title], [Content], [imgBlogDetail], [BlogID]) VALUES (9, N'Các cách phối đồ đi chơi mùa hè cho nữ cực chất', N'Hè đến cũng là quãng thời gian đầy năng động với rất nhiều những hoạt động ngoài trời. Những cô nàng trót yêu sự cá tính và phong cách hãy cùng dành chút thời gian
đọc những góp ý dưới đây để có những cách mĩ match đẹp “thần sầu” cho mùa hè bốc lửa', N'mixdomuahe.jpg', 4)
GO
INSERT [dbo].[BlogDetail] ([BlogDetailID], [Title], [Content], [imgBlogDetail], [BlogID]) VALUES (10, N'Combo mix 1 chiếc váy ngắn cộng với đôi Sneaker', N'Combo hoàn hảo nhất cho mùa hè trẻ trung, xinh xắn và năng động có lẽ là chân váy ngắn cùng giày sneaker. Dù bạn muốn phối đồ đi chơi mùa hè cho nữ hay phối đồ mùa hè đi học.
Set đồ này cũng sẽ không khiến bạn thất vọng. Chân váy ngắn rất đa dạng như chân váy hoa nhí, chân váy chữ A, chân váy xếp ly ngắn, chân váy ôm,… Và bạn có thể thoải mái mix chân váy ngắn cùng áo thun, áo kiểu, áo sơ mi, áo trễ vai, áo hai dây tùy bạn thích.', N'vayngansneaker.jpg', 4)
GO
INSERT [dbo].[BlogDetail] ([BlogDetailID], [Title], [Content], [imgBlogDetail], [BlogID]) VALUES (11, N'Combo Áo thun với 1 chiếc quần short hoặc quần jean', N'Một công thức phối đồ đi chơi mùa hè cho nữ cơ bản đến không thể cơ bản hơn. Và thật may là set đồ này phù hợp với hầu hết mọi vóc dáng.
Những chiếc áo phông được may từ chất liệu thấm hút mồ hôi sẽ giúp nàng thật thoải mái suốt ngày dài năng động.', N'aothunvoiquanjean.jpg', 4)
GO
INSERT [dbo].[BlogDetail] ([BlogDetailID], [Title], [Content], [imgBlogDetail], [BlogID]) VALUES (12, N'Combo Áo trễ vai với chiếc quần jean baggy', N'Trong khi baggy jean là chiêc quần “hack” dáng thần thánh và che khuyết điểm đôi chân tuyệt vời. Chiếc áo trễ vai lại khéo léo tôn lên bờ vai mảnh khảnh cùng xương quai xanh quyến rũ của bạn.', N'aotrevai.jpg', 4)
GO
INSERT [dbo].[BlogDetail] ([BlogDetailID], [Title], [Content], [imgBlogDetail], [BlogID]) VALUES (13, N'Những chiếc áo sơ mi có màu nổi', N'Trong trường hợp chị em không để ý, thì áo sơ mi màu nổi chính là xu hướng của mùa hè năm nay. Không khó để bắt gặp hội sành điệu xúng xính mẫu áo rực rỡ này.
Các gam màu thật nổi không chỉ giúp vẻ ngoài của người diện trở thành tâm điểm giữa đám đông, mà còn hack tuổi cực siêu.', N'aosomi.jpg', 5)
GO
INSERT [dbo].[BlogDetail] ([BlogDetailID], [Title], [Content], [imgBlogDetail], [BlogID]) VALUES (14, N'Áo sơ mi kẻ sọc', N'Không phải là một kiểu sơ mi quá mới, tuy nhiên sức hút của áo sơ mi kẻ vẫn chưa bao giờ thuyên giảm. Điểm đáng chú ý của áo sơ mi kẻ là món thời trang này rất thanh lịch, trang nhã và vẫn có sự nổi bật nhất định.', N'aosomi1.jpg', 5)
GO
INSERT [dbo].[BlogDetail] ([BlogDetailID], [Title], [Content], [imgBlogDetail], [BlogID]) VALUES (15, N'Áo sơ mi cộc tay', N'Hot hơn cả áo sơ mi màu nổi chính là sơ mi cộc tay. Món thời trang này phảng phất nét retro, nhưng cũng rất trẻ trung, ngọt ngào.', N'aosomi2.jpg', 5)
GO
SET IDENTITY_INSERT [dbo].[BlogDetail] OFF
GO
INSERT [dbo].[Cart] ([UserID], [ProductID], [Amount]) VALUES (1, 1, 2)
GO
INSERT [dbo].[Cart] ([UserID], [ProductID], [Amount]) VALUES (6, 2, 2)
GO
INSERT [dbo].[Cart] ([UserID], [ProductID], [Amount]) VALUES (4, 1, 3)
GO
INSERT [dbo].[Cart] ([UserID], [ProductID], [Amount]) VALUES (4, 2, 1)
GO
INSERT [dbo].[Cart] ([UserID], [ProductID], [Amount]) VALUES (5, 1, 1)
GO
INSERT [dbo].[Cart] ([UserID], [ProductID], [Amount]) VALUES (5, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryImgURL]) VALUES (1, N'Men Clothes', N'men_clothes.png')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryImgURL]) VALUES (2, N'Women Clothes', N'women_clothes.png')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryImgURL]) VALUES (3, N'Men Shoes', N'men_shoes.png')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryImgURL]) VALUES (4, N'Women Shoes', N'women_shoes.png')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryImgURL]) VALUES (5, N'Fashion Accessories', N'accessories.png')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryImgURL]) VALUES (6, N'Men Bags', N'bags.png')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryImgURL]) VALUES (7, N'Women Bags', N'women_bags.png')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryImgURL]) VALUES (8, N'Watches', N'watches.png')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[chat_room] ON 
GO
INSERT [dbo].[chat_room] ([room_id], [is_Private], [name]) VALUES (17, 1, NULL)
GO
INSERT [dbo].[chat_room] ([room_id], [is_Private], [name]) VALUES (22, 1, NULL)
GO
INSERT [dbo].[chat_room] ([room_id], [is_Private], [name]) VALUES (23, 1, NULL)
GO
INSERT [dbo].[chat_room] ([room_id], [is_Private], [name]) VALUES (24, 1, NULL)
GO
INSERT [dbo].[chat_room] ([room_id], [is_Private], [name]) VALUES (25, 1, NULL)
GO
INSERT [dbo].[chat_room] ([room_id], [is_Private], [name]) VALUES (26, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[chat_room] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 
GO
INSERT [dbo].[Feedback] ([ID], [UserID], [ProductID], [OrderID], [Star], [FeedbackDetail]) VALUES (1, 4, 1, 1, 5, N'Very good')
GO
INSERT [dbo].[Feedback] ([ID], [UserID], [ProductID], [OrderID], [Star], [FeedbackDetail]) VALUES (2, 5, 2, 2, 4, N'Good')
GO
INSERT [dbo].[Feedback] ([ID], [UserID], [ProductID], [OrderID], [Star], [FeedbackDetail]) VALUES (3, 5, 1, 3, 5, N'Sản phẩm rất tốt')
GO
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback_Replies] ON 
GO
INSERT [dbo].[Feedback_Replies] ([ID], [FeedbackID], [UserID], [RepliesText]) VALUES (1, 1, 5, N'Xin Cám Ơn!')
GO
INSERT [dbo].[Feedback_Replies] ([ID], [FeedbackID], [UserID], [RepliesText]) VALUES (2, 2, 4, N'Xin Cám Ơn!')
GO
INSERT [dbo].[Feedback_Replies] ([ID], [FeedbackID], [UserID], [RepliesText]) VALUES (3, 3, 6, N'Xin Cám Ơn!')
GO
SET IDENTITY_INSERT [dbo].[Feedback_Replies] OFF
GO
SET IDENTITY_INSERT [dbo].[HelpCategory] ON 
GO
INSERT [dbo].[HelpCategory] ([CategoryID], [CategoryName], [Image]) VALUES (1, N'Mua sắm cùng LeventShop', N'helpcenter.png')
GO
INSERT [dbo].[HelpCategory] ([CategoryID], [CategoryName], [Image]) VALUES (2, N'Khuyến mãi & Ưu đãi', N'helpcenter1.png')
GO
INSERT [dbo].[HelpCategory] ([CategoryID], [CategoryName], [Image]) VALUES (3, N'Thanh toán', N'helpcenter2.png')
GO
INSERT [dbo].[HelpCategory] ([CategoryID], [CategoryName], [Image]) VALUES (4, N'Đơn hàng & vận chuyển', N'helpcenter3.png')
GO
INSERT [dbo].[HelpCategory] ([CategoryID], [CategoryName], [Image]) VALUES (5, N'Thông tin chung', N'helpcenter4.png')
GO
SET IDENTITY_INSERT [dbo].[HelpCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[HelpContent] ON 
GO
INSERT [dbo].[HelpContent] ([ContentID], [Content], [TitleID]) VALUES (1, N'[Thành viên mới] Cách đăng nhập/ đăng ký tài khoản mới', 1)
GO
INSERT [dbo].[HelpContent] ([ContentID], [Content], [TitleID]) VALUES (2, N'[Thành viên mới] Làm sao để mua hàng/ đặt hàng trên Shop', 1)
GO
INSERT [dbo].[HelpContent] ([ContentID], [Content], [TitleID]) VALUES (3, N'[Thành viên mới] Tính năng "Yêu thích sản phẩm"', 1)
GO
INSERT [dbo].[HelpContent] ([ContentID], [Content], [TitleID]) VALUES (4, N'[Chat] Hướng dẫn nhắn tin với Người bán', 2)
GO
INSERT [dbo].[HelpContent] ([ContentID], [Content], [TitleID]) VALUES (5, N'[Thành viên mới] Hướng dẫn đăng xuất tài khoản LeventShop', 2)
GO
INSERT [dbo].[HelpContent] ([ContentID], [Content], [TitleID]) VALUES (6, N'Tôi có thể hủy đơn hàng sau khi đặt hàng không?', 3)
GO
INSERT [dbo].[HelpContent] ([ContentID], [Content], [TitleID]) VALUES (7, N'Thêm sản phẩm vào danh sách yêu thích', 3)
GO
INSERT [dbo].[HelpContent] ([ContentID], [Content], [TitleID]) VALUES (8, N'Coming soon....', 4)
GO
INSERT [dbo].[HelpContent] ([ContentID], [Content], [TitleID]) VALUES (9, N'Coming soon....', 5)
GO
INSERT [dbo].[HelpContent] ([ContentID], [Content], [TitleID]) VALUES (10, N'[Vận chuyển] Trạng thái giao hàng của Đơn hàng', 6)
GO
INSERT [dbo].[HelpContent] ([ContentID], [Content], [TitleID]) VALUES (11, N'Thời gian giao hàng ước tính', 6)
GO
INSERT [dbo].[HelpContent] ([ContentID], [Content], [TitleID]) VALUES (12, N'Theo dõi tình trạng vận chuyển của đơn hàng', 7)
GO
INSERT [dbo].[HelpContent] ([ContentID], [Content], [TitleID]) VALUES (13, N'Cách kiểm tra lịch sử mua hàng', 7)
GO
INSERT [dbo].[HelpContent] ([ContentID], [Content], [TitleID]) VALUES (14, N'Hướng dẫn đánh giá sản phẩm', 8)
GO
INSERT [dbo].[HelpContent] ([ContentID], [Content], [TitleID]) VALUES (15, N'Xóa/ chỉnh sửa đánh giá sản phẩm của mình trên LeventShop', 8)
GO
INSERT [dbo].[HelpContent] ([ContentID], [Content], [TitleID]) VALUES (16, N'[Tài khoản LeventShop] Hướng dẫn lấy lại mật khẩu đăng nhập khi quên mật khẩu', 9)
GO
INSERT [dbo].[HelpContent] ([ContentID], [Content], [TitleID]) VALUES (17, N'[Tài khoản LeventShop] Hướng dẫn thay đổi mật khẩu tài khoản đăng nhập', 9)
GO
INSERT [dbo].[HelpContent] ([ContentID], [Content], [TitleID]) VALUES (18, N'Coming soon....', 10)
GO
SET IDENTITY_INSERT [dbo].[HelpContent] OFF
GO
SET IDENTITY_INSERT [dbo].[HelpTitle] ON 
GO
INSERT [dbo].[HelpTitle] ([TitleID], [Title], [UserID], [CategoryID]) VALUES (1, N'Người dùng mới', 1, 1)
GO
INSERT [dbo].[HelpTitle] ([TitleID], [Title], [UserID], [CategoryID]) VALUES (2, N'Thao tác', 1, 1)
GO
INSERT [dbo].[HelpTitle] ([TitleID], [Title], [UserID], [CategoryID]) VALUES (3, N'Tính năng', 1, 1)
GO
INSERT [dbo].[HelpTitle] ([TitleID], [Title], [UserID], [CategoryID]) VALUES (4, N'Chương trình khuyến mãi', 1, 2)
GO
INSERT [dbo].[HelpTitle] ([TitleID], [Title], [UserID], [CategoryID]) VALUES (5, N'Phương thức thanh toán', 1, 3)
GO
INSERT [dbo].[HelpTitle] ([TitleID], [Title], [UserID], [CategoryID]) VALUES (6, N'Thông tin vận chuyển', 1, 4)
GO
INSERT [dbo].[HelpTitle] ([TitleID], [Title], [UserID], [CategoryID]) VALUES (7, N'Đơn hàng', 1, 4)
GO
INSERT [dbo].[HelpTitle] ([TitleID], [Title], [UserID], [CategoryID]) VALUES (8, N'Đánh giá và bình luận', 1, 4)
GO
INSERT [dbo].[HelpTitle] ([TitleID], [Title], [UserID], [CategoryID]) VALUES (9, N'Tài khoản LeventShop', 1, 5)
GO
INSERT [dbo].[HelpTitle] ([TitleID], [Title], [UserID], [CategoryID]) VALUES (10, N'Hướng dẫn chung', 1, 5)
GO
SET IDENTITY_INSERT [dbo].[HelpTitle] OFF
GO
SET IDENTITY_INSERT [dbo].[member] ON 
GO
INSERT [dbo].[member] ([member_id], [room_id], [UserID]) VALUES (16, 17, 4)
GO
INSERT [dbo].[member] ([member_id], [room_id], [UserID]) VALUES (17, 17, 5)
GO
INSERT [dbo].[member] ([member_id], [room_id], [UserID]) VALUES (23, 22, 1)
GO
INSERT [dbo].[member] ([member_id], [room_id], [UserID]) VALUES (24, 22, 4)
GO
INSERT [dbo].[member] ([member_id], [room_id], [UserID]) VALUES (25, 23, 4)
GO
INSERT [dbo].[member] ([member_id], [room_id], [UserID]) VALUES (26, 23, 6)
GO
INSERT [dbo].[member] ([member_id], [room_id], [UserID]) VALUES (27, 24, 4)
GO
INSERT [dbo].[member] ([member_id], [room_id], [UserID]) VALUES (28, 24, 7)
GO
INSERT [dbo].[member] ([member_id], [room_id], [UserID]) VALUES (29, 25, 24)
GO
INSERT [dbo].[member] ([member_id], [room_id], [UserID]) VALUES (30, 25, 4)
GO
INSERT [dbo].[member] ([member_id], [room_id], [UserID]) VALUES (31, 26, 1)
GO
INSERT [dbo].[member] ([member_id], [room_id], [UserID]) VALUES (32, 26, 7)
GO
SET IDENTITY_INSERT [dbo].[member] OFF
GO
SET IDENTITY_INSERT [dbo].[messsages] ON 
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (3, 17, 4, N'hello', CAST(N'2022-10-31' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (4, 17, 4, N'how are you', CAST(N'2022-10-31' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (5, 17, 4, N'nigg', CAST(N'2022-10-31' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (6, 22, 1, N'chao ban', CAST(N'2022-10-31' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (7, 22, 1, N'he', CAST(N'2022-11-01' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (10, 17, 4, N'khong gui dau', CAST(N'2022-11-01' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (11, 24, 4, N'who are du', CAST(N'2022-11-01' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (12, 24, 4, N'em ăn cơm chưa', CAST(N'2022-11-01' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (13, 23, 4, N'hihi', CAST(N'2022-11-01' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (14, 22, 4, N'Harro', CAST(N'2022-11-01' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (15, 22, 1, N'chào bạn', CAST(N'2022-11-01' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (16, 22, 4, N'chao admin', CAST(N'2022-11-01' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (17, 22, 1, N'bạn cần gì từ chúng mình', CAST(N'2022-11-01' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (18, 22, 4, N'hong co j het tron a', CAST(N'2022-11-01' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (19, 25, 24, N'harro', CAST(N'2022-11-02' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (20, 25, 24, N'chao nguoi gay nhe', CAST(N'2022-11-02' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (21, 22, 4, N'chào ', CAST(N'2022-11-02' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (22, 22, 1, N'chào lại', CAST(N'2022-11-02' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (23, 17, 4, N'chào', CAST(N'2022-11-02' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (24, 17, 4, N'đằng ấy có yêu đời không', CAST(N'2022-11-02' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (25, 22, 4, N'chào lại tiếp', CAST(N'2022-11-02' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (26, 26, 1, N'lady, whatever you selling', CAST(N'2022-11-03' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (27, 26, 1, N'I aint buying yo!', CAST(N'2022-11-03' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (28, 22, 1, N'lady, whatever you selling', CAST(N'2022-11-03' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (29, 22, 1, N'I aint buying yo!', CAST(N'2022-11-03' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (30, 22, 4, N'well', CAST(N'2022-11-03' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (31, 22, 4, N'my name is skyler white yo!', CAST(N'2022-11-03' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (32, 22, 4, N'my husband is walter white yo!', CAST(N'2022-11-03' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (33, 22, 4, N'u huh', CAST(N'2022-11-03' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (34, 22, 4, N'he''d told me everything\', CAST(N'2022-11-03' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (35, 22, 1, N'he did ?', CAST(N'2022-11-03' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (36, 22, 1, N'minhmolly123321@gmail.com', CAST(N'2022-11-03' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (37, 22, 1, N'hiiii', CAST(N'2022-11-04' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (38, 22, 4, N'😎', CAST(N'2022-11-04' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (39, 22, 4, N'😎', CAST(N'2022-11-04' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (40, 22, 1, N'I aint buying yo!', CAST(N'2022-11-04' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (41, 22, 1, N'I aint buying yo!', CAST(N'2022-11-04' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (42, 22, 1, N'I aint buying yo!', CAST(N'2022-11-04' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (43, 22, 1, N'I aint buying yo!', CAST(N'2022-11-04' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (44, 22, 1, N'I aint buying yo!', CAST(N'2022-11-04' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (45, 22, 1, N'I aint buying yo!', CAST(N'2022-11-04' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (46, 22, 1, N'I aint buying yo!', CAST(N'2022-11-04' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (47, 22, 1, N'I aint buying yo!', CAST(N'2022-11-04' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (48, 22, 1, N'I aint buying yo!', CAST(N'2022-11-04' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (49, 22, 4, N'😎', CAST(N'2022-11-04' AS Date))
GO
INSERT [dbo].[messsages] ([message_id], [room_id], [UserID], [Message], [Date]) VALUES (50, 22, 4, N'', CAST(N'2022-11-05' AS Date))
GO
SET IDENTITY_INSERT [dbo].[messsages] OFF
GO
SET IDENTITY_INSERT [dbo].[Notifications] ON 
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [OrderID], [Content], [status], [time]) VALUES (1, 5, 1, N'Test Checked', 1, CAST(N'2022-10-30T18:41:39.350' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [OrderID], [Content], [status], [time]) VALUES (2, 5, 1, N'Test Unchecked', 0, CAST(N'2022-10-30T18:41:39.363' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [OrderID], [Content], [status], [time]) VALUES (3, 1, 13, N'lmao thu xem', NULL, CAST(N'2022-11-06T18:31:03.000' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [OrderID], [Content], [status], [time]) VALUES (4, 1, 13, N'The status of the rder with ID: 13 had been changed to 1', NULL, CAST(N'2022-11-06T18:31:51.000' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [OrderID], [Content], [status], [time]) VALUES (5, 1, 17, N'The status of the rder with ID: 17 had been changed to 1', NULL, CAST(N'2022-11-06T18:31:53.000' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [OrderID], [Content], [status], [time]) VALUES (6, 1, 18, N'The status of the rder with ID: 18 had been changed to 1', NULL, CAST(N'2022-11-06T18:31:55.000' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [OrderID], [Content], [status], [time]) VALUES (7, 1, 13, N'The status of the rder with ID: 13 had been changed to Delivering', NULL, CAST(N'2022-11-06T18:35:58.000' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [OrderID], [Content], [status], [time]) VALUES (8, 1, 17, N'The status of the rder with ID: 17 had been changed to Canceled', NULL, CAST(N'2022-11-06T18:36:00.000' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [OrderID], [Content], [status], [time]) VALUES (9, 1, 18, N'The status of the rder with ID: 18 had been changed to Delivering', NULL, CAST(N'2022-11-06T18:36:02.000' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [OrderID], [Content], [status], [time]) VALUES (10, 1, 13, N'The Order with ID: 13 had been deleted to Completed', NULL, CAST(N'2022-11-06T19:28:27.000' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [OrderID], [Content], [status], [time]) VALUES (11, 1, 17, N'The status of the rder with ID: 17 had been changed to Completed', NULL, CAST(N'2022-11-06T19:28:29.000' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [OrderID], [Content], [status], [time]) VALUES (12, 1, 17, N'The status of the rder with ID: 17 had been changed to Delivering', NULL, CAST(N'2022-11-09T08:47:27.000' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [OrderID], [Content], [status], [time]) VALUES (13, 1, 18, N'The Order with ID: 18 had been deleted to Packaging', NULL, CAST(N'2022-11-09T08:47:30.000' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [OrderID], [Content], [status], [time]) VALUES (14, 1, 17, N'The status of the rder with ID: 17 had been changed to Completed', NULL, CAST(N'2022-11-10T09:40:22.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Detail] ON 
GO
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (8, 5, 23, N'Korean style flared dress', 150000.0000, 1)
GO
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (9, 6, 22, N'Off Shoulder Body Hugging Dress', 200000.0000, 1)
GO
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (10, 7, 25, N'Short A-line Jean Skirt Women High Loose', 131000.0000, 1)
GO
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (11, 8, 20, N'UNISEX Plain Sweater (Multicolor)', 312000.0000, 1)
GO
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (12, 8, 19, N'UNISEX DURHAM sweatshirt hoodie', 450000.0000, 1)
GO
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (13, 9, 26, N'[Premium] Seamless bikini, luxurious V-neck', 245000.0000, 3)
GO
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (14, 10, 21, N'Dress two-shoulder chiffon dress', 130000.0000, 2)
GO
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (30, 17, 1, N'KAKI bomber jackets - FUNK Unisex baseball shirt', 165000.0000, 1)
GO
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (31, 17, 2, N'Latest fashion KAKI jacket 2019 KKN01', 102000.0000, 1)
GO
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (32, 17, 3, N'KAKI unisex jacket Ulzzang style', 350000.0000, 1)
GO
SET IDENTITY_INSERT [dbo].[Order_Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Status] ON 
GO
INSERT [dbo].[Order_Status] ([ID], [Name]) VALUES (1, N'Waiting for Confirmation')
GO
INSERT [dbo].[Order_Status] ([ID], [Name]) VALUES (2, N'Packaging')
GO
INSERT [dbo].[Order_Status] ([ID], [Name]) VALUES (3, N'Delivering')
GO
INSERT [dbo].[Order_Status] ([ID], [Name]) VALUES (4, N'Canceled')
GO
INSERT [dbo].[Order_Status] ([ID], [Name]) VALUES (5, N'Completed')
GO
SET IDENTITY_INSERT [dbo].[Order_Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [Date]) VALUES (1, 2, 179000.0000, N'byeeeeeeeeee', 5, CAST(N'2022-09-06T04:17:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [Date]) VALUES (2, 2, 750000.0000, N'harro mr', 3, CAST(N'2022-09-16T12:36:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [Date]) VALUES (3, 3, 760000.0000, NULL, 1, CAST(N'2022-09-12T10:18:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [Date]) VALUES (5, 5, 150000.0000, N'hello', 1, CAST(N'2022-09-11T01:30:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [Date]) VALUES (6, 5, 200000.0000, N'bye', 2, CAST(N'2022-09-02T02:30:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [Date]) VALUES (7, 5, 131000.0000, NULL, 1, CAST(N'2022-09-05T04:30:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [Date]) VALUES (8, 6, 762000.0000, NULL, 1, CAST(N'2022-09-05T05:30:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [Date]) VALUES (9, 6, 735000.0000, NULL, 1, CAST(N'2022-09-09T09:30:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [Date]) VALUES (10, 6, 260000.0000, NULL, 1, CAST(N'2022-09-11T11:30:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [Date]) VALUES (13, 1, 3040000.0000, N'', 2, CAST(N'2022-11-03T08:24:09.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [Date]) VALUES (17, 1, 647000.0000, N'', 5, CAST(N'2022-11-05T12:41:53.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [Date]) VALUES (18, 1, 209000.0000, N'', 2, CAST(N'2022-11-05T12:45:06.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (1, N'KAKI bomber jackets - FUNK Unisex baseball shirt', N'The fabric of the shirt is a genuine khaki material with a prominent border pattern, with a thick inner lining.', 300000.0000, 165000.0000, 45, 1, 1, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (2, N'Latest fashion KAKI jacket 2019 KKN01', N'KAKI jacket is suitable for dynamic, youthful and masculine style. With raw KAKI fabric, thick, warm, durable, delicate design, solemn color.', 250000.0000, 102000.0000, 59, 1, 1, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (3, N'KAKI unisex jacket Ulzzang style', N'The shirt is manufactured from KAKI fabric type 1, does not ruffle, does not fade, does not cause skin irritation. Standard form, comfortable, moderate color, flattering shape, suitable for all ages.', 350000.0000, 350000.0000, 0, 1, 1, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (4, N'Baseball bomber jackets', N'Does not cause discomfort if worn in the hot season when traveling on the street, the ability to sweat to absorb sweat and leave no odor if worn for a long time, can be used well in the rainy season.', 178000.0000, 178000.0000, 0, 1, 1, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (5, N'Unisex Bomber Jacket - Ulzzang Baseball Jacket', N'High quality KAKI material with outstanding border motifs. Extremely warm double-layer khaki suitable for winter wear.', 270000.0000, 179000.0000, 34, 1, 1, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (6, N'Paisley Unisex N7 Basic Jeans oversize', N'High quality jean material, high quality ink does not peel off, the print is sharp, does not fade, does not harm the skin of the hands. Modern design, youthful, dynamic, easy to coordinate.', 400000.0000, 400000.0000, 0, 2, 1, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (7, N'Men stretch black jeans', N'Jeans with a new design is more fashionable, bringing maximum confidence to the wearer in front of the people around. Made of high quality denim fabric, so soft and comfortable to wear.', 400000.0000, 380000.0000, 5, 2, 1, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (8, N'Men smokey gray 4-way stretch jeans HD02', N'Nice seams, sturdy, slightly stretchy. The standard colors are carefully dyed, although the pants are slightly faded after a few washes, they still give a more dusty and personality jean color. 98% cotton 2% spandex, Slim fit shape.', 498000.0000, 449000.0000, 10, 2, 1, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (9, N'Light gray men jeans', N'Non-fading, Fit (Slimfit), Stretch Jean Material.', 280000.0000, 280000.0000, 0, 2, 1, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (10, N'High quality men jeans', N'There are two front pockets and two back pockets. Men jeans material is durable, sturdy, does not fade, does not shrink when washed, suitable for all ages, body shapes, not out of fashion.', 145000.0000, 145000.0000, 0, 2, 1, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (11, N'KAKi Soft VICERO', N'Male T-Shirt I7TSH545I', 190000.0000, 133000.0000, 30, 3, 2, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (12, N'Men body pants with stretchy black and white', N'Male T-Shirt I7TSH535I', 250000.0000, 250000.0000, 0, 3, 2, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (13, N'Men jeans shorts MD Q414 silver blue', N'Female T-Shirt I9TSH553I', 250000.0000, 250000.0000, 0, 3, 2, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (14, N'Men shorts Q32 MD blue and white scratched', N'Female T-Shirt I9TSH569I', 190000.0000, 190000.0000, 0, 3, 2, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (15, N'SHORT Pants for Men Summer', N'Female T-Shirt I9TSH545I', 190000.0000, 57000.0000, 70, 3, 2, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (16, N'Hoodie Oversize Odin Acid', N'Hooded hood, thick winter fabric, dark gray', 350000.0000, 350000.0000, 0, 4, 2, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (17, N'JBAGY JL0102', N'Long white turtleneck sweater, stretch fabric material, very warm in winter', 350000.0000, 350000.0000, 0, 4, 2, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (18, N'Local Brand Multi Color Jacket', N'Hoodie Logo Dragon free size, thin fabric suitable for autumn and winter wear', 450000.0000, 450000.0000, 0, 4, 2, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (19, N'UNISEX DURHAM sweatshirt hoodie', N'UNISEX Durham fall and winter long sleeve shirt in black', 450000.0000, 450000.0000, 0, 4, 2, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (20, N'UNISEX Plain Sweater (Multicolor)', N'Gray UNISEX Durham fall hooded hoodie', 390000.0000, 312000.0000, 20, 4, 2, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (21, N'Dress two-shoulder chiffon dress', N'Silk chiffon dress with 2 layers free size', 130000.0000, 130000.0000, 0, 5, 3, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (22, N'Off Shoulder Body Hugging Dress', N'This is a fabric with very high color fastness, stretch resistance, and drift resistance, but its ability to resist wrinkles and absorb sweat is very poor because it contains a lot of cotton', 200000.0000, 200000.0000, 0, 5, 3, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (23, N'Korean style flared dress', N'Free size 80cm. Elasticities', 150000.0000, 150000.0000, 0, 5, 3, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (24, N'Split A-line skirt', N'Design: Short A-line skirt with front thigh split', 120000.0000, 120000.0000, 0, 6, 3, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (25, N'Short A-line Jean Skirt Women High Loose', N'Women high-waisted jeans skirt with a simple design with a V7 inside, thick khaki / jean material, light stretch, extremely comfortable', 131000.0000, 131000.0000, 0, 6, 3, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (26, N'[Premium] Seamless bikini, luxurious V-neck', N'Fabric from Polyester Spandex. The fabric is stretchy, well adapted to sea water and sunlight', 350000.0000, 245000.0000, 30, 7, 3, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (27, N'Bikini 1 piece cross shoulder BK1', N'Bikini one-piece swimsuit discreet horizontal strap BK01, Korean style swimsuit is a good quality swimsuit product, with a youthful and feminine design', 259000.0000, 168000.0000, 35, 7, 3, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (28, N'Swimwear - Sexy purple blue bikini', N'Fabric quality from Polyester + Spandex, good elasticity, adapts to water and sunlight, highly aesthetic', 300000.0000, 185000.0000, 38, 7, 3, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (29, N'Korean Croptop bikini', N'Korean croptop bikinis with high-end cold t-shirts, no need to wear bras inside', 190000.0000, 190000.0000, 0, 7, 3, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (30, N'ENVYLOOK Linen-Belt Skirt', N'ENVYLOOK Linen-Belt Skirt', 570000.0000, 299000.0000, 47, 7, 3, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (31, N'Nike Air Zoom Winflo 7 CJ0291-005', N'Nike Air Zoom Winflo 7 CJ0291-005', 2929000.0000, 2196750.0000, 25, 7, 4, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (32, N'Nike Benassi Slip Shoe 882410-010', N'Nike Benassi Slip Shoe 882410-010', 1923000.0000, 961500.0000, 50, 7, 4, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (33, N'Nike Benassi Slp 882410-008', N'Nike Benassi Slp 882410-008', 1569000.0000, 784500.0000, 50, 7, 4, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (34, N'Vans Slip-On Label Mix', N'Vans Slip-On Label Mix', 145000.0000, 145000.0000, 0, 7, 4, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (35, N'Vans Sk8-Hi', N'Vans Sk8-Hi', 185000.0000, 185000.0000, 0, 7, 4, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (36, N'Male Sock Pack 3 I7SOK201H', N'Male Sock Pack 3 I7SOK201H', 50000.0000, 50000.0000, 0, 8, 4, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (37, N'Male Sock I7SOK213E', N'Male Sock I7SOK213E', 150000.0000, 150000.0000, 0, 8, 4, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (38, N'Male Sock I7SOK217E', N'Male Sock I7SOK217E', 150000.0000, 150000.0000, 0, 8, 4, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (39, N'Female Sock I9SOK015E', N'Female Sock I9SOK015E', 150000.0000, 150000.0000, 0, 8, 4, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (40, N'Female Sock I9SOK222E', N'Female Sock I9SOK222E', 150000.0000, 150000.0000, 0, 8, 4, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (41, N'Backpack V8BPK302I', N'Backpack V8BPK302I', 690000.0000, 690000.0000, 0, 9, 1, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (42, N'Backpack V8BPK300I', N'Backpack V8BPK300I', 590000.0000, 590000.0000, 0, 9, 1, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (43, N'Waterproof Backpack I7BPK003I', N'Waterproof Backpack I7BPK003I', 399000.0000, 399000.0000, 0, 9, 2, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (44, N'Unisex Adidas 4Athlts Id Bp FJ3924', N'Unisex Adidas 4Athlts Id Bp FJ3924', 1200000.0000, 780000.0000, 35, 9, 2, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (45, N'Unisex Adidas Clas Bp Fabric GL0890', N'Unisex Adidas Clas Bp Fabric GL0890', 700000.0000, 700000.0000, 0, 9, 3, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (46, N'FLAANS 925 SharpStar N', N'FLAANS 925 SharpStar N', 356000.0000, 356000.0000, 0, 10, 3, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (47, N'FLAANS Bauli R', N'FLAANS Bauli R', 156000.0000, 156000.0000, 0, 10, 4, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (48, N'FLAANS Vin Bold R', N'FLAANS Vin Bold R', 156000.0000, 156000.0000, 0, 10, 4, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (49, N'FLAANS ChainBZ_N', N'FLAANS ChainBZ_N', 516000.0000, 516000.0000, 0, 10, 4, 100, 1)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [ShopID], [Amount], [StatusID]) VALUES (50, N'FLAANS 925 NewMoon N', N'FLAANS 925 NewMoon N', 356000.0000, 356000.0000, 0, 10, 4, 100, 1)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (1, N'KAKI-bomber-jackets.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (2, N'KAKI-jacket-2019-KKN01.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (3, N'KAKI-unisex-jacket.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (4, N'Baseball-bomber-jacket.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (5, N'Unisex-Bomber-Jacket-Ulzzang.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (6, N'Paisley-Unisex-N7-Basic-Jeans.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (7, N'Men-stretch-black-jeans.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (8, N'Men-smokey-gray-4-way-stretch-jeans-HD02.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (9, N'Light-gray-men-jeans.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (10, N'High-quality-men-jeans.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (11, N'KAKI-Shorts-Soft-VICERO.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (12, N'Men-body-pants.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (13, N'Men-jeans-shorts-MD-Q414.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (14, N'Men-shorts-Q32-MD.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (15, N'SHORT-Pants-for-Men-Summer.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (16, N'Hoodie-Oversize-Odin-Acid.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (17, N'JBAGY-JL0102.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (18, N'Local-Brand-Multi-Color-Jacket.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (19, N'UNISEX-DURHAM-sweatshirt-hoodie.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (20, N'UNISEX-Plain-Sweater.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (21, N'Dress-two-shoulder-chiffon-dress.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (22, N'Off-shoulderbody-huggingdress.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (23, N'Korean-style-flared-dress.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (24, N'Split-A-line-skirt.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (25, N'High-waisted-A-line-short-jean-skirt.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (26, N'Luxurious-V-neck_A20208.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (27, N'Bikini-1-piece-cross-shoulder-BK1.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (28, N'Swimwear-Sexy-purple-blue-bikini_2392.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (29, N'Korean-Croptop-bikini.png')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (30, N'dosiin-karihada-oops-i-did-it-again-115992115992.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (31, NULL)
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (32, NULL)
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (33, NULL)
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (34, NULL)
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (35, NULL)
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (36, NULL)
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (37, NULL)
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (38, NULL)
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (39, NULL)
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (40, NULL)
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (41, NULL)
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (42, NULL)
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (43, NULL)
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (44, NULL)
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (45, NULL)
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (46, NULL)
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (47, NULL)
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (48, NULL)
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (49, NULL)
GO
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (50, NULL)
GO
SET IDENTITY_INSERT [dbo].[ProductStatus] ON 
GO
INSERT [dbo].[ProductStatus] ([StatusID], [StatusName]) VALUES (1, N'Available')
GO
INSERT [dbo].[ProductStatus] ([StatusID], [StatusName]) VALUES (2, N'StopBusiness')
GO
SET IDENTITY_INSERT [dbo].[ProductStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([ID], [RoleName]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Role] ([ID], [RoleName]) VALUES (2, N'Seller')
GO
INSERT [dbo].[Role] ([ID], [RoleName]) VALUES (3, N'Customer')
GO
INSERT [dbo].[Role] ([ID], [RoleName]) VALUES (4, N'Shipper')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Ship] ON 
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (1, N'An Giang', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (2, N'Bà Rịa-Vũng Tàu', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (3, N'Bạc Liêu', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (4, N'Bắc Kạn', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (5, N'Bắc Giang', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (6, N'Bắc Ninh', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (7, N'Bến Tre', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (8, N'Bình Dương', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (9, N'Bình Định', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (10, N'Bình Phước', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (11, N'Bình Thuận', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (12, N'Cà Mau', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (13, N'Cao Bằng', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (14, N'Cần Thơ', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (15, N'Đà Nẵng', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (16, N'Đắk Lắk', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (17, N'Đắk Nông', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (18, N'Điện Biên', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (19, N'Đồng Nai', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (20, N'Đồng Tháp', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (21, N'Gia Lai', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (22, N'Hà Giang', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (23, N'Hà Nam', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (24, N'Hà Nội', 20000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (25, N'Hà Tĩnh', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (26, N'Hải Dương', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (27, N'Hải Phòng', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (28, N'Hòa Bình', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (29, N'Hồ Chí Minh', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (30, N'Hậu Giang', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (31, N'Hưng Yên', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (32, N'Khánh Hòa', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (33, N'Kiên Giang', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (34, N'Kon Tum', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (35, N'Lai Châu', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (36, N'Lào Cai', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (37, N'Lạng Sơn', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (38, N'Lâm Đồng', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (39, N'Long An', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (40, N'Nam Định', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (41, N'Nghệ An', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (42, N'Ninh Bình', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (43, N'Ninh Thuận', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (44, N'Phú Thọ', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (45, N'Phú Yên', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (46, N'Quảng Bình', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (47, N'Quảng Nam', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (48, N'Quảng Ngãi', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (49, N'Quảng Ninh', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (50, N'Quảng Trị', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (51, N'Sóc Trăng', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (52, N'Sơn La', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (53, N'Tây Ninh', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (54, N'Thái Bình', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (55, N'Thái Nguyên', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (56, N'Thanh Hóa', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (57, N'Thừa Thiên - Huế', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (58, N'Tiền Giang', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (59, N'Trà Vinh', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (60, N'Tuyên Quang', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (61, N'Vĩnh Long', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (62, N'Vĩnh Phúc', 30000)
GO
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (63, N'Yên Bái', 30000)
GO
SET IDENTITY_INSERT [dbo].[Ship] OFF
GO
SET IDENTITY_INSERT [dbo].[ShipInfo] ON 
GO
INSERT [dbo].[ShipInfo] ([ID], [Order_ID], [CustomerName], [ShippingAddress], [ShipCityID], [PhoneNum], [Note]) VALUES (6, 17, N'harro', N'chịu chết', 3, N'0333333444', N'')
GO
SET IDENTITY_INSERT [dbo].[ShipInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Shop] ON 
GO
INSERT [dbo].[Shop] ([ID], [ShopName]) VALUES (1, N'TcMinh')
GO
INSERT [dbo].[Shop] ([ID], [ShopName]) VALUES (2, N'LsThai')
GO
INSERT [dbo].[Shop] ([ID], [ShopName]) VALUES (3, N'TtViet')
GO
INSERT [dbo].[Shop] ([ID], [ShopName]) VALUES (4, N'Best Seller')
GO
SET IDENTITY_INSERT [dbo].[Shop] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON 
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (1, N'Jackets & Coats', 1)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (2, N'Jean', 1)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (3, N'Shorts', 1)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (4, N'Hoodies & Sweatshirts', 1)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (5, N'Dresses', 2)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (6, N'Skirt', 2)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (7, N'Bikini', 2)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (8, N'Sneakers', 3)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (9, N'Loafers', 3)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (10, N'Leather Shoes', 3)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (11, N'High heel', 4)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (12, N'Boots', 4)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (13, N'Sneakers', 4)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (14, N'Rings', 5)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (15, N'Earrings', 5)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (16, N'Hats & Caps', 5)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (17, N'Necklaces', 5)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (18, N'Backpacks', 6)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (19, N'Wallets', 6)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (20, N'Crossbody & Shoulder', 6)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (21, N'Handbag', 7)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (22, N'Tote Bags', 7)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (23, N'Cosmetic Bags', 7)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (24, N'Set & Couple Watches', 8)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (25, N'Fashion Watches', 8)
GO
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
GO
INSERT [dbo].[tracking] ([no_day], [num], [lastUpdate]) VALUES (1, 43, CAST(N'2022-11-10' AS Date))
GO
INSERT [dbo].[tracking] ([no_day], [num], [lastUpdate]) VALUES (2, 22, CAST(N'2022-11-09' AS Date))
GO
INSERT [dbo].[tracking] ([no_day], [num], [lastUpdate]) VALUES (3, 11, CAST(N'2022-11-06' AS Date))
GO
INSERT [dbo].[tracking] ([no_day], [num], [lastUpdate]) VALUES (4, 26, CAST(N'2022-11-05' AS Date))
GO
INSERT [dbo].[tracking] ([no_day], [num], [lastUpdate]) VALUES (5, 20, CAST(N'2022-11-04' AS Date))
GO
INSERT [dbo].[tracking] ([no_day], [num], [lastUpdate]) VALUES (6, 17, CAST(N'2022-11-03' AS Date))
GO
INSERT [dbo].[tracking] ([no_day], [num], [lastUpdate]) VALUES (7, 0, CAST(N'2000-11-11' AS Date))
GO
SET IDENTITY_INSERT [dbo].[UserAddress] ON 
GO
INSERT [dbo].[UserAddress] ([ID], [UserID], [ShipName], [PhoneNum], [ShipCityID], [NoteDetail]) VALUES (2, 6, N'Trần Trung Việt', N'0968819830', 24, N'Đại Học FPT')
GO
INSERT [dbo].[UserAddress] ([ID], [UserID], [ShipName], [PhoneNum], [ShipCityID], [NoteDetail]) VALUES (8, 24, N'minh test edi', N'0333333333', 12, N'minh test edit')
GO
INSERT [dbo].[UserAddress] ([ID], [UserID], [ShipName], [PhoneNum], [ShipCityID], [NoteDetail]) VALUES (9, 1, N'minh', N'0333333333', 16, N'minh')
GO
INSERT [dbo].[UserAddress] ([ID], [UserID], [ShipName], [PhoneNum], [ShipCityID], [NoteDetail]) VALUES (10, 1, N'harro', N'0333333444', 3, N'chịu chết')
GO
INSERT [dbo].[UserAddress] ([ID], [UserID], [ShipName], [PhoneNum], [ShipCityID], [NoteDetail]) VALUES (11, 1, N'lkạdlkạhdlkj', N'0333333333', 12, N'lkjàlkhàlk')
GO
SET IDENTITY_INSERT [dbo].[UserAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (1, N'admin', N'123456', N'Admin', N'0123445566', 0, N'admin@fpt.edu.vn', 1, NULL, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (2, N'hieu', N'hieu', N'Hiếu', N'0123456789', 0, N'hieuNTHE160326@fpt.edu.vn', 1, NULL, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (3, N'vha', N'vha', N'Hoàng Anh', N'0987654321', 0, N'anhvhhe163109@fpt.edu.vn', 1, NULL, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (4, N'minh', N'Minh1@', N'Minh', N'0147258369', 0, N'minhtche161354@fpt.edu.vn', 2, 1, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (5, N'thai', N'Thai1@', N'Thái', N'0963852741', 0, N'thailshe160614@fpt.edu.vn', 2, 2, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (6, N'viet', N'Viet1@', N'Việt', N'0142753896', 0, N'viettthe153481@fpt.edu.vn', 2, 3, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (7, N'mkt', N'Seller1@', N'Seller', N'0369147852', 1, N'mkt@fpt.edu.vn', 2, 4, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (8, N'shipper', N'Ship1@', N'Shipper1', N'0789123654', 0, N'shipper@fpt.edu.vn', 4, NULL, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (9, N'cus1', N'Custom1@', N'Customer1', N'0937235111', 1, N'customer1@gmail.com', 3, NULL, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (10, N'cus2', N'Cus2@', N'Customer2', N'0123456777', 1, N'customer2@gmail.com', 3, NULL, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (11, N'cus3', N'Cus3@', N'Customer3', N'0123456888', 0, N'customer3@gmail.com', 3, NULL, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (12, N'cus4', N'Cus4@', N'Customer4', N'0123456999', 1, N'customer4@gmail.com', 3, NULL, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (13, N'cus5', N'Cus5@', N'Customer5', N'0111123456', 1, N'customer5@gmail.com', 3, NULL, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (14, N'cus6', N'Cus6@', N'Customer6', N'0122223456', 1, N'customer6@gmail.com', 3, NULL, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (15, N'cus7', N'Cus7@', N'Customer7', N'0123333456', 1, N'customer7@gmail.com', 3, NULL, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (16, N'cus8', N'Cus8@', N'Customer8', N'0123444456', 0, N'customer8@gmail.com', 3, NULL, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (17, N'cus9', N'Cus9@', N'Customer9', N'0123455556', 1, N'customer9@gmail.com', 3, NULL, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (18, N'ship1', N'Ship2@', N'Shipper2', N'0946312458', 1, N'ship1@gmail.com', 4, NULL, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (19, N'ship2', N'Ship3@', N'Shipper3', N'0145326849', 0, N'ship2@gmail.com', 4, NULL, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (20, N'ship3', N'Ship4@', N'Shipper4', N'0222356777', 0, N'ship3@gmail.com', 4, NULL, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (21, N'cusvip', N'Vip1@', N'Khách VIP', N'0155234789', 1, N'khachvip01@gmail.com', 3, NULL, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (22, N'ship5', N'Ship5@', N'Shipper5', N'0196478532', 0, N'ship5@gmail.com', 4, NULL, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (23, N'minh123', N'd26ab42bf3d78e66b0763ecae755b4f8e222ae2fd63d034ab5f24658bf534650', N'Tran Minh', N'0333333333', 0, N'minhtche161354@fpt.edu.vn', 3, NULL, 1)
GO
INSERT [dbo].[Users] ([UserID], [username], [password], [fullname], [phone], [gender], [email], [RoleID], [ShopID], [StatusID]) VALUES (24, N'minh2', N'5dd188c859d5a69f2094dfd087ade883c0767ad5ae2db4a7f6d968515c98bfa5', N'minh', N'0333333333', 0, N'minh123@gmail.com', 3, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserStatus] ON 
GO
INSERT [dbo].[UserStatus] ([ID], [StatusName]) VALUES (1, N'Active')
GO
INSERT [dbo].[UserStatus] ([ID], [StatusName]) VALUES (2, N'Locked')
GO
INSERT [dbo].[UserStatus] ([ID], [StatusName]) VALUES (3, N'Gmail Login')
GO
INSERT [dbo].[UserStatus] ([ID], [StatusName]) VALUES (4, N'Unverified')
GO
SET IDENTITY_INSERT [dbo].[UserStatus] OFF
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [AuthorID] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [AuthorID]
GO
ALTER TABLE [dbo].[BlogDetail]  WITH CHECK ADD  CONSTRAINT [BlogID] FOREIGN KEY([BlogID])
REFERENCES [dbo].[Blog] ([ID])
GO
ALTER TABLE [dbo].[BlogDetail] CHECK CONSTRAINT [BlogID]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [productID_in_cart] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [productID_in_cart]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [userID_in_cart] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [userID_in_cart]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD FOREIGN KEY([ShipInfoID])
REFERENCES [dbo].[ShipInfo] ([ID])
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [orderID_in_orders_6] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [orderID_in_orders_6]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [productID_in_feedback] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [productID_in_feedback]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [userID_in_user_3] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [userID_in_user_3]
GO
ALTER TABLE [dbo].[Feedback_Replies]  WITH CHECK ADD  CONSTRAINT [feedbackID_in_feedback] FOREIGN KEY([FeedbackID])
REFERENCES [dbo].[Feedback] ([ID])
GO
ALTER TABLE [dbo].[Feedback_Replies] CHECK CONSTRAINT [feedbackID_in_feedback]
GO
ALTER TABLE [dbo].[Feedback_Replies]  WITH CHECK ADD  CONSTRAINT [userID_in_user_4] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Feedback_Replies] CHECK CONSTRAINT [userID_in_user_4]
GO
ALTER TABLE [dbo].[HelpContent]  WITH CHECK ADD  CONSTRAINT [TitleID] FOREIGN KEY([TitleID])
REFERENCES [dbo].[HelpTitle] ([TitleID])
GO
ALTER TABLE [dbo].[HelpContent] CHECK CONSTRAINT [TitleID]
GO
ALTER TABLE [dbo].[HelpTitle]  WITH CHECK ADD  CONSTRAINT [CategoryID_in_HelpTitle] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[HelpCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[HelpTitle] CHECK CONSTRAINT [CategoryID_in_HelpTitle]
GO
ALTER TABLE [dbo].[HelpTitle]  WITH CHECK ADD  CONSTRAINT [userID_in_user_5] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[HelpTitle] CHECK CONSTRAINT [userID_in_user_5]
GO
ALTER TABLE [dbo].[member]  WITH CHECK ADD FOREIGN KEY([room_id])
REFERENCES [dbo].[chat_room] ([room_id])
GO
ALTER TABLE [dbo].[member]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[messsages]  WITH CHECK ADD FOREIGN KEY([room_id])
REFERENCES [dbo].[chat_room] ([room_id])
GO
ALTER TABLE [dbo].[messsages]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [OrderID_in_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [OrderID_in_Orders]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [UserID_in_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [UserID_in_Users]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [orderID_in_order_detail] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [orderID_in_order_detail]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [productID_in_order_detail] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [productID_in_order_detail]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [statusID_in_order_status] FOREIGN KEY([Status])
REFERENCES [dbo].[Order_Status] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [statusID_in_order_status]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [userID_in_order_status] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [userID_in_order_status]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [product_in_subCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([SubCategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [product_in_subCategory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [ShopID_in_Shop] FOREIGN KEY([ShopID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [ShopID_in_Shop]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [StatusID_in_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[ProductStatus] ([StatusID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [StatusID_in_Status]
GO
ALTER TABLE [dbo].[ProductImg]  WITH CHECK ADD  CONSTRAINT [ProductImg_ID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductImg] CHECK CONSTRAINT [ProductImg_ID]
GO
ALTER TABLE [dbo].[ShipInfo]  WITH CHECK ADD  CONSTRAINT [order_id_in_ship_info] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[ShipInfo] CHECK CONSTRAINT [order_id_in_ship_info]
GO
ALTER TABLE [dbo].[ShipInfo]  WITH CHECK ADD  CONSTRAINT [ship_city_in_ship_info] FOREIGN KEY([ShipCityID])
REFERENCES [dbo].[Ship] ([id])
GO
ALTER TABLE [dbo].[ShipInfo] CHECK CONSTRAINT [ship_city_in_ship_info]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [CategoryID]
GO
ALTER TABLE [dbo].[UserAddress]  WITH CHECK ADD  CONSTRAINT [ship_city_in_ship_address] FOREIGN KEY([ShipCityID])
REFERENCES [dbo].[Ship] ([id])
GO
ALTER TABLE [dbo].[UserAddress] CHECK CONSTRAINT [ship_city_in_ship_address]
GO
ALTER TABLE [dbo].[UserAddress]  WITH CHECK ADD  CONSTRAINT [UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserAddress] CHECK CONSTRAINT [UserID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [role_in_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [role_in_Role]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [ShopID] FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shop] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [ShopID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [Status_ID_in_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[UserStatus] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [Status_ID_in_Status]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [valid_star] CHECK  (([Star]<(6) AND [Star]>(0)))
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [valid_star]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([SalePercent]>=(0) AND [SalePercent]<=(100)))
GO
USE [master]
GO
ALTER DATABASE [SWP391_OnlineShop] SET  READ_WRITE 
GO
