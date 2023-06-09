USE [master]
GO
/****** Object:  Database [MyPrpjectSm]    Script Date: 3/25/2023 4:35:18 PM ******/
CREATE DATABASE [MyPrpjectSm]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyPrpjectSm', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MyPrpjectSm.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyPrpjectSm_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MyPrpjectSm_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MyPrpjectSm] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyPrpjectSm].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyPrpjectSm] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyPrpjectSm] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyPrpjectSm] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyPrpjectSm] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyPrpjectSm] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyPrpjectSm] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MyPrpjectSm] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyPrpjectSm] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyPrpjectSm] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyPrpjectSm] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyPrpjectSm] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyPrpjectSm] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyPrpjectSm] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyPrpjectSm] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyPrpjectSm] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MyPrpjectSm] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyPrpjectSm] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyPrpjectSm] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyPrpjectSm] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyPrpjectSm] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyPrpjectSm] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyPrpjectSm] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyPrpjectSm] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyPrpjectSm] SET  MULTI_USER 
GO
ALTER DATABASE [MyPrpjectSm] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyPrpjectSm] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyPrpjectSm] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyPrpjectSm] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyPrpjectSm] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyPrpjectSm] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MyPrpjectSm] SET QUERY_STORE = OFF
GO
USE [MyPrpjectSm]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/25/2023 4:35:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[displayName] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [int] NULL,
	[role] [nvarchar](50) NULL,
 CONSTRAINT [PK__Account__3214EC27563D8BE6] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/25/2023 4:35:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/25/2023 4:35:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[totalPrice] [decimal](38, 2) NULL,
	[note] [nvarchar](50) NULL,
	[createdate] [nvarchar](50) NULL,
	[shippingid] [int] NULL,
 CONSTRAINT [PK__Order__3214EC27CCD0F605] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/25/2023 4:35:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[productprice] [decimal](20, 2) NULL,
	[productname] [nvarchar](50) NULL,
	[productimage] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK__OrderDet__3214EC27BE64966D] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/25/2023 4:35:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[price] [decimal](38, 2) NULL,
	[description] [nvarchar](4000) NULL,
	[image] [varchar](50) NULL,
	[createdate] [nvarchar](50) NULL,
	[categoryID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 3/25/2023 4:35:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[phone] [int] NULL,
 CONSTRAINT [PK__Shipping__3214EC27DB05B160] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ID], [username], [password], [displayName], [address], [email], [phone], [role]) VALUES (1, N'vuv909', N'12345', N'minhvu', N'Hai Duong', N'minh123@gmail.com', 87542145, N'customer')
