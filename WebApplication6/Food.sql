USE [master]
GO
/****** Object:  Database [Food]    Script Date: 2018/12/3 20:10:00 ******/
CREATE DATABASE [Food]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Food', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Food.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Food_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Food_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Food] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Food].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Food] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Food] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Food] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Food] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Food] SET ARITHABORT OFF 
GO
ALTER DATABASE [Food] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Food] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Food] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Food] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Food] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Food] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Food] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Food] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Food] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Food] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Food] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Food] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Food] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Food] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Food] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Food] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Food] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Food] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Food] SET RECOVERY FULL 
GO
ALTER DATABASE [Food] SET  MULTI_USER 
GO
ALTER DATABASE [Food] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Food] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Food] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Food] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Food', N'ON'
GO
USE [Food]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2018/12/3 20:10:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Admin_id] [int] IDENTITY(1,1) NOT NULL,
	[Admin_name] [nchar](10) NULL,
	[Admin_pwd] [nchar](10) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodShare]    Script Date: 2018/12/3 20:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodShare](
	[Fs_id] [int] IDENTITY(1,1) NOT NULL,
	[User_id] [int] NULL,
	[Fs_title] [nvarchar](50) NULL,
	[Fs_img] [nvarchar](max) NULL,
	[Fs_lable] [nvarchar](50) NULL,
	[Fs_addtime] [datetime] NULL,
	[Fs_detail] [nvarchar](max) NULL,
	[ReadCount] [int] NULL,
	[Collection] [int] NULL,
 CONSTRAINT [PK_FoodShare] PRIMARY KEY CLUSTERED 
(
	[Fs_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodShareCollection]    Script Date: 2018/12/3 20:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodShareCollection](
	[FsC_id] [int] IDENTITY(1,1) NOT NULL,
	[User_id] [int] NULL,
	[Fs_id] [int] NULL,
	[State] [int] NULL,
 CONSTRAINT [PK_FoodShareCollection] PRIMARY KEY CLUSTERED 
(
	[FsC_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodShareComment]    Script Date: 2018/12/3 20:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodShareComment](
	[FsComment_id] [int] IDENTITY(1,1) NOT NULL,
	[FsComment_content] [nvarchar](max) NULL,
	[User_id] [int] NULL,
	[Fs_id] [int] NULL,
	[Addtime] [datetime] NULL,
 CONSTRAINT [PK_FoodShareComment] PRIMARY KEY CLUSTERED 
(
	[FsComment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodShareReply]    Script Date: 2018/12/3 20:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodShareReply](
	[FsReply_id] [int] IDENTITY(1,1) NOT NULL,
	[User_id] [int] NULL,
	[Fs_id] [int] NULL,
	[FsComment_id] [int] NULL,
	[FsReply_content] [nvarchar](max) NULL,
	[Addtime] [datetime] NULL,
 CONSTRAINT [PK_FoodShareReply] PRIMARY KEY CLUSTERED 
(
	[FsReply_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 2018/12/3 20:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[News_id] [int] IDENTITY(1,1) NOT NULL,
	[News_content] [nvarchar](max) NULL,
	[News_title] [nvarchar](50) NULL,
	[News_img] [nvarchar](max) NULL,
	[News_lable] [nchar](10) NULL,
	[News_addtime] [datetime] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[News_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Post]    Script Date: 2018/12/3 20:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Post_id] [int] IDENTITY(1,1) NOT NULL,
	[User_id] [int] NULL,
	[Post_title] [nvarchar](50) NULL,
	[Post_content] [nvarchar](max) NULL,
	[Post_img] [nvarchar](max) NULL,
	[Post_addtime] [datetime] NULL,
	[Post_lable] [nvarchar](50) NULL,
	[ReadCount] [int] NULL,
	[Collection] [int] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostCollection]    Script Date: 2018/12/3 20:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostCollection](
	[PostCollection_id] [int] IDENTITY(1,1) NOT NULL,
	[Post_id] [int] NULL,
	[User_id] [int] NULL,
	[State] [int] NULL,
 CONSTRAINT [PK_PostCollection] PRIMARY KEY CLUSTERED 
(
	[PostCollection_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostComment]    Script Date: 2018/12/3 20:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostComment](
	[PostComment_id] [int] IDENTITY(1,1) NOT NULL,
	[User_id] [int] NULL,
	[Post_id] [int] NULL,
	[PostComment_content] [nvarchar](max) NULL,
	[Addtime] [datetime] NULL,
 CONSTRAINT [PK_PostComment] PRIMARY KEY CLUSTERED 
(
	[PostComment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostReply]    Script Date: 2018/12/3 20:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostReply](
	[PostReply_id] [int] IDENTITY(1,1) NOT NULL,
	[User_id] [int] NULL,
	[PostComment_id] [int] NULL,
	[Post_id] [int] NULL,
	[Addtime] [datetime] NULL,
	[PostReply_content] [nvarchar](max) NULL,
 CONSTRAINT [PK_PostReply] PRIMARY KEY CLUSTERED 
(
	[PostReply_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2018/12/3 20:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[User_id] [int] IDENTITY(1,1) NOT NULL,
	[User_pwd] [nvarchar](50) NULL,
	[User_name] [nchar](10) NULL,
	[User_img] [nvarchar](50) NULL,
	[User_addtime] [datetime] NULL,
	[User_sex] [nchar](2) NULL,
	[User_phone] [nvarchar](50) NULL,
	[User_birthday] [nvarchar](50) NULL,
	[User_sign] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[User_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Video]    Script Date: 2018/12/3 20:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[Video_id] [int] IDENTITY(1,1) NOT NULL,
	[User_id] [int] NULL,
	[Video_url] [nvarchar](max) NULL,
	[Video_decription] [nvarchar](max) NULL,
	[Video_img] [nvarchar](max) NULL,
	[Video_lable] [nvarchar](50) NULL,
	[Addtime] [datetime] NULL,
	[ReadCount] [int] NULL,
	[Collection] [int] NULL,
 CONSTRAINT [PK_Video] PRIMARY KEY CLUSTERED 
(
	[Video_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VideoCollection]    Script Date: 2018/12/3 20:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoCollection](
	[VideoCollection_id] [int] IDENTITY(1,1) NOT NULL,
	[User_id] [int] NULL,
	[Video_id] [int] NULL,
	[State] [int] NULL,
 CONSTRAINT [PK_VideoCollection] PRIMARY KEY CLUSTERED 
(
	[VideoCollection_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VideoComment]    Script Date: 2018/12/3 20:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoComment](
	[VideoComment_id] [int] IDENTITY(1,1) NOT NULL,
	[User_id] [int] NULL,
	[Video_id] [int] NULL,
	[VideoComment_content] [nvarchar](max) NULL,
	[Addtime] [datetime] NULL,
 CONSTRAINT [PK_VideoComment] PRIMARY KEY CLUSTERED 
(
	[VideoComment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VideoReply]    Script Date: 2018/12/3 20:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoReply](
	[VideoReply_id] [int] IDENTITY(1,1) NOT NULL,
	[User_id] [int] NULL,
	[Video_id] [int] NULL,
	[VideoComment_id] [int] NULL,
	[VideoReply_content] [nvarchar](max) NULL,
	[Addtime] [datetime] NULL,
 CONSTRAINT [PK_VideoReply] PRIMARY KEY CLUSTERED 
(
	[VideoReply_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[FoodShare] ON 

INSERT [dbo].[FoodShare] ([Fs_id], [User_id], [Fs_title], [Fs_img], [Fs_lable], [Fs_addtime], [Fs_detail], [ReadCount], [Collection]) VALUES (1, 1, N'红烧肉', N'/images/Food/hongshaorou1.jpg', N'荤菜类', CAST(0x0000A9A100000000 AS DateTime), N'牛腩用冷水冲洗干净，切成3厘米大小的方块，将牛肉块放入锅中，加入足量的冷水(水量以完全没过牛肉块为准)大火烧沸后继续煮制2分钟，待血沫完全淅出后，将牛肉块捞出洗净将冼净的牛肉块放入电饭煲内胆里，加入八角、桂皮、香叶、生抽，小心继续纯煮25分钟，调入适量的盐即可出锅', NULL, NULL)
INSERT [dbo].[FoodShare] ([Fs_id], [User_id], [Fs_title], [Fs_img], [Fs_lable], [Fs_addtime], [Fs_detail], [ReadCount], [Collection]) VALUES (2, 2, N'煎饼', N'../images/Food/jidan1.jpg', N'油炸类', CAST(0x0000A9A100000000 AS DateTime), N'将小葱洗净切成葱花，连同鸡蛋加入面粉里，加入适量的盐，再加入少许胡椒粉，添加适量的清水，将其拌成面糊，平底锅烧热，加入食用油，煎至一面金黄，再反面煎另一面，煎至两面金黄即可。', NULL, NULL)
INSERT [dbo].[FoodShare] ([Fs_id], [User_id], [Fs_title], [Fs_img], [Fs_lable], [Fs_addtime], [Fs_detail], [ReadCount], [Collection]) VALUES (3, 3, N'肉末炒面', N'../images/Food/chaomian1.jpg', N'主食类', CAST(0x0000A9A100000000 AS DateTime), N'加油，加水，煮面，放入青椒肉末，爆炒至成熟即可，味道鲜美，分量很多。', NULL, NULL)
INSERT [dbo].[FoodShare] ([Fs_id], [User_id], [Fs_title], [Fs_img], [Fs_lable], [Fs_addtime], [Fs_detail], [ReadCount], [Collection]) VALUES (4, 1, N'酸辣藕片', N'../images/Food/suanlaoupian1.jpg', N'素食类', CAST(0x0000A9A100000000 AS DateTime), N'豆腐切片，菜掰断，辣椒切段，姜蒜切粒，汤锅烧水，水开后，放入叶子烫焉，捞出叶子铺在盆底，热锅倒油，放入花椒、豆瓣酱小火炒香，倒入辣椒节、姜蒜爆香放入菜根炒焉，葱和蒜撒在表面，热锅热油，热好的油浇在葱蒜上面。', NULL, NULL)
INSERT [dbo].[FoodShare] ([Fs_id], [User_id], [Fs_title], [Fs_img], [Fs_lable], [Fs_addtime], [Fs_detail], [ReadCount], [Collection]) VALUES (5, 2, N'串串烧烤', N'../images/Food/chuanchuanshaokao1.jpg', N'烧烤类', CAST(0x0000A9A100000000 AS DateTime), N'牛腩用冷水冲洗干净，切成3厘米大小的方块，将牛肉块放入锅中，加入足量的冷水(水量以完全没过牛肉块为准)大火烧沸后继续煮制2分钟，待血沫完全淅出后，将牛肉块捞出洗净将冼净的牛肉块放入电饭煲内胆里，加入八角、桂皮、香叶、生抽，小心继续纯煮25分钟，调入适量的盐即可出锅', NULL, NULL)
INSERT [dbo].[FoodShare] ([Fs_id], [User_id], [Fs_title], [Fs_img], [Fs_lable], [Fs_addtime], [Fs_detail], [ReadCount], [Collection]) VALUES (6, 3, N'土豆牛腩', N'../images/Food/tudouniunan1.jpg', N'荤菜类', CAST(0x0000A9A100000000 AS DateTime), N'牛腩用冷水冲洗干净，切成3厘米大小的方块，将牛肉块放入锅中，加入足量的冷水(水量以完全没过牛肉块为准)大火烧沸后继续煮制2分钟，待血沫完全淅出后，将牛肉块捞出洗净将冼净的牛肉块放入电饭煲内胆里，加入八角、桂皮、香叶、生抽，小心继续纯煮25分钟，调入适量的盐即可出锅', NULL, NULL)
INSERT [dbo].[FoodShare] ([Fs_id], [User_id], [Fs_title], [Fs_img], [Fs_lable], [Fs_addtime], [Fs_detail], [ReadCount], [Collection]) VALUES (7, 1, N'水煮豆腐', N'../images/Food/shuizhudoufu1.jpg', N'素食类', CAST(0x0000A9A100000000 AS DateTime), N'豆腐切片，菜掰断，辣椒切段，姜蒜切粒，汤锅烧水，水开后，放入叶子烫焉，捞出叶子铺在盆底，热锅倒油，放入花椒、豆瓣酱小火炒香，倒入辣椒节、姜蒜爆香放入菜根炒焉，葱和蒜撒在表面，热锅热油，热好的油浇在葱蒜上面。', NULL, NULL)
INSERT [dbo].[FoodShare] ([Fs_id], [User_id], [Fs_title], [Fs_img], [Fs_lable], [Fs_addtime], [Fs_detail], [ReadCount], [Collection]) VALUES (8, 2, N'烤鸡腿', N'../images/Food/kaojitui1.jpg', N'烧烤类', CAST(0x0000A9A100000000 AS DateTime), N'牛腩用冷水冲洗干净，切成3厘米大小的方块，将牛肉块放入锅中，加入足量的冷水(水量以完全没过牛肉块为准)大火烧沸后继续煮制2分钟，待血沫完全淅出后，将牛肉块捞出洗净将冼净的牛肉块放入电饭煲内胆里，加入八角、桂皮、香叶、生抽，小心继续纯煮25分钟，调入适量的盐即可出锅', NULL, NULL)
INSERT [dbo].[FoodShare] ([Fs_id], [User_id], [Fs_title], [Fs_img], [Fs_lable], [Fs_addtime], [Fs_detail], [ReadCount], [Collection]) VALUES (9, 3, N'大白菜', N'../images/Food/dabaicai1.jpg', N'素食类', CAST(0x0000A9A100000000 AS DateTime), N'牛腩用冷水冲洗干净，切成3厘米大小的方块，将牛肉块放入锅中，加入足量的冷水(水量以完全没过牛肉块为准)大火烧沸后继续煮制2分钟，待血沫完全淅出后，将牛肉块捞出洗净将冼净的牛肉块放入电饭煲内胆里，加入八角、桂皮、香叶、生抽，小心继续纯煮25分钟，调入适量的盐即可出锅', NULL, NULL)
INSERT [dbo].[FoodShare] ([Fs_id], [User_id], [Fs_title], [Fs_img], [Fs_lable], [Fs_addtime], [Fs_detail], [ReadCount], [Collection]) VALUES (10, 1, N'虾仁沙拉汤', N'../images/Food/xiarenshalatang1.jpg', N'汤类', CAST(0x0000A9A100000000 AS DateTime), N'牛腩用冷水冲洗干净，切成3厘米大小的方块，将牛肉块放入锅中，加入足量的冷水(水量以完全没过牛肉块为准)大火烧沸后继续煮制2分钟，待血沫完全淅出后，将牛肉块捞出洗净将冼净的牛肉块放入电饭煲内胆里，加入八角、桂皮、香叶、生抽，小心继续纯煮25分钟，调入适量的盐即可出锅', NULL, NULL)
INSERT [dbo].[FoodShare] ([Fs_id], [User_id], [Fs_title], [Fs_img], [Fs_lable], [Fs_addtime], [Fs_detail], [ReadCount], [Collection]) VALUES (11, 2, NULL, NULL, NULL, CAST(0x0000A9A100000000 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[FoodShare] ([Fs_id], [User_id], [Fs_title], [Fs_img], [Fs_lable], [Fs_addtime], [Fs_detail], [ReadCount], [Collection]) VALUES (12, 3, NULL, NULL, NULL, CAST(0x0000A9A100000000 AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[FoodShare] OFF
SET IDENTITY_INSERT [dbo].[FoodShareComment] ON 

INSERT [dbo].[FoodShareComment] ([FsComment_id], [FsComment_content], [User_id], [Fs_id], [Addtime]) VALUES (0, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodShareComment] ([FsComment_id], [FsComment_content], [User_id], [Fs_id], [Addtime]) VALUES (1, N'好看，想吃', 1, 1, CAST(0x0000A9A700000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[FoodShareComment] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([News_id], [News_content], [News_title], [News_img], [News_lable], [News_addtime]) VALUES (1, N'中国江西网讯　彭锋、全媒体记者刘健摄影报道：为进一步弘扬赣菜文化，促进新宜吉六县跨行政区经贸交流合作，11月14日至15日，新宜吉六县跨行政区厨艺美食节在新余市举行，渝水区、分宜县、上高县、樟树市、新干县、峡江县六县美食齐聚，美滋美味令人垂涎欲滴。

    本次新宜吉六县跨行政区厨艺美食节通过形式多样的厨艺交流，挖掘出了一批各地具有代表性的特色菜肴，促进三地六县创新赣菜餐饮品牌。（江南都市 报）', N'六县举办美食节推广赣菜', N'../images/News/News_1.jpg', N'最新        ', CAST(0x0000A9AB00000000 AS DateTime))
INSERT [dbo].[News] ([News_id], [News_content], [News_title], [News_img], [News_lable], [News_addtime]) VALUES (2, N'<p>舌尖上的江西美食，吃货们千万不可错过。</p><p>江西菜历史悠久，菜系丰富，且已南昌、九江、鄱阳湖、景德镇等地区分流派系化构成，提到江西菜，人们随口就能说出几道，吸引了不少食客来这里寻找美食，今天小编就帮大家细数江西的特色美食，还不赶紧把它们盛进你的碗里。</p><p>藜蒿炒腊肉</p><p>它是江西菜的代表之一，藜蒿是产自鄱阳湖的特产，因为鄱阳湖是我国最大的淡水湖，所以出产的也是佳品，再搭配当地的腊肉，味道极其独特，其中在往期的《天天向上》里，这些美食都有出现过，两种反差极大的味道，翻炒中碰撞出了一道名菜，炒出来的藜蒿在鲜嫩翠绿中发亮，腊肉清香交融。</p>', N'舌尖上的江西美食，吃货们千万不可错过', N'../images/News/News_2.jpg', N'最热        ', CAST(0x0000A5FC00000000 AS DateTime))
INSERT [dbo].[News] ([News_id], [News_content], [News_title], [News_img], [News_lable], [News_addtime]) VALUES (3, N'南昌米粉蒸肉：南昌人每年立夏前后都喜欢蒸上一碗米粉蒸肉，据说立夏日吃了不会生痱子。成菜美观，味道鲜美。民国《安义县志》（稿本）载：立夏，炒占米磨粉，加香料，和酒酱，蒸米粉肉。食后不分老幼，衡其轻重，藉以觇肥瘦之消长焉。因此，在立夏之时，吃上一道地道的米粉蒸肉，不仅是一种习俗，更是一道美食，一种养生之道！', N'不吃对不起自己啊，江西美食真的是太好吃了！', N'../images/News/News_3.jpg', N'推荐        ', CAST(0x0000A9AB00000000 AS DateTime))
INSERT [dbo].[News] ([News_id], [News_content], [News_title], [News_img], [News_lable], [News_addtime]) VALUES (4, N'赣州九层糕。在《舌尖上的中国Ⅱ—时节》中。出现的赣州九层米糕，应该是《舌尖》江西美食的正式亮相，解说词中这样说到：“头年的大米，加入韭菜，磨出绿色的米浆，晾干的栀子果用水冲泡，调和出泥土般的黄色，第三层，大米的白色，最后，是喜庆的茄红一层层添加蒸熟，反复九次，做出的米糕就叫九层皮。”', N'如果你来到江西，这些必不可少的美食，最有名的江西美食都在这', N'../images/News/News_4.jpg', N'最新        ', CAST(0x0000A97100000000 AS DateTime))
INSERT [dbo].[News] ([News_id], [News_content], [News_title], [News_img], [News_lable], [News_addtime]) VALUES (5, N'方法一：我们首先要准备的食材有：藜蒿、腊肉，配料要准备红辣椒、大蒜、姜。

步骤一：我们先把锅洗干净，锅里加入清水。

步骤二：加入清水后，烧火，把水烧开。

步骤三：水烧开后，把腊肉放到锅里煮一下，把腊肉的咸味去掉一点和杂质煮掉。

步骤四：煮几分钟后，就可以捞出来。放凉。步骤五：把藜蒿的叶子摘掉，把根去掉。

步骤六：去掉后，把藜蒿摘成一小段一小段的，然后洗干净。

步骤七：腊肉放凉后，把腊肉切成薄片。

步骤八：把腊肉切好的后，就把大蒜、辣椒和姜洗干净。

步骤九：大蒜、辣椒和姜洗干净后，大蒜剁碎，辣椒切成段，姜切成片。

步骤十：把刚才煮了腊肉的水倒出来。

步骤十一：水倒出来后，把锅烧热。步骤十二：锅烧热后，把腊肉入进去炒，把腊肉里面的油炒出来。

步骤十三：油炒出来后，把切好的蒜、辣椒和姜放进去炒。

步骤十四：用铲子一直的翻炒，直到腊肉熟了。

步骤十五：腊肉炒熟后，把藜蒿也放进去。

步骤十六：藜蒿放进去后，用铲子不停的翻炒，直到把藜蒿炒熟。

步骤十七：因为腊肉是咸的，所以这道菜可以不用放盐。

步骤十八：把藜蒿炒熟后，就可以拿碗装起来了。', N'江西美食之腊肉的做法', N'../images/News/News_5.jpg', N'最新        ', CAST(0x0000A9AC00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Post_id], [User_id], [Post_title], [Post_content], [Post_img], [Post_addtime], [Post_lable], [ReadCount], [Collection]) VALUES (1, 1, N'好吃', N'粉红粉红粉红粉红粉红风格和...', N'../images/Post/tiezi.jpg', CAST(0x0000A9A400000000 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Post] ([Post_id], [User_id], [Post_title], [Post_content], [Post_img], [Post_addtime], [Post_lable], [ReadCount], [Collection]) VALUES (2, 2, N'做饭', N'今早起床面对阳光满满的正能量', N'../images/Post/tiezi2.jpg', CAST(0x0000A9A400000000 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Post] ([Post_id], [User_id], [Post_title], [Post_content], [Post_img], [Post_addtime], [Post_lable], [ReadCount], [Collection]) VALUES (3, 3, N'yeshi', N'嘴角向下会迷失方向', N'../images/Post/tiezi3.jpg', CAST(0x0000A9A400000000 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Post] ([Post_id], [User_id], [Post_title], [Post_content], [Post_img], [Post_addtime], [Post_lable], [ReadCount], [Collection]) VALUES (4, 2, N'风景', N'好看好看好看', N'../images/Post/tiezi4.jpg', CAST(0x0000A9A400000000 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Post] ([Post_id], [User_id], [Post_title], [Post_content], [Post_img], [Post_addtime], [Post_lable], [ReadCount], [Collection]) VALUES (5, 3, N'高山', N'山好高', N'../images/Post/tiezi5.jpg', CAST(0x0000A9A400000000 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Post] ([Post_id], [User_id], [Post_title], [Post_content], [Post_img], [Post_addtime], [Post_lable], [ReadCount], [Collection]) VALUES (6, 1, N'夜景', N'夜景好好看', N'../images/Post/tiezi6.jpg', CAST(0x0000A9A400000000 AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Post] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([User_id], [User_pwd], [User_name], [User_img], [User_addtime], [User_sex], [User_phone], [User_birthday], [User_sign]) VALUES (1, N'123', N'烟花易冷1     ', N'../images/User/user3.jpg', CAST(0x0000A9A100000000 AS DateTime), N'女 ', N'15711111111', NULL, N'哦哟哟！')
INSERT [dbo].[UserInfo] ([User_id], [User_pwd], [User_name], [User_img], [User_addtime], [User_sex], [User_phone], [User_birthday], [User_sign]) VALUES (2, N'123', N'奉行家       ', N'../images/User/user1.jpg', CAST(0x0000A9A100000000 AS DateTime), N'男 ', N'15711221122', NULL, N'天青色等烟雨')
INSERT [dbo].[UserInfo] ([User_id], [User_pwd], [User_name], [User_img], [User_addtime], [User_sex], [User_phone], [User_birthday], [User_sign]) VALUES (3, N'123', N'虾32头      ', N'../images/User/user3.jpg', CAST(0x0000A9A100000000 AS DateTime), N'女 ', N'15712121212', NULL, N'而我在等你')
INSERT [dbo].[UserInfo] ([User_id], [User_pwd], [User_name], [User_img], [User_addtime], [User_sex], [User_phone], [User_birthday], [User_sign]) VALUES (4, N'123', N'往后余生      ', N'../images/User/user1.jpg', CAST(0x0000A9A400000000 AS DateTime), N'女 ', N'13612122112', NULL, N'风雪是你')
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
SET IDENTITY_INSERT [dbo].[Video] ON 

INSERT [dbo].[Video] ([Video_id], [User_id], [Video_url], [Video_decription], [Video_img], [Video_lable], [Addtime], [ReadCount], [Collection]) VALUES (1, 1, N'../Video/1.mp4', N'红烧肉', N'../images/Food/hongshaorou1.jpg', N'推荐', CAST(0x0000A9A200000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Video] ([Video_id], [User_id], [Video_url], [Video_decription], [Video_img], [Video_lable], [Addtime], [ReadCount], [Collection]) VALUES (2, 1, N'../Video/2.mp4', N'虾仁炒面', N'../images/Food/jidan1.jpg', N'推荐', CAST(0x0000A9A200000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Video] ([Video_id], [User_id], [Video_url], [Video_decription], [Video_img], [Video_lable], [Addtime], [ReadCount], [Collection]) VALUES (3, 1, N'../Video/3.mp4', N'葱爆大虾', N'../images/Food/paigu1.jpg', N'推荐', CAST(0x0000A9A200000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Video] ([Video_id], [User_id], [Video_url], [Video_decription], [Video_img], [Video_lable], [Addtime], [ReadCount], [Collection]) VALUES (4, 2, N'../Video/3.mp4', N'串串烧烤', N'../images/Food/chuanchuanshaokao1.jpg', N'推荐', CAST(0x0001038700000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Video] ([Video_id], [User_id], [Video_url], [Video_decription], [Video_img], [Video_lable], [Addtime], [ReadCount], [Collection]) VALUES (5, 3, N'../Video/3.mp4', N'油焖大虾', N'../images/Food/xiarenshalatang1.jpg', N'推荐', CAST(0x0001038700000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Video] ([Video_id], [User_id], [Video_url], [Video_decription], [Video_img], [Video_lable], [Addtime], [ReadCount], [Collection]) VALUES (6, 1, N'../Video/3.mp4', N'土豆牛腩', N'../images/Food/tudouniunan1.jpg', N'推荐', CAST(0x0001038700000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Video] ([Video_id], [User_id], [Video_url], [Video_decription], [Video_img], [Video_lable], [Addtime], [ReadCount], [Collection]) VALUES (7, 2, N'../Video/2.mp4', N'烤鸡腿', N'../images/Food/kaojitui1.jpg', N'推荐', CAST(0x0001038700000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Video] ([Video_id], [User_id], [Video_url], [Video_decription], [Video_img], [Video_lable], [Addtime], [ReadCount], [Collection]) VALUES (8, 3, N'../Video/2.mp4', N'水煮肉片', N'../images/Food/shuizhudoufu1.jpg', N'推荐', CAST(0x0001038700000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Video] ([Video_id], [User_id], [Video_url], [Video_decription], [Video_img], [Video_lable], [Addtime], [ReadCount], [Collection]) VALUES (9, 1, N'../Video/1.mp4../Video/1.mp4', N'红烧肉', N'../images/Food/hongshaorou1.jpg', N'最热', CAST(0x0001038700000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Video] ([Video_id], [User_id], [Video_url], [Video_decription], [Video_img], [Video_lable], [Addtime], [ReadCount], [Collection]) VALUES (10, 2, N'../Video/2.mp4', N'虾仁炒面', N'../images/Food/jidan1.jpg', N'最新', CAST(0x0000A9AB00000000 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Video] OFF
ALTER TABLE [dbo].[FoodShare]  WITH CHECK ADD  CONSTRAINT [FK_FoodShare_UserInfo] FOREIGN KEY([User_id])
REFERENCES [dbo].[UserInfo] ([User_id])
GO
ALTER TABLE [dbo].[FoodShare] CHECK CONSTRAINT [FK_FoodShare_UserInfo]
GO
ALTER TABLE [dbo].[FoodShareCollection]  WITH CHECK ADD  CONSTRAINT [FK_FoodShareCollection_FoodShare] FOREIGN KEY([Fs_id])
REFERENCES [dbo].[FoodShare] ([Fs_id])
GO
ALTER TABLE [dbo].[FoodShareCollection] CHECK CONSTRAINT [FK_FoodShareCollection_FoodShare]
GO
ALTER TABLE [dbo].[FoodShareCollection]  WITH CHECK ADD  CONSTRAINT [FK_FoodShareCollection_UserInfo] FOREIGN KEY([User_id])
REFERENCES [dbo].[UserInfo] ([User_id])
GO
ALTER TABLE [dbo].[FoodShareCollection] CHECK CONSTRAINT [FK_FoodShareCollection_UserInfo]
GO
ALTER TABLE [dbo].[FoodShareComment]  WITH CHECK ADD  CONSTRAINT [FK_FoodShareComment_FoodShare] FOREIGN KEY([Fs_id])
REFERENCES [dbo].[FoodShare] ([Fs_id])
GO
ALTER TABLE [dbo].[FoodShareComment] CHECK CONSTRAINT [FK_FoodShareComment_FoodShare]
GO
ALTER TABLE [dbo].[FoodShareComment]  WITH CHECK ADD  CONSTRAINT [FK_FoodShareComment_UserInfo] FOREIGN KEY([User_id])
REFERENCES [dbo].[UserInfo] ([User_id])
GO
ALTER TABLE [dbo].[FoodShareComment] CHECK CONSTRAINT [FK_FoodShareComment_UserInfo]
GO
ALTER TABLE [dbo].[FoodShareReply]  WITH CHECK ADD  CONSTRAINT [FK_FoodShareReply_FoodShare] FOREIGN KEY([Fs_id])
REFERENCES [dbo].[FoodShare] ([Fs_id])
GO
ALTER TABLE [dbo].[FoodShareReply] CHECK CONSTRAINT [FK_FoodShareReply_FoodShare]
GO
ALTER TABLE [dbo].[FoodShareReply]  WITH CHECK ADD  CONSTRAINT [FK_FoodShareReply_FoodShareComment] FOREIGN KEY([FsComment_id])
REFERENCES [dbo].[FoodShareComment] ([FsComment_id])
GO
ALTER TABLE [dbo].[FoodShareReply] CHECK CONSTRAINT [FK_FoodShareReply_FoodShareComment]
GO
ALTER TABLE [dbo].[FoodShareReply]  WITH CHECK ADD  CONSTRAINT [FK_FoodShareReply_UserInfo] FOREIGN KEY([User_id])
REFERENCES [dbo].[UserInfo] ([User_id])
GO
ALTER TABLE [dbo].[FoodShareReply] CHECK CONSTRAINT [FK_FoodShareReply_UserInfo]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_UserInfo] FOREIGN KEY([User_id])
REFERENCES [dbo].[UserInfo] ([User_id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_UserInfo]
GO
ALTER TABLE [dbo].[PostCollection]  WITH CHECK ADD  CONSTRAINT [FK_PostCollection_Post] FOREIGN KEY([Post_id])
REFERENCES [dbo].[Post] ([Post_id])
GO
ALTER TABLE [dbo].[PostCollection] CHECK CONSTRAINT [FK_PostCollection_Post]
GO
ALTER TABLE [dbo].[PostCollection]  WITH CHECK ADD  CONSTRAINT [FK_PostCollection_UserInfo] FOREIGN KEY([User_id])
REFERENCES [dbo].[UserInfo] ([User_id])
GO
ALTER TABLE [dbo].[PostCollection] CHECK CONSTRAINT [FK_PostCollection_UserInfo]
GO
ALTER TABLE [dbo].[PostComment]  WITH CHECK ADD  CONSTRAINT [FK_PostComment_Post] FOREIGN KEY([Post_id])
REFERENCES [dbo].[Post] ([Post_id])
GO
ALTER TABLE [dbo].[PostComment] CHECK CONSTRAINT [FK_PostComment_Post]
GO
ALTER TABLE [dbo].[PostComment]  WITH CHECK ADD  CONSTRAINT [FK_PostComment_UserInfo] FOREIGN KEY([User_id])
REFERENCES [dbo].[UserInfo] ([User_id])
GO
ALTER TABLE [dbo].[PostComment] CHECK CONSTRAINT [FK_PostComment_UserInfo]
GO
ALTER TABLE [dbo].[PostReply]  WITH CHECK ADD  CONSTRAINT [FK_PostReply_Post] FOREIGN KEY([Post_id])
REFERENCES [dbo].[Post] ([Post_id])
GO
ALTER TABLE [dbo].[PostReply] CHECK CONSTRAINT [FK_PostReply_Post]
GO
ALTER TABLE [dbo].[PostReply]  WITH CHECK ADD  CONSTRAINT [FK_PostReply_PostComment] FOREIGN KEY([PostComment_id])
REFERENCES [dbo].[PostComment] ([PostComment_id])
GO
ALTER TABLE [dbo].[PostReply] CHECK CONSTRAINT [FK_PostReply_PostComment]
GO
ALTER TABLE [dbo].[PostReply]  WITH CHECK ADD  CONSTRAINT [FK_PostReply_UserInfo] FOREIGN KEY([User_id])
REFERENCES [dbo].[UserInfo] ([User_id])
GO
ALTER TABLE [dbo].[PostReply] CHECK CONSTRAINT [FK_PostReply_UserInfo]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_Video_UserInfo] FOREIGN KEY([User_id])
REFERENCES [dbo].[UserInfo] ([User_id])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_Video_UserInfo]
GO
ALTER TABLE [dbo].[VideoCollection]  WITH CHECK ADD  CONSTRAINT [FK_VideoCollection_UserInfo] FOREIGN KEY([User_id])
REFERENCES [dbo].[UserInfo] ([User_id])
GO
ALTER TABLE [dbo].[VideoCollection] CHECK CONSTRAINT [FK_VideoCollection_UserInfo]
GO
ALTER TABLE [dbo].[VideoCollection]  WITH CHECK ADD  CONSTRAINT [FK_VideoCollection_Video] FOREIGN KEY([Video_id])
REFERENCES [dbo].[Video] ([Video_id])
GO
ALTER TABLE [dbo].[VideoCollection] CHECK CONSTRAINT [FK_VideoCollection_Video]
GO
ALTER TABLE [dbo].[VideoComment]  WITH CHECK ADD  CONSTRAINT [FK_VideoComment_UserInfo] FOREIGN KEY([User_id])
REFERENCES [dbo].[UserInfo] ([User_id])
GO
ALTER TABLE [dbo].[VideoComment] CHECK CONSTRAINT [FK_VideoComment_UserInfo]
GO
ALTER TABLE [dbo].[VideoComment]  WITH CHECK ADD  CONSTRAINT [FK_VideoComment_Video] FOREIGN KEY([Video_id])
REFERENCES [dbo].[Video] ([Video_id])
GO
ALTER TABLE [dbo].[VideoComment] CHECK CONSTRAINT [FK_VideoComment_Video]
GO
ALTER TABLE [dbo].[VideoReply]  WITH CHECK ADD  CONSTRAINT [FK_VideoReply_UserInfo] FOREIGN KEY([User_id])
REFERENCES [dbo].[UserInfo] ([User_id])
GO
ALTER TABLE [dbo].[VideoReply] CHECK CONSTRAINT [FK_VideoReply_UserInfo]
GO
ALTER TABLE [dbo].[VideoReply]  WITH CHECK ADD  CONSTRAINT [FK_VideoReply_Video] FOREIGN KEY([Video_id])
REFERENCES [dbo].[Video] ([Video_id])
GO
ALTER TABLE [dbo].[VideoReply] CHECK CONSTRAINT [FK_VideoReply_Video]
GO
ALTER TABLE [dbo].[VideoReply]  WITH CHECK ADD  CONSTRAINT [FK_VideoReply_VideoComment] FOREIGN KEY([VideoComment_id])
REFERENCES [dbo].[VideoComment] ([VideoComment_id])
GO
ALTER TABLE [dbo].[VideoReply] CHECK CONSTRAINT [FK_VideoReply_VideoComment]
GO
USE [master]
GO
ALTER DATABASE [Food] SET  READ_WRITE 
GO
