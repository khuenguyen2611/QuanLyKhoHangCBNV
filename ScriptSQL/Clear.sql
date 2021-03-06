USE [master]
GO
/****** Object:  Database [QuanLyKhoHang]    Script Date: 6/28/2022 11:32:04 PM ******/
CREATE DATABASE [QuanLyKhoHang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyKhoHang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyKhoHang.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyKhoHang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyKhoHang_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLyKhoHang] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyKhoHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyKhoHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyKhoHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyKhoHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyKhoHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyKhoHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyKhoHang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyKhoHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyKhoHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyKhoHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyKhoHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyKhoHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyKhoHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyKhoHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyKhoHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyKhoHang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyKhoHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyKhoHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyKhoHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyKhoHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyKhoHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyKhoHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyKhoHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyKhoHang] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyKhoHang] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyKhoHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyKhoHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyKhoHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyKhoHang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyKhoHang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyKhoHang] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyKhoHang', N'ON'
GO
ALTER DATABASE [QuanLyKhoHang] SET QUERY_STORE = OFF
GO
USE [QuanLyKhoHang]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/28/2022 11:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [varchar](max) NULL,
	[Address] [varchar](max) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[MoreInfo] [varchar](max) NULL,
	[ContractDate] [datetime] NULL,
 CONSTRAINT [PK__Customer__3214EC07A5CDDAAE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Export]    Script Date: 6/28/2022 11:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Export](
	[Id] [varchar](128) NOT NULL,
	[DateExport] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExportInfo]    Script Date: 6/28/2022 11:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExportInfo](
	[Id] [varchar](128) NOT NULL,
	[IdSupply] [varchar](128) NOT NULL,
	[IdExport] [varchar](128) NOT NULL,
	[IdCustomer] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Status] [varchar](max) NULL,
	[ExportPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Import]    Script Date: 6/28/2022 11:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import](
	[Id] [varchar](128) NOT NULL,
	[DateImport] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportInfo]    Script Date: 6/28/2022 11:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportInfo](
	[Id] [varchar](128) NOT NULL,
	[IdSupply] [varchar](128) NOT NULL,
	[IdImport] [varchar](128) NOT NULL,
	[Quantity] [int] NULL,
	[ImportPrice] [float] NULL,
	[Status] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measure]    Script Date: 6/28/2022 11:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measure](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 6/28/2022 11:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [varchar](max) NULL,
	[Address] [varchar](max) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](20) NULL,
	[MoreInfo] [varchar](max) NULL,
	[ContractDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supply]    Script Date: 6/28/2022 11:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supply](
	[Id] [varchar](128) NOT NULL,
	[DisplayName] [varchar](max) NULL,
	[IdMeasure] [int] NOT NULL,
	[IdSupplier] [int] NOT NULL,
	[QRCode] [varchar](max) NULL,
	[BarCode] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 6/28/2022 11:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/28/2022 11:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [varchar](max) NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](max) NULL,
	[IdRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (1, N'Phan Huu Loi', N'01 Binh Duong', N'037667121', N'loiphan@gmail.com', NULL, CAST(N'2021-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (2, N'Datker', N'96 Ngo Quyen', N'0908070601', N'datker@gmail.com', N'DotBlastrizer77', CAST(N'2022-02-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (3, N'Tran Dam Duy Dat', N'16 Ly Thai To', N'090292312', N'pekhoc@lol.com', N'Silver ranked', CAST(N'2021-02-02T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
INSERT [dbo].[Export] ([Id], [DateExport]) VALUES (N'227c7e68-470c-42db-814d-ca27ef8d9e00', CAST(N'2022-06-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Export] ([Id], [DateExport]) VALUES (N'2c653dfb-d68d-4291-8782-5a12a17fc4d2', CAST(N'2022-06-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Export] ([Id], [DateExport]) VALUES (N'34224ce8-6135-417a-b501-9388b3ec6341', CAST(N'2022-06-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Export] ([Id], [DateExport]) VALUES (N'b59558da-20d0-48d6-9797-38d1cb2e8220', CAST(N'2022-06-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Export] ([Id], [DateExport]) VALUES (N'c990474b-484d-41fc-9021-4b9a28a8e47b', CAST(N'2022-06-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ExportInfo] ([Id], [IdSupply], [IdExport], [IdCustomer], [Quantity], [Status], [ExportPrice]) VALUES (N'31997962-84a7-48d8-a546-fb2fe8932e2a', N'c7425431-6ad1-415a-9b63-624f9ae265b2', N'34224ce8-6135-417a-b501-9388b3ec6341', 3, 30, N'Done', 35000)
INSERT [dbo].[ExportInfo] ([Id], [IdSupply], [IdExport], [IdCustomer], [Quantity], [Status], [ExportPrice]) VALUES (N'8e24d418-8419-4dbe-8d6c-2d9fd5799a9f', N'6662a745-2bb1-4bf8-a9af-3663721dc20c', N'c990474b-484d-41fc-9021-4b9a28a8e47b', 1, 50, N'Done', 18000)
INSERT [dbo].[ExportInfo] ([Id], [IdSupply], [IdExport], [IdCustomer], [Quantity], [Status], [ExportPrice]) VALUES (N'92b02031-beb1-44b2-a9db-9a2a1933be63', N'021d4fac-7588-466b-8a1c-13f8d7238140', N'2c653dfb-d68d-4291-8782-5a12a17fc4d2', 1, 100, N'Done', 10000)
INSERT [dbo].[ExportInfo] ([Id], [IdSupply], [IdExport], [IdCustomer], [Quantity], [Status], [ExportPrice]) VALUES (N'9330fda3-2692-49ec-b3f9-73754356299d', N'79ad5867-1e91-480e-94aa-4a66cb6ff74f', N'227c7e68-470c-42db-814d-ca27ef8d9e00', 2, 100, N'Done', 10000)
GO
INSERT [dbo].[Import] ([Id], [DateImport]) VALUES (N'56758953-1f08-4bbb-aabd-f77815451509', CAST(N'2021-08-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Import] ([Id], [DateImport]) VALUES (N'5a563b72-7fe6-453e-9a2b-ba70d05e9c9f', CAST(N'2020-07-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Import] ([Id], [DateImport]) VALUES (N'783a88e2-749a-408f-937e-59ecc9f12456', CAST(N'2021-06-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Import] ([Id], [DateImport]) VALUES (N'a3ddb270-e8d5-4e51-9325-c87899126957', CAST(N'2020-08-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Import] ([Id], [DateImport]) VALUES (N'a7c6a934-6848-4ef7-88d6-cd1695e1f4f6', CAST(N'2022-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Import] ([Id], [DateImport]) VALUES (N'b4f51324-da79-4956-b0a0-f664f940ae5c', CAST(N'2022-01-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ImportInfo] ([Id], [IdSupply], [IdImport], [Quantity], [ImportPrice], [Status]) VALUES (N'03b79ae7-41ef-4001-8834-41c0299c6fd0', N'79ad5867-1e91-480e-94aa-4a66cb6ff74f', N'a7c6a934-6848-4ef7-88d6-cd1695e1f4f6', 300, 5000, N'Done')
INSERT [dbo].[ImportInfo] ([Id], [IdSupply], [IdImport], [Quantity], [ImportPrice], [Status]) VALUES (N'5fc8f272-7372-4d7d-9b0c-4efc676ac1ec', N'644bcad0-9250-4c52-ad52-6579f26820ee', N'56758953-1f08-4bbb-aabd-f77815451509', 200, 12000, N'Done')
INSERT [dbo].[ImportInfo] ([Id], [IdSupply], [IdImport], [Quantity], [ImportPrice], [Status]) VALUES (N'62f58996-63a6-4113-a1d0-6cec1edb34e9', N'c7425431-6ad1-415a-9b63-624f9ae265b2', N'783a88e2-749a-408f-937e-59ecc9f12456', 200, 30000, N'Done')
INSERT [dbo].[ImportInfo] ([Id], [IdSupply], [IdImport], [Quantity], [ImportPrice], [Status]) VALUES (N'8022523e-3cbd-43b6-9319-cb07c610f37c', N'6662a745-2bb1-4bf8-a9af-3663721dc20c', N'b4f51324-da79-4956-b0a0-f664f940ae5c', 1000, 12000, N'Done')
INSERT [dbo].[ImportInfo] ([Id], [IdSupply], [IdImport], [Quantity], [ImportPrice], [Status]) VALUES (N'be3e793f-82b5-46b3-8538-b1866ec1f1b3', N'8a47b3e6-c317-4b6a-a408-c19b7dee6511', N'a3ddb270-e8d5-4e51-9325-c87899126957', 50, 120000, N'Done')
INSERT [dbo].[ImportInfo] ([Id], [IdSupply], [IdImport], [Quantity], [ImportPrice], [Status]) VALUES (N'ce7490a3-9f12-4ba3-912d-fc5c827c54e6', N'021d4fac-7588-466b-8a1c-13f8d7238140', N'5a563b72-7fe6-453e-9a2b-ba70d05e9c9f', 200, 8000, N'Done')
GO
SET IDENTITY_INSERT [dbo].[Measure] ON 

INSERT [dbo].[Measure] ([Id], [DisplayName]) VALUES (1, N'kg')
INSERT [dbo].[Measure] ([Id], [DisplayName]) VALUES (2, N'bag')
INSERT [dbo].[Measure] ([Id], [DisplayName]) VALUES (3, N'box')
INSERT [dbo].[Measure] ([Id], [DisplayName]) VALUES (4, N'bottle')
INSERT [dbo].[Measure] ([Id], [DisplayName]) VALUES (5, N'pcs')
INSERT [dbo].[Measure] ([Id], [DisplayName]) VALUES (6, N'can')
INSERT [dbo].[Measure] ([Id], [DisplayName]) VALUES (8, N'sheet')
SET IDENTITY_INSERT [dbo].[Measure] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (1, N'FaHuLo', N'01 Thu Duc', N'0902222111', N'fahulo@yahoo.com', N'nezumi27', CAST(N'2018-05-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Supplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (2, N'BuThaBo', N'01 Que Son', N'0385612889', N'btb@gmail.com', N'', CAST(N'2018-05-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Supplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (3, N'NoHiKa', N'99 Le Duan', N'0721291281', N'nohika@gmail.com', N'', CAST(N'2018-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Supplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (4, N'TaNaHy', N'78 Le Dinh Ly', N'0908070605', N'tanahy@gmail.com', N'', CAST(N'2019-03-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Supplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (5, N'Nasico', N'27 Nguyen Du', N'093123121', N'nasico@gmail.com', N'', CAST(N'2019-03-18T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
INSERT [dbo].[Supply] ([Id], [DisplayName], [IdMeasure], [IdSupplier], [QRCode], [BarCode]) VALUES (N'021d4fac-7588-466b-8a1c-13f8d7238140', N'Wake up 24/7', 4, 1, N'192166', N'12345688')
INSERT [dbo].[Supply] ([Id], [DisplayName], [IdMeasure], [IdSupplier], [QRCode], [BarCode]) VALUES (N'21ed6ec4-6bbb-455c-bc3f-fc041c6ff16a', N'Top2 Milk', 3, 3, N'871231', N'09091223')
INSERT [dbo].[Supply] ([Id], [DisplayName], [IdMeasure], [IdSupplier], [QRCode], [BarCode]) VALUES (N'2fc5f508-a4c6-463f-81d5-1279657167c2', N'Pebsy', 4, 1, N'192167', N'12345612')
INSERT [dbo].[Supply] ([Id], [DisplayName], [IdMeasure], [IdSupplier], [QRCode], [BarCode]) VALUES (N'4acf675a-6727-4d39-a4c0-648b3613bac9', N'Spring Meat', 1, 4, N'862178', N'78695838')
INSERT [dbo].[Supply] ([Id], [DisplayName], [IdMeasure], [IdSupplier], [QRCode], [BarCode]) VALUES (N'60b8107c-6fae-4637-8130-6bf6bb8641ae', N'9up', 6, 1, N'192161', N'12345699')
INSERT [dbo].[Supply] ([Id], [DisplayName], [IdMeasure], [IdSupplier], [QRCode], [BarCode]) VALUES (N'644bcad0-9250-4c52-ad52-6579f26820ee', N'Top1 Milk', 3, 4, N'862175', N'78695825')
INSERT [dbo].[Supply] ([Id], [DisplayName], [IdMeasure], [IdSupplier], [QRCode], [BarCode]) VALUES (N'6662a745-2bb1-4bf8-a9af-3663721dc20c', N'Rockstar', 6, 1, N'192165', N'12345632')
INSERT [dbo].[Supply] ([Id], [DisplayName], [IdMeasure], [IdSupplier], [QRCode], [BarCode]) VALUES (N'79ad5867-1e91-480e-94aa-4a66cb6ff74f', N'C++ Snack', 2, 2, N'382112', N'44556689')
INSERT [dbo].[Supply] ([Id], [DisplayName], [IdMeasure], [IdSupplier], [QRCode], [BarCode]) VALUES (N'89cbc488-acd6-4d8b-9db7-8bb7de40c008', N'KMS Cola', 4, 2, N'382111', N'44556688')
INSERT [dbo].[Supply] ([Id], [DisplayName], [IdMeasure], [IdSupplier], [QRCode], [BarCode]) VALUES (N'8a47b3e6-c317-4b6a-a408-c19b7dee6511', N'TaNaHy boot', 5, 3, N'871230', N'09091222')
INSERT [dbo].[Supply] ([Id], [DisplayName], [IdMeasure], [IdSupplier], [QRCode], [BarCode]) VALUES (N'8da38fbb-38be-4b77-bb63-555866e4d10d', N'Java Snack', 2, 2, N'912712', N'44556677')
INSERT [dbo].[Supply] ([Id], [DisplayName], [IdMeasure], [IdSupplier], [QRCode], [BarCode]) VALUES (N'9a2d42a8-725a-44c1-ab8c-03ee00209785', N'JS Snack', 2, 2, N'912713', N'44556670')
INSERT [dbo].[Supply] ([Id], [DisplayName], [IdMeasure], [IdSupplier], [QRCode], [BarCode]) VALUES (N'c7425431-6ad1-415a-9b63-624f9ae265b2', N'React Meat', 1, 4, N'817666', N'98761234')
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([Id], [DisplayName]) VALUES (1, N'admin')
INSERT [dbo].[UserRole] ([Id], [DisplayName]) VALUES (2, N'staff')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [DisplayName], [UserName], [Password], [IdRole]) VALUES (1, N'Khue', N'admin', N'80432911e07b111f6a05fd7c904c1bc9', 1)
INSERT [dbo].[Users] ([Id], [DisplayName], [UserName], [Password], [IdRole]) VALUES (2, N'Loi Phan', N'loi', N'80432911e07b111f6a05fd7c904c1bc9', 2)
INSERT [dbo].[Users] ([Id], [DisplayName], [UserName], [Password], [IdRole]) VALUES (3, N'Ha Khue', N'khue', N'cdd96d3cc73d1dbdaffa03cc6cd7339b', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[ImportInfo] ADD  DEFAULT ((0)) FOR [ImportPrice]
GO
ALTER TABLE [dbo].[ExportInfo]  WITH CHECK ADD  CONSTRAINT [FK__ExportInf__IdCus__37A5467C] FOREIGN KEY([IdCustomer])
REFERENCES [dbo].[Customer] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExportInfo] CHECK CONSTRAINT [FK__ExportInf__IdCus__37A5467C]
GO
ALTER TABLE [dbo].[ExportInfo]  WITH CHECK ADD  CONSTRAINT [FK__ExportInf__IdSup__38996AB5] FOREIGN KEY([IdSupply])
REFERENCES [dbo].[Supply] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExportInfo] CHECK CONSTRAINT [FK__ExportInf__IdSup__38996AB5]
GO
ALTER TABLE [dbo].[ExportInfo]  WITH CHECK ADD  CONSTRAINT [FK_ExportInfo_Export] FOREIGN KEY([IdExport])
REFERENCES [dbo].[Export] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExportInfo] CHECK CONSTRAINT [FK_ExportInfo_Export]
GO
ALTER TABLE [dbo].[ImportInfo]  WITH CHECK ADD  CONSTRAINT [FK__ImportInf__IdImp__398D8EEE] FOREIGN KEY([IdImport])
REFERENCES [dbo].[Import] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ImportInfo] CHECK CONSTRAINT [FK__ImportInf__IdImp__398D8EEE]
GO
ALTER TABLE [dbo].[ImportInfo]  WITH CHECK ADD  CONSTRAINT [FK__ImportInf__IdSup__3B75D760] FOREIGN KEY([IdSupply])
REFERENCES [dbo].[Supply] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ImportInfo] CHECK CONSTRAINT [FK__ImportInf__IdSup__3B75D760]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [FK__Supply__IdMeasur__3C69FB99] FOREIGN KEY([IdMeasure])
REFERENCES [dbo].[Measure] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [FK__Supply__IdMeasur__3C69FB99]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [FK__Supply__IdSuppli__3D5E1FD2] FOREIGN KEY([IdSupplier])
REFERENCES [dbo].[Supplier] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [FK__Supply__IdSuppli__3D5E1FD2]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK__Users__IdRole__3E52440B] FOREIGN KEY([IdRole])
REFERENCES [dbo].[UserRole] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK__Users__IdRole__3E52440B]
GO
USE [master]
GO
ALTER DATABASE [QuanLyKhoHang] SET  READ_WRITE 
GO
