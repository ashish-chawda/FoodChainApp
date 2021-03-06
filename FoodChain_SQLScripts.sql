USE [master]
GO
/****** Object:  Database [FoodChain]    Script Date: 1/12/2020 11:22:13 AM ******/
CREATE DATABASE [FoodChain]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FoodChain', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FoodChain.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FoodChain_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FoodChain_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FoodChain] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FoodChain].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FoodChain] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FoodChain] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FoodChain] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FoodChain] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FoodChain] SET ARITHABORT OFF 
GO
ALTER DATABASE [FoodChain] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FoodChain] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FoodChain] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FoodChain] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FoodChain] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FoodChain] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FoodChain] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FoodChain] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FoodChain] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FoodChain] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FoodChain] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FoodChain] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FoodChain] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FoodChain] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FoodChain] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FoodChain] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FoodChain] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FoodChain] SET RECOVERY FULL 
GO
ALTER DATABASE [FoodChain] SET  MULTI_USER 
GO
ALTER DATABASE [FoodChain] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FoodChain] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FoodChain] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FoodChain] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FoodChain] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FoodChain', N'ON'
GO
USE [FoodChain]
GO
/****** Object:  Table [dbo].[FoodChain_Orders]    Script Date: 1/12/2020 11:22:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FoodChain_Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderOwner] [varchar](200) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderStatus] [varchar](100) NOT NULL,
	[OrderAmount] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_FoodChain_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FoodChainProducts]    Script Date: 1/12/2020 11:22:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FoodChainProducts](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](200) NOT NULL,
	[ProductType] [varchar](100) NOT NULL,
	[ProductStock] [int] NOT NULL,
	[ProductPrice] [decimal](18, 0) NULL,
	[ProductDiscountPercentage] [int] NULL,
 CONSTRAINT [PK_FoodChainProducts] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FoodChainRoles]    Script Date: 1/12/2020 11:22:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FoodChainRoles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](100) NOT NULL,
 CONSTRAINT [PK_FoodChainRoles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FoodChainUsers]    Script Date: 1/12/2020 11:22:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FoodChainUsers](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](200) NOT NULL,
	[Password] [varchar](200) NOT NULL,
	[UserRole] [varchar](100) NOT NULL,
 CONSTRAINT [PK_FoodChainUsers] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[FoodChain_Orders] ON 

INSERT [dbo].[FoodChain_Orders] ([OrderId], [OrderOwner], [OrderDate], [OrderStatus], [OrderAmount]) VALUES (1, N'admin', CAST(N'2020-01-09 12:29:32.997' AS DateTime), N'Processing', CAST(120 AS Decimal(18, 0)))
INSERT [dbo].[FoodChain_Orders] ([OrderId], [OrderOwner], [OrderDate], [OrderStatus], [OrderAmount]) VALUES (2, N'admin', CAST(N'2020-01-09 12:32:12.110' AS DateTime), N'Processing', CAST(1170 AS Decimal(18, 0)))
INSERT [dbo].[FoodChain_Orders] ([OrderId], [OrderOwner], [OrderDate], [OrderStatus], [OrderAmount]) VALUES (3, N'admin', CAST(N'2020-01-09 12:55:20.533' AS DateTime), N'Processing', CAST(2340 AS Decimal(18, 0)))
INSERT [dbo].[FoodChain_Orders] ([OrderId], [OrderOwner], [OrderDate], [OrderStatus], [OrderAmount]) VALUES (4, N'admin', CAST(N'2020-01-10 08:42:13.937' AS DateTime), N'Processing', CAST(540 AS Decimal(18, 0)))
INSERT [dbo].[FoodChain_Orders] ([OrderId], [OrderOwner], [OrderDate], [OrderStatus], [OrderAmount]) VALUES (5, N'admin', CAST(N'2020-01-11 17:27:44.013' AS DateTime), N'Processing', CAST(2160 AS Decimal(18, 0)))
INSERT [dbo].[FoodChain_Orders] ([OrderId], [OrderOwner], [OrderDate], [OrderStatus], [OrderAmount]) VALUES (6, N'admin', CAST(N'2020-01-11 17:33:17.787' AS DateTime), N'Processing', CAST(1080 AS Decimal(18, 0)))
INSERT [dbo].[FoodChain_Orders] ([OrderId], [OrderOwner], [OrderDate], [OrderStatus], [OrderAmount]) VALUES (7, N'admin', CAST(N'2020-01-11 17:38:23.177' AS DateTime), N'Processing', CAST(460 AS Decimal(18, 0)))
INSERT [dbo].[FoodChain_Orders] ([OrderId], [OrderOwner], [OrderDate], [OrderStatus], [OrderAmount]) VALUES (8, N'admin', CAST(N'2020-01-11 17:40:43.507' AS DateTime), N'Processing', CAST(176 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[FoodChain_Orders] OFF
SET IDENTITY_INSERT [dbo].[FoodChainProducts] ON 

INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (1, N'Double Cheese Margherita', N'Pizza', 100, CAST(300 AS Decimal(18, 0)), 10)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (2, N'Farmers Market', N'Pizza', 150, CAST(300 AS Decimal(18, 0)), 10)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (3, N'Veggie Paradise', N'Pizza', 50, CAST(400 AS Decimal(18, 0)), 10)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (4, N'Paneer Tikka', N'Pizza', 20, CAST(500 AS Decimal(18, 0)), 10)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (5, N'Cheese Chilly Sandwitch', N'Sandwitch', 100, CAST(100 AS Decimal(18, 0)), 20)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (6, N'Corn Cheese Sandwitch', N'Sandwitch', 40, CAST(150 AS Decimal(18, 0)), 10)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (7, N'Mix Veg Sandwitch', N'Sandwitch', 50, CAST(100 AS Decimal(18, 0)), 20)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (8, N'Veg Club Sandwitch', N'Sandwitch', 60, CAST(90 AS Decimal(18, 0)), 10)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (9, N'Pan Tossed', N'Crust', 100, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (10, N'Cheese Blast', N'Crust', 100, CAST(90 AS Decimal(18, 0)), 10)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (11, N'Thin Crust', N'Crust', 100, CAST(80 AS Decimal(18, 0)), 10)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (12, N'White Bread', N'Bread', 100, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (13, N'Brown Bread', N'Bread', 100, CAST(10 AS Decimal(18, 0)), 0)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (14, N'Garlic Bread', N'Bread', 100, CAST(20 AS Decimal(18, 0)), 0)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (15, N'Mushrooms', N'Toppings', 100, CAST(10 AS Decimal(18, 0)), 0)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (16, N'Black Olives', N'Toppings', 100, CAST(10 AS Decimal(18, 0)), 0)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (17, N'Red Paprika', N'Toppings', 100, CAST(10 AS Decimal(18, 0)), 0)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (18, N'Golden Corn', N'Toppings', 100, CAST(10 AS Decimal(18, 0)), 0)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (19, N'Mayo Sauce', N'Sauce', 100, CAST(10 AS Decimal(18, 0)), 0)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (20, N'Chilli Sauce', N'Sauce', 100, CAST(10 AS Decimal(18, 0)), 0)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (21, N'Mint Sauce', N'Sauce', 100, CAST(10 AS Decimal(18, 0)), 0)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (22, N'Peri Peri Sauce', N'Sauce', 100, CAST(10 AS Decimal(18, 0)), 0)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (23, N'Berry Coolers', N'Drinks', 100, CAST(50 AS Decimal(18, 0)), 5)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (24, N'Coke', N'Drinks', 100, CAST(60 AS Decimal(18, 0)), 5)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (25, N'Lemonade', N'Drinks', 100, CAST(50 AS Decimal(18, 0)), 5)
INSERT [dbo].[FoodChainProducts] ([ProductId], [ProductName], [ProductType], [ProductStock], [ProductPrice], [ProductDiscountPercentage]) VALUES (26, N'PinaColada', N'Drinks', 100, CAST(100 AS Decimal(18, 0)), 10)
SET IDENTITY_INSERT [dbo].[FoodChainProducts] OFF
SET IDENTITY_INSERT [dbo].[FoodChainRoles] ON 

INSERT [dbo].[FoodChainRoles] ([RoleId], [Role]) VALUES (1, N'Admin')
INSERT [dbo].[FoodChainRoles] ([RoleId], [Role]) VALUES (2, N'Users')
INSERT [dbo].[FoodChainRoles] ([RoleId], [Role]) VALUES (3, N'Chefs')
SET IDENTITY_INSERT [dbo].[FoodChainRoles] OFF
SET IDENTITY_INSERT [dbo].[FoodChainUsers] ON 

INSERT [dbo].[FoodChainUsers] ([UserId], [UserName], [Password], [UserRole]) VALUES (1, N'admin', N'admin@123', N'Admin')
INSERT [dbo].[FoodChainUsers] ([UserId], [UserName], [Password], [UserRole]) VALUES (2, N'users', N'user@123', N'Users')
INSERT [dbo].[FoodChainUsers] ([UserId], [UserName], [Password], [UserRole]) VALUES (3, N'chefs', N'chef@123', N'Chefs')
SET IDENTITY_INSERT [dbo].[FoodChainUsers] OFF
USE [master]
GO
ALTER DATABASE [FoodChain] SET  READ_WRITE 
GO
