USE [master]
GO
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'SWP_Project')
	DROP DATABASE SWP_Project
GO
create database SWP_Project
GO
USE SWP_Project
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 6/17/2022 12:14:55 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Shipping]') AND type in (N'U'))
DROP TABLE [dbo].[Shipping]
GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 6/17/2022 12:14:55 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Shipper]') AND type in (N'U'))
DROP TABLE [dbo].[Shipper]
GO
/****** Object:  Table [dbo].[Seller]    Script Date: 6/17/2022 12:14:55 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Seller]') AND type in (N'U'))
DROP TABLE [dbo].[Seller]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/17/2022 12:14:55 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
DROP TABLE [dbo].[Orders]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/17/2022 12:14:55 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetail]') AND type in (N'U'))
DROP TABLE [dbo].[OrderDetail]
GO
/****** Object:  Table [dbo].[Foods]    Script Date: 6/17/2022 12:14:55 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Foods]') AND type in (N'U'))
DROP TABLE [dbo].[Foods]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/17/2022 12:14:55 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
DROP TABLE [dbo].[Category]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/17/2022 12:14:55 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Account]') AND type in (N'U'))
DROP TABLE [dbo].[Account]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/17/2022 12:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Displayname] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[isAdmin] [bit] NULL,
	[isCustomer] [bit] NULL,
	[IsShipper] [bit] NULL,
	[IsSaller] [bit] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/17/2022 12:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foods]    Script Date: 6/17/2022 12:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foods](
	[FoodID] [int] IDENTITY(1,1) NOT NULL,
	[FoodName] [nvarchar](50) NULL,
	[CategoryID] [int] NULL,
	[Image] [nvarchar](max) NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [float] NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK_Foods] PRIMARY KEY CLUSTERED 
(
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/17/2022 12:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[NameFood] [nvarchar](max) NULL,
	[ImageFood] [nvarchar](max) NULL,
	[PriceFood] [float] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/17/2022 12:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[TotalPrice] [float] NULL,
	[SellerID] [int] NULL,
	[ShipperID] [int] NULL,
	[created_date] [date] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seller]    Script Date: 6/17/2022 12:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seller](
	[SallerID] [int] IDENTITY(1,1) NOT NULL,
	[SallerName] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](50) NULL,
	[ReceiveMoney] [float] NULL,
	[AccountID] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Seller] PRIMARY KEY CLUSTERED 
(
	[SallerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 6/17/2022 12:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipper](
	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
	[SellerID] [int] NULL,
	[ShipperName] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[DeliveryMoney] [float] NULL,
	[AccountID] [int] NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Shipper] PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 6/17/2022 12:14:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[TotalPrice] [float] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ID], [Username], [Password], [Displayname], [Address], [Phone], [isAdmin], [isCustomer], [IsShipper], [IsSaller], [status]) VALUES (1, N'manhlam', N'lam123', N'Admin', N'Hai Phong', N'99999999', 1, 0, 0, 0, 0)
INSERT [dbo].[Account] ([ID], [Username], [Password], [Displayname], [Address], [Phone], [isAdmin], [isCustomer], [IsShipper], [IsSaller], [status]) VALUES (2, N'manhtung', N'tung123', N'manhtung', N'hai phong', N'11223344', 0, 1, 0, 0, 0)
INSERT [dbo].[Account] ([ID], [Username], [Password], [Displayname], [Address], [Phone], [isAdmin], [isCustomer], [IsShipper], [IsSaller], [status]) VALUES (3, N'khachang', N'112233', N'khach', N'ha noi', N'1122', 0, 1, 0, 0, 0)
INSERT [dbo].[Account] ([ID], [Username], [Password], [Displayname], [Address], [Phone], [isAdmin], [isCustomer], [IsShipper], [IsSaller], [status]) VALUES (5, N'manhlam2', N'1', N'lam', N'hp', N'1112233', 0, 1, 0, 0, 0)
INSERT [dbo].[Account] ([ID], [Username], [Password], [Displayname], [Address], [Phone], [isAdmin], [isCustomer], [IsShipper], [IsSaller], [status]) VALUES (6, N'toilanguoidung', N'nguoidung2', N'nguoidung2', N'Ha Noi', N'123456655', 0, 0, 0, 1, 0)
INSERT [dbo].[Account] ([ID], [Username], [Password], [Displayname], [Address], [Phone], [isAdmin], [isCustomer], [IsShipper], [IsSaller], [status]) VALUES (7, N'shipper', N'1', N'Shipper', N'Ha Noi', N'123456', 0, 0, 1, 0, 0)
INSERT [dbo].[Account] ([ID], [Username], [Password], [Displayname], [Address], [Phone], [isAdmin], [isCustomer], [IsShipper], [IsSaller], [status]) VALUES (8, N'shipper2', N'2', N'manhanh', N'Ha Noi', N'123', 0, 0, 1, 0, 0)
INSERT [dbo].[Account] ([ID], [Username], [Password], [Displayname], [Address], [Phone], [isAdmin], [isCustomer], [IsShipper], [IsSaller], [status]) VALUES (9, N'shipper3', N'3', N'shipper', N'hn', N'11', 0, 0, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Pizza')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Breakfast')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (3, N'Burgers')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (4, N'Chicken & Sandwiches')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (5, N'Desserts & Shakes')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (6, N'Beverages')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Foods] ON 

INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (1, N'Hunting Pizza', 1, N'https://palermo.if.ua/wp-content/uploads/2017/03/Muslyvska.png', 500, 15, N'Classic marinara sauce, mozzarella, hunting sausages, salami, pickled gherkins, tomatoes, blue onion, garlic.', 1, CAST(N'2021-07-18' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (2, N'Vegetarian Pizza', 1, N'https://palermo.if.ua/wp-content/uploads/2017/03/Vegetarian-2.png', 500, 12, N'The white pizza cream sauce, mozzarella, eggplant, zucchini, cherry tomatoes, spinach, garlic, and oregano.', 1, CAST(N'2021-07-18' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (3, N'Tuna Bianco Pizza', 1, N'https://palermo.if.ua/wp-content/uploads/2018/07/tuna-bianko.png', 500, 10, N'The white pizza cream sauce, mozzarella, tuna, blue onion, capers, oregano.

', 1, CAST(N'2021-06-15' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (4, N'Palermo Rosso Pizza', 1, N'https://palermo.if.ua/wp-content/uploads/2018/08/Palermo-rosso.png', 500, 16, N'Classic marinara sauce, mozzarella, spinach, mushrooms, smoked bacon.', 1, CAST(N'2022-02-10' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (5, N'Mexican Pizza', 1, N'https://palermo.if.ua/wp-content/uploads/2017/03/Mexicana.png', 500, 13, N'Classic marinara sauce, mozzarella, fresh tomatoes, chili peppers, original Salami pepperoni.', 1, CAST(N'2022-02-11' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (6, N'Roma Bianco', 1, N'https://palermo.if.ua/wp-content/uploads/2018/09/Roma-Bianco.png', 500, 12, N'The white pizza cream, mozzarella, bacon, chicken, pineapple, champignons, tomatoes, sesame seeds.', 1, CAST(N'2022-02-12' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (7, N'Bacon, Egg & Cheese Biscuit', 2, N'https://www.hotnreadysandwiches.com/Images/Products-HD/bacon-egg-cheese-biscuit2.png', 500, 10, N'Sandwich features a warm, buttermilk biscuit brushed with real butter, thick cut Applewood smoked bacon, a fluffy folded egg', 1, CAST(N'0220-02-11' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (8, N'Egg McMuffin', 2, N'https://mcdonalds.vn/uploads/2018/food/muffin/sausage-mcmuffin-with-egg.png', 500, 5, N'We place a freshly cracked Grade A egg on a toasted English Muffin topped with real butter and add lean Canadian bacon and melty American cheese. ', 1, CAST(N'2022-02-11' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (9, N'
Sausage McMuffin', 2, N'https://mcdonalds.vn/uploads/2018/food/muffin/sausage_mcmuffin_deluxe_0.png', 500, 12, N'Recipe features a warm, freshly toasted English muffin, topped with a savory hot sausage patty and a slice of melty American cheese', 1, CAST(N'2022-02-11' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (10, N'Bacon, Egg & Cheese McGriddles', 2, N'https://www.mcdonalds.co.jp/product_images/264/8641-McGriddle-Bacon-Egg.png?20220523152418', 500, 11, N'Recipe features thick-cut Applewood smoked bacon, a fluffy folded egg, and a slice of melty American cheese', 1, CAST(N'2021-07-18' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (11, N'Sausage Burrito', 2, N'https://www.pngkit.com/png/full/19-195400_breakfast-burritos-png-svg-freeuse-stock-breakfast-burrito.png', 500, 16, N' It''s wrapped in a soft tortilla, making it the perfect grab and go breakfast.', 1, CAST(N'2022-02-11' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (12, N'Big Mac', 3, N'https://www.pngall.com/wp-content/uploads/4/Mcdonalds-Ham-Burger.png', 500, 3, N'It’s topped off with pickles, crisp shredded lettuce, finely chopped onion and American cheese for a 100% beef burger with a taste like no other. ', 1, CAST(N'2022-02-11' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (13, N'Double Quarter Pounder with Cheese', 3, N'https://i.pinimg.com/originals/9e/27/3d/9e273def50e7be3c5a9b36d5d90edb95.png', 500, 5, N'Each Double Quarter Pounder with Cheese features two quarter pound* 100% fresh beef burger patties that are hot.', 1, CAST(N'2022-02-11' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (14, N'Quarter Pounder with Cheese Deluxe', 3, N'https://www.reviewstream.com/images_items/Q0Nt4Er2r.png', 500, 3, N'Seasoned with just a pinch of salt and pepper and sizzled on our flat iron grill. Layered with two slices of melty American cheese.', 1, CAST(N'2022-02-12' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (15, N'McDouble', 3, N'https://www.mcdonalds.eg/Cms_Data/Contents/En/Media/images/Menu/large-Image/McDouble.png', 500, 4, N'The classic McDouble burger stacks two 100% pure beef patties seasoned with just a pinch of salt and pepper.', 1, CAST(N'2021-07-18' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (16, N'Quarter Pounder with Cheese Bacon', 3, N'https://res.cloudinary.com/sonic-drive-in/image/upload/c_fit,w_600,h_600,dpr_2,f_auto,q_auto/v1616178802/oa_menu/products/menuproduct_burger_bacon-double-cheeseburger.png', 500, 5, N' It''s a hot, deliciously juicy bacon cheeseburger, seasoned with just a pinch of salt and pepper and sizzled on our flat iron grill.', 1, CAST(N'2022-02-11' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (17, N'Hamburger', 3, N'https://freepngimg.com/thumb/burger/2-2-burger-free-download-png-thumb.png', 500, 3, N'The original burger starts with a 100% pure beef burger seasoned with just a pinch of salt and pepper.', 1, CAST(N'2022-02-12' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (18, N'Spicy Deluxe Crispy Chicken Sandwich', 4, N'https://images.ctfassets.net/a9odgsv44wmq/2n8v481xOhTqRKIXlZmgRt/04f937df298a830b933bf46a9127b7dc/Jacks_Spicy_Chicken_MenuImages.png', 500, 6, N'Our southern-style fried chicken fillet on a potato roll, topped with shredded lettuce, Roma tomatoes and Spicy Pepper Sauce', 1, CAST(N'2022-02-11' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (19, N'Crispy Chicken Sandwich', 4, N'https://images.ctfassets.net/o19mhvm9a2cm/31kKfUJcqOnkbmXz4JvS9d/c2cb01bbcbe6a2b0892e3c86bb851cb9/Website_Chicken_Classic.png?w=1500', 500, 6, N'It’s topped with crinkle-cut pickles and served on a toasted, buttered potato roll.', 1, CAST(N'2022-02-12' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (20, N'
Spicy Crispy Chicken Sandwich', 4, N'https://images.getbento.com/accounts/0a6ca328d2a4178127fd36f1a142b8e4/media/neX2LHeGSSenM3wsSzCF_GrilledCK18.png?w=1000&fit=max&auto=compress,format&h=1000', 500, 5, N'With our Spicy Pepper Sauce topping the southern style fried chicken fillet on a toasted potato roll, it crispy, juicy, tender and hot.', 1, CAST(N'2022-02-11' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (21, N'Chicken McNuggets', 4, N'https://pngpress.com/wp-content/uploads/2020/05/kisspng-burger-king-chicken-nuggets-chicken-fingers-mcdona-chicken-nugget-5b3d595fae4673.5748914615307472317138-300x200.png', 500, 2, N'Our tender, juicy Chicken McNuggets are made with all white meat chicken and no artificial colors, flavors or preservatives. ', 1, CAST(N'2022-02-12' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (22, N'McChicken', 4, N'https://www.pngkit.com/png/full/269-2692992_mcspicy-double-mcspicy-chicken-burger.png', 500, 3, N' Savor the satisfying crunch of our juicy chicken patty, topped with shredded lettuce and just the right amount of creamy mayonnaise', 1, CAST(N'2021-07-18' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (23, N'Filet-O-Fish', 4, N'https://i.warosu.org/data/ck/img/0111/12/1535194749494.png', 500, 3, N'This  fish sandwich has fish sourced from sustainably managed fisheries, on melty cheese and topped with creamy  sauce.', 1, CAST(N'2022-02-11' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (24, N'Chocolatey Pretzel McFlurry', 5, N'https://www.mcdonalds.pt/media/4846/028_mcflurry_snickers_grande_new.png?anchor=center&mode=crop&width=210&height=210&rnd=132352386630000000', 500, 2, N'Creamy vanilla soft serve with caramel topping and chocolatey pretzel pieces blended throughout to satisfy your sweet and salty cravings.', 1, CAST(N'2022-02-11' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (25, N'McFlurry with M&M''S Candies', 5, N'https://fastfoodedition.weebly.com/uploads/1/7/7/8/17789053/6521324_orig.png?164', 500, 2, N'The McDonald’s M&M  McFlurry is a sweet, creamy  dessert of vanilla soft serve with  chocolate candies swirled in.', 1, CAST(N'2022-02-12' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (26, N'Chocolate Shake', 5, N'https://d1nqx6es26drid.cloudfront.net/app/uploads/2015/04/16032138/product-iced-chocolate.png', 500, 2, N' Our chocolate shake is made with delicious soft serve, chocolate syrup and finished off with a creamy whipped topping', 1, CAST(N'2021-07-18' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (27, N'Vanilla Shake', 5, N'https://i.pinimg.com/originals/25/cd/47/25cd47d18de3220f56ef4d65ce2123a5.png', 500, 3, N'Vanilla shake is made with our creamy vanilla soft serve and topped with whipped topping for a cool, tasty treat. ', 1, CAST(N'2022-02-11' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (28, N'Strawberry Shake', 5, N'https://www.pafootdoctors.com/media/k2/galleries/mcdonalds-strawberry-shake.png', 500, 3, N' Strawberry Shake is made with creamy vanilla soft serve, blended with strawberry syrup and topped with whipped topping.', 1, CAST(N'2022-02-12' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (29, N'
Hot Fudge Sundae', 5, N'https://149449860.v2.pressablecdn.com/wp-content/uploads/2019/06/Sundae.png', 500, 5, N'Our classic hot fudge sundae is made with creamy vanilla soft serve and smothered in chocolaty hot fudge topping. ', 1, CAST(N'2022-02-11' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (30, N'
Hot Caramel Sundae', 5, N'https://www.hungryjacks.com.au/Upload/HJ/Media/Menu/product/Main/2404_CaramelSundae.png', 500, 3, N'This Caramel Sundae combines creamy vanilla soft serve and warm, buttery caramel topping.', 1, CAST(N'2021-07-18' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (31, N'Baked Apple Pie', 5, N'https://www.mcdonalds.com/content/dam/ArabiaGWS/english/nfl/Nutrition/Items/Regular/apple-pie.png', 500, 3, N'Baked Apple Pie recipe features 100% American-grown apples, and a lattice crust baked to perfection and topped with sprinkled sugar. ', 1, CAST(N'2022-02-11' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (32, N'Chocolate Chip Cookie', 5, N'https://www.downloadclipart.net/large/cookies-png-transparent-image.png', 500, 2, N'Classic chocolate chip cookie, loaded with chocolate chips. It''s a soft baked cookie and warmed to perfection.', 1, CAST(N'2021-07-18' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (33, N'Coca-Cola', 6, N'https://bk-apac-prd.s3.amazonaws.com/sites/burgerking.com.fj/files/BK_CocaCola_detail.png', 500, 2, N'Coca-Cola is a refreshing soda option that complements all of your menu favorites.', 1, CAST(N'2022-02-11' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (34, N'Sprite', 6, N'https://bk-apac-prd.s3.amazonaws.com/sites/burgerking.com.fj/files/BK_Sprite_detail.png', 500, 2, N'Sprite is a caffeine-free soda that makes the perfect addition to any your combo meal.', 1, CAST(N'2021-07-18' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (35, N'Dr Pepper', 6, N'https://images.ctfassets.net/a9odgsv44wmq/3NWUk7GaaZsODIMyZv06PW/ad8238a6e36211632ca3aa21e6fc0cec/MenuImage_DietDrPepper_Straight.png', 500, 2, N' Dr Pepper, the classic and refreshing fountain drink with a unique blend of 23 flavors. ', 1, CAST(N'2022-02-11' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (36, N'Fanta Orange', 6, N'http://assets.stickpng.com/images/58710037b8261606d1c863ef.png', 500, 2, N'Fanta Orange is a caffeine-free soft drink full of bubbly, refreshing orange flavor. ', 1, CAST(N'2022-02-11' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (37, N'Diet Coke', 6, N'https://www.dairyqueen.com/dA/aa368fe1a0/Diet-Coke.png', 500, 2, N'Fresh and always tasting the way they should by following the guidelines set by Coca-Cola, using a ratio of syrup that allows ice to melt', 1, CAST(N'2022-02-11' AS Date))
INSERT [dbo].[Foods] ([FoodID], [FoodName], [CategoryID], [Image], [Quantity], [UnitPrice], [Description], [Status], [DateCreated]) VALUES (38, N'Strawberry Banana Smoothie', 6, N'http://montrealmom.com/wp-content/uploads/2012/07/hero_mccafe-smoothie.png', 500, 2, N'Strawberry Banana Smoothie recipe features the perfect combination of fruit purees and fruit juices, such as strawberry and banana.', 1, CAST(N'2022-02-12' AS Date))
SET IDENTITY_INSERT [dbo].[Foods] OFF
GO



ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Foods]  WITH CHECK ADD  CONSTRAINT [FK_Foods_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Foods] CHECK CONSTRAINT [FK_Foods_Category]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Account]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Seller] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Seller] ([SallerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Seller]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shipper] FOREIGN KEY([ShipperID])
REFERENCES [dbo].[Shipper] ([ShipperID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shipper]
GO
ALTER TABLE [dbo].[Shipper]  WITH CHECK ADD  CONSTRAINT [FK_Shipper_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Shipper] CHECK CONSTRAINT [FK_Shipper_Account]
GO
ALTER TABLE [dbo].[Shipper]  WITH CHECK ADD  CONSTRAINT [FK_Shipper_Seller] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Seller] ([SallerID])
GO
ALTER TABLE [dbo].[Shipper] CHECK CONSTRAINT [FK_Shipper_Seller]
GO
ALTER TABLE [dbo].[Shipping]  WITH CHECK ADD  CONSTRAINT [FK_Shipping_OrderDetail] FOREIGN KEY([OrderID])
REFERENCES [dbo].[OrderDetail] ([ID])
GO
ALTER TABLE [dbo].[Shipping] CHECK CONSTRAINT [FK_Shipping_OrderDetail]
GO
ALTER TABLE [dbo].[Shipping]  WITH CHECK ADD  CONSTRAINT [FK_Shipping_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Shipping] CHECK CONSTRAINT [FK_Shipping_Orders]
GO