INSERT [dbo].[Account] ([ID], [username], [password], [displayName], [address], [email], [phone], [role]) VALUES (2, N'minhvu', N'4567', N'ADMIN', N'Ha Noi', N'admin@gmail.com', 312154486, N'admin')
INSERT [dbo].[Account] ([ID], [username], [password], [displayName], [address], [email], [phone], [role]) VALUES (4, N'mra', N'123', N'rturtu', N'jdtyjdfgh', N'dfh@gmail.com', 678678, N'customer')
INSERT [dbo].[Account] ([ID], [username], [password], [displayName], [address], [email], [phone], [role]) VALUES (5, N'vythi', N'3456', N'minh', N'thanh ha', N'minh@gmail.com', 85674567, N'customer')
INSERT [dbo].[Account] ([ID], [username], [password], [displayName], [address], [email], [phone], [role]) VALUES (6, N'thaivu', N'1234', N'thai', N'hai phong', N'van@gmail.com', 749867456, N'customer')
INSERT [dbo].[Account] ([ID], [username], [password], [displayName], [address], [email], [phone], [role]) VALUES (7, N'shipper', N'1234', N'shipper', N'ha noi', N'shipper@gmail.com', 45654123, N'shipper')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Iphone')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Samsung')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Nokia')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'LG')
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'Xiaomi')
INSERT [dbo].[Category] ([id], [name]) VALUES (6, N'Oppo')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (1, 1, CAST(54.40 AS Decimal(38, 2)), N'ship nhanh nhe', N'Mar  3 2023  5:38PM', 1)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (2, 1, CAST(25.00 AS Decimal(38, 2)), N'ship nhanh nhe', N'Mar  3 2023  5:53PM', 2)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (3, 1, CAST(54.40 AS Decimal(38, 2)), N'good', N'Mar  3 2023  5:58PM', 3)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (4, 1, CAST(55.10 AS Decimal(38, 2)), N'ship can than nhe', N'Mar  3 2023  6:00PM', 4)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (5, 1, CAST(58.80 AS Decimal(38, 2)), N'chúc shop bán đắt hàng', N'Mar  3 2023  6:04PM', 5)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (6, 1, CAST(25.00 AS Decimal(38, 2)), N'hang de vo', N'Mar  4 2023 12:53PM', 6)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (7, 1, CAST(58.80 AS Decimal(38, 2)), N'giao can than', N'Mar  4 2023  1:57PM', 7)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (22, 2, CAST(25.00 AS Decimal(38, 2)), N'2345rwerfe', N'Mar  6 2023  3:00PM', 12)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (25, 2, CAST(25.00 AS Decimal(38, 2)), N'34yt43', N'Mar  7 2023  6:17PM', 15)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (27, 2, CAST(31.90 AS Decimal(38, 2)), N'tyutyr', N'Mar  7 2023  6:20PM', 17)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (28, 2, CAST(31.90 AS Decimal(38, 2)), N'3e4fger', N'Mar  7 2023  6:20PM', 18)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (29, 2, CAST(31.90 AS Decimal(38, 2)), N'ehrtyh', N'Mar  7 2023  6:21PM', 19)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (30, 2, CAST(31.90 AS Decimal(38, 2)), N'dghdrgh', N'Mar  7 2023  6:21PM', 20)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (31, 2, CAST(31.90 AS Decimal(38, 2)), N'', N'Mar  7 2023  6:24PM', 21)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (32, 2, CAST(31.90 AS Decimal(38, 2)), N'', N'Mar  7 2023  7:01PM', 22)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (42, 1, CAST(55.70 AS Decimal(38, 2)), N'hello', N'Mar 10 2023 12:13AM', 30)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (43, 2, CAST(1199.99 AS Decimal(38, 2)), N'srg', N'Mar 10 2023 10:42AM', 40)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (45, 2, CAST(668.00 AS Decimal(38, 2)), N'fwaef', N'Mar 18 2023  3:39PM', 42)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (46, 2, CAST(668.00 AS Decimal(38, 2)), N'gsdfgesrge', N'Mar 24 2023  1:38PM', 43)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (47, 7, CAST(668.00 AS Decimal(38, 2)), N'fghg', N'Mar 24 2023 10:23PM', 44)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (48, 2, CAST(9758.15 AS Decimal(38, 2)), N'dfgdsfgdsfhdsfgh', N'Mar 24 2023 11:46PM', 45)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (49, 2, CAST(1295.00 AS Decimal(38, 2)), N'ghjgh', N'Mar 24 2023 11:48PM', 46)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (50, 2, CAST(449.99 AS Decimal(38, 2)), N'dhdjdgj', N'Mar 25 2023 12:32AM', 47)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (51, 2, CAST(5479.07 AS Decimal(38, 2)), N'fdghfgd', N'Mar 25 2023  1:10AM', 48)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (52, 2, CAST(2399.98 AS Decimal(38, 2)), N'ship nhanh nhe', N'Mar 25 2023  1:13AM', 49)
INSERT [dbo].[Order] ([ID], [account_id], [totalPrice], [note], [createdate], [shippingid]) VALUES (53, 1, CAST(1676.00 AS Decimal(38, 2)), N'hang de vo', N'Mar 25 2023  1:59PM', 50)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (1, 1, CAST(29.40 AS Decimal(20, 2)), N'Fatty and Mabel Adrift', N'http://dummyimage.com/169x109.png/cc0000/ffffff', 1, N'Giao hàng thành công')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (2, 1, CAST(25.00 AS Decimal(20, 2)), N'Hiroshima Mon Amour', N'http://dummyimage.com/240x182.png/dddddd/000000', 1, N'Đang giao')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (3, 2, CAST(25.00 AS Decimal(20, 2)), N'Hiroshima Mon Amour', N'http://dummyimage.com/240x182.png/dddddd/000000', 1, N'Giao hàng thành công')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (4, 3, CAST(29.40 AS Decimal(20, 2)), N'Fatty and Mabel Adrift', N'http://dummyimage.com/169x109.png/cc0000/ffffff', 1, N'Đang chuẩn bị hàng')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (5, 3, CAST(25.00 AS Decimal(20, 2)), N'Hiroshima Mon Amour', N'http://dummyimage.com/240x182.png/dddddd/000000', 1, N'Đang giao')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (6, 4, CAST(29.40 AS Decimal(20, 2)), N'Fatty and Mabel Adrift', N'http://dummyimage.com/169x109.png/cc0000/ffffff', 1, N'Giao hàng thành công')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (7, 4, CAST(25.70 AS Decimal(20, 2)), N'Undisputed II: Last Man Standing', N'http://dummyimage.com/146x161.png/5fa2dd/ffffff', 1, N'Giao hàng thành công')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (8, 5, CAST(29.40 AS Decimal(20, 2)), N'Fatty and Mabel Adrift', N'http://dummyimage.com/169x109.png/cc0000/ffffff', 2, N'Giao hàng thành công')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (9, 6, CAST(25.00 AS Decimal(20, 2)), N'Hiroshima Mon Amour', N'http://dummyimage.com/240x182.png/dddddd/000000', 1, N'Đang chuẩn bị hàng')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (10, 7, CAST(29.40 AS Decimal(20, 2)), N'Fatty and Mabel Adrift', N'http://dummyimage.com/169x109.png/cc0000/ffffff', 2, N'Giao hàng thành công')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (21, 6, CAST(67.00 AS Decimal(20, 2)), N'sdf', N'dfghdf', 6, N'Đang giao')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (28, 22, CAST(25.00 AS Decimal(20, 2)), N'Hiroshima Mon Amour', N'http://dummyimage.com/240x182.png/dddddd/000000', 1, N'Đang chuẩn bị hàng')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (31, 25, CAST(25.00 AS Decimal(20, 2)), N'Hiroshima Mon Amour', N'http://dummyimage.com/240x182.png/dddddd/000000', 1, N'Giao hàng thành công')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (33, 27, CAST(31.90 AS Decimal(20, 2)), N'Step Up', N'http://dummyimage.com/204x142.png/5fa2dd/ffffff', 1, N'Giao hàng thành công')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (34, 28, CAST(31.90 AS Decimal(20, 2)), N'Step Up', N'http://dummyimage.com/204x142.png/5fa2dd/ffffff', 1, N'Đang chuẩn bị hàng')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (35, 29, CAST(31.90 AS Decimal(20, 2)), N'Step Up', N'http://dummyimage.com/204x142.png/5fa2dd/ffffff', 1, N'Giao hàng không thành công')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (36, 30, CAST(31.90 AS Decimal(20, 2)), N'Step Up', N'http://dummyimage.com/204x142.png/5fa2dd/ffffff', 1, N'Giao hàng thành công')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (37, 31, CAST(31.90 AS Decimal(20, 2)), N'Step Up', N'http://dummyimage.com/204x142.png/5fa2dd/ffffff', 1, N'Đang chuẩn bị hàng')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (38, 32, CAST(31.90 AS Decimal(20, 2)), N'Step Up', N'http://dummyimage.com/204x142.png/5fa2dd/ffffff', 1, N'Đang chuẩn bị hàng')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (39, 43, CAST(1199.99 AS Decimal(20, 2)), N'SAMSUNG Galaxy S21 Ultra 5G', N'sss21ultra.png', 1, N'Giao hàng thành công')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (41, 45, CAST(668.00 AS Decimal(20, 2)), N'iPhone 13', N'ip13.png', 1, N'Đang giao')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (42, 46, CAST(668.00 AS Decimal(20, 2)), N'iPhone 13', N'ip13.png', 1, N'Giao hàng không thành công')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (43, 47, CAST(668.00 AS Decimal(20, 2)), N'iPhone 13', N'ip13promax.png', 1, N'Đang giao')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (44, 48, CAST(939.55 AS Decimal(20, 2)), N'iPhone 13 Pro Max', N'ip13promax.png', 4, N'Đang chuẩn bị hàng')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (45, 48, CAST(1199.99 AS Decimal(20, 2)), N'SAMSUNG Galaxy S23 Ultra ', N'sss23plusultra.png', 5, N'Giao hàng thành công')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (46, 49, CAST(791.00 AS Decimal(20, 2)), N'Apple iPhone 12 Pro Max', N'ip12.png', 1, N'Giao hàng thành công')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (47, 49, CAST(504.00 AS Decimal(20, 2)), N'Apple iPhone 11 Pro Max', N'ip11promax.png', 1, N'Đang chuẩn bị hàng')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (48, 50, CAST(449.99 AS Decimal(20, 2)), N'SAMSUNG A53 5G', N'ssa53.png', 1, N'Đang chuẩn bị hàng')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (49, 51, CAST(939.55 AS Decimal(20, 2)), N'iPhone 13 Pro Max', N'ip13promax.png', 2, N'Giao hàng thành công')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (50, 51, CAST(1199.99 AS Decimal(20, 2)), N'SAMSUNG Galaxy S23 Ultra ', N'sss23plusultra.png', 3, N'Giao hàng thành công')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (51, 52, CAST(1199.99 AS Decimal(20, 2)), N'SAMSUNG Galaxy S23 Ultra ', N'sss23plusultra.png', 2, N'Giao hàng thành công')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (52, 53, CAST(668.00 AS Decimal(20, 2)), N'iPhone 13', N'ip13promax.png', 1, N'Đang chuẩn bị hàng')
INSERT [dbo].[OrderDetail] ([ID], [order_id], [productprice], [productname], [productimage], [quantity], [status]) VALUES (53, 53, CAST(504.00 AS Decimal(20, 2)), N'Apple iPhone 11 Pro Max', N'ip11promax.png', 2, N'Đang chuẩn bị hàng')
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (1, N'iPhone 13', 17, CAST(668.00 AS Decimal(38, 2)), N'The iPhone 13 is the latest iteration of Apple''s flagship smartphone, released in September 2021. It comes in four models: the iPhone 13, iPhone 13 Mini, iPhone 13 Pro, and iPhone 13 Pro Max. All models are powered by the A15 Bionic chip and run on iOS 15. They feature improved cameras, including cinematic mode, which allows for professional-quality video recording. The Pro models have a ProMotion display with a 120Hz refresh rate, and the Pro Max model has improved battery life. Additionally, the iPhone 13 has been designed with improved durability, with Ceramic Shield front cover glass and improved water resistance. The iPhone 13 also supports 5G connectivity.', N'ip13promax.png', N'2023-02-26', 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (2, N'Apple iPhone XR', 0, CAST(310.00 AS Decimal(38, 2)), N'The iPhone XR was released by Apple in 2018 and is no longer the latest model. However, it is still a popular and capable smartphone that runs on Apple''s A12 Bionic chip and iOS 15. It has a 6.1-inch Liquid Retina display and features Face ID for biometric security. The camera on the iPhone XR is a single-lens 12-megapixel camera with advanced features like Smart HDR and Portrait mode. It also supports wireless charging and fast charging with a compatible charger. The iPhone XR comes in a variety of colors and storage options and is a great option for those who want a newer iPhone at a more affordable price point.', N'ipxr.png', N'2022-11-09', 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (3, N'Apple iPhone SE', 0, CAST(304.03 AS Decimal(38, 2)), N'The Apple iPhone SE is a budget-friendly smartphone released in 2020. It has a 4.7-inch Retina HD display and runs on Apple''s A13 Bionic chip and iOS 15. The iPhone SE features a single-lens 12-megapixel camera with advanced features like Portrait mode, Depth Control, and Smart HDR. It also supports wireless charging and fast charging with a compatible charger. The design of the iPhone SE is similar to that of the iPhone 8, with a Touch ID fingerprint sensor for biometric security. The iPhone SE comes in three storage options and three color options, making it a great option for those who want an affordable iPhone with powerful performance and a smaller form factor.', N'ipse.png', N'2022-06-19', 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (4, N'Apple iPhone 12 Pro Max', 9, CAST(791.00 AS Decimal(38, 2)), N'The Apple iPhone 12 Pro Max is a high-end smartphone released in 2020. It features a large 6.7-inch Super Retina XDR display and is powered by Apple''s A14 Bionic chip and runs on iOS 15. The iPhone 12 Pro Max has a triple-lens camera system with a 12-megapixel ultra-wide lens, a 12-megapixel wide lens, and a 12-megapixel telephoto lens. It also features advanced camera features like Night mode, Deep Fusion, and Smart HDR 3, as well as Dolby Vision HDR video recording. The iPhone 12 Pro Max has a durable Ceramic Shield front cover glass and is water-resistant with an IP68 rating. It supports 5G connectivity and features MagSafe wireless charging. The iPhone 12 Pro Max comes in four storage options and three color options.', N'ip12.png', N'2022-11-28', 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (5, N'iPhone 13 Pro Max', 13, CAST(939.55 AS Decimal(38, 2)), N'The iPhone 13 Pro Max is the latest and most advanced model of the iPhone 13 series, released by Apple in September 2021. It has a massive 6.7-inch Super Retina XDR display with ProMotion technology and runs on Apple''s A15 Bionic chip with iOS 15. The iPhone 13 Pro Max features a triple-lens camera system with a 12-megapixel ultra-wide lens, a 12-megapixel wide lens, and a 12-megapixel telephoto lens, with improved low-light performance and the ability to capture ProRes video. It also features advanced camera features like Night mode, Deep Fusion, and Smart HDR 4. The iPhone 13 Pro Max has a durable Ceramic Shield front cover glass and is water-resistant with an IP68 rating. It supports 5G connectivity and features MagSafe wireless charging. The iPhone 13 Pro Max comes in four storage options and four color options.', N'ip13promax.png', N'2022-04-20', 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (6, N'Apple iPhone 11 Pro Max', 6, CAST(504.00 AS Decimal(38, 2)), N'The Apple iPhone 11 Pro Max is a high-end smartphone released in 2019. It features a large 6.5-inch Super Retina XDR display and is powered by Apple''s A13 Bionic chip and runs on iOS 15. The iPhone 11 Pro Max has a triple-lens camera system with a 12-megapixel ultra-wide lens, a 12-megapixel wide lens, and a 12-megapixel telephoto lens. It also features advanced camera features like Night mode, Deep Fusion, and Smart HDR. The iPhone 11 Pro Max has a durable front cover glass and is water-resistant with an IP68 rating. It supports 4G LTE connectivity and features wireless charging. The iPhone 11 Pro Max comes in three storage options and four color options. While it is no longer the latest model, the iPhone 11 Pro Max is still a highly capable smartphone with a powerful camera and sleek design.', N'ip11promax.png', N'2022-08-31', 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (7, N'SAMSUNG Galaxy S23+ Plus ', 18, CAST(859.99 AS Decimal(38, 2)), N'The Samsung Galaxy S23+ Plus is a high-end smartphone that boasts a large and vibrant display, powerful performance, and an impressive camera system. It comes equipped with advanced features such as 5G connectivity, a long-lasting battery, and advanced security features. The S23+ Plus is a sleek and stylish device that offers an exceptional user experience.', N'sss23plusultra.png', N'2022-09-08', 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (8, N'SAMSUNG Galaxy Z Fold 4 ', 9, CAST(1569.99 AS Decimal(38, 2)), N'The Samsung Galaxy Z Fold 4 is a cutting-edge smartphone that features a foldable design, allowing users to expand the screen to tablet size. It boasts powerful performance, an impressive camera system, and 5G connectivity. The Z Fold 4 also features advanced security features, a long-lasting battery.', N'sszfoldfour.png', N'2022-10-09', 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (9, N'SAMSUNG Galaxy S23 Ultra ', 5, CAST(1199.99 AS Decimal(38, 2)), N'As of 2021, the Samsung Galaxy S23 Ultra does not exist. The latest Samsung Galaxy S series model is the Samsung Galaxy S21 Ultra 5G. It features a 6.8-inch Dynamic AMOLED display, 108MP main camera, 40MP front camera, 5G connectivity, and an Exynos 2100 or Snapdragon 888 processor.', N'sss23plusultra.png', N'2022-06-14', 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (10, N'SAMSUNG A53 5G', 7, CAST(449.99 AS Decimal(38, 2)), N'The Samsung Galaxy A53 5G is a mid-range smartphone released in 2020. It features a 6.5-inch LCD display, a 48MP main camera, a 13MP front camera, 5G connectivity, and a Snapdragon 750G processor. It also has a 4,500mAh battery and runs on Android 10. The A53 5G is a budget-friendly option for those seeking 5G connectivity.', N'ssa53.png', N'2022-06-13', 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (11, N'SAMSUNG Galaxy S21 Ultra 5G', 1, CAST(1199.99 AS Decimal(38, 2)), N'The Samsung Galaxy S21 Ultra 5G is a high-end smartphone released in 2021. It features a 6.8-inch Dynamic AMOLED display with a 120Hz refresh rate, a 108MP main camera, a 40MP front camera, 5G connectivity, and an Exynos 2100 or Snapdragon 888 processor. It also has a 5,000mAh battery and runs on Android 11.', N'sss21ultra.png', N'2022-05-07', 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (12, N'Samsung Electronics Galaxy Z Fold 2 5G', 19, CAST(999.50 AS Decimal(38, 2)), N'The Samsung Galaxy Z Fold 2 5G is a foldable smartphone released in 2020. It features a 7.6-inch Dynamic AMOLED display when unfolded and a 6.2-inch Super AMOLED display when folded, both with a 120Hz refresh rate. It also has a triple camera setup with 12MP wide, ultrawide.', N'sszfold2.png', N'2022-09-09', 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (13, N'TracFone Samsung Galaxy A42 5G', 7, CAST(249.99 AS Decimal(38, 2)), N'The TracFone Samsung Galaxy A42 5G is a mid-range smartphone with 5G connectivity. It features a 6.6-inch Super AMOLED display, a quad-camera setup with a 48MP main sensor, a Snapdragon 750G processor, 4GB of RAM, and 128GB of internal storage. It also has a large 5,000mAh battery and runs on Android 11 with Samsung''s One UI 3.1.', N'ssA42.png', N'2022-08-12', 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (14, N'SAMSUNG Galaxy S21 FE 5G', 18, CAST(705.98 AS Decimal(38, 2)), N'The Samsung Galaxy S21 FE 5G is a high-end smartphone that offers many of the features of the flagship Galaxy S21 at a more affordable price. It has a 6.4-inch Super AMOLED display, a Snapdragon 888 processor, 6GB or 8GB of RAM, and 128GB or 256GB of internal storage. It also has a triple-camera setup with a 64MP main sensor, a 4,500mAh battery, and runs on Android 11 with Samsung''s One UI 3.1.', N'sss21fe5g.png', N'2023-02-22', 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (15, N'Samsung Galaxy Note 20 5G', 12, CAST(879.99 AS Decimal(38, 2)), N'The Samsung Galaxy Note 20 5G is a premium smartphone with a 6.7-inch Dynamic AMOLED display, a Snapdragon 865+ processor, 8GB of RAM, and 128GB or 256GB of internal storage. It also has a triple-camera setup with a 64MP main sensor, an S Pen stylus for note-taking and drawing, and a large 4,300mAh battery. It runs on Android 10 with Samsung''s One UI 2.5.', N'ssnote205g.png', N'2022-12-30', 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (16, N'SAMSUNG Galaxy S21 5G', 5, CAST(600.00 AS Decimal(38, 2)), N'The Samsung Galaxy S21 5G is a flagship smartphone with a 6.2-inch Dynamic AMOLED display, a Snapdragon 888 processor, 8GB of RAM, and 128GB or 256GB of internal storage. It also has a triple-camera setup with a 64MP main sensor, a 4,000mAh battery, and runs on Android 11 with Samsung''s One UI 3.1. It also supports 5G connectivity for faster download and streaming speeds.', N'sss215g.png', N'2022-12-27', 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (17, N'Samsung Galaxy Note 10+', 18, CAST(300.55 AS Decimal(38, 2)), N'The Samsung Galaxy Note 10+ is a premium smartphone with a 6.8-inch Dynamic AMOLED display, a Snapdragon 855 processor, 12GB of RAM, and 256GB or 512GB of internal storage. It also has a quad-camera setup with a 12MP main sensor, an S Pen stylus for note-taking and drawing, and a large 4,300mAh battery. It runs on Android 9 with Samsung''s One UI 1.5.', N'sss10.png', N'2022-07-08', 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (18, N'Nokia G10', 6, CAST(104.99 AS Decimal(38, 2)), N'The Nokia G10 is a budget-friendly smartphone with a 6.5-inch IPS LCD display, a MediaTek Helio G25 processor, 3GB or 4GB of RAM, and 32GB or 64GB of internal storage. It also has a triple-camera setup with a 13MP main sensor, a 5,000mAh battery, and runs on Android 11 with Nokia''s software, including a 2-year warranty and 3 years of security updates.', N'nokiag10.png', N'2022-10-12', 3)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (19, N'Nokia G100 ', 20, CAST(129.99 AS Decimal(38, 2)), N'The Nokia G100 is a mid-range smartphone with a 6.5-inch IPS LCD display, a Snapdragon 870 processor, 4GB or 6GB of RAM, and 64GB or 128GB of internal storage. It also has a triple-camera setup with a 64MP main sensor, a 5,000mAh battery with fast charging support, and runs on Android 11 with Nokia''s software, including 2 years of OS upgrades and 3 years of security updates. It also comes with a detachable 5G-enabled battery case with wireless charging.



', N'nokiag100.png', N'2022-04-06', 3)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (20, N'Nokia G400 5G', 11, CAST(179.23 AS Decimal(38, 2)), N'This one is for those demanding the most from their smartphone. Nokia G400 5G comes with 1080p Full HD+ display with 120 Hz, and a spectacular triple-rear camera with a 48 MP main sensor and A.I. enhancements. Meanwhile, the 16 MP front-facing camera features Super Night mode for low-light selfies. You’re covered with up to 2 days of battery life¹ and fast charge compatibility. So, if you’ve got high demands, the Nokia G400 5G is the smartphone for you.', N'nokiag400.png', N'2023-02-23', 3)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (21, N'Nokia XR20 5G', 12, CAST(456.88 AS Decimal(38, 2)), N'The Nokia XR20 5G is a rugged smartphone designed for durability and reliability. It features a 6.67-inch Full HD+ display, 48MP rear camera, and 8MP front-facing camera. The device is powered by a Qualcomm Snapdragon 480 5G processor and comes with 6GB of RAM and 128GB of internal storage. It also boasts a 4,630mAh battery with 18W fast charging support. ', N'nokiaxr20.png', N'2022-07-19', 3)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (22, N'Nokia X30 5G ', 6, CAST(469.00 AS Decimal(38, 2)), N'Eco-friendly to its core – equipped with our best PureView photo experience to date. Its body is made with 100% recycled aluminum and 65% recycled plastic – and with 3 years of warranty, 3 OS upgrades and 3 years of monthly security updates, Nokia X30 5G is built with both sustainability and longevity in mind.', N'nokiax30.png', N'2022-08-24', 3)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (23, N'Nokia C01 Plus', 8, CAST(86.77 AS Decimal(38, 2)), N'The Nokia C01 Plus is an entry-level smartphone featuring a 5.45-inch HD+ display, 5MP rear camera, and 5MP front-facing camera. It is powered by a quad-core Unisoc processor and comes with 1GB of RAM and 16GB of internal storage (expandable up to 128GB via microSD). The device runs on Android 11 (Go edition) and is equipped with a 3,000mAh battery. It is designed for affordability and simplicity, making it an ideal choice for budget-conscious users.', N'nokiac01.png', N'2022-06-02', 3)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (24, N'Nokia 8', 16, CAST(100.00 AS Decimal(38, 2)), N'The Nokia 8 is a flagship smartphone released in 2017, featuring a 5.3-inch Quad HD display, dual 13MP rear cameras with Zeiss optics, and a 13MP front-facing camera. It is powered by a Qualcomm Snapdragon 835 processor and comes with 4GB of RAM and 64GB of internal storage (expandable up to 256GB via microSD). The device is also equipped with a 3,090mAh battery with Quick Charge 3.0 support. It was originally released running on Android 7.1 Nougat but has since received updates to Android 9.0 Pie.', N'nokia8.png', N'2022-09-02', 3)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (25, N'Nokia 6300 4G', 16, CAST(69.99 AS Decimal(38, 2)), N'The Nokia 6300 4G is a modern take on the classic Nokia 6300 released in 2006. It features a 2.4-inch QVGA display, 2MP rear camera, and 4GB of internal storage (expandable up to 32GB via microSD). The device runs on the KaiOS operating system and supports 4G connectivity. It also features a 1,500mAh battery and comes with popular apps such as WhatsApp, YouTube, and Google Maps pre-installed.', N'nokia6300.png', N'2022-03-02', 3)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (26, N'LG Q70', 8, CAST(300.99 AS Decimal(38, 2)), N'The LG Q70 is a mid-range smartphone featuring a 6.4-inch Full HD+ display, 32MP rear camera, and 16MP front-facing camera. It is powered by a Qualcomm Snapdragon 675 processor and comes with 4GB of RAM and 64GB of internal storage (expandable up to 2TB via microSD). The device is also equipped with a 4,000mAh battery and is MIL-STD-810G certified for durability. It also features a rear-mounted fingerprint sensor and supports DTS:X 3D Surround Sound.', N'lgq70.png', N'2023-02-01', 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (27, N'LG Velvet (5G)', 17, CAST(500.55 AS Decimal(38, 2)), N'The LG Velvet 5G is a premium smartphone featuring a 6.8-inch Full HD+ OLED display, 48MP rear camera, and 16MP front-facing camera. It is powered by a Qualcomm Snapdragon 765G processor and comes with 6GB of RAM and 128GB of internal storage (expandable up to 2TB via microSD). The device is also equipped with a 4,300mAh battery with 25W fast charging support and is IP68 certified for water and dust resistance. It also supports 5G connectivity and features an in-display fingerprint sensor.', N'lgvelvet.png', N'2022-04-22', 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (28, N'LG V30 ', 13, CAST(79.99 AS Decimal(38, 2)), N'The LG V30 is a flagship smartphone released in 2017, featuring a 6.0-inch Quad HD+ OLED display, dual 16MP and 13MP rear cameras, and a 5MP front-facing camera. It is powered by a Qualcomm Snapdragon 835 processor and comes with 4GB of RAM and 64GB of internal storage (expandable up to 2TB via microSD). The device is also equipped with a 3,300mAh battery with Quick Charge 3.0 and wireless charging support.', N'lgv30.png', N'2022-10-08', 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (29, N'LG G4', 8, CAST(60.66 AS Decimal(38, 2)), N'The LG G4 is a flagship smartphone released in 2015, featuring a 5.5-inch Quad HD IPS display, 16MP rear camera with laser autofocus, and an 8MP front-facing camera. It is powered by a Qualcomm Snapdragon 808 processor and comes with 3GB of RAM and 32GB of internal storage (expandable up to 2TB via microSD). The device is also equipped with a 3,000mAh battery with Quick Charge 2.0 support and runs on Android 6.0 Marshmallow.', N'lgg4.png', N'2023-02-11', 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (30, N'LG V20 ', 14, CAST(40.00 AS Decimal(38, 2)), N'The LG V20 is a flagship smartphone released in 2016, featuring a 5.7-inch Quad HD IPS display, dual 16MP and 8MP rear cameras, and a 5MP front-facing camera.', N'lgv20.png', N'2022-05-19', 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (31, N'LG V40', 12, CAST(100.55 AS Decimal(38, 2)), N'The LG V40 ThinQ is a smartphone released in 2018, featuring a 6.4-inch OLED display, Snapdragon 845 processor, 6GB of RAM, and up to 128GB of storage. It also has a triple-lens rear camera system, a dual-lens front camera, and a 3300mAh battery. Other features include wireless charging and IP68 water resistance.', N'lgv40.png', N'2022-11-07', 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (32, N'LG Q6', 15, CAST(42.00 AS Decimal(38, 2)), N'The LG Q6 is a budget smartphone released in 2017, featuring a 5.5-inch IPS LCD display with an 18:9 aspect ratio, Snapdragon 435 processor, 3GB of RAM, and up to 64GB of storage. It also has a single-lens 13MP rear camera and a 5MP front-facing camera, as well as a 3000mAh battery and Android 7.1.1 Nougat.', N'lgq6.png', N'2022-03-16', 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (33, N'LG V35', 18, CAST(90.00 AS Decimal(38, 2)), N'The LG V35 ThinQ is a high-end smartphone released in 2018, featuring a 6-inch OLED display, Snapdragon 845 processor, 6GB of RAM, and up to 128GB of storage. It also has a dual-lens rear camera system, a 3300mAh battery with Quick Charge 3.0 support, and IP68 water resistance. Other features include wireless charging and Google Assistant integration.', N'lgv35.png', N'2022-04-02', 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (34, N'LG G6', 13, CAST(70.00 AS Decimal(38, 2)), N'The LG G6 is a smartphone released in 2017, featuring a 5.7-inch IPS LCD display with an 18:9 aspect ratio, Snapdragon 821 processor, 4GB of RAM, and up to 128GB of storage. It also has a dual-lens rear camera system, a 3300mAh battery with Quick Charge 3.0 support, and IP68 water resistance. Other features include wireless charging and a fingerprint scanner.', N'lgg6.png', N'2022-06-01', 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (35, N'LG K52 4G LTE', 5, CAST(150.00 AS Decimal(38, 2)), N'The LG K52 is a budget smartphone released in 2020, featuring a 6.6-inch IPS LCD display with an HD+ resolution, MediaTek Helio P35 processor, 3GB of RAM, and up to 64GB of storage. It also has a quad-lens rear camera system, a 4000mAh battery with fast charging, and 4G LTE connectivity. Other features include a rear-mounted fingerprint scanner and a dedicated Google Assistant button.', N'lgk52.png', N'2023-01-30', 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (36, N'Xiaomi 12T PRO 5G + 4G LTE', 10, CAST(660.00 AS Decimal(38, 2)), N'The Xiaomi 12T Pro is a high-end smartphone released in 2021, featuring a 6.67-inch AMOLED display with a 120Hz refresh rate, Snapdragon 888 processor, up to 12GB of RAM, and up to 512GB of storage. It also has a triple-lens rear camera system, a 20MP front-facing camera, and a 5000mAh battery with fast charging support for both 5G and 4G LTE networks. ', N'xiaomi12tpro.png', N'2022-08-03', 5)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (37, N'Xiaomi Note 10 5G + 4G LTE', 15, CAST(300.00 AS Decimal(38, 2)), N'The Xiaomi Note 10 is a mid-range smartphone released in 2019, featuring a 6.47-inch AMOLED display with a curved edge, Snapdragon 730G processor, 6GB of RAM, and up to 128GB of storage. It also has a penta-lens rear camera system, a 32MP front-facing camera, and a 5260mAh battery with fast charging support for both 5G and 4G LTE networks. Other features include an in-display fingerprint scanner and NFC connectivity.', N'xiaonote10.png', N'2022-05-13', 5)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (38, N'Xiaomi Poco X5 PRO 5G + 4G', 19, CAST(372.00 AS Decimal(38, 2)), N'The Xiaomi Poco X5 Pro is a mid-range smartphone released in 2021, featuring a 6.67-inch IPS LCD display with a 120Hz refresh rate, MediaTek Dimensity 1100 processor, up to 8GB of RAM, and up to 256GB of storage. It also has a quad-lens rear camera system, a 16MP front-facing camera, and a 5160mAh battery with fast charging support for both 5G and 4G networks.', N'xiaopocox5pro.png', N'2022-09-04', 5)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (39, N'Xiaomi Redmi 10 2022 NFC 4G LTE', 17, CAST(210.00 AS Decimal(38, 2)), N'The Xiaomi Redmi 10 (2022) is a budget smartphone released in 2022, featuring a 6.5-inch IPS LCD display with a 90Hz refresh rate, MediaTek Helio G88 processor, up to 6GB of RAM, and up to 128GB of storage. It also has a quad-lens rear camera system, an 8MP front-facing camera, and a 5000mAh battery with fast charging support. Other features include NFC connectivity, an IR blaster, and a rear-mounted fingerprint scanner.', N'remi10.png', N'2022-06-09', 5)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (40, N'Xiaomi Note 10S 4G', 24, CAST(200.00 AS Decimal(38, 2)), N'The Xiaomi Note 10S is a mid-range smartphone released in 2021, featuring a 6.43-inch AMOLED display with a 60Hz refresh rate, MediaTek Helio G95 processor, up to 8GB of RAM, and up to 128GB of storage. It also has a quad-lens rear camera system, a 16MP front-facing camera, and a 5000mAh battery with fast charging support for 4G networks. Other features include an in-display fingerprint scanner and NFC connectivity.', N'xiaominote10s.png', N'2022-06-09', 5)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (41, N'Xiaomi Pad 5 ', 23, CAST(500.00 AS Decimal(38, 2)), N'The Xiaomi Pad 5 is a tablet released in 2021, featuring an 11-inch IPS LCD display with a 120Hz refresh rate, Snapdragon 860 processor, up to 6GB of RAM, and up to 256GB of storage. It also has a dual-lens rear camera system, an 8MP front-facing camera, and a 8720mAh battery with fast charging support. Other features include a stylus pen, quad speakers, and Wi-Fi 6 connectivity.', N'xiaomipad5.png', N'2022-06-09', 5)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (42, N'Xiaomi Redmi 9 4GB/64GB Carbon Grey EU', 12, CAST(266.94 AS Decimal(38, 2)), N'The Xiaomi Redmi 9 is a budget smartphone released in 2020, featuring a 6.53-inch IPS LCD display, MediaTek Helio G80 processor, 4GB of RAM, and 64GB of storage. It also has a quad-lens rear camera system, a 8MP front-facing camera, and a 5020mAh battery with fast charging support. Other features include a rear-mounted fingerprint scanner, NFC connectivity, and a headphone jack. The Carbon Grey EU version is designed for the European market.', N'redmi9.png', N'2022-06-09', 5)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (43, N'OPPO Reno 8 Pro ', 34, CAST(728.00 AS Decimal(38, 2)), N'It comes with 8 GB, 12 GB RAM and 128 GB, 256 GB internal storage and is powered by MediaTek Dimensity 1300 Octa-core processor. It comes with a rear triple camera set up with a 50 MP (wide) + 2 MP (macro) + 2 MP (depth).', N'opporeno8.png', N'2022-06-09', 6)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (44, N'Oppo Reno 6 Pro 5G', 12, CAST(599.00 AS Decimal(38, 2)), N'The OPPO Reno 6 Pro 5G is a mid-range smartphone released in 2021, featuring a 6.55-inch AMOLED display with a 90Hz refresh rate, MediaTek Dimensity 1200 processor, up to 12GB of RAM, and up to 256GB of storage. It also has a quad-lens rear camera system, a 32MP front-facing camera, and a 4500mAh battery with fast charging support. Other features include an in-display fingerprint scanner and 5G connectivity.', N'reno6pro.png', N'2022-06-09', 6)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (45, N'Oppo A77', 12, CAST(400.66 AS Decimal(38, 2)), N'The OPPO A77 is a mid-range smartphone released in 2017, featuring a 5.5-inch IPS LCD display, MediaTek MT6750T processor, 4GB of RAM, and 64GB of storage. It also has a 13MP rear camera, a 16MP front-facing camera, and a 3200mAh battery with fast charging support. Other features include a fingerprint scanner and 4G LTE connectivity.', N'oppoa77.png', N'2022-06-09', 6)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (46, N'OPPO Find N2 Flip', 22, CAST(700.44 AS Decimal(38, 2)), N'The internal screen is very much the usual type for a flip phone. Oppo''s clamshell has a large 6.8-inch 21:9 ratio AMOLED panel which sings all the right notes for a flagship screen. Those include a peak brightness of 1600 nits, up to 120Hz refresh rates and support for HDR10+ content. The refresh rates are adaptive too, using LTPO technology to quickly adjust down to 1Hz when needed, or as high as 120Hz when the content demands it.', N'oppofindzflip.png', N'2022-06-09', 6)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (47, N'OPPO FIND X3 PRO 5G', 12, CAST(750.55 AS Decimal(38, 2)), N'The OPPO Find X3 Pro 5G is a flagship smartphone released in 2021, featuring a 6.7-inch AMOLED display with a 120Hz refresh rate, Snapdragon 888 processor, up to 12GB of RAM, and up to 256GB of storage. It also has a quad-lens rear camera system, a 32MP front-facing camera, and a 4500mAh battery with fast charging support. Other features include an in-display fingerprint scanner, 5G connectivity, and IP68 water and dust resistance.', N'oppofindx3pro.png', N'2022-06-09', 6)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (48, N'OPPO Reno 8 Lite ', 32, CAST(600.00 AS Decimal(38, 2)), N'Oppo Reno8 Lite Android smartphone. Announced Jun 2022. Features 6.43″ display, Snapdragon 695 5G chipset, 4500 mAh battery, 128 GB storage, 12 GB RAM.', N'opporeno8lite.png', N'2022-06-09', 6)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [description], [image], [createdate], [categoryID]) VALUES (49, N'Oppo Reno 7', 12, CAST(400.00 AS Decimal(38, 2)), N'Oppo Reno7 5G Android smartphone. Announced Feb 2022. Features 6.43″ display, MT6877 Dimensity 900 chipset, 4500 mAh battery, 256 GB storage, 8 GB RAM.', N'opporeno7.png', N'2022-06-09', 6)
GO
SET IDENTITY_INSERT [dbo].[Shipping] ON 

INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (1, N'tu', N'thanh ha', 854687123)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (2, N'toan', N'hai phong', 5654875)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (3, N'minh', N'thanh binh', 5487465)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (4, N'thu', N'thanh hoa', 66548421)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (5, N'minh toàn', N'Nghệ An', 846515465)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (6, N'vu thi ha', N'kinh mon', 5646587)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (7, N'tu', N'vuv909', 9846213)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (10, N'thinh', N'khanh hoa', 321564)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (12, N'to', N'fghdh', 789677456)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (13, N'hieu', N'ca mau', 123456)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (14, N'mo', N'frhthfg', 967656)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (15, N'hop', N'45gf', 346)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (17, N'thuong', N'ophutho', 67956709)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (18, N'ii', N'grsg', 9789)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (19, N'uioprjh', N'jhfgjtreh', 807890896)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (20, N'quan', N'jfghj', 7976567)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (21, N'minh', N'34534dfgsh', 67856)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (22, N'thương', N'hau', 894576534)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (23, N'tyuj', N'rtyu', 4765)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (24, N'yufik', N'dtygj', 809)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (25, N'hieuminh', N'drgdf', 78956774)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (26, N'dfh', N'tydfi', 56876)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (27, N'hiruyt', N'dfghj', 789078)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (28, N'678', N'fyku', 568)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (29, N'minh', N'dtyj', 789)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (30, N'mo', N'ftyu', 67868)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (31, N'yu', N'dtjh', 8967)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (32, N'minh toàn', N'Nghệ An', 846515465)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (33, N'nan', N'rt', 876)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (34, N'quet nha', N'hai phong', 749867456)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (35, N'yu', N'jyhj', 8978)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (36, N'jtygj', N'yu', 678)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (37, N'tee', N'hai phong', 749867456)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (38, N'oi', N'wetgerazg', 6785678)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (39, N'tyj', N'srth', 90789)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (40, N'yiu', N'wetgerazg', 6785678)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (42, N'fadga', N'sdfgdsfg', 44654)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (43, N'to', N'dfsgd', 34534532)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (44, N'toam', N'hfk', 4565687)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (45, N'thanh', N'thanh ha', 4564651)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (46, N'ghjgf', N'hjkhg', 456456574)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (47, N'toan', N'hai phong', 5464562)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (48, N'thai', N'phu tho', 6548651)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (49, N'minh', N'ha noi', 56452)
INSERT [dbo].[Shipping] ([ID], [name], [address], [phone]) VALUES (50, N'toan', N'ha noi', 54648465)
SET IDENTITY_INSERT [dbo].[Shipping] OFF
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__account_i__73BA3083] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__account_i__73BA3083]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__shippingi__74AE54BC] FOREIGN KEY([shippingid])
REFERENCES [dbo].[Shipping] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__shippingi__74AE54BC]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__order__778AC167] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__order__778AC167]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__categor__5DCAEF64] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__categor__5DCAEF64]
GO
USE [master]
GO
ALTER DATABASE [MyPrpjectSm] SET  READ_WRITE 
GO
