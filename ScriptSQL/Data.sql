USE [master]
GO
/****** Object:  Database [QuanLyKhoHang]    Script Date: 6/20/2022 5:23:03 PM ******/
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
ALTER DATABASE [QuanLyKhoHang] SET  ENABLE_BROKER 
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
/****** Object:  Table [dbo].[Customer]    Script Date: 6/20/2022 5:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
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
/****** Object:  Table [dbo].[Export]    Script Date: 6/20/2022 5:23:04 PM ******/
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
/****** Object:  Table [dbo].[ExportInfo]    Script Date: 6/20/2022 5:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExportInfo](
	[Id] [varchar](128) NOT NULL,
	[IdSupply] [varchar](128) NOT NULL,
	[IdExportInfo] [varchar](128) NOT NULL,
	[IdCustomer] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Status] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Import]    Script Date: 6/20/2022 5:23:04 PM ******/
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
/****** Object:  Table [dbo].[ImportInfo]    Script Date: 6/20/2022 5:23:04 PM ******/
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
	[ExportPrice] [float] NULL,
	[Status] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measure]    Script Date: 6/20/2022 5:23:04 PM ******/
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
/****** Object:  Table [dbo].[Supplier]    Script Date: 6/20/2022 5:23:04 PM ******/
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
/****** Object:  Table [dbo].[Supply]    Script Date: 6/20/2022 5:23:04 PM ******/
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
/****** Object:  Table [dbo].[UserRole]    Script Date: 6/20/2022 5:23:04 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 6/20/2022 5:23:04 PM ******/
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

INSERT [dbo].[Customer] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (1, N'Nezumi', N'Thu Duc', N'0905001002', N'nezumi@gmail.com', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (2, N'Loi Phan', N'Da Nang', N'0781243423', N'loiphang@gmail.com', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
INSERT [dbo].[Export] ([Id], [DateExport]) VALUES (N'EP1', CAST(N'2022-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Export] ([Id], [DateExport]) VALUES (N'EP2', CAST(N'2022-06-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ExportInfo] ([Id], [IdSupply], [IdExportInfo], [IdCustomer], [Quantity], [Status]) VALUES (N'1', N'FD001', N'EP1', 1, 10, NULL)
INSERT [dbo].[ExportInfo] ([Id], [IdSupply], [IdExportInfo], [IdCustomer], [Quantity], [Status]) VALUES (N'2', N'FD002', N'EP1', 1, 12, NULL)
GO
INSERT [dbo].[Import] ([Id], [DateImport]) VALUES (N'IP1', CAST(N'2022-06-01T01:32:03.023' AS DateTime))
INSERT [dbo].[Import] ([Id], [DateImport]) VALUES (N'IP2', CAST(N'2022-05-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ImportInfo] ([Id], [IdSupply], [IdImport], [Quantity], [ImportPrice], [ExportPrice], [Status]) VALUES (N'1', N'FD001', N'IP1', 50, 200000, 238000, NULL)
INSERT [dbo].[ImportInfo] ([Id], [IdSupply], [IdImport], [Quantity], [ImportPrice], [ExportPrice], [Status]) VALUES (N'2', N'FD002', N'IP1', 23, 189000, 226000, NULL)
GO
SET IDENTITY_INSERT [dbo].[Measure] ON 

INSERT [dbo].[Measure] ([Id], [DisplayName]) VALUES (1, N'kg')
INSERT [dbo].[Measure] ([Id], [DisplayName]) VALUES (2, N'bag')
INSERT [dbo].[Measure] ([Id], [DisplayName]) VALUES (3, N'bin')
INSERT [dbo].[Measure] ([Id], [DisplayName]) VALUES (4, N'box')
INSERT [dbo].[Measure] ([Id], [DisplayName]) VALUES (5, N'g')
SET IDENTITY_INSERT [dbo].[Measure] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (1, N'Nasico', N'01 Ngo Tat To', N'0905001002', N'nasico@gmail.com', NULL, NULL)
INSERT [dbo].[Supplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (3, N'Massan', N'92 Nguyen Hue', N'0905001003', N'massan@gmail.com', NULL, NULL)
INSERT [dbo].[Supplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (4, N'Mojang', N'17 Ha Huy Tap', N'038129729', N'mojang@gmail.com', N'Minecraft', NULL)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
INSERT [dbo].[Supply] ([Id], [DisplayName], [IdMeasure], [IdSupplier], [QRCode], [BarCode]) VALUES (N'b6d05994-599a-4f28-b7f6-cab22054b31f', N'Fish Noodle', 4, 3, N'31244', N'3223123')
INSERT [dbo].[Supply] ([Id], [DisplayName], [IdMeasure], [IdSupplier], [QRCode], [BarCode]) VALUES (N'f183fd79-a9b7-4382-baba-a14b06821708', N'Dicky Snack', 2, 4, N'12423', N'23124')
INSERT [dbo].[Supply] ([Id], [DisplayName], [IdMeasure], [IdSupplier], [QRCode], [BarCode]) VALUES (N'FD001', N'Shrimp Noodle', 4, 1, NULL, NULL)
INSERT [dbo].[Supply] ([Id], [DisplayName], [IdMeasure], [IdSupplier], [QRCode], [BarCode]) VALUES (N'FD002', N'Beef Noodle', 4, 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([Id], [DisplayName]) VALUES (1, N'admin')
INSERT [dbo].[UserRole] ([Id], [DisplayName]) VALUES (2, N'staff')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [DisplayName], [UserName], [Password], [IdRole]) VALUES (3, N'Nguyen Ha Khue', N'admin', N'64f2a9ac50ffe3e9ada509e10d1b4076', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[ImportInfo] ADD  DEFAULT ((0)) FOR [ImportPrice]
GO
ALTER TABLE [dbo].[ImportInfo] ADD  DEFAULT ((0)) FOR [ExportPrice]
GO
ALTER TABLE [dbo].[ExportInfo]  WITH CHECK ADD FOREIGN KEY([IdCustomer])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[ExportInfo]  WITH CHECK ADD FOREIGN KEY([IdSupply])
REFERENCES [dbo].[Supply] ([Id])
GO
ALTER TABLE [dbo].[ExportInfo]  WITH CHECK ADD  CONSTRAINT [FK_ExportInfo_Export] FOREIGN KEY([IdExportInfo])
REFERENCES [dbo].[Export] ([Id])
GO
ALTER TABLE [dbo].[ExportInfo] CHECK CONSTRAINT [FK_ExportInfo_Export]
GO
ALTER TABLE [dbo].[ImportInfo]  WITH CHECK ADD FOREIGN KEY([IdImport])
REFERENCES [dbo].[Import] ([Id])
GO
ALTER TABLE [dbo].[ImportInfo]  WITH CHECK ADD FOREIGN KEY([IdSupply])
REFERENCES [dbo].[Supply] ([Id])
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD FOREIGN KEY([IdMeasure])
REFERENCES [dbo].[Measure] ([Id])
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD FOREIGN KEY([IdSupplier])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([IdRole])
REFERENCES [dbo].[UserRole] ([Id])
GO
USE [master]
GO
ALTER DATABASE [QuanLyKhoHang] SET  READ_WRITE 
GO
