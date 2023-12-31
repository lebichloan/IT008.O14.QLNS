USE [master]
GO
/****** Object:  Database [QLNS]    Script Date: 1/3/2024 8:01:56 AM ******/
CREATE DATABASE [QLNS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLNS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QLNS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLNS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QLNS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLNS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLNS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLNS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLNS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLNS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLNS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLNS] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLNS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLNS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLNS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLNS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLNS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLNS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLNS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLNS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLNS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLNS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLNS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLNS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLNS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLNS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLNS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLNS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLNS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLNS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLNS] SET  MULTI_USER 
GO
ALTER DATABASE [QLNS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLNS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLNS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLNS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLNS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLNS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLNS] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLNS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLNS]
GO
/****** Object:  Table [dbo].[CHUCNANG]    Script Date: 1/3/2024 8:01:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUCNANG](
	[idCN] [int] IDENTITY(1,1) NOT NULL,
	[MaCN]  AS (CONVERT([char](6),'CN'+right('000'+CONVERT([varchar](3),[idCN]),(3)))) PERSISTED,
	[TenCN] [nvarchar](max) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTHD]    Script Date: 1/3/2024 8:01:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHD](
	[idCTHD] [int] IDENTITY(1,1) NOT NULL,
	[idHD] [int] NOT NULL,
	[idCTSP] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [money] NOT NULL,
	[ThanhTien] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCTHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTSP]    Script Date: 1/3/2024 8:01:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTSP](
	[idCTSP] [int] IDENTITY(1,1) NOT NULL,
	[MaCTSP]  AS (CONVERT([char](10),'SP'+right('000000'+CONVERT([varchar](5),[idCTSP]),(5)))) PERSISTED,
	[DonGiaNhap] [money] NOT NULL,
	[SoLuongNhap] [smallint] NOT NULL,
	[SoLuongLoi] [smallint] NOT NULL,
	[DonGiaXuat] [money] NOT NULL,
	[DaBan] [smallint] NOT NULL,
	[SLConLai] [smallint] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TinhTrang] [int] NOT NULL,
	[idSP] [int] NOT NULL,
	[idNH] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCTSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHMUC]    Script Date: 1/3/2024 8:01:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUC](
	[idDM] [int] IDENTITY(1,1) NOT NULL,
	[MaDM]  AS (CONVERT([char](6),'DM'+right('000'+CONVERT([varchar](3),[idDM]),(3)))) PERSISTED,
	[TenDM] [nvarchar](max) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 1/3/2024 8:01:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[idHD] [int] IDENTITY(1,1) NOT NULL,
	[SoHD]  AS (CONVERT([char](12),'HD'+right('000000'+CONVERT([varchar](6),[idHD]),(6)))) PERSISTED,
	[NgayHD] [datetime] NOT NULL,
	[SLSP] [int] NOT NULL,
	[ThanhTien] [money] NOT NULL,
	[GiamGia] [money] NOT NULL,
	[ThanhToan] [money] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
	[idLKH] [int] NULL,
	[idKH] [int] NULL,
	[idKM] [int] NULL,
	[idND] [int] NOT NULL,
	[idPT] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 1/3/2024 8:01:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[idKH] [int] IDENTITY(1,1) NOT NULL,
	[MaKH]  AS (CONVERT([char](10),'KH'+right('00000'+CONVERT([varchar](5),[idKH]),(5)))) PERSISTED,
	[TenKH] [nvarchar](max) NOT NULL,
	[GioiTinh] [nvarchar](max) NOT NULL,
	[NgaySinh] [datetime] NULL,
	[DiaChi] [nvarchar](max) NULL,
	[SDT] [varchar](10) NOT NULL,
	[NgayTG] [datetime] NOT NULL,
	[DiemTichLuy] [int] NOT NULL,
	[idLKH] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHUYENMAI]    Script Date: 1/3/2024 8:01:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHUYENMAI](
	[idKM] [int] IDENTITY(1,1) NOT NULL,
	[MaKM]  AS (CONVERT([char](6),'KM'+right('000'+CONVERT([varchar](3),[idKM]),(3)))) PERSISTED,
	[TenKM] [nvarchar](max) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[idLKH] [int] NOT NULL,
	[NgayBD] [datetime] NOT NULL,
	[NgayKT] [datetime] NOT NULL,
	[GiamGia] [smallint] NOT NULL,
	[idND] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idKM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAIKHACHHANG]    Script Date: 1/3/2024 8:01:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIKHACHHANG](
	[idLKH] [int] IDENTITY(1,1) NOT NULL,
	[MaLKH]  AS (CONVERT([char](6),'LKH'+right('000'+CONVERT([varchar](3),[idLKH]),(3)))) PERSISTED,
	[TenLKH] [nvarchar](max) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[DiemTichLuyToiThieu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idLKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAINGUOIDUNG]    Script Date: 1/3/2024 8:01:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAINGUOIDUNG](
	[idLND] [int] IDENTITY(1,1) NOT NULL,
	[MaLND]  AS (CONVERT([char](6),'LND'+right('000'+CONVERT([varchar](3),[idLND]),(3)))) PERSISTED,
	[TenLND] [nvarchar](max) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[idLND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NGUOIDUNG]    Script Date: 1/3/2024 8:01:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGUOIDUNG](
	[idND] [int] IDENTITY(1,1) NOT NULL,
	[MaND]  AS (CONVERT([char](8),'ND'+right('000000'+CONVERT([varchar](4),[idND]),(4)))) PERSISTED,
	[TenDN] [varchar](50) NOT NULL,
	[MatKhau] [varchar](max) NOT NULL,
	[NgayTao] [datetime] NOT NULL,
	[TinhTrang] [int] NOT NULL,
	[idNV] [int] NOT NULL,
	[idLND] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 1/3/2024 8:01:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[idNV] [int] IDENTITY(1,1) NOT NULL,
	[MaNV]  AS (CONVERT([char](8),'NV'+right('000000'+CONVERT([varchar](4),[idNV]),(4)))) PERSISTED,
	[TenNV] [nvarchar](max) NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[GioiTinh] [nvarchar](max) NOT NULL,
	[DiaChi] [nvarchar](max) NULL,
	[SDT] [varchar](10) NULL,
	[NgayVL] [datetime] NOT NULL,
	[ChucVu] [nvarchar](max) NOT NULL,
	[TinhTrang] [int] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[idNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHAPHANG]    Script Date: 1/3/2024 8:01:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHAPHANG](
	[idNH] [int] IDENTITY(1,1) NOT NULL,
	[MaNH]  AS (CONVERT([char](10),'NH'+right('000000'+CONVERT([varchar](5),[idNH]),(5)))) PERSISTED,
	[NgayNhap] [datetime] NOT NULL,
	[ThanhTien] [money] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
	[idND] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idNH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHANQUYEN]    Script Date: 1/3/2024 8:01:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHANQUYEN](
	[idLND] [int] NOT NULL,
	[idCN] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idLND] ASC,
	[idCN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PTTHANHTOAN]    Script Date: 1/3/2024 8:01:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PTTHANHTOAN](
	[idPT] [int] IDENTITY(1,1) NOT NULL,
	[MaPT]  AS (CONVERT([char](4),'PT'+right('000'+CONVERT([varchar](2),[idPT]),(2)))) PERSISTED,
	[TenPT] [nvarchar](max) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 1/3/2024 8:01:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[idSP] [int] IDENTITY(1,1) NOT NULL,
	[MaSP]  AS (CONVERT([char](8),'TTSP'+right('0000000'+CONVERT([varchar](4),[idSP]),(4)))) PERSISTED,
	[TenSP] [nvarchar](max) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[idDM] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SANPHAMLOI]    Script Date: 1/3/2024 8:01:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAMLOI](
	[idSPL] [int] IDENTITY(1,1) NOT NULL,
	[MaSPL]  AS (CONVERT([char](8),'SPL'+right('0000'+CONVERT([varchar](4),[idSPL]),(4)))) PERSISTED,
	[idCTSP] [int] NOT NULL,
	[SoLuongLoi] [smallint] NOT NULL,
	[NgayLoi] [datetime] NOT NULL,
	[ChiTietLoi] [nvarchar](max) NULL,
	[GhiChu] [nvarchar](max) NULL,
	[idND] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idSPL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CHUCNANG] ON 

INSERT [dbo].[CHUCNANG] ([idCN], [TenCN], [MoTa]) VALUES (1, N'Quản lý nhân viên', N'')
INSERT [dbo].[CHUCNANG] ([idCN], [TenCN], [MoTa]) VALUES (2, N'Phân quyền', N'')
INSERT [dbo].[CHUCNANG] ([idCN], [TenCN], [MoTa]) VALUES (3, N'Quản lý loại khách hàng', N'')
INSERT [dbo].[CHUCNANG] ([idCN], [TenCN], [MoTa]) VALUES (4, N'Quản lý khách hàng', N'')
INSERT [dbo].[CHUCNANG] ([idCN], [TenCN], [MoTa]) VALUES (5, N'Quản lý danh mục sản phẩm', N'')
INSERT [dbo].[CHUCNANG] ([idCN], [TenCN], [MoTa]) VALUES (6, N'Quản lý sản phẩm', N'')
INSERT [dbo].[CHUCNANG] ([idCN], [TenCN], [MoTa]) VALUES (7, N'Quản lý nhập hàng', N'')
INSERT [dbo].[CHUCNANG] ([idCN], [TenCN], [MoTa]) VALUES (8, N'Quản lý chương trình khuyến mãi', N'')
INSERT [dbo].[CHUCNANG] ([idCN], [TenCN], [MoTa]) VALUES (9, N'Quản lý hóa đơn', N'')
INSERT [dbo].[CHUCNANG] ([idCN], [TenCN], [MoTa]) VALUES (10, N'Báo cáo thống kê', N'')
SET IDENTITY_INSERT [dbo].[CHUCNANG] OFF
GO
SET IDENTITY_INSERT [dbo].[CTHD] ON 

INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (1, 1, 1, 10, 24000.0000, 240000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (2, 1, 2, 3, 24000.0000, 72000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3, 2, 3, 4, 25000.0000, 100000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (4, 2, 5, 1, 25000.0000, 25000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (5, 3, 1, 2, 24000.0000, 48000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (6, 3, 3, 1, 25000.0000, 25000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (7, 4, 9, 2, 23000.0000, 46000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (8, 4, 6, 4, 25500.0000, 102000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (9, 5, 1, 1, 24000.0000, 24000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (10, 5, 11, 6, 7000.0000, 42000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (11, 5, 16, 50, 2000.0000, 100000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (12, 6, 8, 2, 25000.0000, 50000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (13, 6, 31, 2, 3615000.0000, 7230000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (14, 7, 9, 2, 23000.0000, 46000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (15, 7, 10, 1, 24000.0000, 24000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (16, 7, 15, 1, 260000.0000, 260000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (17, 8, 4, 2, 30000.0000, 60000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (18, 8, 17, 4, 54000.0000, 216000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (19, 9, 1, 1, 24000.0000, 24000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (20, 9, 14, 5, 6500.0000, 32500.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (21, 10, 6, 2, 25500.0000, 51000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (22, 10, 13, 1, 580000.0000, 580000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (23, 10, 15, 1, 260000.0000, 260000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (24, 11, 5, 1, 25000.0000, 25000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (25, 11, 13, 1, 580000.0000, 580000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (26, 11, 16, 10, 2000.0000, 20000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (27, 12, 16, 100, 2000.0000, 200000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (28, 12, 22, 2, 161000.0000, 322000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (29, 13, 10, 1, 24000.0000, 24000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (30, 13, 11, 5, 7000.0000, 35000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (31, 14, 18, 1, 5000000.0000, 5000000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (32, 14, 29, 2, 147000.0000, 294000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (33, 15, 24, 2, 158000.0000, 316000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (34, 15, 26, 1, 783000.0000, 783000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (35, 16, 40, 3, 61500.0000, 184500.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (36, 16, 52, 2, 48000.0000, 96000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (37, 17, 37, 5, 46000.0000, 230000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (38, 17, 34, 3, 113000.0000, 339000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (39, 18, 38, 2, 107000.0000, 214000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (40, 18, 40, 2, 61500.0000, 123000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (41, 19, 38, 3, 107000.0000, 321000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (42, 19, 45, 2, 180000.0000, 360000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (43, 19, 58, 1, 58000.0000, 58000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (44, 20, 40, 2, 61500.0000, 123000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (45, 20, 42, 2, 45000.0000, 90000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (46, 21, 23, 1, 1350000.0000, 1350000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (47, 21, 39, 2, 100000.0000, 200000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (48, 21, 55, 1, 34000.0000, 34000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (49, 22, 24, 2, 158000.0000, 316000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (50, 22, 33, 1, 471000.0000, 471000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (51, 22, 50, 1, 7540000.0000, 7540000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (52, 23, 35, 2, 264000.0000, 528000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (53, 23, 45, 1, 180000.0000, 180000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (54, 23, 54, 1, 33000.0000, 33000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (55, 24, 21, 2, 272000.0000, 544000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (56, 24, 31, 1, 3615000.0000, 3615000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (57, 24, 43, 2, 62000.0000, 124000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (58, 25, 24, 3, 158000.0000, 474000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (59, 25, 38, 1, 107000.0000, 107000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (60, 25, 48, 3, 103000.0000, 309000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (61, 26, 16, 50, 2000.0000, 100000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (62, 26, 35, 2, 264000.0000, 528000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (63, 26, 47, 1, 138000.0000, 138000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (64, 27, 34, 3, 113000.0000, 339000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (65, 27, 46, 1, 633000.0000, 633000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (66, 28, 35, 1, 264000.0000, 264000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (67, 28, 47, 2, 138000.0000, 276000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (68, 28, 57, 1, 43000.0000, 43000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (69, 29, 6, 1, 25500.0000, 25500.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (70, 29, 10, 1, 24000.0000, 24000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (71, 29, 3, 1, 25000.0000, 25000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (72, 30, 15, 1, 260000.0000, 260000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (73, 30, 26, 1, 783000.0000, 783000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (74, 30, 38, 2, 107000.0000, 214000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (75, 31, 49, 1, 40000.0000, 40000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (76, 32, 30, 1, 121000.0000, 121000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (77, 32, 41, 2, 32000.0000, 64000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (78, 32, 60, 3, 41000.0000, 123000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (79, 32, 73, 1, 124000.0000, 124000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (80, 33, 5, 1, 25000.0000, 25000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (81, 33, 13, 1, 580000.0000, 580000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (82, 33, 21, 1, 272000.0000, 272000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (83, 34, 22, 1, 161000.0000, 161000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (84, 34, 31, 1, 3615000.0000, 3615000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (85, 34, 44, 1, 4990000.0000, 4990000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (86, 35, 12, 5, 10000.0000, 50000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (87, 35, 26, 1, 783000.0000, 783000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (88, 35, 40, 1, 61500.0000, 61500.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (89, 36, 7, 1, 24000.0000, 24000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (90, 36, 24, 1, 158000.0000, 158000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (91, 36, 39, 1, 100000.0000, 100000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (92, 37, 36, 1, 38000.0000, 38000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (93, 37, 50, 1, 7540000.0000, 7540000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (94, 37, 64, 2, 27500.0000, 55000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (95, 38, 25, 2, 74000.0000, 148000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (96, 38, 34, 2, 113000.0000, 226000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (97, 38, 47, 2, 138000.0000, 276000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (98, 39, 25, 1, 74000.0000, 74000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (99, 39, 35, 2, 264000.0000, 528000.0000)
GO
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (100, 39, 51, 2, 56000.0000, 112000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (101, 40, 5, 1, 25000.0000, 25000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (102, 40, 22, 2, 161000.0000, 322000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (103, 40, 43, 1, 62000.0000, 62000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (104, 40, 54, 1, 33000.0000, 33000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (105, 41, 53, 1, 52000.0000, 52000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (106, 41, 55, 1, 34000.0000, 34000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (107, 41, 56, 1, 37000.0000, 37000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (108, 41, 52, 1, 48000.0000, 48000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (109, 42, 24, 2, 158000.0000, 316000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (110, 42, 36, 1, 38000.0000, 38000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (111, 42, 48, 1, 103000.0000, 103000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (112, 42, 57, 1, 43000.0000, 43000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (113, 43, 33, 1, 471000.0000, 471000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (114, 43, 44, 1, 4990000.0000, 4990000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (115, 43, 52, 1, 48000.0000, 48000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (116, 44, 14, 1, 6500.0000, 6500.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (117, 44, 34, 2, 113000.0000, 226000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (118, 44, 50, 1, 7540000.0000, 7540000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (119, 44, 64, 1, 27500.0000, 27500.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (120, 44, 65, 2, 27500.0000, 55000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (121, 45, 41, 2, 32000.0000, 64000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (122, 45, 59, 1, 52000.0000, 52000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (123, 45, 76, 6, 175000.0000, 1050000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (124, 46, 70, 4, 27000.0000, 108000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (125, 46, 69, 5, 28500.0000, 142500.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (126, 46, 68, 5, 29000.0000, 145000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (127, 47, 31, 1, 3615000.0000, 3615000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (128, 47, 45, 4, 180000.0000, 720000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (129, 47, 58, 1, 58000.0000, 58000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (130, 48, 50, 1, 7540000.0000, 7540000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (131, 48, 62, 4, 29000.0000, 116000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (132, 48, 64, 2, 27500.0000, 55000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (133, 48, 63, 2, 27500.0000, 55000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (134, 49, 9, 1, 23000.0000, 23000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (135, 49, 20, 3, 6200000.0000, 18600000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (136, 49, 18, 1, 5000000.0000, 5000000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (137, 49, 19, 2, 55000.0000, 110000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (138, 50, 23, 2, 1350000.0000, 2700000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (139, 50, 34, 1, 113000.0000, 113000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (140, 50, 42, 1, 45000.0000, 45000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (141, 50, 56, 3, 37000.0000, 111000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (142, 50, 68, 3, 29000.0000, 87000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (143, 51, 24, 4, 158000.0000, 632000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (144, 51, 33, 4, 471000.0000, 1884000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (145, 51, 47, 1, 138000.0000, 138000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (146, 51, 61, 10, 28500.0000, 285000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (147, 52, 38, 2, 107000.0000, 214000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (148, 52, 50, 1, 7540000.0000, 7540000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (149, 52, 63, 6, 27500.0000, 165000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (150, 53, 78, 7, 109000.0000, 763000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (151, 53, 76, 3, 175000.0000, 525000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (152, 53, 75, 6, 133000.0000, 798000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (153, 54, 8, 1, 25000.0000, 25000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (154, 54, 14, 2, 6500.0000, 13000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (155, 54, 26, 1, 783000.0000, 783000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (156, 54, 40, 4, 61500.0000, 246000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (157, 54, 49, 1, 40000.0000, 40000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (158, 55, 7, 3, 24000.0000, 72000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (159, 55, 38, 1, 107000.0000, 107000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (160, 55, 53, 4, 52000.0000, 208000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (161, 55, 66, 4, 27500.0000, 110000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (162, 55, 74, 1, 155000.0000, 155000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (163, 55, 75, 2, 133000.0000, 266000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (164, 56, 9, 4, 23000.0000, 92000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (165, 56, 8, 4, 25000.0000, 100000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (166, 56, 4, 3, 30000.0000, 90000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (167, 56, 39, 1, 100000.0000, 100000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (168, 56, 62, 5, 29000.0000, 145000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (169, 57, 26, 2, 783000.0000, 1566000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (170, 57, 47, 1, 138000.0000, 138000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (171, 57, 57, 3, 43000.0000, 129000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (172, 57, 76, 3, 175000.0000, 525000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (173, 58, 3, 3, 25000.0000, 75000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (174, 58, 28, 1, 617000.0000, 617000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (175, 58, 37, 1, 46000.0000, 46000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (176, 58, 49, 1, 40000.0000, 40000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (177, 58, 61, 4, 28500.0000, 114000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (178, 59, 4, 2, 30000.0000, 60000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (179, 59, 2, 2, 24000.0000, 48000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (180, 59, 36, 4, 38000.0000, 152000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (181, 59, 62, 3, 29000.0000, 87000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (182, 60, 29, 1, 147000.0000, 147000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (183, 60, 32, 4, 91000.0000, 364000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (184, 60, 51, 3, 56000.0000, 168000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (185, 60, 64, 5, 27500.0000, 137500.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (186, 61, 24, 2, 158000.0000, 316000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (187, 61, 37, 1, 46000.0000, 46000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (188, 61, 50, 1, 7540000.0000, 7540000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (189, 61, 60, 2, 41000.0000, 82000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (190, 62, 16, 100, 2000.0000, 200000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (191, 62, 53, 5, 52000.0000, 260000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (192, 62, 66, 5, 27500.0000, 137500.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (193, 63, 25, 1, 74000.0000, 74000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (194, 63, 41, 4, 32000.0000, 128000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (195, 63, 51, 1, 56000.0000, 56000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (196, 63, 65, 4, 27500.0000, 110000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (197, 64, 40, 3, 61500.0000, 184500.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (198, 64, 55, 4, 34000.0000, 136000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (199, 64, 65, 3, 27500.0000, 82500.0000)
GO
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (200, 64, 76, 3, 175000.0000, 525000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (201, 65, 11, 4, 7000.0000, 28000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (202, 65, 32, 5, 91000.0000, 455000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (203, 66, 34, 3, 113000.0000, 339000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (204, 66, 49, 1, 40000.0000, 40000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (205, 66, 58, 2, 58000.0000, 116000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3570, 183, 853, 2, 24000.0000, 48000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3571, 184, 857, 5, 24000.0000, 120000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3572, 185, 818, 5, 600000.0000, 3000000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3573, 186, 818, 2, 600000.0000, 1200000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3574, 187, 846, 2, 31000.0000, 62000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3575, 188, 817, 5, 120000.0000, 600000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3576, 189, 874, 2, 22000.0000, 44000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3577, 190, 867, 4, 130000.0000, 520000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3578, 191, 818, 4, 600000.0000, 2400000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3579, 192, 804, 4, 4000.0000, 16000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3580, 193, 850, 3, 37000.0000, 111000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3581, 194, 819, 5, 130000.0000, 650000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3582, 195, 824, 5, 100000.0000, 500000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3583, 196, 833, 2, 59000.0000, 118000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3584, 197, 878, 4, 17500.0000, 70000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3585, 198, 848, 2, 53000.0000, 106000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3586, 199, 804, 4, 4000.0000, 16000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3587, 200, 860, 4, 24000.0000, 96000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3588, 201, 834, 4, 4800000.0000, 19200000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3589, 202, 825, 2, 250000.0000, 500000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3590, 203, 867, 4, 130000.0000, 520000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3591, 204, 818, 3, 600000.0000, 1800000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3592, 205, 802, 2, 7000.0000, 14000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3593, 206, 810, 2, 6000000.0000, 12000000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3594, 207, 839, 3, 33000.0000, 99000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3595, 208, 800, 5, 20500.0000, 102500.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3596, 209, 800, 5, 20500.0000, 102500.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3597, 210, 826, 3, 30000.0000, 90000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3598, 211, 815, 5, 67000.0000, 335000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3599, 212, 843, 3, 48000.0000, 144000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3600, 213, 874, 5, 22000.0000, 110000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3601, 214, 808, 3, 4800000.0000, 14400000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3602, 215, 825, 3, 250000.0000, 750000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3603, 216, 826, 4, 30000.0000, 120000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3604, 217, 834, 5, 4800000.0000, 24000000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3605, 218, 819, 5, 130000.0000, 650000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3606, 219, 814, 2, 145000.0000, 290000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3607, 220, 878, 2, 17500.0000, 35000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3608, 221, 840, 5, 7400000.0000, 37000000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3609, 222, 875, 2, 22500.0000, 45000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3610, 223, 807, 2, 50000.0000, 100000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3611, 224, 809, 3, 50000.0000, 150000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3612, 225, 862, 3, 120000.0000, 360000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3613, 226, 850, 4, 37000.0000, 148000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3614, 227, 851, 3, 23000.0000, 69000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3615, 228, 870, 2, 20000.0000, 40000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3616, 229, 808, 2, 4800000.0000, 9600000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3617, 230, 827, 2, 40000.0000, 80000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3618, 231, 834, 4, 4800000.0000, 19200000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3619, 232, 850, 2, 37000.0000, 74000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3620, 233, 845, 3, 29000.0000, 87000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3621, 234, 839, 3, 33000.0000, 99000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3622, 235, 845, 2, 29000.0000, 58000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3623, 236, 822, 5, 80000.0000, 400000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3624, 237, 825, 4, 250000.0000, 1000000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3625, 238, 874, 2, 22000.0000, 44000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3626, 239, 2, 4, 20000.0000, 80000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3627, 239, 25, 3, 67000.0000, 201000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3628, 239, 31, 2, 3500000.0000, 7000000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3629, 239, 43, 3, 59000.0000, 177000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3630, 240, 45, 1, 174000.0000, 174000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3631, 240, 41, 4, 29000.0000, 116000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3632, 240, 56, 3, 31000.0000, 93000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3633, 240, 73, 2, 116000.0000, 232000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3634, 241, 6, 1, 22500.0000, 22500.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3635, 241, 11, 5, 5000.0000, 25000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3636, 241, 28, 3, 600000.0000, 1800000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3637, 241, 39, 1, 950000.0000, 950000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3638, 241, 58, 1, 53000.0000, 53000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3639, 242, 21, 2, 250000.0000, 500000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3640, 242, 39, 1, 950000.0000, 950000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3641, 242, 55, 4, 29000.0000, 116000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3642, 242, 68, 3, 24000.0000, 72000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3643, 243, 9, 2, 17500.0000, 35000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3644, 243, 23, 1, 1200000.0000, 1200000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3645, 243, 42, 2, 43000.0000, 86000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3646, 243, 58, 1, 53000.0000, 53000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3647, 243, 61, 3, 23000.0000, 69000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3648, 244, 7, 1, 19500.0000, 19500.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3649, 244, 3, 1, 21000.0000, 21000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3650, 244, 31, 3, 3500000.0000, 10500000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3651, 244, 56, 2, 31000.0000, 62000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3652, 244, 74, 1, 140000.0000, 140000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3653, 245, 7, 1, 19500.0000, 19500.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3654, 245, 50, 1, 7400000.0000, 7400000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3655, 245, 69, 4, 24000.0000, 96000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3656, 245, 73, 5, 116000.0000, 580000.0000)
INSERT [dbo].[CTHD] ([idCTHD], [idHD], [idCTSP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3657, 245, 77, 5, 130000.0000, 650000.0000)
SET IDENTITY_INSERT [dbo].[CTHD] OFF
GO
SET IDENTITY_INSERT [dbo].[CTSP] ON 

INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1, 20000.0000, 20, 0, 24000.0000, 14, 6, NULL, 1, 1, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (2, 20000.0000, 20, 0, 24000.0000, 9, 11, NULL, 1, 2, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (3, 21000.0000, 20, 0, 25000.0000, 10, 10, NULL, 1, 3, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (4, 24000.0000, 20, 0, 30000.0000, 7, 13, NULL, 1, 4, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (5, 22000.0000, 20, 0, 25000.0000, 4, 16, NULL, 1, 5, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (6, 22500.0000, 20, 0, 25500.0000, 8, 12, NULL, 1, 6, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (7, 19500.0000, 20, 0, 24000.0000, 6, 14, NULL, 1, 7, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (8, 22000.0000, 20, 0, 25000.0000, 7, 13, NULL, 1, 8, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (9, 17500.0000, 20, 0, 23000.0000, 11, 9, NULL, 1, 9, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (10, 20500.0000, 20, 0, 24000.0000, 3, 17, NULL, 1, 10, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (11, 5000.0000, 40, 0, 7000.0000, 20, 20, NULL, 1, 11, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (12, 7000.0000, 20, 0, 10000.0000, 5, 15, NULL, 1, 12, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (13, 500000.0000, 20, 0, 580000.0000, 3, 17, NULL, 1, 13, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (14, 4000.0000, 20, 0, 6500.0000, 8, 12, NULL, 1, 14, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (15, 200000.0000, 20, 0, 260000.0000, 3, 17, NULL, 1, 15, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (16, 1000.0000, 1000, 0, 2000.0000, 310, 690, NULL, 1, 16, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (17, 50000.0000, 20, 0, 54000.0000, 4, 16, NULL, 1, 17, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (18, 4800000.0000, 20, 0, 5000000.0000, 2, 18, NULL, 1, 18, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (19, 50000.0000, 20, 0, 55000.0000, 2, 18, NULL, 1, 19, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (20, 6000000.0000, 20, 0, 6200000.0000, 3, 17, NULL, 1, 20, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (21, 250000.0000, 30, 0, 272000.0000, 5, 25, NULL, 1, 21, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (22, 140000.0000, 30, 0, 161000.0000, 5, 25, NULL, 1, 22, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (23, 1200000.0000, 15, 0, 1350000.0000, 4, 11, NULL, 1, 23, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (24, 145000.0000, 30, 0, 158000.0000, 16, 14, NULL, 1, 24, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (25, 67000.0000, 40, 0, 74000.0000, 7, 33, NULL, 1, 25, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (26, 750000.0000, 25, 0, 783000.0000, 6, 19, NULL, 1, 26, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (27, 120000.0000, 30, 0, 141000.0000, 0, 30, NULL, 1, 27, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (28, 600000.0000, 30, 0, 617000.0000, 4, 26, NULL, 1, 28, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (29, 130000.0000, 30, 0, 147000.0000, 3, 27, NULL, 1, 29, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (30, 100000.0000, 30, 0, 121000.0000, 1, 29, NULL, 1, 30, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (31, 3500000.0000, 30, 0, 3615000.0000, 10, 20, NULL, 1, 31, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (32, 80000.0000, 30, 0, 91000.0000, 9, 21, NULL, 1, 32, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (33, 450000.0000, 25, 0, 471000.0000, 6, 19, NULL, 1, 33, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (34, 100000.0000, 35, 0, 113000.0000, 14, 21, NULL, 1, 34, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (35, 250000.0000, 20, 0, 264000.0000, 7, 13, NULL, 1, 35, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (36, 30000.0000, 30, 0, 38000.0000, 6, 24, NULL, 1, 36, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (37, 40000.0000, 30, 0, 46000.0000, 7, 23, NULL, 1, 37, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (38, 99000.0000, 25, 0, 107000.0000, 11, 14, NULL, 1, 38, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (39, 950000.0000, 15, 0, 100000.0000, 6, 9, NULL, 1, 39, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (40, 54000.0000, 30, 0, 61500.0000, 15, 15, NULL, 1, 40, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (41, 29000.0000, 40, 0, 32000.0000, 12, 28, NULL, 1, 41, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (42, 43000.0000, 25, 0, 45000.0000, 5, 20, NULL, 1, 42, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (43, 59000.0000, 30, 0, 62000.0000, 6, 24, NULL, 1, 43, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (44, 4800000.0000, 10, 0, 4990000.0000, 2, 8, NULL, 1, 44, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (45, 174000.0000, 20, 0, 180000.0000, 8, 12, NULL, 1, 45, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (46, 620000.0000, 10, 0, 633000.0000, 1, 9, NULL, 1, 46, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (47, 130000.0000, 10, 0, 138000.0000, 7, 3, NULL, 1, 47, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (48, 99000.0000, 10, 0, 103000.0000, 4, 6, NULL, 1, 48, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (49, 33000.0000, 10, 0, 40000.0000, 4, 6, NULL, 1, 49, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (50, 7400000.0000, 10, 0, 7540000.0000, 7, 3, NULL, 1, 50, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (51, 52000.0000, 20, 0, 56000.0000, 6, 14, NULL, 1, 51, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (52, 43000.0000, 25, 0, 48000.0000, 4, 21, NULL, 1, 52, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (53, 48000.0000, 25, 0, 52000.0000, 10, 15, NULL, 1, 53, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (54, 19840.0000, 20, 0, 33000.0000, 2, 18, NULL, 1, 54, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (55, 29000.0000, 30, 0, 34000.0000, 10, 20, NULL, 1, 55, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (56, 31000.0000, 30, 0, 37000.0000, 9, 21, NULL, 1, 56, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (57, 38000.0000, 20, 0, 43000.0000, 5, 15, NULL, 1, 57, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (58, 53000.0000, 15, 0, 58000.0000, 6, 9, NULL, 1, 58, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (59, 48000.0000, 20, 0, 52000.0000, 1, 19, NULL, 1, 59, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (60, 37000.0000, 20, 0, 41000.0000, 5, 15, NULL, 1, 60, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (61, 23000.0000, 40, 0, 28500.0000, 17, 23, NULL, 1, 61, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (62, 24000.0000, 40, 0, 29000.0000, 12, 28, NULL, 1, 62, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (63, 24000.0000, 40, 0, 27500.0000, 8, 32, NULL, 1, 63, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (64, 24000.0000, 40, 0, 27500.0000, 10, 30, NULL, 1, 64, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (65, 24000.0000, 40, 0, 27500.0000, 9, 31, NULL, 1, 65, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (66, 24000.0000, 40, 0, 27500.0000, 9, 31, NULL, 1, 66, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (67, 24000.0000, 40, 0, 28000.0000, 0, 40, NULL, 1, 67, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (68, 24000.0000, 40, 0, 29000.0000, 11, 29, NULL, 1, 68, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (69, 24000.0000, 40, 0, 28500.0000, 9, 31, NULL, 1, 69, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (70, 24000.0000, 40, 0, 27000.0000, 4, 36, NULL, 1, 70, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (71, 45000.0000, 50, 0, 50000.0000, 0, 50, NULL, 1, 71, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (72, 120000.0000, 30, 0, 133000.0000, 0, 30, NULL, 1, 72, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (73, 116000.0000, 40, 0, 124000.0000, 8, 32, NULL, 1, 73, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (74, 140000.0000, 40, 0, 155000.0000, 2, 38, NULL, 1, 74, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (75, 120000.0000, 50, 0, 133000.0000, 8, 42, NULL, 1, 75, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (76, 160000.0000, 50, 0, 175000.0000, 15, 35, NULL, 1, 76, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (77, 130000.0000, 40, 0, 153000.0000, 5, 35, NULL, 1, 77, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (78, 99000.0000, 30, 0, 109000.0000, 7, 23, NULL, 1, 78, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (79, 132000.0000, 40, 0, 148000.0000, 0, 40, NULL, 1, 79, 1)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (80, 20000.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 1, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (81, 20000.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 2, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (82, 21000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 3, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (83, 24000.0000, 20, 0, 30000.0000, 0, 20, NULL, 1, 4, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (84, 22000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 5, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (85, 22500.0000, 40, 0, 25500.0000, 0, 40, NULL, 1, 6, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (86, 19500.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 7, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (87, 22000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 8, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (88, 17500.0000, 60, 0, 23000.0000, 0, 60, NULL, 1, 9, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (89, 20500.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 10, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (90, 5000.0000, 40, 0, 7000.0000, 0, 40, NULL, 1, 11, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (91, 7000.0000, 20, 0, 10000.0000, 0, 20, NULL, 1, 12, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (92, 500000.0000, 20, 0, 580000.0000, 0, 20, NULL, 1, 13, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (93, 4000.0000, 20, 0, 6500.0000, 0, 20, NULL, 1, 14, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (94, 200000.0000, 20, 0, 260000.0000, 0, 20, NULL, 1, 15, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (95, 1000.0000, 1000, 0, 2000.0000, 0, 1000, NULL, 1, 16, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (96, 50000.0000, 100, 0, 54000.0000, 0, 100, NULL, 1, 17, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (97, 4800000.0000, 20, 0, 5000000.0000, 0, 20, NULL, 1, 18, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (98, 50000.0000, 20, 0, 55000.0000, 0, 20, NULL, 1, 19, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (99, 6000000.0000, 20, 0, 6200000.0000, 0, 20, NULL, 1, 20, 2)
GO
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (100, 250000.0000, 30, 0, 272000.0000, 0, 30, NULL, 1, 21, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (101, 140000.0000, 30, 0, 161000.0000, 0, 30, NULL, 1, 22, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (102, 1200000.0000, 15, 0, 1350000.0000, 0, 15, NULL, 1, 23, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (103, 145000.0000, 30, 0, 158000.0000, 0, 30, NULL, 1, 24, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (104, 67000.0000, 40, 0, 74000.0000, 0, 40, NULL, 1, 25, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (105, 750000.0000, 25, 0, 783000.0000, 0, 25, NULL, 1, 26, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (106, 120000.0000, 30, 0, 141000.0000, 0, 30, NULL, 1, 27, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (107, 600000.0000, 30, 0, 617000.0000, 0, 30, NULL, 1, 28, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (108, 130000.0000, 30, 0, 147000.0000, 0, 30, NULL, 1, 29, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (109, 100000.0000, 30, 0, 121000.0000, 0, 30, NULL, 1, 30, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (110, 3500000.0000, 30, 0, 3615000.0000, 0, 30, NULL, 1, 31, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (111, 80000.0000, 30, 0, 91000.0000, 0, 30, NULL, 1, 32, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (112, 450000.0000, 25, 0, 471000.0000, 0, 25, NULL, 1, 33, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (113, 100000.0000, 45, 0, 113000.0000, 0, 45, NULL, 1, 34, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (114, 250000.0000, 20, 0, 264000.0000, 0, 20, NULL, 1, 35, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (115, 30000.0000, 30, 0, 38000.0000, 0, 30, NULL, 1, 36, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (116, 40000.0000, 30, 0, 46000.0000, 0, 30, NULL, 1, 37, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (117, 99000.0000, 25, 0, 107000.0000, 0, 25, NULL, 1, 38, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (118, 950000.0000, 15, 0, 100000.0000, 0, 15, NULL, 1, 39, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (119, 54000.0000, 30, 0, 61500.0000, 0, 30, NULL, 1, 40, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (120, 29000.0000, 40, 0, 32000.0000, 0, 40, NULL, 1, 41, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (121, 43000.0000, 25, 0, 45000.0000, 0, 25, NULL, 1, 42, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (122, 59000.0000, 30, 0, 62000.0000, 0, 30, NULL, 1, 43, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (123, 4800000.0000, 10, 0, 4990000.0000, 0, 10, NULL, 1, 44, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (124, 174000.0000, 40, 0, 180000.0000, 0, 40, NULL, 1, 45, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (125, 620000.0000, 10, 0, 633000.0000, 0, 10, NULL, 1, 46, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (126, 130000.0000, 10, 0, 138000.0000, 0, 10, NULL, 1, 47, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (127, 99000.0000, 10, 0, 103000.0000, 0, 10, NULL, 1, 48, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (128, 33000.0000, 10, 0, 40000.0000, 0, 10, NULL, 1, 49, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (129, 7400000.0000, 10, 0, 7540000.0000, 0, 10, NULL, 1, 50, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (130, 52000.0000, 20, 0, 56000.0000, 0, 20, NULL, 1, 51, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (131, 43000.0000, 25, 0, 48000.0000, 0, 25, NULL, 1, 52, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (132, 48000.0000, 25, 0, 52000.0000, 0, 25, NULL, 1, 53, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (133, 19840.0000, 20, 0, 33000.0000, 0, 20, NULL, 1, 54, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (134, 29000.0000, 30, 0, 34000.0000, 0, 30, NULL, 1, 55, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (135, 31000.0000, 30, 0, 37000.0000, 0, 30, NULL, 1, 56, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (136, 38000.0000, 20, 0, 43000.0000, 0, 20, NULL, 1, 57, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (137, 53000.0000, 15, 0, 58000.0000, 0, 15, NULL, 1, 58, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (138, 48000.0000, 20, 0, 52000.0000, 0, 20, NULL, 1, 59, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (139, 37000.0000, 20, 0, 41000.0000, 0, 20, NULL, 1, 60, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (140, 23000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 61, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (141, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 62, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (142, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 63, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (143, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 64, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (144, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 65, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (145, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 66, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (146, 24000.0000, 40, 0, 28000.0000, 0, 40, NULL, 1, 67, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (147, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 68, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (148, 24000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 69, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (149, 24000.0000, 60, 0, 27000.0000, 0, 60, NULL, 1, 70, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (150, 45000.0000, 50, 0, 50000.0000, 0, 50, NULL, 1, 71, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (151, 120000.0000, 30, 0, 133000.0000, 0, 30, NULL, 1, 72, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (152, 116000.0000, 40, 0, 124000.0000, 0, 40, NULL, 1, 73, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (153, 140000.0000, 40, 0, 155000.0000, 0, 40, NULL, 1, 74, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (154, 120000.0000, 50, 0, 133000.0000, 0, 50, NULL, 1, 75, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (155, 160000.0000, 70, 0, 175000.0000, 0, 70, NULL, 1, 76, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (156, 130000.0000, 40, 0, 153000.0000, 0, 40, NULL, 1, 77, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (157, 99000.0000, 30, 0, 109000.0000, 0, 30, NULL, 1, 78, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (158, 132000.0000, 40, 0, 148000.0000, 0, 40, NULL, 1, 79, 2)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (159, 20000.0000, 40, 0, 24000.0000, 0, 40, NULL, 1, 1, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (160, 20000.0000, 50, 0, 24000.0000, 0, 50, NULL, 1, 2, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (161, 21000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 3, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (162, 24000.0000, 20, 0, 30000.0000, 0, 20, NULL, 1, 4, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (163, 22000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 5, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (164, 22500.0000, 70, 0, 25500.0000, 0, 70, NULL, 1, 6, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (165, 19500.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 7, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (166, 22000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 8, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (167, 17500.0000, 20, 0, 23000.0000, 0, 20, NULL, 1, 9, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (168, 20500.0000, 60, 0, 24000.0000, 0, 60, NULL, 1, 10, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (169, 5000.0000, 40, 0, 7000.0000, 0, 40, NULL, 1, 11, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (170, 7000.0000, 20, 0, 10000.0000, 0, 20, NULL, 1, 12, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (171, 500000.0000, 20, 0, 580000.0000, 0, 20, NULL, 1, 13, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (172, 4000.0000, 20, 0, 6500.0000, 0, 20, NULL, 1, 14, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (173, 200000.0000, 20, 0, 260000.0000, 0, 20, NULL, 1, 15, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (174, 1000.0000, 1000, 0, 2000.0000, 0, 1000, NULL, 1, 16, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (175, 50000.0000, 20, 0, 54000.0000, 0, 20, NULL, 1, 17, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (176, 4800000.0000, 20, 0, 5000000.0000, 0, 20, NULL, 1, 18, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (177, 50000.0000, 20, 0, 55000.0000, 0, 20, NULL, 1, 19, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (178, 6000000.0000, 20, 0, 6200000.0000, 0, 20, NULL, 1, 20, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (179, 250000.0000, 30, 0, 272000.0000, 0, 30, NULL, 1, 21, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (180, 140000.0000, 30, 0, 161000.0000, 0, 30, NULL, 1, 22, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (181, 1200000.0000, 15, 0, 1350000.0000, 0, 15, NULL, 1, 23, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (182, 145000.0000, 30, 0, 158000.0000, 0, 30, NULL, 1, 24, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (183, 67000.0000, 40, 0, 74000.0000, 0, 40, NULL, 1, 25, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (184, 750000.0000, 25, 0, 783000.0000, 0, 25, NULL, 1, 26, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (185, 120000.0000, 30, 0, 141000.0000, 0, 30, NULL, 1, 27, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (186, 600000.0000, 30, 0, 617000.0000, 0, 30, NULL, 1, 28, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (187, 130000.0000, 30, 0, 147000.0000, 0, 30, NULL, 1, 29, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (188, 100000.0000, 30, 0, 121000.0000, 0, 30, NULL, 1, 30, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (189, 3500000.0000, 30, 0, 3615000.0000, 0, 30, NULL, 1, 31, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (190, 80000.0000, 30, 0, 91000.0000, 0, 30, NULL, 1, 32, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (191, 450000.0000, 45, 0, 471000.0000, 0, 45, NULL, 1, 33, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (192, 100000.0000, 35, 0, 113000.0000, 0, 35, NULL, 1, 34, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (193, 250000.0000, 20, 0, 264000.0000, 0, 20, NULL, 1, 35, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (194, 30000.0000, 30, 0, 38000.0000, 0, 30, NULL, 1, 36, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (195, 40000.0000, 30, 0, 46000.0000, 0, 30, NULL, 1, 37, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (196, 99000.0000, 25, 0, 107000.0000, 0, 25, NULL, 1, 38, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (197, 950000.0000, 15, 0, 100000.0000, 0, 15, NULL, 1, 39, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (198, 54000.0000, 30, 0, 61500.0000, 0, 30, NULL, 1, 40, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (199, 29000.0000, 40, 0, 32000.0000, 0, 40, NULL, 1, 41, 3)
GO
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (200, 43000.0000, 25, 0, 45000.0000, 0, 25, NULL, 1, 42, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (201, 59000.0000, 30, 0, 62000.0000, 0, 30, NULL, 1, 43, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (202, 4800000.0000, 10, 0, 4990000.0000, 0, 10, NULL, 1, 44, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (203, 174000.0000, 20, 0, 180000.0000, 0, 20, NULL, 1, 45, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (204, 620000.0000, 10, 0, 633000.0000, 0, 10, NULL, 1, 46, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (205, 130000.0000, 10, 0, 138000.0000, 0, 10, NULL, 1, 47, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (206, 99000.0000, 10, 0, 103000.0000, 0, 10, NULL, 1, 48, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (207, 33000.0000, 10, 0, 40000.0000, 0, 10, NULL, 1, 49, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (208, 7400000.0000, 10, 0, 7540000.0000, 0, 10, NULL, 1, 50, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (209, 52000.0000, 20, 0, 56000.0000, 0, 20, NULL, 1, 51, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (210, 43000.0000, 25, 0, 48000.0000, 0, 25, NULL, 1, 52, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (211, 48000.0000, 25, 0, 52000.0000, 0, 25, NULL, 1, 53, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (212, 19840.0000, 20, 0, 33000.0000, 0, 20, NULL, 1, 54, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (213, 29000.0000, 30, 0, 34000.0000, 0, 30, NULL, 1, 55, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (214, 31000.0000, 50, 0, 37000.0000, 0, 50, NULL, 1, 56, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (215, 38000.0000, 20, 0, 43000.0000, 0, 20, NULL, 1, 57, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (216, 53000.0000, 15, 0, 58000.0000, 0, 15, NULL, 1, 58, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (217, 48000.0000, 20, 0, 52000.0000, 0, 20, NULL, 1, 59, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (218, 37000.0000, 20, 0, 41000.0000, 0, 20, NULL, 1, 60, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (219, 23000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 61, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (220, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 62, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (221, 24000.0000, 60, 0, 27500.0000, 0, 60, NULL, 1, 63, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (222, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 64, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (223, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 65, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (224, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 66, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (225, 24000.0000, 40, 0, 28000.0000, 0, 40, NULL, 1, 67, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (226, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 68, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (227, 24000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 69, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (228, 24000.0000, 70, 0, 27000.0000, 0, 70, NULL, 1, 70, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (229, 45000.0000, 50, 0, 50000.0000, 0, 50, NULL, 1, 71, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (230, 120000.0000, 30, 0, 133000.0000, 0, 30, NULL, 1, 72, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (231, 116000.0000, 40, 0, 124000.0000, 0, 40, NULL, 1, 73, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (232, 140000.0000, 40, 0, 155000.0000, 0, 40, NULL, 1, 74, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (233, 120000.0000, 50, 0, 133000.0000, 0, 50, NULL, 1, 75, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (234, 160000.0000, 50, 0, 175000.0000, 0, 50, NULL, 1, 76, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (235, 130000.0000, 30, 0, 153000.0000, 0, 30, NULL, 1, 77, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (236, 99000.0000, 30, 0, 109000.0000, 0, 30, NULL, 1, 78, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (237, 132000.0000, 40, 0, 148000.0000, 0, 40, NULL, 1, 79, 3)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (238, 20000.0000, 30, 0, 24000.0000, 0, 30, NULL, 1, 1, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (239, 20000.0000, 60, 0, 24000.0000, 0, 60, NULL, 1, 2, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (240, 21000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 3, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (241, 24000.0000, 40, 0, 30000.0000, 0, 40, NULL, 1, 4, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (242, 22000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 5, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (243, 22500.0000, 20, 0, 25500.0000, 0, 20, NULL, 1, 6, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (244, 19500.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 7, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (245, 22000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 8, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (246, 17500.0000, 50, 0, 23000.0000, 0, 50, NULL, 1, 9, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (247, 20500.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 10, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (248, 5000.0000, 40, 0, 7000.0000, 0, 40, NULL, 1, 11, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (249, 7000.0000, 20, 0, 10000.0000, 0, 20, NULL, 1, 12, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (250, 500000.0000, 50, 0, 580000.0000, 0, 50, NULL, 1, 13, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (251, 4000.0000, 20, 0, 6500.0000, 0, 20, NULL, 1, 14, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (252, 200000.0000, 20, 0, 260000.0000, 0, 20, NULL, 1, 15, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (253, 1000.0000, 1000, 0, 2000.0000, 0, 1000, NULL, 1, 16, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (254, 50000.0000, 20, 0, 54000.0000, 0, 20, NULL, 1, 17, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (255, 4800000.0000, 20, 0, 5000000.0000, 0, 20, NULL, 1, 18, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (256, 50000.0000, 20, 0, 55000.0000, 0, 20, NULL, 1, 19, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (257, 6000000.0000, 20, 0, 6200000.0000, 0, 20, NULL, 1, 20, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (258, 250000.0000, 30, 0, 272000.0000, 0, 30, NULL, 1, 21, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (259, 140000.0000, 30, 0, 161000.0000, 0, 30, NULL, 1, 22, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (260, 1200000.0000, 15, 0, 1350000.0000, 0, 15, NULL, 1, 23, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (261, 145000.0000, 30, 0, 158000.0000, 0, 30, NULL, 1, 24, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (262, 67000.0000, 40, 0, 74000.0000, 0, 40, NULL, 1, 25, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (263, 750000.0000, 65, 0, 783000.0000, 0, 65, NULL, 1, 26, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (264, 120000.0000, 30, 0, 141000.0000, 0, 30, NULL, 1, 27, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (265, 600000.0000, 60, 0, 617000.0000, 0, 60, NULL, 1, 28, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (266, 130000.0000, 40, 0, 147000.0000, 0, 40, NULL, 1, 29, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (267, 100000.0000, 30, 0, 121000.0000, 0, 30, NULL, 1, 30, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (268, 3500000.0000, 30, 0, 3615000.0000, 0, 30, NULL, 1, 31, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (269, 80000.0000, 30, 0, 91000.0000, 0, 30, NULL, 1, 32, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (270, 450000.0000, 25, 0, 471000.0000, 0, 25, NULL, 1, 33, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (271, 100000.0000, 85, 0, 113000.0000, 0, 85, NULL, 1, 34, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (272, 250000.0000, 20, 0, 264000.0000, 0, 20, NULL, 1, 35, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (273, 30000.0000, 30, 0, 38000.0000, 0, 30, NULL, 1, 36, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (274, 40000.0000, 30, 0, 46000.0000, 0, 30, NULL, 1, 37, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (275, 99000.0000, 25, 0, 107000.0000, 0, 25, NULL, 1, 38, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (276, 950000.0000, 15, 0, 100000.0000, 0, 15, NULL, 1, 39, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (277, 54000.0000, 30, 0, 61500.0000, 0, 30, NULL, 1, 40, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (278, 29000.0000, 40, 0, 32000.0000, 0, 40, NULL, 1, 41, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (279, 43000.0000, 25, 0, 45000.0000, 0, 25, NULL, 1, 42, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (280, 59000.0000, 30, 0, 62000.0000, 0, 30, NULL, 1, 43, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (281, 4800000.0000, 10, 0, 4990000.0000, 0, 10, NULL, 1, 44, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (282, 174000.0000, 40, 0, 180000.0000, 0, 40, NULL, 1, 45, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (283, 620000.0000, 20, 0, 633000.0000, 0, 20, NULL, 1, 46, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (284, 130000.0000, 10, 0, 138000.0000, 0, 10, NULL, 1, 47, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (285, 99000.0000, 10, 0, 103000.0000, 0, 10, NULL, 1, 48, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (286, 33000.0000, 10, 0, 40000.0000, 0, 10, NULL, 1, 49, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (287, 7400000.0000, 10, 0, 7540000.0000, 0, 10, NULL, 1, 50, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (288, 52000.0000, 20, 0, 56000.0000, 0, 20, NULL, 1, 51, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (289, 43000.0000, 25, 0, 48000.0000, 0, 25, NULL, 1, 52, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (290, 48000.0000, 25, 0, 52000.0000, 0, 25, NULL, 1, 53, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (291, 19840.0000, 20, 0, 33000.0000, 0, 20, NULL, 1, 54, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (292, 29000.0000, 30, 0, 34000.0000, 0, 30, NULL, 1, 55, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (293, 31000.0000, 30, 0, 37000.0000, 0, 30, NULL, 1, 56, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (294, 38000.0000, 20, 0, 43000.0000, 0, 20, NULL, 1, 57, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (295, 53000.0000, 15, 0, 58000.0000, 0, 15, NULL, 1, 58, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (296, 48000.0000, 20, 0, 52000.0000, 0, 20, NULL, 1, 59, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (297, 37000.0000, 40, 0, 41000.0000, 0, 40, NULL, 1, 60, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (298, 23000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 61, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (299, 24000.0000, 60, 0, 29000.0000, 0, 60, NULL, 1, 62, 4)
GO
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (300, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 63, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (301, 24000.0000, 80, 0, 27500.0000, 0, 80, NULL, 1, 64, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (302, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 65, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (303, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 66, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (304, 24000.0000, 70, 0, 28000.0000, 0, 70, NULL, 1, 67, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (305, 24000.0000, 60, 0, 29000.0000, 0, 60, NULL, 1, 68, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (306, 24000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 69, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (307, 24000.0000, 40, 0, 27000.0000, 0, 40, NULL, 1, 70, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (308, 45000.0000, 50, 0, 50000.0000, 0, 50, NULL, 1, 71, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (309, 120000.0000, 40, 0, 133000.0000, 0, 40, NULL, 1, 72, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (310, 116000.0000, 50, 0, 124000.0000, 0, 50, NULL, 1, 73, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (311, 140000.0000, 40, 0, 155000.0000, 0, 40, NULL, 1, 74, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (312, 120000.0000, 50, 0, 133000.0000, 0, 50, NULL, 1, 75, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (313, 160000.0000, 80, 0, 175000.0000, 0, 80, NULL, 1, 76, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (314, 130000.0000, 50, 0, 153000.0000, 0, 50, NULL, 1, 77, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (315, 99000.0000, 60, 0, 109000.0000, 0, 60, NULL, 1, 78, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (316, 132000.0000, 40, 0, 148000.0000, 0, 40, NULL, 1, 79, 4)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (317, 20000.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 1, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (318, 20000.0000, 70, 0, 24000.0000, 0, 70, NULL, 1, 2, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (319, 21000.0000, 80, 0, 25000.0000, 0, 80, NULL, 1, 3, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (320, 24000.0000, 40, 0, 30000.0000, 0, 40, NULL, 1, 4, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (321, 22000.0000, 50, 0, 25000.0000, 0, 50, NULL, 1, 5, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (322, 22500.0000, 70, 0, 25500.0000, 0, 70, NULL, 1, 6, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (323, 19500.0000, 80, 0, 24000.0000, 0, 80, NULL, 1, 7, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (324, 22000.0000, 80, 0, 25000.0000, 0, 80, NULL, 1, 8, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (325, 17500.0000, 20, 0, 23000.0000, 0, 20, NULL, 1, 9, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (326, 20500.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 10, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (327, 5000.0000, 40, 0, 7000.0000, 0, 40, NULL, 1, 11, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (328, 7000.0000, 20, 0, 10000.0000, 0, 20, NULL, 1, 12, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (329, 500000.0000, 20, 0, 580000.0000, 0, 20, NULL, 1, 13, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (330, 4000.0000, 20, 0, 6500.0000, 0, 20, NULL, 1, 14, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (331, 200000.0000, 20, 0, 260000.0000, 0, 20, NULL, 1, 15, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (332, 1000.0000, 1000, 0, 2000.0000, 0, 1000, NULL, 1, 16, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (333, 50000.0000, 20, 0, 54000.0000, 0, 20, NULL, 1, 17, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (334, 4800000.0000, 20, 0, 5000000.0000, 0, 20, NULL, 1, 18, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (335, 50000.0000, 20, 0, 55000.0000, 0, 20, NULL, 1, 19, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (336, 6000000.0000, 20, 0, 6200000.0000, 0, 20, NULL, 1, 20, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (337, 250000.0000, 30, 0, 272000.0000, 0, 30, NULL, 1, 21, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (338, 140000.0000, 30, 0, 161000.0000, 0, 30, NULL, 1, 22, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (339, 1200000.0000, 15, 0, 1350000.0000, 0, 15, NULL, 1, 23, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (340, 145000.0000, 30, 0, 158000.0000, 0, 30, NULL, 1, 24, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (341, 67000.0000, 40, 0, 74000.0000, 0, 40, NULL, 1, 25, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (342, 750000.0000, 25, 0, 783000.0000, 0, 25, NULL, 1, 26, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (343, 120000.0000, 30, 0, 141000.0000, 0, 30, NULL, 1, 27, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (344, 600000.0000, 30, 0, 617000.0000, 0, 30, NULL, 1, 28, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (345, 130000.0000, 30, 0, 147000.0000, 0, 30, NULL, 1, 29, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (346, 100000.0000, 30, 0, 121000.0000, 0, 30, NULL, 1, 30, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (347, 3500000.0000, 30, 0, 3615000.0000, 0, 30, NULL, 1, 31, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (348, 80000.0000, 30, 0, 91000.0000, 0, 30, NULL, 1, 32, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (349, 450000.0000, 25, 0, 471000.0000, 0, 25, NULL, 1, 33, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (350, 100000.0000, 35, 0, 113000.0000, 0, 35, NULL, 1, 34, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (351, 250000.0000, 20, 0, 264000.0000, 0, 20, NULL, 1, 35, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (352, 30000.0000, 30, 0, 38000.0000, 0, 30, NULL, 1, 36, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (353, 40000.0000, 30, 0, 46000.0000, 0, 30, NULL, 1, 37, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (354, 99000.0000, 25, 0, 107000.0000, 0, 25, NULL, 1, 38, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (355, 950000.0000, 15, 0, 100000.0000, 0, 15, NULL, 1, 39, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (356, 54000.0000, 50, 0, 61500.0000, 0, 50, NULL, 1, 40, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (357, 29000.0000, 40, 0, 32000.0000, 0, 40, NULL, 1, 41, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (358, 43000.0000, 25, 0, 45000.0000, 0, 25, NULL, 1, 42, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (359, 59000.0000, 40, 0, 62000.0000, 0, 40, NULL, 1, 43, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (360, 4800000.0000, 10, 0, 4990000.0000, 0, 10, NULL, 1, 44, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (361, 174000.0000, 20, 0, 180000.0000, 0, 20, NULL, 1, 45, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (362, 620000.0000, 10, 0, 633000.0000, 0, 10, NULL, 1, 46, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (363, 130000.0000, 20, 0, 138000.0000, 0, 20, NULL, 1, 47, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (364, 99000.0000, 10, 0, 103000.0000, 0, 10, NULL, 1, 48, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (365, 33000.0000, 20, 0, 40000.0000, 0, 20, NULL, 1, 49, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (366, 7400000.0000, 20, 0, 7540000.0000, 0, 20, NULL, 1, 50, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (367, 52000.0000, 20, 0, 56000.0000, 0, 20, NULL, 1, 51, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (368, 43000.0000, 25, 0, 48000.0000, 0, 25, NULL, 1, 52, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (369, 48000.0000, 25, 0, 52000.0000, 0, 25, NULL, 1, 53, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (370, 19840.0000, 20, 0, 33000.0000, 0, 20, NULL, 1, 54, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (371, 29000.0000, 30, 0, 34000.0000, 0, 30, NULL, 1, 55, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (372, 31000.0000, 70, 0, 37000.0000, 0, 70, NULL, 1, 56, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (373, 38000.0000, 50, 0, 43000.0000, 0, 50, NULL, 1, 57, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (374, 53000.0000, 15, 0, 58000.0000, 0, 15, NULL, 1, 58, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (375, 48000.0000, 20, 0, 52000.0000, 0, 20, NULL, 1, 59, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (376, 37000.0000, 20, 0, 41000.0000, 0, 20, NULL, 1, 60, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (377, 23000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 61, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (378, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 62, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (379, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 63, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (380, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 64, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (381, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 65, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (382, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 66, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (383, 24000.0000, 40, 0, 28000.0000, 0, 40, NULL, 1, 67, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (384, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 68, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (385, 24000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 69, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (386, 24000.0000, 40, 0, 27000.0000, 0, 40, NULL, 1, 70, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (387, 45000.0000, 70, 0, 50000.0000, 0, 70, NULL, 1, 71, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (388, 120000.0000, 80, 0, 133000.0000, 0, 80, NULL, 1, 72, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (389, 116000.0000, 90, 0, 124000.0000, 0, 90, NULL, 1, 73, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (390, 140000.0000, 40, 0, 155000.0000, 0, 40, NULL, 1, 74, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (391, 120000.0000, 50, 0, 133000.0000, 0, 50, NULL, 1, 75, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (392, 160000.0000, 50, 0, 175000.0000, 0, 50, NULL, 1, 76, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (393, 130000.0000, 60, 0, 153000.0000, 0, 60, NULL, 1, 77, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (394, 99000.0000, 30, 0, 109000.0000, 0, 30, NULL, 1, 78, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (395, 132000.0000, 40, 0, 148000.0000, 0, 40, NULL, 1, 79, 5)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (396, 20000.0000, 80, 0, 24000.0000, 0, 80, NULL, 1, 1, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (397, 20000.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 2, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (398, 21000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 3, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (399, 24000.0000, 20, 0, 30000.0000, 0, 20, NULL, 1, 4, 6)
GO
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (400, 22000.0000, 40, 0, 25000.0000, 0, 40, NULL, 1, 5, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (401, 22500.0000, 20, 0, 25500.0000, 0, 20, NULL, 1, 6, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (402, 19500.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 7, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (403, 22000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 8, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (404, 17500.0000, 20, 0, 23000.0000, 0, 20, NULL, 1, 9, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (405, 20500.0000, 40, 0, 24000.0000, 0, 40, NULL, 1, 10, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (406, 5000.0000, 40, 0, 7000.0000, 0, 40, NULL, 1, 11, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (407, 7000.0000, 20, 0, 10000.0000, 0, 20, NULL, 1, 12, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (408, 500000.0000, 40, 0, 580000.0000, 0, 40, NULL, 1, 13, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (409, 4000.0000, 20, 0, 6500.0000, 0, 20, NULL, 1, 14, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (410, 200000.0000, 40, 0, 260000.0000, 0, 40, NULL, 1, 15, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (411, 1000.0000, 1000, 0, 2000.0000, 0, 1000, NULL, 1, 16, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (412, 50000.0000, 20, 0, 54000.0000, 0, 20, NULL, 1, 17, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (413, 4800000.0000, 20, 0, 5000000.0000, 0, 20, NULL, 1, 18, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (414, 50000.0000, 20, 0, 55000.0000, 0, 20, NULL, 1, 19, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (415, 6000000.0000, 20, 0, 6200000.0000, 0, 20, NULL, 1, 20, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (416, 250000.0000, 50, 0, 272000.0000, 0, 50, NULL, 1, 21, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (417, 140000.0000, 50, 0, 161000.0000, 0, 50, NULL, 1, 22, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (418, 1200000.0000, 15, 0, 1350000.0000, 0, 15, NULL, 1, 23, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (419, 145000.0000, 30, 0, 158000.0000, 0, 30, NULL, 1, 24, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (420, 67000.0000, 40, 0, 74000.0000, 0, 40, NULL, 1, 25, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (421, 750000.0000, 55, 0, 783000.0000, 0, 55, NULL, 1, 26, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (422, 120000.0000, 30, 0, 141000.0000, 0, 30, NULL, 1, 27, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (423, 600000.0000, 30, 0, 617000.0000, 0, 30, NULL, 1, 28, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (424, 130000.0000, 50, 0, 147000.0000, 0, 50, NULL, 1, 29, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (425, 100000.0000, 30, 0, 121000.0000, 0, 30, NULL, 1, 30, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (426, 3500000.0000, 30, 0, 3615000.0000, 0, 30, NULL, 1, 31, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (427, 80000.0000, 30, 0, 91000.0000, 0, 30, NULL, 1, 32, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (428, 450000.0000, 25, 0, 471000.0000, 0, 25, NULL, 1, 33, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (429, 100000.0000, 35, 0, 113000.0000, 0, 35, NULL, 1, 34, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (430, 250000.0000, 20, 0, 264000.0000, 0, 20, NULL, 1, 35, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (431, 30000.0000, 30, 0, 38000.0000, 0, 30, NULL, 1, 36, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (432, 40000.0000, 30, 0, 46000.0000, 0, 30, NULL, 1, 37, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (433, 99000.0000, 25, 0, 107000.0000, 0, 25, NULL, 1, 38, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (434, 950000.0000, 15, 0, 100000.0000, 0, 15, NULL, 1, 39, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (435, 54000.0000, 30, 0, 61500.0000, 0, 30, NULL, 1, 40, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (436, 29000.0000, 40, 0, 32000.0000, 0, 40, NULL, 1, 41, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (437, 43000.0000, 55, 0, 45000.0000, 0, 55, NULL, 1, 42, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (438, 59000.0000, 30, 0, 62000.0000, 0, 30, NULL, 1, 43, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (439, 4800000.0000, 10, 0, 4990000.0000, 0, 10, NULL, 1, 44, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (440, 174000.0000, 20, 0, 180000.0000, 0, 20, NULL, 1, 45, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (441, 620000.0000, 10, 0, 633000.0000, 0, 10, NULL, 1, 46, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (442, 130000.0000, 10, 0, 138000.0000, 0, 10, NULL, 1, 47, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (443, 99000.0000, 10, 0, 103000.0000, 0, 10, NULL, 1, 48, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (444, 33000.0000, 10, 0, 40000.0000, 0, 10, NULL, 1, 49, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (445, 7400000.0000, 10, 0, 7540000.0000, 0, 10, NULL, 1, 50, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (446, 52000.0000, 20, 0, 56000.0000, 0, 20, NULL, 1, 51, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (447, 43000.0000, 25, 0, 48000.0000, 0, 25, NULL, 1, 52, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (448, 48000.0000, 25, 0, 52000.0000, 0, 25, NULL, 1, 53, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (449, 19840.0000, 20, 0, 33000.0000, 0, 20, NULL, 1, 54, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (450, 29000.0000, 30, 0, 34000.0000, 0, 30, NULL, 1, 55, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (451, 31000.0000, 30, 0, 37000.0000, 0, 30, NULL, 1, 56, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (452, 38000.0000, 20, 0, 43000.0000, 0, 20, NULL, 1, 57, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (453, 53000.0000, 15, 0, 58000.0000, 0, 15, NULL, 1, 58, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (454, 48000.0000, 20, 0, 52000.0000, 0, 20, NULL, 1, 59, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (455, 37000.0000, 20, 0, 41000.0000, 0, 20, NULL, 1, 60, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (456, 23000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 61, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (457, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 62, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (458, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 63, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (459, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 64, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (460, 24000.0000, 50, 0, 27500.0000, 0, 50, NULL, 1, 65, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (461, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 66, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (462, 24000.0000, 50, 0, 28000.0000, 0, 50, NULL, 1, 67, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (463, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 68, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (464, 24000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 69, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (465, 24000.0000, 50, 0, 27000.0000, 0, 50, NULL, 1, 70, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (466, 45000.0000, 50, 0, 50000.0000, 0, 50, NULL, 1, 71, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (467, 120000.0000, 30, 0, 133000.0000, 0, 30, NULL, 1, 72, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (468, 116000.0000, 40, 0, 124000.0000, 0, 40, NULL, 1, 73, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (469, 140000.0000, 50, 0, 155000.0000, 0, 50, NULL, 1, 74, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (470, 120000.0000, 50, 0, 133000.0000, 0, 50, NULL, 1, 75, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (471, 160000.0000, 50, 0, 175000.0000, 0, 50, NULL, 1, 76, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (472, 130000.0000, 40, 0, 153000.0000, 0, 40, NULL, 1, 77, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (473, 99000.0000, 30, 0, 109000.0000, 0, 30, NULL, 1, 78, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (474, 132000.0000, 70, 0, 148000.0000, 0, 70, NULL, 1, 79, 6)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (475, 20000.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 1, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (476, 20000.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 2, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (477, 21000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 3, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (478, 24000.0000, 20, 0, 30000.0000, 0, 20, NULL, 1, 4, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (479, 22000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 5, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (480, 22500.0000, 20, 0, 25500.0000, 0, 20, NULL, 1, 6, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (481, 19500.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 7, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (482, 22000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 8, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (483, 17500.0000, 20, 0, 23000.0000, 0, 20, NULL, 1, 9, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (484, 20500.0000, 50, 0, 24000.0000, 0, 50, NULL, 1, 10, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (485, 5000.0000, 40, 0, 7000.0000, 0, 40, NULL, 1, 11, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (486, 7000.0000, 70, 0, 10000.0000, 0, 70, NULL, 1, 12, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (487, 500000.0000, 60, 0, 580000.0000, 0, 60, NULL, 1, 13, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (488, 4000.0000, 70, 0, 6500.0000, 0, 70, NULL, 1, 14, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (489, 200000.0000, 30, 0, 260000.0000, 0, 30, NULL, 1, 15, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (490, 1000.0000, 1000, 0, 2000.0000, 0, 1000, NULL, 1, 16, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (491, 50000.0000, 20, 0, 54000.0000, 0, 20, NULL, 1, 17, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (492, 4800000.0000, 20, 0, 5000000.0000, 0, 20, NULL, 1, 18, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (493, 50000.0000, 40, 0, 55000.0000, 0, 40, NULL, 1, 19, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (494, 6000000.0000, 20, 0, 6200000.0000, 0, 20, NULL, 1, 20, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (495, 250000.0000, 30, 0, 272000.0000, 0, 30, NULL, 1, 21, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (496, 140000.0000, 30, 0, 161000.0000, 0, 30, NULL, 1, 22, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (497, 1200000.0000, 15, 0, 1350000.0000, 0, 15, NULL, 1, 23, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (498, 145000.0000, 30, 0, 158000.0000, 0, 30, NULL, 1, 24, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (499, 67000.0000, 40, 0, 74000.0000, 0, 40, NULL, 1, 25, 7)
GO
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (500, 750000.0000, 25, 0, 783000.0000, 0, 25, NULL, 1, 26, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (501, 120000.0000, 30, 0, 141000.0000, 0, 30, NULL, 1, 27, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (502, 600000.0000, 30, 0, 617000.0000, 0, 30, NULL, 1, 28, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (503, 130000.0000, 30, 0, 147000.0000, 0, 30, NULL, 1, 29, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (504, 100000.0000, 30, 0, 121000.0000, 0, 30, NULL, 1, 30, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (505, 3500000.0000, 30, 0, 3615000.0000, 0, 30, NULL, 1, 31, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (506, 80000.0000, 30, 0, 91000.0000, 0, 30, NULL, 1, 32, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (507, 450000.0000, 25, 0, 471000.0000, 0, 25, NULL, 1, 33, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (508, 100000.0000, 35, 0, 113000.0000, 0, 35, NULL, 1, 34, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (509, 250000.0000, 20, 0, 264000.0000, 0, 20, NULL, 1, 35, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (510, 30000.0000, 30, 0, 38000.0000, 0, 30, NULL, 1, 36, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (511, 40000.0000, 50, 0, 46000.0000, 0, 50, NULL, 1, 37, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (512, 99000.0000, 25, 0, 107000.0000, 0, 25, NULL, 1, 38, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (513, 950000.0000, 15, 0, 100000.0000, 0, 15, NULL, 1, 39, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (514, 54000.0000, 30, 0, 61500.0000, 0, 30, NULL, 1, 40, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (515, 29000.0000, 40, 0, 32000.0000, 0, 40, NULL, 1, 41, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (516, 43000.0000, 25, 0, 45000.0000, 0, 25, NULL, 1, 42, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (517, 59000.0000, 60, 0, 62000.0000, 0, 60, NULL, 1, 43, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (518, 4800000.0000, 10, 0, 4990000.0000, 0, 10, NULL, 1, 44, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (519, 174000.0000, 20, 0, 180000.0000, 0, 20, NULL, 1, 45, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (520, 620000.0000, 10, 0, 633000.0000, 0, 10, NULL, 1, 46, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (521, 130000.0000, 30, 0, 138000.0000, 0, 30, NULL, 1, 47, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (522, 99000.0000, 10, 0, 103000.0000, 0, 10, NULL, 1, 48, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (523, 33000.0000, 10, 0, 40000.0000, 0, 10, NULL, 1, 49, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (524, 7400000.0000, 10, 0, 7540000.0000, 0, 10, NULL, 1, 50, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (525, 52000.0000, 20, 0, 56000.0000, 0, 20, NULL, 1, 51, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (526, 43000.0000, 25, 0, 48000.0000, 0, 25, NULL, 1, 52, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (527, 48000.0000, 25, 0, 52000.0000, 0, 25, NULL, 1, 53, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (528, 19840.0000, 20, 0, 33000.0000, 0, 20, NULL, 1, 54, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (529, 29000.0000, 30, 0, 34000.0000, 0, 30, NULL, 1, 55, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (530, 31000.0000, 30, 0, 37000.0000, 0, 30, NULL, 1, 56, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (531, 38000.0000, 20, 0, 43000.0000, 0, 20, NULL, 1, 57, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (532, 53000.0000, 55, 0, 58000.0000, 0, 55, NULL, 1, 58, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (533, 48000.0000, 20, 0, 52000.0000, 0, 20, NULL, 1, 59, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (534, 37000.0000, 20, 0, 41000.0000, 0, 20, NULL, 1, 60, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (535, 23000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 61, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (536, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 62, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (537, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 63, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (538, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 64, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (539, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 65, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (540, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 66, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (541, 24000.0000, 40, 0, 28000.0000, 0, 40, NULL, 1, 67, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (542, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 68, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (543, 24000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 69, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (544, 24000.0000, 60, 0, 27000.0000, 0, 60, NULL, 1, 70, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (545, 45000.0000, 50, 0, 50000.0000, 0, 50, NULL, 1, 71, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (546, 120000.0000, 30, 0, 133000.0000, 0, 30, NULL, 1, 72, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (547, 116000.0000, 40, 0, 124000.0000, 0, 40, NULL, 1, 73, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (548, 140000.0000, 40, 0, 155000.0000, 0, 40, NULL, 1, 74, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (549, 120000.0000, 50, 0, 133000.0000, 0, 50, NULL, 1, 75, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (550, 160000.0000, 50, 0, 175000.0000, 0, 50, NULL, 1, 76, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (551, 130000.0000, 40, 0, 153000.0000, 0, 40, NULL, 1, 77, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (552, 99000.0000, 30, 0, 109000.0000, 0, 30, NULL, 1, 78, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (553, 132000.0000, 40, 0, 148000.0000, 0, 40, NULL, 1, 79, 7)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (554, 20000.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 1, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (555, 20000.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 2, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (556, 21000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 3, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (557, 24000.0000, 60, 0, 30000.0000, 0, 60, NULL, 1, 4, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (558, 22000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 5, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (559, 22500.0000, 20, 0, 25500.0000, 0, 20, NULL, 1, 6, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (560, 19500.0000, 60, 0, 24000.0000, 0, 60, NULL, 1, 7, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (561, 22000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 8, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (562, 17500.0000, 20, 0, 23000.0000, 0, 20, NULL, 1, 9, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (563, 20500.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 10, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (564, 5000.0000, 40, 0, 7000.0000, 0, 40, NULL, 1, 11, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (565, 7000.0000, 20, 0, 10000.0000, 0, 20, NULL, 1, 12, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (566, 500000.0000, 20, 0, 580000.0000, 0, 20, NULL, 1, 13, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (567, 4000.0000, 20, 0, 6500.0000, 0, 20, NULL, 1, 14, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (568, 200000.0000, 20, 0, 260000.0000, 0, 20, NULL, 1, 15, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (569, 1000.0000, 1000, 0, 2000.0000, 0, 1000, NULL, 1, 16, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (570, 50000.0000, 20, 0, 54000.0000, 0, 20, NULL, 1, 17, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (571, 4800000.0000, 20, 0, 5000000.0000, 0, 20, NULL, 1, 18, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (572, 50000.0000, 20, 0, 55000.0000, 0, 20, NULL, 1, 19, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (573, 6000000.0000, 20, 0, 6200000.0000, 0, 20, NULL, 1, 20, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (574, 250000.0000, 30, 0, 272000.0000, 0, 30, NULL, 1, 21, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (575, 140000.0000, 60, 0, 161000.0000, 0, 60, NULL, 1, 22, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (576, 1200000.0000, 15, 0, 1350000.0000, 0, 15, NULL, 1, 23, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (577, 145000.0000, 30, 0, 158000.0000, 0, 30, NULL, 1, 24, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (578, 67000.0000, 40, 0, 74000.0000, 0, 40, NULL, 1, 25, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (579, 750000.0000, 25, 0, 783000.0000, 0, 25, NULL, 1, 26, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (580, 120000.0000, 60, 0, 141000.0000, 0, 60, NULL, 1, 27, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (581, 600000.0000, 30, 0, 617000.0000, 0, 30, NULL, 1, 28, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (582, 130000.0000, 30, 0, 147000.0000, 0, 30, NULL, 1, 29, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (583, 100000.0000, 30, 0, 121000.0000, 0, 30, NULL, 1, 30, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (584, 3500000.0000, 60, 0, 3615000.0000, 0, 60, NULL, 1, 31, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (585, 80000.0000, 30, 0, 91000.0000, 0, 30, NULL, 1, 32, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (586, 450000.0000, 25, 0, 471000.0000, 0, 25, NULL, 1, 33, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (587, 100000.0000, 35, 0, 113000.0000, 0, 35, NULL, 1, 34, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (588, 250000.0000, 20, 0, 264000.0000, 0, 20, NULL, 1, 35, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (589, 30000.0000, 30, 0, 38000.0000, 0, 30, NULL, 1, 36, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (590, 40000.0000, 30, 0, 46000.0000, 0, 30, NULL, 1, 37, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (591, 99000.0000, 25, 0, 107000.0000, 0, 25, NULL, 1, 38, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (592, 950000.0000, 15, 0, 100000.0000, 0, 15, NULL, 1, 39, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (593, 54000.0000, 30, 0, 61500.0000, 0, 30, NULL, 1, 40, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (594, 29000.0000, 60, 0, 32000.0000, 0, 60, NULL, 1, 41, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (595, 43000.0000, 25, 0, 45000.0000, 0, 25, NULL, 1, 42, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (596, 59000.0000, 30, 0, 62000.0000, 0, 30, NULL, 1, 43, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (597, 4800000.0000, 10, 0, 4990000.0000, 0, 10, NULL, 1, 44, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (598, 174000.0000, 20, 0, 180000.0000, 0, 20, NULL, 1, 45, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (599, 620000.0000, 10, 0, 633000.0000, 0, 10, NULL, 1, 46, 8)
GO
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (600, 130000.0000, 10, 0, 138000.0000, 0, 10, NULL, 1, 47, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (601, 99000.0000, 10, 0, 103000.0000, 0, 10, NULL, 1, 48, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (602, 33000.0000, 10, 0, 40000.0000, 0, 10, NULL, 1, 49, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (603, 7400000.0000, 10, 0, 7540000.0000, 0, 10, NULL, 1, 50, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (604, 52000.0000, 60, 0, 56000.0000, 0, 60, NULL, 1, 51, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (605, 43000.0000, 25, 0, 48000.0000, 0, 25, NULL, 1, 52, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (606, 48000.0000, 25, 0, 52000.0000, 0, 25, NULL, 1, 53, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (607, 19840.0000, 20, 0, 33000.0000, 0, 20, NULL, 1, 54, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (608, 29000.0000, 30, 0, 34000.0000, 0, 30, NULL, 1, 55, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (609, 31000.0000, 30, 0, 37000.0000, 0, 30, NULL, 1, 56, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (610, 38000.0000, 20, 0, 43000.0000, 0, 20, NULL, 1, 57, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (611, 53000.0000, 15, 0, 58000.0000, 0, 15, NULL, 1, 58, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (612, 48000.0000, 20, 0, 52000.0000, 0, 20, NULL, 1, 59, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (613, 37000.0000, 20, 0, 41000.0000, 0, 20, NULL, 1, 60, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (614, 23000.0000, 60, 0, 28500.0000, 0, 60, NULL, 1, 61, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (615, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 62, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (616, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 63, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (617, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 64, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (618, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 65, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (619, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 66, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (620, 24000.0000, 40, 0, 28000.0000, 0, 40, NULL, 1, 67, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (621, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 68, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (622, 24000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 69, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (623, 24000.0000, 40, 0, 27000.0000, 0, 40, NULL, 1, 70, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (624, 45000.0000, 60, 0, 50000.0000, 0, 60, NULL, 1, 71, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (625, 120000.0000, 30, 0, 133000.0000, 0, 30, NULL, 1, 72, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (626, 116000.0000, 40, 0, 124000.0000, 0, 40, NULL, 1, 73, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (627, 140000.0000, 40, 0, 155000.0000, 0, 40, NULL, 1, 74, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (628, 120000.0000, 50, 0, 133000.0000, 0, 50, NULL, 1, 75, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (629, 160000.0000, 50, 0, 175000.0000, 0, 50, NULL, 1, 76, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (630, 130000.0000, 40, 0, 153000.0000, 0, 40, NULL, 1, 77, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (631, 99000.0000, 30, 0, 109000.0000, 0, 30, NULL, 1, 78, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (632, 132000.0000, 40, 0, 148000.0000, 0, 40, NULL, 1, 79, 8)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (633, 20000.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 1, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (634, 20000.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 2, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (635, 21000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 3, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (636, 24000.0000, 20, 0, 30000.0000, 0, 20, NULL, 1, 4, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (637, 22000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 5, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (638, 22500.0000, 20, 0, 25500.0000, 0, 20, NULL, 1, 6, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (639, 19500.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 7, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (640, 22000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 8, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (641, 17500.0000, 70, 0, 23000.0000, 0, 70, NULL, 1, 9, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (642, 20500.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 10, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (643, 5000.0000, 40, 0, 7000.0000, 0, 40, NULL, 1, 11, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (644, 7000.0000, 20, 0, 10000.0000, 0, 20, NULL, 1, 12, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (645, 500000.0000, 20, 0, 580000.0000, 0, 20, NULL, 1, 13, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (646, 4000.0000, 20, 0, 6500.0000, 0, 20, NULL, 1, 14, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (647, 200000.0000, 20, 0, 260000.0000, 0, 20, NULL, 1, 15, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (648, 1000.0000, 1000, 0, 2000.0000, 0, 1000, NULL, 1, 16, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (649, 50000.0000, 20, 0, 54000.0000, 0, 20, NULL, 1, 17, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (650, 4800000.0000, 20, 0, 5000000.0000, 0, 20, NULL, 1, 18, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (651, 50000.0000, 20, 0, 55000.0000, 0, 20, NULL, 1, 19, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (652, 6000000.0000, 20, 0, 6200000.0000, 0, 20, NULL, 1, 20, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (653, 250000.0000, 30, 0, 272000.0000, 0, 30, NULL, 1, 21, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (654, 140000.0000, 30, 0, 161000.0000, 0, 30, NULL, 1, 22, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (655, 1200000.0000, 15, 0, 1350000.0000, 0, 15, NULL, 1, 23, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (656, 145000.0000, 30, 0, 158000.0000, 0, 30, NULL, 1, 24, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (657, 67000.0000, 40, 0, 74000.0000, 0, 40, NULL, 1, 25, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (658, 750000.0000, 25, 0, 783000.0000, 0, 25, NULL, 1, 26, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (659, 120000.0000, 30, 0, 141000.0000, 0, 30, NULL, 1, 27, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (660, 600000.0000, 30, 0, 617000.0000, 0, 30, NULL, 1, 28, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (661, 130000.0000, 30, 0, 147000.0000, 0, 30, NULL, 1, 29, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (662, 100000.0000, 70, 0, 121000.0000, 0, 70, NULL, 1, 30, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (663, 3500000.0000, 30, 0, 3615000.0000, 0, 30, NULL, 1, 31, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (664, 80000.0000, 30, 0, 91000.0000, 0, 30, NULL, 1, 32, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (665, 450000.0000, 25, 0, 471000.0000, 0, 25, NULL, 1, 33, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (666, 100000.0000, 35, 0, 113000.0000, 0, 35, NULL, 1, 34, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (667, 250000.0000, 20, 0, 264000.0000, 0, 20, NULL, 1, 35, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (668, 30000.0000, 30, 0, 38000.0000, 0, 30, NULL, 1, 36, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (669, 40000.0000, 30, 0, 46000.0000, 0, 30, NULL, 1, 37, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (670, 99000.0000, 25, 0, 107000.0000, 0, 25, NULL, 1, 38, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (671, 950000.0000, 65, 0, 100000.0000, 0, 65, NULL, 1, 39, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (672, 54000.0000, 30, 0, 61500.0000, 0, 30, NULL, 1, 40, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (673, 29000.0000, 60, 0, 32000.0000, 0, 60, NULL, 1, 41, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (674, 43000.0000, 25, 0, 45000.0000, 0, 25, NULL, 1, 42, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (675, 59000.0000, 30, 0, 62000.0000, 0, 30, NULL, 1, 43, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (676, 4800000.0000, 10, 0, 4990000.0000, 0, 10, NULL, 1, 44, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (677, 174000.0000, 20, 0, 180000.0000, 0, 20, NULL, 1, 45, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (678, 620000.0000, 10, 0, 633000.0000, 0, 10, NULL, 1, 46, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (679, 130000.0000, 60, 0, 138000.0000, 0, 60, NULL, 1, 47, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (680, 99000.0000, 10, 0, 103000.0000, 0, 10, NULL, 1, 48, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (681, 33000.0000, 10, 0, 40000.0000, 0, 10, NULL, 1, 49, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (682, 7400000.0000, 10, 0, 7540000.0000, 0, 10, NULL, 1, 50, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (683, 52000.0000, 20, 0, 56000.0000, 0, 20, NULL, 1, 51, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (684, 43000.0000, 25, 0, 48000.0000, 0, 25, NULL, 1, 52, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (685, 48000.0000, 25, 0, 52000.0000, 0, 25, NULL, 1, 53, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (686, 19840.0000, 20, 0, 33000.0000, 0, 20, NULL, 1, 54, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (687, 29000.0000, 30, 0, 34000.0000, 0, 30, NULL, 1, 55, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (688, 31000.0000, 30, 0, 37000.0000, 0, 30, NULL, 1, 56, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (689, 38000.0000, 60, 0, 43000.0000, 0, 60, NULL, 1, 57, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (690, 53000.0000, 15, 0, 58000.0000, 0, 15, NULL, 1, 58, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (691, 48000.0000, 20, 0, 52000.0000, 0, 20, NULL, 1, 59, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (692, 37000.0000, 20, 0, 41000.0000, 0, 20, NULL, 1, 60, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (693, 23000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 61, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (694, 24000.0000, 60, 0, 29000.0000, 0, 60, NULL, 1, 62, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (695, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 63, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (696, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 64, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (697, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 65, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (698, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 66, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (699, 24000.0000, 40, 0, 28000.0000, 0, 40, NULL, 1, 67, 9)
GO
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (700, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 68, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (701, 24000.0000, 60, 0, 28500.0000, 0, 60, NULL, 1, 69, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (702, 24000.0000, 60, 0, 27000.0000, 0, 60, NULL, 1, 70, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (703, 45000.0000, 50, 0, 50000.0000, 0, 50, NULL, 1, 71, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (704, 120000.0000, 30, 0, 133000.0000, 0, 30, NULL, 1, 72, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (705, 116000.0000, 40, 0, 124000.0000, 0, 40, NULL, 1, 73, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (706, 140000.0000, 40, 0, 155000.0000, 0, 40, NULL, 1, 74, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (707, 120000.0000, 50, 0, 133000.0000, 0, 50, NULL, 1, 75, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (708, 160000.0000, 50, 0, 175000.0000, 0, 50, NULL, 1, 76, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (709, 130000.0000, 40, 0, 153000.0000, 0, 40, NULL, 1, 77, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (710, 99000.0000, 60, 0, 109000.0000, 0, 60, NULL, 1, 78, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (711, 132000.0000, 40, 0, 148000.0000, 0, 40, NULL, 1, 79, 9)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (712, 20000.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 1, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (713, 20000.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 2, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (714, 21000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 3, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (715, 24000.0000, 20, 0, 30000.0000, 0, 20, NULL, 1, 4, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (716, 22000.0000, 50, 0, 25000.0000, 0, 50, NULL, 1, 5, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (717, 22500.0000, 50, 0, 25500.0000, 0, 50, NULL, 1, 6, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (718, 19500.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 7, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (719, 22000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 8, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (720, 17500.0000, 20, 0, 23000.0000, 0, 20, NULL, 1, 9, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (721, 20500.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 10, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (722, 5000.0000, 40, 0, 7000.0000, 0, 40, NULL, 1, 11, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (723, 7000.0000, 20, 0, 10000.0000, 0, 20, NULL, 1, 12, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (724, 500000.0000, 20, 0, 580000.0000, 0, 20, NULL, 1, 13, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (725, 4000.0000, 50, 0, 6500.0000, 0, 50, NULL, 1, 14, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (726, 200000.0000, 20, 0, 260000.0000, 0, 20, NULL, 1, 15, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (727, 1000.0000, 1000, 0, 2000.0000, 0, 1000, NULL, 1, 16, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (728, 50000.0000, 50, 0, 54000.0000, 0, 50, NULL, 1, 17, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (729, 4800000.0000, 20, 0, 5000000.0000, 0, 20, NULL, 1, 18, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (730, 50000.0000, 20, 0, 55000.0000, 0, 20, NULL, 1, 19, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (731, 6000000.0000, 20, 0, 6200000.0000, 0, 20, NULL, 1, 20, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (732, 250000.0000, 30, 0, 272000.0000, 0, 30, NULL, 1, 21, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (733, 140000.0000, 50, 0, 161000.0000, 0, 50, NULL, 1, 22, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (734, 1200000.0000, 15, 0, 1350000.0000, 0, 15, NULL, 1, 23, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (735, 145000.0000, 30, 0, 158000.0000, 0, 30, NULL, 1, 24, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (736, 67000.0000, 40, 0, 74000.0000, 0, 40, NULL, 1, 25, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (737, 750000.0000, 25, 0, 783000.0000, 0, 25, NULL, 1, 26, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (738, 120000.0000, 50, 0, 141000.0000, 0, 50, NULL, 1, 27, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (739, 600000.0000, 30, 0, 617000.0000, 0, 30, NULL, 1, 28, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (740, 130000.0000, 30, 0, 147000.0000, 0, 30, NULL, 1, 29, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (741, 100000.0000, 50, 0, 121000.0000, 0, 50, NULL, 1, 30, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (742, 3500000.0000, 30, 0, 3615000.0000, 0, 30, NULL, 1, 31, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (743, 80000.0000, 30, 0, 91000.0000, 0, 30, NULL, 1, 32, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (744, 450000.0000, 25, 0, 471000.0000, 0, 25, NULL, 1, 33, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (745, 100000.0000, 35, 0, 113000.0000, 0, 35, NULL, 1, 34, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (746, 250000.0000, 20, 0, 264000.0000, 0, 20, NULL, 1, 35, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (747, 30000.0000, 30, 0, 38000.0000, 0, 30, NULL, 1, 36, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (748, 40000.0000, 30, 0, 46000.0000, 0, 30, NULL, 1, 37, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (749, 99000.0000, 55, 0, 107000.0000, 0, 55, NULL, 1, 38, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (750, 950000.0000, 15, 0, 100000.0000, 0, 15, NULL, 1, 39, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (751, 54000.0000, 30, 0, 61500.0000, 0, 30, NULL, 1, 40, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (752, 29000.0000, 40, 0, 32000.0000, 0, 40, NULL, 1, 41, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (753, 43000.0000, 55, 0, 45000.0000, 0, 55, NULL, 1, 42, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (754, 59000.0000, 30, 0, 62000.0000, 0, 30, NULL, 1, 43, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (755, 4800000.0000, 10, 0, 4990000.0000, 0, 10, NULL, 1, 44, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (756, 174000.0000, 20, 0, 180000.0000, 0, 20, NULL, 1, 45, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (757, 620000.0000, 50, 0, 633000.0000, 0, 50, NULL, 1, 46, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (758, 130000.0000, 10, 0, 138000.0000, 0, 10, NULL, 1, 47, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (759, 99000.0000, 10, 0, 103000.0000, 0, 10, NULL, 1, 48, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (760, 33000.0000, 50, 0, 40000.0000, 0, 50, NULL, 1, 49, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (761, 7400000.0000, 50, 0, 7540000.0000, 0, 50, NULL, 1, 50, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (762, 52000.0000, 20, 0, 56000.0000, 0, 20, NULL, 1, 51, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (763, 43000.0000, 25, 0, 48000.0000, 0, 25, NULL, 1, 52, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (764, 48000.0000, 25, 0, 52000.0000, 0, 25, NULL, 1, 53, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (765, 19840.0000, 20, 0, 33000.0000, 0, 20, NULL, 1, 54, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (766, 29000.0000, 30, 0, 34000.0000, 0, 30, NULL, 1, 55, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (767, 31000.0000, 30, 0, 37000.0000, 0, 30, NULL, 1, 56, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (768, 38000.0000, 20, 0, 43000.0000, 0, 20, NULL, 1, 57, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (769, 53000.0000, 15, 0, 58000.0000, 0, 15, NULL, 1, 58, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (770, 48000.0000, 20, 0, 52000.0000, 0, 20, NULL, 1, 59, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (771, 37000.0000, 20, 0, 41000.0000, 0, 20, NULL, 1, 60, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (772, 23000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 61, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (773, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 62, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (774, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 63, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (775, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 64, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (776, 24000.0000, 50, 0, 27500.0000, 0, 50, NULL, 1, 65, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (777, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 66, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (778, 24000.0000, 40, 0, 28000.0000, 0, 40, NULL, 1, 67, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (779, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 68, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (780, 24000.0000, 50, 0, 28500.0000, 0, 50, NULL, 1, 69, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (781, 24000.0000, 40, 0, 27000.0000, 0, 40, NULL, 1, 70, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (782, 45000.0000, 50, 0, 50000.0000, 0, 50, NULL, 1, 71, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (783, 120000.0000, 30, 0, 133000.0000, 0, 30, NULL, 1, 72, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (784, 116000.0000, 40, 0, 124000.0000, 0, 40, NULL, 1, 73, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (785, 140000.0000, 40, 0, 155000.0000, 0, 40, NULL, 1, 74, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (786, 120000.0000, 50, 0, 133000.0000, 0, 50, NULL, 1, 75, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (787, 160000.0000, 50, 0, 175000.0000, 0, 50, NULL, 1, 76, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (788, 130000.0000, 40, 0, 153000.0000, 0, 40, NULL, 1, 77, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (789, 99000.0000, 30, 0, 109000.0000, 0, 30, NULL, 1, 78, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (790, 132000.0000, 40, 0, 148000.0000, 0, 40, NULL, 1, 79, 10)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (791, 20000.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 1, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (792, 20000.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 2, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (793, 21000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 3, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (794, 24000.0000, 20, 0, 30000.0000, 0, 20, NULL, 1, 4, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (795, 22000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 5, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (796, 22500.0000, 20, 0, 25500.0000, 0, 20, NULL, 1, 6, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (797, 19500.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 7, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (798, 22000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 8, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (799, 17500.0000, 70, 0, 23000.0000, 0, 70, NULL, 1, 9, 11)
GO
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (800, 20500.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 10, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (801, 5000.0000, 40, 0, 7000.0000, 0, 40, NULL, 1, 11, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (802, 7000.0000, 20, 0, 10000.0000, 0, 20, NULL, 1, 12, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (803, 500000.0000, 20, 0, 580000.0000, 0, 20, NULL, 1, 13, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (804, 4000.0000, 20, 0, 6500.0000, 0, 20, NULL, 1, 14, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (805, 200000.0000, 20, 0, 260000.0000, 0, 20, NULL, 1, 15, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (806, 1000.0000, 1000, 0, 2000.0000, 0, 1000, NULL, 1, 16, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (807, 50000.0000, 70, 0, 54000.0000, 0, 70, NULL, 1, 17, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (808, 4800000.0000, 70, 0, 5000000.0000, 0, 70, NULL, 1, 18, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (809, 50000.0000, 20, 0, 55000.0000, 0, 20, NULL, 1, 19, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (810, 6000000.0000, 20, 0, 6200000.0000, 0, 20, NULL, 1, 20, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (811, 250000.0000, 30, 0, 272000.0000, 0, 30, NULL, 1, 21, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (812, 140000.0000, 30, 0, 161000.0000, 0, 30, NULL, 1, 22, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (813, 1200000.0000, 15, 0, 1350000.0000, 0, 15, NULL, 1, 23, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (814, 145000.0000, 30, 0, 158000.0000, 0, 30, NULL, 1, 24, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (815, 67000.0000, 40, 0, 74000.0000, 0, 40, NULL, 1, 25, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (816, 750000.0000, 25, 0, 783000.0000, 0, 25, NULL, 1, 26, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (817, 120000.0000, 30, 0, 141000.0000, 0, 30, NULL, 1, 27, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (818, 600000.0000, 30, 0, 617000.0000, 0, 30, NULL, 1, 28, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (819, 130000.0000, 30, 0, 147000.0000, 0, 30, NULL, 1, 29, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (820, 100000.0000, 30, 0, 121000.0000, 0, 30, NULL, 1, 30, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (821, 3500000.0000, 30, 0, 3615000.0000, 0, 30, NULL, 1, 31, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (822, 80000.0000, 30, 0, 91000.0000, 0, 30, NULL, 1, 32, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (823, 450000.0000, 25, 0, 471000.0000, 0, 25, NULL, 1, 33, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (824, 100000.0000, 35, 0, 113000.0000, 0, 35, NULL, 1, 34, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (825, 250000.0000, 20, 0, 264000.0000, 0, 20, NULL, 1, 35, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (826, 30000.0000, 30, 0, 38000.0000, 0, 30, NULL, 1, 36, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (827, 40000.0000, 30, 0, 46000.0000, 0, 30, NULL, 1, 37, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (828, 99000.0000, 25, 0, 107000.0000, 0, 25, NULL, 1, 38, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (829, 950000.0000, 15, 0, 100000.0000, 0, 15, NULL, 1, 39, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (830, 54000.0000, 30, 0, 61500.0000, 0, 30, NULL, 1, 40, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (831, 29000.0000, 40, 0, 32000.0000, 0, 40, NULL, 1, 41, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (832, 43000.0000, 25, 0, 45000.0000, 0, 25, NULL, 1, 42, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (833, 59000.0000, 30, 0, 62000.0000, 0, 30, NULL, 1, 43, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (834, 4800000.0000, 10, 0, 4990000.0000, 0, 10, NULL, 1, 44, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (835, 174000.0000, 20, 0, 180000.0000, 0, 20, NULL, 1, 45, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (836, 620000.0000, 10, 0, 633000.0000, 0, 10, NULL, 1, 46, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (837, 130000.0000, 10, 0, 138000.0000, 0, 10, NULL, 1, 47, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (838, 99000.0000, 10, 0, 103000.0000, 0, 10, NULL, 1, 48, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (839, 33000.0000, 70, 0, 40000.0000, 0, 70, NULL, 1, 49, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (840, 7400000.0000, 10, 0, 7540000.0000, 0, 10, NULL, 1, 50, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (841, 52000.0000, 20, 0, 56000.0000, 0, 20, NULL, 1, 51, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (842, 43000.0000, 25, 0, 48000.0000, 0, 25, NULL, 1, 52, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (843, 48000.0000, 25, 0, 52000.0000, 0, 25, NULL, 1, 53, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (844, 19840.0000, 70, 0, 33000.0000, 0, 70, NULL, 1, 54, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (845, 29000.0000, 30, 0, 34000.0000, 0, 30, NULL, 1, 55, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (846, 31000.0000, 30, 0, 37000.0000, 0, 30, NULL, 1, 56, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (847, 38000.0000, 20, 0, 43000.0000, 0, 20, NULL, 1, 57, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (848, 53000.0000, 15, 0, 58000.0000, 0, 15, NULL, 1, 58, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (849, 48000.0000, 20, 0, 52000.0000, 0, 20, NULL, 1, 59, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (850, 37000.0000, 20, 0, 41000.0000, 0, 20, NULL, 1, 60, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (851, 23000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 61, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (852, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 62, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (853, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 63, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (854, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 64, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (855, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 65, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (856, 24000.0000, 70, 0, 27500.0000, 0, 70, NULL, 1, 66, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (857, 24000.0000, 40, 0, 28000.0000, 0, 40, NULL, 1, 67, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (858, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 68, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (859, 24000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 69, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (860, 24000.0000, 70, 0, 27000.0000, 0, 70, NULL, 1, 70, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (861, 45000.0000, 50, 0, 50000.0000, 0, 50, NULL, 1, 71, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (862, 120000.0000, 30, 0, 133000.0000, 0, 30, NULL, 1, 72, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (863, 116000.0000, 40, 0, 124000.0000, 0, 40, NULL, 1, 73, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (864, 140000.0000, 40, 0, 155000.0000, 0, 40, NULL, 1, 74, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (865, 120000.0000, 50, 0, 133000.0000, 0, 50, NULL, 1, 75, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (866, 160000.0000, 50, 0, 175000.0000, 0, 50, NULL, 1, 76, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (867, 130000.0000, 40, 0, 153000.0000, 0, 40, NULL, 1, 77, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (868, 99000.0000, 30, 0, 109000.0000, 0, 30, NULL, 1, 78, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (869, 132000.0000, 70, 0, 148000.0000, 0, 70, NULL, 1, 79, 11)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (870, 20000.0000, 70, 0, 24000.0000, 0, 70, NULL, 1, 1, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (871, 20000.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 2, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (872, 21000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 3, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (873, 24000.0000, 20, 0, 30000.0000, 0, 20, NULL, 1, 4, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (874, 22000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 5, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (875, 22500.0000, 20, 0, 25500.0000, 0, 20, NULL, 1, 6, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (876, 19500.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 7, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (877, 22000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 8, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (878, 17500.0000, 20, 0, 23000.0000, 0, 20, NULL, 1, 9, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (879, 20500.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 10, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (880, 5000.0000, 40, 0, 7000.0000, 0, 40, NULL, 1, 11, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (881, 7000.0000, 20, 0, 10000.0000, 0, 20, NULL, 1, 12, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (882, 500000.0000, 20, 0, 580000.0000, 0, 20, NULL, 1, 13, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (883, 4000.0000, 20, 0, 6500.0000, 0, 20, NULL, 1, 14, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (884, 200000.0000, 20, 0, 260000.0000, 0, 20, NULL, 1, 15, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (885, 1000.0000, 1000, 0, 2000.0000, 0, 1000, NULL, 1, 16, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (886, 50000.0000, 20, 0, 54000.0000, 0, 20, NULL, 1, 17, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (887, 4800000.0000, 60, 0, 5000000.0000, 0, 60, NULL, 1, 18, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (888, 50000.0000, 20, 0, 55000.0000, 0, 20, NULL, 1, 19, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (889, 6000000.0000, 20, 0, 6200000.0000, 0, 20, NULL, 1, 20, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (890, 250000.0000, 30, 0, 272000.0000, 0, 30, NULL, 1, 21, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (891, 140000.0000, 30, 0, 161000.0000, 0, 30, NULL, 1, 22, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (892, 1200000.0000, 15, 0, 1350000.0000, 0, 15, NULL, 1, 23, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (893, 145000.0000, 30, 0, 158000.0000, 0, 30, NULL, 1, 24, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (894, 67000.0000, 40, 0, 74000.0000, 0, 40, NULL, 1, 25, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (895, 750000.0000, 25, 0, 783000.0000, 0, 25, NULL, 1, 26, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (896, 120000.0000, 30, 0, 141000.0000, 0, 30, NULL, 1, 27, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (897, 600000.0000, 30, 0, 617000.0000, 0, 30, NULL, 1, 28, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (898, 130000.0000, 30, 0, 147000.0000, 0, 30, NULL, 1, 29, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (899, 100000.0000, 60, 0, 121000.0000, 0, 60, NULL, 1, 30, 12)
GO
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (900, 3500000.0000, 30, 0, 3615000.0000, 0, 30, NULL, 1, 31, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (901, 80000.0000, 30, 0, 91000.0000, 0, 30, NULL, 1, 32, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (902, 450000.0000, 25, 0, 471000.0000, 0, 25, NULL, 1, 33, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (903, 100000.0000, 35, 0, 113000.0000, 0, 35, NULL, 1, 34, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (904, 250000.0000, 60, 0, 264000.0000, 0, 60, NULL, 1, 35, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (905, 30000.0000, 30, 0, 38000.0000, 0, 30, NULL, 1, 36, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (906, 40000.0000, 60, 0, 46000.0000, 0, 60, NULL, 1, 37, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (907, 99000.0000, 25, 0, 107000.0000, 0, 25, NULL, 1, 38, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (908, 950000.0000, 15, 0, 100000.0000, 0, 15, NULL, 1, 39, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (909, 54000.0000, 30, 0, 61500.0000, 0, 30, NULL, 1, 40, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (910, 29000.0000, 40, 0, 32000.0000, 0, 40, NULL, 1, 41, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (911, 43000.0000, 25, 0, 45000.0000, 0, 25, NULL, 1, 42, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (912, 59000.0000, 30, 0, 62000.0000, 0, 30, NULL, 1, 43, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (913, 4800000.0000, 10, 0, 4990000.0000, 0, 10, NULL, 1, 44, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (914, 174000.0000, 60, 0, 180000.0000, 0, 60, NULL, 1, 45, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (915, 620000.0000, 10, 0, 633000.0000, 0, 10, NULL, 1, 46, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (916, 130000.0000, 10, 0, 138000.0000, 0, 10, NULL, 1, 47, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (917, 99000.0000, 10, 0, 103000.0000, 0, 10, NULL, 1, 48, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (918, 33000.0000, 10, 0, 40000.0000, 0, 10, NULL, 1, 49, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (919, 7400000.0000, 10, 0, 7540000.0000, 0, 10, NULL, 1, 50, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (920, 52000.0000, 20, 0, 56000.0000, 0, 20, NULL, 1, 51, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (921, 43000.0000, 25, 0, 48000.0000, 0, 25, NULL, 1, 52, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (922, 48000.0000, 25, 0, 52000.0000, 0, 25, NULL, 1, 53, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (923, 19840.0000, 20, 0, 33000.0000, 0, 20, NULL, 1, 54, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (924, 29000.0000, 60, 0, 34000.0000, 0, 60, NULL, 1, 55, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (925, 31000.0000, 30, 0, 37000.0000, 0, 30, NULL, 1, 56, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (926, 38000.0000, 20, 0, 43000.0000, 0, 20, NULL, 1, 57, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (927, 53000.0000, 15, 0, 58000.0000, 0, 15, NULL, 1, 58, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (928, 48000.0000, 20, 0, 52000.0000, 0, 20, NULL, 1, 59, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (929, 37000.0000, 20, 0, 41000.0000, 0, 20, NULL, 1, 60, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (930, 23000.0000, 60, 0, 28500.0000, 0, 60, NULL, 1, 61, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (931, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 62, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (932, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 63, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (933, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 64, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (934, 24000.0000, 60, 0, 27500.0000, 0, 60, NULL, 1, 65, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (935, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 66, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (936, 24000.0000, 60, 0, 28000.0000, 0, 60, NULL, 1, 67, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (937, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 68, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (938, 24000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 69, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (939, 24000.0000, 40, 0, 27000.0000, 0, 40, NULL, 1, 70, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (940, 45000.0000, 50, 0, 50000.0000, 0, 50, NULL, 1, 71, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (941, 120000.0000, 30, 0, 133000.0000, 0, 30, NULL, 1, 72, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (942, 116000.0000, 40, 0, 124000.0000, 0, 40, NULL, 1, 73, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (943, 140000.0000, 40, 0, 155000.0000, 0, 40, NULL, 1, 74, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (944, 120000.0000, 50, 0, 133000.0000, 0, 50, NULL, 1, 75, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (945, 160000.0000, 60, 0, 175000.0000, 0, 60, NULL, 1, 76, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (946, 130000.0000, 40, 0, 153000.0000, 0, 40, NULL, 1, 77, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (947, 99000.0000, 30, 0, 109000.0000, 0, 30, NULL, 1, 78, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (948, 132000.0000, 40, 0, 148000.0000, 0, 40, NULL, 1, 79, 12)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (949, 20000.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 1, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (950, 20000.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 2, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (951, 21000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 3, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (952, 24000.0000, 20, 0, 30000.0000, 0, 20, NULL, 1, 4, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (953, 22000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 5, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (954, 22500.0000, 20, 0, 25500.0000, 0, 20, NULL, 1, 6, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (955, 19500.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 7, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (956, 22000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 8, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (957, 17500.0000, 50, 0, 23000.0000, 0, 50, NULL, 1, 9, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (958, 20500.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 10, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (959, 5000.0000, 40, 0, 7000.0000, 0, 40, NULL, 1, 11, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (960, 7000.0000, 20, 0, 10000.0000, 0, 20, NULL, 1, 12, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (961, 500000.0000, 20, 0, 580000.0000, 0, 20, NULL, 1, 13, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (962, 4000.0000, 20, 0, 6500.0000, 0, 20, NULL, 1, 14, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (963, 200000.0000, 20, 0, 260000.0000, 0, 20, NULL, 1, 15, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (964, 1000.0000, 1000, 0, 2000.0000, 0, 1000, NULL, 1, 16, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (965, 50000.0000, 20, 0, 54000.0000, 0, 20, NULL, 1, 17, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (966, 4800000.0000, 20, 0, 5000000.0000, 0, 20, NULL, 1, 18, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (967, 50000.0000, 20, 0, 55000.0000, 0, 20, NULL, 1, 19, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (968, 6000000.0000, 20, 0, 6200000.0000, 0, 20, NULL, 1, 20, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (969, 250000.0000, 50, 0, 272000.0000, 0, 50, NULL, 1, 21, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (970, 140000.0000, 30, 0, 161000.0000, 0, 30, NULL, 1, 22, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (971, 1200000.0000, 15, 0, 1350000.0000, 0, 15, NULL, 1, 23, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (972, 145000.0000, 30, 0, 158000.0000, 0, 30, NULL, 1, 24, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (973, 67000.0000, 50, 0, 74000.0000, 0, 50, NULL, 1, 25, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (974, 750000.0000, 25, 0, 783000.0000, 0, 25, NULL, 1, 26, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (975, 120000.0000, 30, 0, 141000.0000, 0, 30, NULL, 1, 27, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (976, 600000.0000, 30, 0, 617000.0000, 0, 30, NULL, 1, 28, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (977, 130000.0000, 30, 0, 147000.0000, 0, 30, NULL, 1, 29, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (978, 100000.0000, 50, 0, 121000.0000, 0, 50, NULL, 1, 30, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (979, 3500000.0000, 30, 0, 3615000.0000, 0, 30, NULL, 1, 31, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (980, 80000.0000, 30, 0, 91000.0000, 0, 30, NULL, 1, 32, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (981, 450000.0000, 25, 0, 471000.0000, 0, 25, NULL, 1, 33, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (982, 100000.0000, 35, 0, 113000.0000, 0, 35, NULL, 1, 34, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (983, 250000.0000, 20, 0, 264000.0000, 0, 20, NULL, 1, 35, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (984, 30000.0000, 30, 0, 38000.0000, 0, 30, NULL, 1, 36, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (985, 40000.0000, 30, 0, 46000.0000, 0, 30, NULL, 1, 37, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (986, 99000.0000, 25, 0, 107000.0000, 0, 25, NULL, 1, 38, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (987, 950000.0000, 15, 0, 100000.0000, 0, 15, NULL, 1, 39, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (988, 54000.0000, 50, 0, 61500.0000, 0, 50, NULL, 1, 40, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (989, 29000.0000, 40, 0, 32000.0000, 0, 40, NULL, 1, 41, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (990, 43000.0000, 25, 0, 45000.0000, 0, 25, NULL, 1, 42, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (991, 59000.0000, 30, 0, 62000.0000, 0, 30, NULL, 1, 43, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (992, 4800000.0000, 10, 0, 4990000.0000, 0, 10, NULL, 1, 44, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (993, 174000.0000, 20, 0, 180000.0000, 0, 20, NULL, 1, 45, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (994, 620000.0000, 10, 0, 633000.0000, 0, 10, NULL, 1, 46, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (995, 130000.0000, 50, 0, 138000.0000, 0, 50, NULL, 1, 47, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (996, 99000.0000, 10, 0, 103000.0000, 0, 10, NULL, 1, 48, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (997, 33000.0000, 50, 0, 40000.0000, 0, 50, NULL, 1, 49, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (998, 7400000.0000, 10, 0, 7540000.0000, 0, 10, NULL, 1, 50, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (999, 52000.0000, 20, 0, 56000.0000, 0, 20, NULL, 1, 51, 13)
GO
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1000, 43000.0000, 25, 0, 48000.0000, 0, 25, NULL, 1, 52, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1001, 48000.0000, 25, 0, 52000.0000, 0, 25, NULL, 1, 53, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1002, 19840.0000, 20, 0, 33000.0000, 0, 20, NULL, 1, 54, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1003, 29000.0000, 30, 0, 34000.0000, 0, 30, NULL, 1, 55, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1004, 31000.0000, 30, 0, 37000.0000, 0, 30, NULL, 1, 56, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1005, 38000.0000, 50, 0, 43000.0000, 0, 50, NULL, 1, 57, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1006, 53000.0000, 55, 0, 58000.0000, 0, 55, NULL, 1, 58, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1007, 48000.0000, 20, 0, 52000.0000, 0, 20, NULL, 1, 59, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1008, 37000.0000, 20, 0, 41000.0000, 0, 20, NULL, 1, 60, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1009, 23000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 61, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1010, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 62, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1011, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 63, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1012, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 64, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1013, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 65, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1014, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 66, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1015, 24000.0000, 40, 0, 28000.0000, 0, 40, NULL, 1, 67, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1016, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 68, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1017, 24000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 69, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1018, 24000.0000, 40, 0, 27000.0000, 0, 40, NULL, 1, 70, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1019, 45000.0000, 50, 0, 50000.0000, 0, 50, NULL, 1, 71, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1020, 120000.0000, 50, 0, 133000.0000, 0, 50, NULL, 1, 72, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1021, 116000.0000, 40, 0, 124000.0000, 0, 40, NULL, 1, 73, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1022, 140000.0000, 40, 0, 155000.0000, 0, 40, NULL, 1, 74, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1023, 120000.0000, 50, 0, 133000.0000, 0, 50, NULL, 1, 75, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1024, 160000.0000, 50, 0, 175000.0000, 0, 50, NULL, 1, 76, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1025, 130000.0000, 50, 0, 153000.0000, 0, 50, NULL, 1, 77, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1026, 99000.0000, 30, 0, 109000.0000, 0, 30, NULL, 1, 78, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1027, 132000.0000, 40, 0, 148000.0000, 0, 40, NULL, 1, 79, 13)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1028, 20000.0000, 50, 0, 24000.0000, 0, 50, NULL, 1, 1, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1029, 20000.0000, 70, 0, 24000.0000, 0, 70, NULL, 1, 2, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1030, 21000.0000, 60, 0, 25000.0000, 0, 60, NULL, 1, 3, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1031, 24000.0000, 20, 0, 30000.0000, 0, 20, NULL, 1, 4, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1032, 22000.0000, 20, 0, 25000.0000, 0, 20, NULL, 1, 5, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1033, 22500.0000, 60, 0, 25500.0000, 0, 60, NULL, 1, 6, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1034, 19500.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 7, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1035, 22000.0000, 30, 0, 25000.0000, 0, 30, NULL, 1, 8, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1036, 17500.0000, 20, 0, 23000.0000, 0, 20, NULL, 1, 9, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1037, 20500.0000, 20, 0, 24000.0000, 0, 20, NULL, 1, 10, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1038, 5000.0000, 40, 0, 7000.0000, 0, 40, NULL, 1, 11, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1039, 7000.0000, 20, 0, 10000.0000, 0, 20, NULL, 1, 12, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1040, 500000.0000, 20, 0, 580000.0000, 0, 20, NULL, 1, 13, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1041, 4000.0000, 20, 0, 6500.0000, 0, 20, NULL, 1, 14, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1042, 200000.0000, 20, 0, 260000.0000, 0, 20, NULL, 1, 15, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1043, 1000.0000, 1000, 0, 2000.0000, 0, 1000, NULL, 1, 16, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1044, 50000.0000, 20, 0, 54000.0000, 0, 20, NULL, 1, 17, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1045, 4800000.0000, 20, 0, 5000000.0000, 0, 20, NULL, 1, 18, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1046, 50000.0000, 20, 0, 55000.0000, 0, 20, NULL, 1, 19, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1047, 6000000.0000, 20, 0, 6200000.0000, 0, 20, NULL, 1, 20, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1048, 250000.0000, 30, 0, 272000.0000, 0, 30, NULL, 1, 21, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1049, 140000.0000, 30, 0, 161000.0000, 0, 30, NULL, 1, 22, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1050, 1200000.0000, 15, 0, 1350000.0000, 0, 15, NULL, 1, 23, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1051, 145000.0000, 30, 0, 158000.0000, 0, 30, NULL, 1, 24, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1052, 67000.0000, 40, 0, 74000.0000, 0, 40, NULL, 1, 25, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1053, 750000.0000, 25, 0, 783000.0000, 0, 25, NULL, 1, 26, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1054, 120000.0000, 30, 0, 141000.0000, 0, 30, NULL, 1, 27, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1055, 600000.0000, 30, 0, 617000.0000, 0, 30, NULL, 1, 28, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1056, 130000.0000, 30, 0, 147000.0000, 0, 30, NULL, 1, 29, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1057, 100000.0000, 30, 0, 121000.0000, 0, 30, NULL, 1, 30, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1058, 3500000.0000, 30, 0, 3615000.0000, 0, 30, NULL, 1, 31, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1059, 80000.0000, 30, 0, 91000.0000, 0, 30, NULL, 1, 32, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1060, 450000.0000, 25, 0, 471000.0000, 0, 25, NULL, 1, 33, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1061, 100000.0000, 35, 0, 113000.0000, 0, 35, NULL, 1, 34, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1062, 250000.0000, 20, 0, 264000.0000, 0, 20, NULL, 1, 35, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1063, 30000.0000, 30, 0, 38000.0000, 0, 30, NULL, 1, 36, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1064, 40000.0000, 30, 0, 46000.0000, 0, 30, NULL, 1, 37, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1065, 99000.0000, 25, 0, 107000.0000, 0, 25, NULL, 1, 38, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1066, 950000.0000, 15, 0, 100000.0000, 0, 15, NULL, 1, 39, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1067, 54000.0000, 30, 0, 61500.0000, 0, 30, NULL, 1, 40, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1068, 29000.0000, 40, 0, 32000.0000, 0, 40, NULL, 1, 41, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1069, 43000.0000, 35, 0, 45000.0000, 0, 35, NULL, 1, 42, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1070, 59000.0000, 30, 0, 62000.0000, 0, 30, NULL, 1, 43, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1071, 4800000.0000, 10, 0, 4990000.0000, 0, 10, NULL, 1, 44, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1072, 174000.0000, 30, 0, 180000.0000, 0, 30, NULL, 1, 45, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1073, 620000.0000, 10, 0, 633000.0000, 0, 10, NULL, 1, 46, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1074, 130000.0000, 10, 0, 138000.0000, 0, 10, NULL, 1, 47, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1075, 99000.0000, 10, 0, 103000.0000, 0, 10, NULL, 1, 48, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1076, 33000.0000, 10, 0, 40000.0000, 0, 10, NULL, 1, 49, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1077, 7400000.0000, 10, 0, 7540000.0000, 0, 10, NULL, 1, 50, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1078, 52000.0000, 20, 0, 56000.0000, 0, 20, NULL, 1, 51, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1079, 43000.0000, 25, 0, 48000.0000, 0, 25, NULL, 1, 52, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1080, 48000.0000, 25, 0, 52000.0000, 0, 25, NULL, 1, 53, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1081, 19840.0000, 20, 0, 33000.0000, 0, 20, NULL, 1, 54, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1082, 29000.0000, 60, 0, 34000.0000, 0, 60, NULL, 1, 55, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1083, 31000.0000, 30, 0, 37000.0000, 0, 30, NULL, 1, 56, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1084, 38000.0000, 20, 0, 43000.0000, 0, 20, NULL, 1, 57, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1085, 53000.0000, 15, 0, 58000.0000, 0, 15, NULL, 1, 58, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1086, 48000.0000, 60, 0, 52000.0000, 0, 60, NULL, 1, 59, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1087, 37000.0000, 20, 0, 41000.0000, 0, 20, NULL, 1, 60, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1088, 23000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 61, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1089, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 62, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1090, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 63, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1091, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 64, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1092, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 65, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1093, 24000.0000, 40, 0, 27500.0000, 0, 40, NULL, 1, 66, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1094, 24000.0000, 40, 0, 28000.0000, 0, 40, NULL, 1, 67, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1095, 24000.0000, 40, 0, 29000.0000, 0, 40, NULL, 1, 68, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1096, 24000.0000, 40, 0, 28500.0000, 0, 40, NULL, 1, 69, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1097, 24000.0000, 40, 0, 27000.0000, 0, 40, NULL, 1, 70, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1098, 45000.0000, 50, 0, 50000.0000, 0, 50, NULL, 1, 71, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1099, 120000.0000, 30, 0, 133000.0000, 0, 30, NULL, 1, 72, 14)
GO
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1100, 116000.0000, 40, 0, 124000.0000, 0, 40, NULL, 1, 73, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1101, 140000.0000, 45, 0, 155000.0000, 0, 45, NULL, 1, 74, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1102, 120000.0000, 55, 0, 133000.0000, 0, 55, NULL, 1, 75, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1103, 160000.0000, 55, 0, 175000.0000, 0, 55, NULL, 1, 76, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1104, 130000.0000, 40, 0, 153000.0000, 0, 40, NULL, 1, 77, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1105, 99000.0000, 30, 0, 109000.0000, 0, 30, NULL, 1, 78, 14)
INSERT [dbo].[CTSP] ([idCTSP], [DonGiaNhap], [SoLuongNhap], [SoLuongLoi], [DonGiaXuat], [DaBan], [SLConLai], [GhiChu], [TinhTrang], [idSP], [idNH]) VALUES (1106, 132000.0000, 40, 0, 148000.0000, 0, 40, NULL, 1, 79, 14)
SET IDENTITY_INSERT [dbo].[CTSP] OFF
GO
SET IDENTITY_INSERT [dbo].[DANHMUC] ON 

INSERT [dbo].[DANHMUC] ([idDM], [TenDM], [MoTa]) VALUES (1, N'Sách trong nước', N'')
INSERT [dbo].[DANHMUC] ([idDM], [TenDM], [MoTa]) VALUES (2, N'Văn phòng phẩm', N'')
INSERT [dbo].[DANHMUC] ([idDM], [TenDM], [MoTa]) VALUES (3, N'Đồ chơi', N'')
INSERT [dbo].[DANHMUC] ([idDM], [TenDM], [MoTa]) VALUES (4, N'Dụng cụ học tập', N'')
INSERT [dbo].[DANHMUC] ([idDM], [TenDM], [MoTa]) VALUES (5, N'Bách hóa lưu niệm', N'')
INSERT [dbo].[DANHMUC] ([idDM], [TenDM], [MoTa]) VALUES (6, N'Sách ngoại văn', N'')
INSERT [dbo].[DANHMUC] ([idDM], [TenDM], [MoTa]) VALUES (7, N'Sách giáo khoa', N'')
INSERT [dbo].[DANHMUC] ([idDM], [TenDM], [MoTa]) VALUES (8, N'Giáo trình', N'')
SET IDENTITY_INSERT [dbo].[DANHMUC] OFF
GO
SET IDENTITY_INSERT [dbo].[HOADON] ON 

INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (1, CAST(N'2022-12-02T00:00:00.000' AS DateTime), 13, 312000.0000, 0.0000, 312000.0000, NULL, 0, NULL, NULL, 2, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (2, CAST(N'2022-12-02T00:00:00.000' AS DateTime), 5, 125000.0000, 0.0000, 125000.0000, NULL, 0, NULL, NULL, 2, 1)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (3, CAST(N'2022-12-02T00:00:00.000' AS DateTime), 3, 73000.0000, 0.0000, 73000.0000, NULL, 2, 3, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (4, CAST(N'2022-12-03T00:00:00.000' AS DateTime), 6, 148000.0000, 0.0000, 148000.0000, NULL, 0, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (5, CAST(N'2022-12-03T00:00:00.000' AS DateTime), 57, 166000.0000, 0.0000, 166000.0000, NULL, 0, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (6, CAST(N'2022-12-03T00:00:00.000' AS DateTime), 4, 7280000.0000, 0.0000, 7280000.0000, NULL, 0, NULL, NULL, 2, 1)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (7, CAST(N'2022-12-03T00:00:00.000' AS DateTime), 4, 330000.0000, 0.0000, 330000.0000, NULL, 0, NULL, NULL, 2, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (8, CAST(N'2022-12-03T00:00:00.000' AS DateTime), 6, 276000.0000, 0.0000, 276000.0000, NULL, 0, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (9, CAST(N'2022-12-04T00:00:00.000' AS DateTime), 6, 56500.0000, 0.0000, 56500.0000, NULL, 0, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (10, CAST(N'2022-12-04T00:00:00.000' AS DateTime), 4, 891000.0000, 0.0000, 891000.0000, NULL, 0, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (11, CAST(N'2022-12-04T00:00:00.000' AS DateTime), 12, 625000.0000, 0.0000, 625000.0000, NULL, 2, 2, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (12, CAST(N'2022-12-05T00:00:00.000' AS DateTime), 102, 522000.0000, 0.0000, 522000.0000, NULL, 2, 3, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (13, CAST(N'2022-12-05T00:00:00.000' AS DateTime), 6, 59000.0000, 0.0000, 59000.0000, NULL, 0, NULL, NULL, 2, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (14, CAST(N'2022-12-07T00:00:00.000' AS DateTime), 3, 5294000.0000, 0.0000, 5294000.0000, NULL, 0, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (15, CAST(N'2022-12-07T00:00:00.000' AS DateTime), 3, 1099000.0000, 0.0000, 1099000.0000, NULL, 0, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (16, CAST(N'2022-12-08T00:00:00.000' AS DateTime), 5, 280500.0000, 0.0000, 280500.0000, NULL, 0, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (17, CAST(N'2022-12-09T00:00:00.000' AS DateTime), 8, 569000.0000, 0.0000, 569000.0000, NULL, 0, NULL, NULL, 2, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (18, CAST(N'2022-12-09T00:00:00.000' AS DateTime), 4, 337000.0000, 0.0000, 337000.0000, NULL, 0, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (19, CAST(N'2022-12-09T00:00:00.000' AS DateTime), 6, 739000.0000, 0.0000, 739000.0000, NULL, 2, 22, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (20, CAST(N'2022-12-12T00:00:00.000' AS DateTime), 4, 213000.0000, 0.0000, 213000.0000, NULL, 0, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (21, CAST(N'2022-12-13T00:00:00.000' AS DateTime), 4, 1584000.0000, 0.0000, 1584000.0000, NULL, 0, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (22, CAST(N'2022-12-13T00:00:00.000' AS DateTime), 4, 8327000.0000, 0.0000, 8327000.0000, NULL, 2, 11, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (23, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 4, 741000.0000, 0.0000, 741000.0000, NULL, 0, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (24, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 5, 4283000.0000, 0.0000, 4283000.0000, NULL, 0, NULL, NULL, 2, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (25, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 7, 890000.0000, 0.0000, 890000.0000, NULL, 0, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (26, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 53, 766000.0000, 0.0000, 766000.0000, NULL, 0, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (27, CAST(N'2022-12-15T00:00:00.000' AS DateTime), 4, 972000.0000, 0.0000, 972000.0000, NULL, 2, 21, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (28, CAST(N'2022-12-15T00:00:00.000' AS DateTime), 4, 583000.0000, 0.0000, 583000.0000, NULL, 0, NULL, NULL, 2, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (29, CAST(N'2022-12-15T00:00:00.000' AS DateTime), 3, 74500.0000, 0.0000, 74500.0000, NULL, 2, 1, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (30, CAST(N'2022-12-15T00:00:00.000' AS DateTime), 4, 1257000.0000, 0.0000, 1257000.0000, NULL, 2, 3, NULL, 2, 1)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (31, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 1, 40000.0000, 0.0000, 40000.0000, NULL, 0, NULL, NULL, 2, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (32, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 7, 432000.0000, 0.0000, 432000.0000, NULL, 0, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (33, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 3, 877000.0000, 0.0000, 877000.0000, NULL, 2, 4, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (34, CAST(N'2022-12-18T00:00:00.000' AS DateTime), 3, 8766000.0000, 0.0000, 8766000.0000, NULL, 3, 40, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (35, CAST(N'2022-12-18T00:00:00.000' AS DateTime), 7, 894500.0000, 0.0000, 894500.0000, NULL, 0, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (36, CAST(N'2022-12-19T00:00:00.000' AS DateTime), 3, 282000.0000, 0.0000, 282000.0000, NULL, 0, NULL, NULL, 2, 1)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (37, CAST(N'2022-12-19T00:00:00.000' AS DateTime), 4, 7633000.0000, 0.0000, 7633000.0000, NULL, 2, 14, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (38, CAST(N'2022-12-19T00:00:00.000' AS DateTime), 6, 650000.0000, 0.0000, 650000.0000, NULL, 0, NULL, NULL, 2, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (39, CAST(N'2022-12-20T00:00:00.000' AS DateTime), 5, 714000.0000, 0.0000, 714000.0000, NULL, 0, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (40, CAST(N'2022-12-20T00:00:00.000' AS DateTime), 5, 442000.0000, 0.0000, 442000.0000, NULL, 0, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (41, CAST(N'2022-12-20T00:00:00.000' AS DateTime), 4, 171000.0000, 0.0000, 171000.0000, NULL, 0, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (42, CAST(N'2022-12-20T00:00:00.000' AS DateTime), 5, 500000.0000, 0.0000, 500000.0000, NULL, 2, 12, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (43, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 3, 5509000.0000, 0.0000, 5509000.0000, NULL, 0, NULL, NULL, 2, 1)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (44, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 7, 7855000.0000, 0.0000, 7855000.0000, NULL, 0, NULL, NULL, 2, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (45, CAST(N'2022-12-23T00:00:00.000' AS DateTime), 9, 1166000.0000, 0.0000, 1166000.0000, NULL, 0, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (46, CAST(N'2022-12-24T00:00:00.000' AS DateTime), 14, 395500.0000, 0.0000, 395500.0000, NULL, 0, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (47, CAST(N'2022-12-24T00:00:00.000' AS DateTime), 6, 4393000.0000, 0.0000, 4393000.0000, NULL, 2, 23, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (48, CAST(N'2022-12-24T00:00:00.000' AS DateTime), 9, 7766000.0000, 0.0000, 7766000.0000, NULL, 3, 35, NULL, 2, 1)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (49, CAST(N'2022-12-24T00:00:00.000' AS DateTime), 7, 23733000.0000, 0.0000, 23733000.0000, NULL, 0, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (50, CAST(N'2022-12-25T00:00:00.000' AS DateTime), 10, 3056000.0000, 0.0000, 3056000.0000, NULL, 2, 1, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (51, CAST(N'2022-12-25T00:00:00.000' AS DateTime), 19, 2939000.0000, 0.0000, 2939000.0000, NULL, 0, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (52, CAST(N'2022-12-25T00:00:00.000' AS DateTime), 9, 7919000.0000, 0.0000, 7919000.0000, NULL, 0, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (53, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 16, 2086000.0000, 0.0000, 2086000.0000, NULL, 0, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (54, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 9, 1107000.0000, 0.0000, 1107000.0000, NULL, 0, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (55, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 15, 918000.0000, 0.0000, 918000.0000, NULL, 3, 35, NULL, 2, 1)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (56, CAST(N'2022-12-28T00:00:00.000' AS DateTime), 17, 527000.0000, 0.0000, 527000.0000, NULL, 0, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (57, CAST(N'2022-12-28T00:00:00.000' AS DateTime), 9, 2358000.0000, 0.0000, 2358000.0000, NULL, 0, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (58, CAST(N'2022-12-29T00:00:00.000' AS DateTime), 10, 892000.0000, 0.0000, 892000.0000, NULL, 0, NULL, NULL, 2, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (59, CAST(N'2022-12-29T00:00:00.000' AS DateTime), 11, 347000.0000, 0.0000, 347000.0000, NULL, 0, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (60, CAST(N'2022-12-30T00:00:00.000' AS DateTime), 13, 816500.0000, 0.0000, 816500.0000, NULL, 0, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (61, CAST(N'2022-12-30T00:00:00.000' AS DateTime), 6, 7984000.0000, 0.0000, 7984000.0000, NULL, 0, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (62, CAST(N'2022-12-30T00:00:00.000' AS DateTime), 110, 597500.0000, 0.0000, 597500.0000, NULL, 0, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (63, CAST(N'2022-12-30T00:00:00.000' AS DateTime), 10, 368000.0000, 0.0000, 368000.0000, NULL, 2, 11, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (64, CAST(N'2022-12-30T00:00:00.000' AS DateTime), 13, 928000.0000, 0.0000, 928000.0000, NULL, 0, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (65, CAST(N'2022-12-30T00:00:00.000' AS DateTime), 9, 483000.0000, 0.0000, 483000.0000, NULL, 0, NULL, NULL, 2, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (66, CAST(N'2022-12-30T00:00:00.000' AS DateTime), 6, 495000.0000, 0.0000, 495000.0000, NULL, 2, 12, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (183, CAST(N'2023-12-01T00:00:00.000' AS DateTime), 5, 48000.0000, 0.0000, 48000.0000, N'', NULL, NULL, NULL, 3, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (184, CAST(N'2023-12-02T00:00:00.000' AS DateTime), 4, 120000.0000, 0.0000, 120000.0000, N'', NULL, NULL, NULL, 3, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (185, CAST(N'2023-12-03T00:00:00.000' AS DateTime), 3, 3000000.0000, 0.0000, 3000000.0000, N'', NULL, NULL, NULL, 1, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (186, CAST(N'2023-12-04T00:00:00.000' AS DateTime), 6, 1200000.0000, 0.0000, 1200000.0000, N'', NULL, NULL, NULL, 1, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (187, CAST(N'2023-12-05T00:00:00.000' AS DateTime), 6, 62000.0000, 0.0000, 62000.0000, N'', NULL, NULL, NULL, 3, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (188, CAST(N'2023-12-06T00:00:00.000' AS DateTime), 4, 600000.0000, 0.0000, 600000.0000, N'', NULL, NULL, NULL, 3, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (189, CAST(N'2023-12-07T00:00:00.000' AS DateTime), 6, 44000.0000, 0.0000, 44000.0000, N'', NULL, NULL, NULL, 3, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (190, CAST(N'2023-12-08T00:00:00.000' AS DateTime), 3, 520000.0000, 0.0000, 520000.0000, N'', NULL, NULL, NULL, 2, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (191, CAST(N'2023-12-09T00:00:00.000' AS DateTime), 6, 2400000.0000, 0.0000, 2400000.0000, N'', NULL, NULL, NULL, 3, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (192, CAST(N'2023-12-10T00:00:00.000' AS DateTime), 3, 16000.0000, 0.0000, 16000.0000, N'', NULL, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (193, CAST(N'2023-12-11T00:00:00.000' AS DateTime), 4, 111000.0000, 0.0000, 111000.0000, N'', NULL, NULL, NULL, 3, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (194, CAST(N'2023-12-12T00:00:00.000' AS DateTime), 3, 650000.0000, 0.0000, 650000.0000, N'', NULL, NULL, NULL, 1, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (195, CAST(N'2023-12-13T00:00:00.000' AS DateTime), 6, 500000.0000, 0.0000, 500000.0000, N'', NULL, NULL, NULL, 3, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (196, CAST(N'2023-12-14T00:00:00.000' AS DateTime), 5, 118000.0000, 0.0000, 118000.0000, N'', NULL, NULL, NULL, 3, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (197, CAST(N'2023-12-15T00:00:00.000' AS DateTime), 6, 70000.0000, 0.0000, 70000.0000, N'', NULL, NULL, NULL, 1, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (198, CAST(N'2023-12-16T00:00:00.000' AS DateTime), 5, 106000.0000, 0.0000, 106000.0000, N'', NULL, NULL, NULL, 3, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (199, CAST(N'2023-12-17T00:00:00.000' AS DateTime), 4, 16000.0000, 0.0000, 16000.0000, N'', NULL, NULL, NULL, 2, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (200, CAST(N'2023-12-18T00:00:00.000' AS DateTime), 5, 96000.0000, 0.0000, 96000.0000, N'', NULL, NULL, NULL, 1, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (201, CAST(N'2023-12-19T00:00:00.000' AS DateTime), 3, 19200000.0000, 0.0000, 19200000.0000, N'', NULL, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (202, CAST(N'2023-12-20T00:00:00.000' AS DateTime), 6, 500000.0000, 0.0000, 500000.0000, N'', NULL, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (203, CAST(N'2023-12-21T00:00:00.000' AS DateTime), 6, 520000.0000, 0.0000, 520000.0000, N'', NULL, NULL, NULL, 1, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (204, CAST(N'2023-12-22T00:00:00.000' AS DateTime), 4, 1800000.0000, 0.0000, 1800000.0000, N'', NULL, NULL, NULL, 1, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (205, CAST(N'2023-12-23T00:00:00.000' AS DateTime), 4, 14000.0000, 0.0000, 14000.0000, N'', NULL, NULL, NULL, 3, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (206, CAST(N'2023-12-24T00:00:00.000' AS DateTime), 6, 12000000.0000, 0.0000, 12000000.0000, N'', NULL, NULL, NULL, 1, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (207, CAST(N'2023-12-25T00:00:00.000' AS DateTime), 6, 99000.0000, 0.0000, 99000.0000, N'', NULL, NULL, NULL, 1, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (208, CAST(N'2023-12-26T00:00:00.000' AS DateTime), 5, 102500.0000, 0.0000, 102500.0000, N'', NULL, NULL, NULL, 3, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (209, CAST(N'2023-12-27T00:00:00.000' AS DateTime), 4, 102500.0000, 0.0000, 102500.0000, N'', NULL, NULL, NULL, 2, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (210, CAST(N'2023-12-28T00:00:00.000' AS DateTime), 5, 90000.0000, 0.0000, 90000.0000, N'', NULL, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (211, CAST(N'2023-12-29T00:00:00.000' AS DateTime), 5, 335000.0000, 0.0000, 335000.0000, N'', NULL, NULL, NULL, 2, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (212, CAST(N'2023-12-30T00:00:00.000' AS DateTime), 4, 144000.0000, 0.0000, 144000.0000, N'', NULL, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (213, CAST(N'2023-12-31T00:00:00.000' AS DateTime), 4, 110000.0000, 0.0000, 110000.0000, N'', NULL, NULL, NULL, 3, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (214, CAST(N'2023-12-03T00:00:00.000' AS DateTime), 4, 14400000.0000, 0.0000, 14400000.0000, N'', NULL, NULL, NULL, 3, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (215, CAST(N'2023-12-06T00:00:00.000' AS DateTime), 3, 750000.0000, 0.0000, 750000.0000, N'', NULL, NULL, NULL, 3, 4)
GO
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (216, CAST(N'2023-12-09T00:00:00.000' AS DateTime), 3, 120000.0000, 0.0000, 120000.0000, N'', NULL, NULL, NULL, 2, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (217, CAST(N'2023-12-12T00:00:00.000' AS DateTime), 3, 24000000.0000, 0.0000, 24000000.0000, N'', NULL, NULL, NULL, 3, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (218, CAST(N'2023-12-15T00:00:00.000' AS DateTime), 6, 650000.0000, 0.0000, 650000.0000, N'', NULL, NULL, NULL, 1, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (219, CAST(N'2023-12-18T00:00:00.000' AS DateTime), 6, 290000.0000, 0.0000, 290000.0000, N'', NULL, NULL, NULL, 1, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (220, CAST(N'2023-12-21T00:00:00.000' AS DateTime), 3, 35000.0000, 0.0000, 35000.0000, N'', NULL, NULL, NULL, 1, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (221, CAST(N'2023-12-24T00:00:00.000' AS DateTime), 5, 37000000.0000, 0.0000, 37000000.0000, N'', NULL, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (222, CAST(N'2023-12-27T00:00:00.000' AS DateTime), 4, 45000.0000, 0.0000, 45000.0000, N'', NULL, NULL, NULL, 2, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (223, CAST(N'2023-12-30T00:00:00.000' AS DateTime), 5, 100000.0000, 0.0000, 100000.0000, N'', NULL, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (224, CAST(N'2023-12-05T00:00:00.000' AS DateTime), 3, 150000.0000, 0.0000, 150000.0000, N'', NULL, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (225, CAST(N'2023-12-10T00:00:00.000' AS DateTime), 4, 360000.0000, 0.0000, 360000.0000, N'', NULL, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (226, CAST(N'2023-12-15T00:00:00.000' AS DateTime), 4, 148000.0000, 0.0000, 148000.0000, N'', NULL, NULL, NULL, 2, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (227, CAST(N'2023-12-20T00:00:00.000' AS DateTime), 4, 69000.0000, 0.0000, 69000.0000, N'', NULL, NULL, NULL, 1, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (228, CAST(N'2023-12-25T00:00:00.000' AS DateTime), 5, 40000.0000, 0.0000, 40000.0000, N'', NULL, NULL, NULL, 3, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (229, CAST(N'2023-12-30T00:00:00.000' AS DateTime), 4, 9600000.0000, 0.0000, 9600000.0000, N'', NULL, NULL, NULL, 1, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (230, CAST(N'2023-12-06T00:00:00.000' AS DateTime), 3, 80000.0000, 0.0000, 80000.0000, N'', NULL, NULL, NULL, 1, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (231, CAST(N'2023-12-12T00:00:00.000' AS DateTime), 6, 19200000.0000, 0.0000, 19200000.0000, N'', NULL, NULL, NULL, 3, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (232, CAST(N'2023-12-18T00:00:00.000' AS DateTime), 5, 74000.0000, 0.0000, 74000.0000, N'', NULL, NULL, NULL, 3, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (233, CAST(N'2023-12-24T00:00:00.000' AS DateTime), 6, 87000.0000, 0.0000, 87000.0000, N'', NULL, NULL, NULL, 3, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (234, CAST(N'2023-12-30T00:00:00.000' AS DateTime), 6, 99000.0000, 0.0000, 99000.0000, N'', NULL, NULL, NULL, 3, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (235, CAST(N'2023-12-07T00:00:00.000' AS DateTime), 5, 58000.0000, 0.0000, 58000.0000, N'', NULL, NULL, NULL, 3, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (236, CAST(N'2023-12-14T00:00:00.000' AS DateTime), 6, 400000.0000, 0.0000, 400000.0000, N'', NULL, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (237, CAST(N'2023-12-21T00:00:00.000' AS DateTime), 4, 1000000.0000, 0.0000, 1000000.0000, N'', NULL, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (238, CAST(N'2023-12-28T00:00:00.000' AS DateTime), 3, 44000.0000, 0.0000, 44000.0000, N'', NULL, NULL, NULL, 3, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (239, CAST(N'2004-01-01T00:00:00.000' AS DateTime), 16, 15192000.0000, 0.0000, 15192000.0000, NULL, 2, 17, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (240, CAST(N'2004-01-01T00:00:00.000' AS DateTime), 14, 1282000.0000, 0.0000, 1282000.0000, NULL, 0, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (241, CAST(N'2024-01-02T23:49:25.980' AS DateTime), 16, 4920000.0000, 0.0000, 4920000.0000, NULL, 2, 14, NULL, 2, 4)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (242, CAST(N'2024-01-02T23:49:41.040' AS DateTime), 14, 2505000.0000, 0.0000, 2505000.0000, NULL, 0, NULL, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (243, CAST(N'2024-01-02T23:49:57.940' AS DateTime), 14, 3072500.0000, 0.0000, 3072500.0000, NULL, 3, 30, NULL, 2, 3)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (244, CAST(N'2004-01-03T00:00:00.000' AS DateTime), 13, 21865500.0000, 0.0000, 21865500.0000, NULL, 0, NULL, NULL, 2, 2)
INSERT [dbo].[HOADON] ([idHD], [NgayHD], [SLSP], [ThanhTien], [GiamGia], [ThanhToan], [GhiChu], [idLKH], [idKH], [idKM], [idND], [idPT]) VALUES (245, CAST(N'2004-01-03T00:00:00.000' AS DateTime), 21, 17808500.0000, 0.0000, 17808500.0000, NULL, 0, NULL, NULL, 2, 3)
SET IDENTITY_INSERT [dbo].[HOADON] OFF
GO
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (1, N'Nguyễn Thị Hương', N'Nữ', CAST(N'2001-12-07T00:00:00.000' AS DateTime), N'9942 Killdeer Way', N'8534387129', CAST(N'2022-07-25T00:00:00.000' AS DateTime), 89, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (2, N'Nguyễn Văn Tuấn', N'Nam', CAST(N'2006-03-14T00:00:00.000' AS DateTime), N'09748 Dottie Street', N'5773362943', CAST(N'2020-12-09T00:00:00.000' AS DateTime), 29, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (3, N'Trần Thị Lan', N'Nữ', CAST(N'1993-10-20T00:00:00.000' AS DateTime), N'19 Warbler Street', N'1257019734', CAST(N'2023-02-23T00:00:00.000' AS DateTime), 205, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (4, N'Nguyễn Thị Trang', N'Nữ', CAST(N'1988-11-26T00:00:00.000' AS DateTime), N'4003 Division Pass', N'1583828629', CAST(N'2021-07-17T00:00:00.000' AS DateTime), 161, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (5, N'Phạm Văn Hùng', N'Nữ', NULL, N'41 Erie Way', N'5968727637', CAST(N'2022-05-15T00:00:00.000' AS DateTime), 230, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (6, N'Trần Văn Hòa', N'Nam', CAST(N'1996-02-05T00:00:00.000' AS DateTime), NULL, N'3148518186', CAST(N'2021-03-09T00:00:00.000' AS DateTime), 66, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (7, N'Lê Thị Bích Ngọc', N'Nữ', CAST(N'1959-11-09T00:00:00.000' AS DateTime), N'8 4th Alley', N'8463502860', CAST(N'2021-12-28T00:00:00.000' AS DateTime), 147, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (8, N'Nguyễn Thị Mai', N'Nữ', CAST(N'1957-12-02T00:00:00.000' AS DateTime), N'1221 Tony Place', N'6488090445', CAST(N'2021-11-19T00:00:00.000' AS DateTime), 202, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (9, N'Hoàng Văn Nam', N'Nam', CAST(N'1975-10-21T00:00:00.000' AS DateTime), N'938 Lerdahl Way', N'2103853200', CAST(N'2021-08-09T00:00:00.000' AS DateTime), 15, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (10, N'Nguyễn Văn Đức', N'Nam', CAST(N'1973-10-28T00:00:00.000' AS DateTime), N'0 Heath Junction', N'8394362594', CAST(N'2023-05-13T00:00:00.000' AS DateTime), 49, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (11, N'Võ Thị Thanh', N'Nam', CAST(N'2001-09-07T00:00:00.000' AS DateTime), N'961 Mayfield Avenue', N'9311849601', CAST(N'2023-06-04T00:00:00.000' AS DateTime), 29, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (12, N'Phan Văn Hoàng', N'Nam', CAST(N'2011-10-15T00:00:00.000' AS DateTime), N'090 Barby Road', N'2656155620', CAST(N'2021-06-07T00:00:00.000' AS DateTime), 30, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (13, N'Nguyễn Thị Hồng', N'Nữ', CAST(N'2005-06-21T00:00:00.000' AS DateTime), N'0092 Menomonie Way', N'5478911698', CAST(N'2022-12-13T00:00:00.000' AS DateTime), 75, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (14, N'Nguyễn Thị Thu', N'Nữ', CAST(N'1997-09-12T00:00:00.000' AS DateTime), N'7745 Scoville Way', N'7796843781', CAST(N'2021-10-04T00:00:00.000' AS DateTime), 45, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (15, N'Lê Văn Minh', N'Nam', CAST(N'1981-01-05T00:00:00.000' AS DateTime), N'494 Basil Circle', N'6861387610', CAST(N'2022-12-02T00:00:00.000' AS DateTime), 123, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (16, N'Trần Thị Diệu', N'Nữ', CAST(N'1985-11-20T00:00:00.000' AS DateTime), N'977 Forster Drive', N'3048069812', CAST(N'2023-04-09T00:00:00.000' AS DateTime), 195, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (17, N'Nguyễn Văn Hòa', N'Nam', CAST(N'1971-10-20T00:00:00.000' AS DateTime), N'7320 Bowman Parkway', N'6915915567', CAST(N'2020-12-02T00:00:00.000' AS DateTime), 174, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (18, N'Nguyễn Thị Hương', N'Nam', CAST(N'1956-04-05T00:00:00.000' AS DateTime), N'03683 Doe Crossing Place', N'4419738973', CAST(N'2021-11-11T00:00:00.000' AS DateTime), 21, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (19, N'Lê Văn Đức', N'Nam', CAST(N'1979-03-05T00:00:00.000' AS DateTime), N'4 Stone Corner Alley', N'6157626832', CAST(N'2022-09-13T00:00:00.000' AS DateTime), 129, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (20, N'Nguyễn Thị Ngọc', N'Nữ', CAST(N'1965-05-28T00:00:00.000' AS DateTime), N'6 Surrey Lane', N'2472890400', CAST(N'2020-12-20T00:00:00.000' AS DateTime), 149, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (21, N'Nguyễn Thị Minh', N'Nam', CAST(N'2003-03-10T00:00:00.000' AS DateTime), N'0304 Kim Plaza', N'2536561324', CAST(N'2021-12-21T00:00:00.000' AS DateTime), 221, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (22, N'Nguyễn Thị Tâm', N'Nữ', NULL, N'24 Karstens Park', N'5909042537', CAST(N'2022-07-05T00:00:00.000' AS DateTime), 225, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (23, N'Trần Thị Ngọc', N'Nữ', CAST(N'2008-09-16T00:00:00.000' AS DateTime), N'6 Toban Parkway', N'7639813411', CAST(N'2023-07-27T00:00:00.000' AS DateTime), 138, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (24, N'Nguyễn Thị Lan', N'Nam', CAST(N'1953-04-15T00:00:00.000' AS DateTime), N'293 High Crossing Lane', N'5338353655', CAST(N'2021-02-06T00:00:00.000' AS DateTime), 153, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (25, N'Nguyễn Thị Bảo', N'Nam', CAST(N'2016-11-05T00:00:00.000' AS DateTime), N'25 Buhler Plaza', N'4869446388', CAST(N'2023-04-01T00:00:00.000' AS DateTime), 153, 2)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (26, N'Nguyễn Văn Nam', N'Nữ', CAST(N'2007-07-23T00:00:00.000' AS DateTime), N'34669 Packers Point', N'6577318271', CAST(N'2023-05-06T00:00:00.000' AS DateTime), 992, 3)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (27, N'Nguyễn Thị Hồng', N'Nữ', CAST(N'2011-01-07T00:00:00.000' AS DateTime), N'16 Tony Parkway', N'5047459610', CAST(N'2023-09-16T00:00:00.000' AS DateTime), 776, 3)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (28, N'Nguyễn Thị Lan', N'Nữ', CAST(N'2001-06-07T00:00:00.000' AS DateTime), N'92074 Lukken Junction', N'5807103440', CAST(N'2022-12-02T00:00:00.000' AS DateTime), 289, 3)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (29, N'Nguyễn Văn Hiệp', N'Nam', CAST(N'1998-04-22T00:00:00.000' AS DateTime), N'027 4th Circle', N'3894113988', CAST(N'2021-06-05T00:00:00.000' AS DateTime), 919, 3)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (30, N'Nguyễn Thị Ngọc', N'Nữ', CAST(N'1957-09-28T00:00:00.000' AS DateTime), N'749 Sunfield Place', N'3496924261', CAST(N'2021-03-21T00:00:00.000' AS DateTime), 257, 3)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (31, N'Nguyễn Văn Nam', N'Nam', CAST(N'1994-08-04T00:00:00.000' AS DateTime), N'4 Westridge Court', N'8374644007', CAST(N'2022-04-27T00:00:00.000' AS DateTime), 489, 3)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (32, N'Nguyễn Văn Hòa', N'Nam', CAST(N'1982-09-01T00:00:00.000' AS DateTime), N'90504 Holmberg Trail', N'3427739220', CAST(N'2023-04-26T00:00:00.000' AS DateTime), 819, 3)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (33, N'Nguyễn Văn Minh', N'Nam', CAST(N'2018-06-07T00:00:00.000' AS DateTime), N'4598 Express Trail', N'3899270383', CAST(N'2021-02-19T00:00:00.000' AS DateTime), 682, 3)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (34, N'Nguyễn Văn Tâm', N'Nam', NULL, N'69 Drewry Court', N'5608526858', CAST(N'2021-11-22T00:00:00.000' AS DateTime), 525, 3)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (35, N'Lê Văn Hiệp', N'Nam', CAST(N'1976-01-30T00:00:00.000' AS DateTime), N'594 Hooker Junction', N'7805396331', CAST(N'2022-01-26T00:00:00.000' AS DateTime), 708, 3)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (36, N'Nguyễn Thị Phương', N'Nữ', CAST(N'2023-08-24T00:00:00.000' AS DateTime), N'7 Utah Circle', N'5518156254', CAST(N'2021-06-12T00:00:00.000' AS DateTime), 363, 3)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (37, N'Nguyễn Văn Hiệp', N'Nam', CAST(N'1962-06-14T00:00:00.000' AS DateTime), N'08 Moland Avenue', N'2245095608', CAST(N'2021-12-02T00:00:00.000' AS DateTime), 944, 3)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (38, N'Phạm Văn Hòa', N'Nam', CAST(N'1951-07-05T00:00:00.000' AS DateTime), N'8 Emmet Crossing', N'1115239110', CAST(N'2020-12-18T00:00:00.000' AS DateTime), 286, 3)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (39, N'Nguyễn Thị Linh', N'Nữ', CAST(N'1961-06-11T00:00:00.000' AS DateTime), N'44379 Golden Leaf Court', N'5507704971', CAST(N'2020-12-13T00:00:00.000' AS DateTime), 641, 3)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (40, N'Nguyễn Thị Minh', N'Male', CAST(N'2002-01-29T00:00:00.000' AS DateTime), N'3758 Bunker Hill Court', N'1356076215', CAST(N'2023-06-15T00:00:00.000' AS DateTime), 692, 3)
INSERT [dbo].[KHACHHANG] ([idKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [NgayTG], [DiemTichLuy], [idLKH]) VALUES (41, N'Nguyễn Thị Ngọc', N'Nữ', CAST(N'1965-02-01T00:00:00.000' AS DateTime), N'77081 Homewood Road', N'1403307386', CAST(N'2022-07-25T00:00:00.000' AS DateTime), 662, 3)
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[KHUYENMAI] ON 

INSERT [dbo].[KHUYENMAI] ([idKM], [TenKM], [MoTa], [idLKH], [NgayBD], [NgayKT], [GiamGia], [idND]) VALUES (1, N'Mừng Ngày Nhà giáo Việt Nam', N'', 0, CAST(N'2022-11-15T00:00:00.000' AS DateTime), CAST(N'2022-11-25T00:00:00.000' AS DateTime), 15, 1)
INSERT [dbo].[KHUYENMAI] ([idKM], [TenKM], [MoTa], [idLKH], [NgayBD], [NgayKT], [GiamGia], [idND]) VALUES (2, N'Giáng Sinh Vui Vẻ', N'', 0, CAST(N'2022-12-23T00:00:00.000' AS DateTime), CAST(N'2022-12-26T00:00:00.000' AS DateTime), 30, 1)
INSERT [dbo].[KHUYENMAI] ([idKM], [TenKM], [MoTa], [idLKH], [NgayBD], [NgayKT], [GiamGia], [idND]) VALUES (3, N'Mừng Năm 2023', N'', 0, CAST(N'2022-12-28T00:00:00.000' AS DateTime), CAST(N'2023-01-02T00:00:00.000' AS DateTime), 30, 1)
INSERT [dbo].[KHUYENMAI] ([idKM], [TenKM], [MoTa], [idLKH], [NgayBD], [NgayKT], [GiamGia], [idND]) VALUES (4, N'Ngày Lễ Tình Nhân', N'', 0, CAST(N'2023-02-12T00:00:00.000' AS DateTime), CAST(N'2023-02-15T00:00:00.000' AS DateTime), 15, 1)
INSERT [dbo].[KHUYENMAI] ([idKM], [TenKM], [MoTa], [idLKH], [NgayBD], [NgayKT], [GiamGia], [idND]) VALUES (5, N'Mừng 30/04 - 01/05', N'', 0, CAST(N'2023-04-29T00:00:00.000' AS DateTime), CAST(N'2023-05-02T00:00:00.000' AS DateTime), 25, 1)
INSERT [dbo].[KHUYENMAI] ([idKM], [TenKM], [MoTa], [idLKH], [NgayBD], [NgayKT], [GiamGia], [idND]) VALUES (6, N'Mừng Quốc Tế Thiếu Nhi', N'', 0, CAST(N'2023-05-31T00:00:00.000' AS DateTime), CAST(N'2023-06-02T00:00:00.000' AS DateTime), 15, 1)
INSERT [dbo].[KHUYENMAI] ([idKM], [TenKM], [MoTa], [idLKH], [NgayBD], [NgayKT], [GiamGia], [idND]) VALUES (7, N'Mừng Quốc Khánh Việt Nam', N'', 0, CAST(N'2023-09-01T00:00:00.000' AS DateTime), CAST(N'2023-09-03T00:00:00.000' AS DateTime), 40, 1)
INSERT [dbo].[KHUYENMAI] ([idKM], [TenKM], [MoTa], [idLKH], [NgayBD], [NgayKT], [GiamGia], [idND]) VALUES (8, N'Mừng ngày Phụ Nữ Việt Nam', N'', 0, CAST(N'2023-10-19T00:00:00.000' AS DateTime), CAST(N'2023-10-21T00:00:00.000' AS DateTime), 20, 1)
INSERT [dbo].[KHUYENMAI] ([idKM], [TenKM], [MoTa], [idLKH], [NgayBD], [NgayKT], [GiamGia], [idND]) VALUES (9, N'Mừng Ngày Nhà giáo Việt Nam', N'', 0, CAST(N'2023-11-19T00:00:00.000' AS DateTime), CAST(N'2023-11-21T00:00:00.000' AS DateTime), 15, 1)
INSERT [dbo].[KHUYENMAI] ([idKM], [TenKM], [MoTa], [idLKH], [NgayBD], [NgayKT], [GiamGia], [idND]) VALUES (10, N'Mừng Giáng Sinh', N'', 0, CAST(N'2023-12-23T00:00:00.000' AS DateTime), CAST(N'2023-12-25T00:00:00.000' AS DateTime), 30, 1)
INSERT [dbo].[KHUYENMAI] ([idKM], [TenKM], [MoTa], [idLKH], [NgayBD], [NgayKT], [GiamGia], [idND]) VALUES (11, N'Mừng Năm Mới 2024', N'', 0, CAST(N'2023-12-30T00:00:00.000' AS DateTime), CAST(N'2024-01-02T00:00:00.000' AS DateTime), 35, 1)
SET IDENTITY_INSERT [dbo].[KHUYENMAI] OFF
GO
SET IDENTITY_INSERT [dbo].[LOAIKHACHHANG] ON 

INSERT [dbo].[LOAIKHACHHANG] ([idLKH], [TenLKH], [MoTa], [DiemTichLuyToiThieu]) VALUES (0, N'Tất cả', N'', 0)
INSERT [dbo].[LOAIKHACHHANG] ([idLKH], [TenLKH], [MoTa], [DiemTichLuyToiThieu]) VALUES (1, N'Khách lẻ', N'', 0)
INSERT [dbo].[LOAIKHACHHANG] ([idLKH], [TenLKH], [MoTa], [DiemTichLuyToiThieu]) VALUES (2, N'Hội viên', N'', 50)
INSERT [dbo].[LOAIKHACHHANG] ([idLKH], [TenLKH], [MoTa], [DiemTichLuyToiThieu]) VALUES (3, N'Hội viên VIP', N'', 200)
SET IDENTITY_INSERT [dbo].[LOAIKHACHHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[LOAINGUOIDUNG] ON 

INSERT [dbo].[LOAINGUOIDUNG] ([idLND], [TenLND], [MoTa]) VALUES (1, N'Admin', N'')
INSERT [dbo].[LOAINGUOIDUNG] ([idLND], [TenLND], [MoTa]) VALUES (2, N'Thu ngân', N'')
INSERT [dbo].[LOAINGUOIDUNG] ([idLND], [TenLND], [MoTa]) VALUES (3, N'Nhân viên kho', N'')
SET IDENTITY_INSERT [dbo].[LOAINGUOIDUNG] OFF
GO
SET IDENTITY_INSERT [dbo].[NGUOIDUNG] ON 

INSERT [dbo].[NGUOIDUNG] ([idND], [TenDN], [MatKhau], [NgayTao], [TinhTrang], [idNV], [idLND]) VALUES (1, N'quanly', N'123456', CAST(N'2023-10-02T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[NGUOIDUNG] ([idND], [TenDN], [MatKhau], [NgayTao], [TinhTrang], [idNV], [idLND]) VALUES (2, N'thungan', N'123456', CAST(N'2023-10-02T00:00:00.000' AS DateTime), 1, 1, 2)
INSERT [dbo].[NGUOIDUNG] ([idND], [TenDN], [MatKhau], [NgayTao], [TinhTrang], [idNV], [idLND]) VALUES (3, N'kho', N'123456', CAST(N'2023-10-02T00:00:00.000' AS DateTime), 1, 1, 3)
INSERT [dbo].[NGUOIDUNG] ([idND], [TenDN], [MatKhau], [NgayTao], [TinhTrang], [idNV], [idLND]) VALUES (4, N'quanly2', N'12345678', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 1, 2, 1)
INSERT [dbo].[NGUOIDUNG] ([idND], [TenDN], [MatKhau], [NgayTao], [TinhTrang], [idNV], [idLND]) VALUES (5, N'thungan2', N'12345678', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 1, 3, 2)
INSERT [dbo].[NGUOIDUNG] ([idND], [TenDN], [MatKhau], [NgayTao], [TinhTrang], [idNV], [idLND]) VALUES (6, N'kho2', N'12345678', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 1, 4, 3)
INSERT [dbo].[NGUOIDUNG] ([idND], [TenDN], [MatKhau], [NgayTao], [TinhTrang], [idNV], [idLND]) VALUES (7, N'quanly3', N'12345678', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 1, 5, 1)
INSERT [dbo].[NGUOIDUNG] ([idND], [TenDN], [MatKhau], [NgayTao], [TinhTrang], [idNV], [idLND]) VALUES (8, N'thungan3', N'12345678', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 1, 6, 2)
INSERT [dbo].[NGUOIDUNG] ([idND], [TenDN], [MatKhau], [NgayTao], [TinhTrang], [idNV], [idLND]) VALUES (9, N'kho3', N'12345678', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 1, 7, 3)
INSERT [dbo].[NGUOIDUNG] ([idND], [TenDN], [MatKhau], [NgayTao], [TinhTrang], [idNV], [idLND]) VALUES (10, N'thungan4', N'12345678', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 1, 8, 2)
INSERT [dbo].[NGUOIDUNG] ([idND], [TenDN], [MatKhau], [NgayTao], [TinhTrang], [idNV], [idLND]) VALUES (11, N'thungan5', N'12345678', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 1, 9, 2)
INSERT [dbo].[NGUOIDUNG] ([idND], [TenDN], [MatKhau], [NgayTao], [TinhTrang], [idNV], [idLND]) VALUES (12, N'thungan6', N'12345678', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 1, 10, 2)
INSERT [dbo].[NGUOIDUNG] ([idND], [TenDN], [MatKhau], [NgayTao], [TinhTrang], [idNV], [idLND]) VALUES (13, N'quanly4', N'12345678', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 1, 2, 1)
SET IDENTITY_INSERT [dbo].[NGUOIDUNG] OFF
GO
SET IDENTITY_INSERT [dbo].[NHANVIEN] ON 

INSERT [dbo].[NHANVIEN] ([idNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [NgayVL], [ChucVu], [TinhTrang], [GhiChu]) VALUES (1, N'Bùi Thái Hoàng', CAST(N'2004-07-26T00:00:00.000' AS DateTime), N'Nam', N'Ktx khu B', N'3016033867', CAST(N'2023-08-26T00:00:00.000' AS DateTime), N'Recruiting Manager', 1, N'')
INSERT [dbo].[NHANVIEN] ([idNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [NgayVL], [ChucVu], [TinhTrang], [GhiChu]) VALUES (2, N'Phạm Hoàng Duy', CAST(N'2004-07-26T00:00:00.000' AS DateTime), N'Nam', N'Alabatrap', N'0938318615', CAST(N'2023-08-27T00:00:00.000' AS DateTime), N'General Manager', 1, N'')
INSERT [dbo].[NHANVIEN] ([idNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [NgayVL], [ChucVu], [TinhTrang], [GhiChu]) VALUES (3, N'Cao Văn Hoàng', CAST(N'2004-07-26T00:00:00.000' AS DateTime), N'Nam', N'Ktx khu B', N'3016033867', CAST(N'2023-08-26T00:00:00.000' AS DateTime), N'Recruiting Manager', 1, N'')
INSERT [dbo].[NHANVIEN] ([idNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [NgayVL], [ChucVu], [TinhTrang], [GhiChu]) VALUES (4, N'Nguyễn Huỳnh Duy Hiếu', CAST(N'2004-07-26T00:00:00.000' AS DateTime), N'Nam', N'Ktx khu B', N'3016033867', CAST(N'2023-08-26T00:00:00.000' AS DateTime), N'Recruiting Manager', 1, N'')
INSERT [dbo].[NHANVIEN] ([idNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [NgayVL], [ChucVu], [TinhTrang], [GhiChu]) VALUES (5, N'Bùi Trọng Hoàng Huy', CAST(N'2004-07-26T00:00:00.000' AS DateTime), N'Nam', N'Ktx khu B', N'3016033867', CAST(N'2023-08-26T00:00:00.000' AS DateTime), N'Recruiting Manager', 1, N'')
INSERT [dbo].[NHANVIEN] ([idNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [NgayVL], [ChucVu], [TinhTrang], [GhiChu]) VALUES (6, N'Phan Châu Hoàng', CAST(N'2004-07-26T00:00:00.000' AS DateTime), N'Nam', N'Ktx khu B', N'3016033867', CAST(N'2023-08-26T00:00:00.000' AS DateTime), N'Recruiting Manager', 1, N'')
INSERT [dbo].[NHANVIEN] ([idNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [NgayVL], [ChucVu], [TinhTrang], [GhiChu]) VALUES (7, N'Mai Hoàng Hưng', CAST(N'2004-07-26T00:00:00.000' AS DateTime), N'Nam', N'Ktx khu B', N'3016033867', CAST(N'2023-08-26T00:00:00.000' AS DateTime), N'Recruiting Manager', 1, N'')
INSERT [dbo].[NHANVIEN] ([idNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [NgayVL], [ChucVu], [TinhTrang], [GhiChu]) VALUES (8, N'Tô Hoàng Huy', CAST(N'2004-07-26T00:00:00.000' AS DateTime), N'Nam', N'Ktx khu B', N'3016033867', CAST(N'2023-08-26T00:00:00.000' AS DateTime), N'Recruiting Manager', 1, N'')
INSERT [dbo].[NHANVIEN] ([idNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [NgayVL], [ChucVu], [TinhTrang], [GhiChu]) VALUES (9, N'Đỗ Nguyễn Hoàng Huy', CAST(N'2004-07-26T00:00:00.000' AS DateTime), N'Nam', N'Ktx khu B', N'3016033867', CAST(N'2023-08-26T00:00:00.000' AS DateTime), N'Recruiting Manager', 1, N'')
INSERT [dbo].[NHANVIEN] ([idNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [NgayVL], [ChucVu], [TinhTrang], [GhiChu]) VALUES (10, N'Phan Trần Tiến Hưng', CAST(N'2004-07-26T00:00:00.000' AS DateTime), N'Nam', N'Ktx khu B', N'3016033867', CAST(N'2023-08-26T00:00:00.000' AS DateTime), N'Recruiting Manager', 1, N'')
INSERT [dbo].[NHANVIEN] ([idNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [NgayVL], [ChucVu], [TinhTrang], [GhiChu]) VALUES (11, N'Lê Huy Hoàng', CAST(N'2004-07-26T00:00:00.000' AS DateTime), N'Nam', N'Ktx khu B', N'3016033867', CAST(N'2023-08-26T00:00:00.000' AS DateTime), N'Recruiting Manager', 1, N'')
SET IDENTITY_INSERT [dbo].[NHANVIEN] OFF
GO
SET IDENTITY_INSERT [dbo].[NHAPHANG] ON 

INSERT [dbo].[NHAPHANG] ([idNH], [NgayNhap], [ThanhTien], [GhiChu], [idND]) VALUES (1, CAST(N'2022-11-01T00:00:00.000' AS DateTime), 669346800.0000, NULL, 1)
INSERT [dbo].[NHAPHANG] ([idNH], [NgayNhap], [ThanhTien], [GhiChu], [idND]) VALUES (2, CAST(N'2022-12-01T00:00:00.000' AS DateTime), 682656800.0000, NULL, 1)
INSERT [dbo].[NHAPHANG] ([idNH], [NgayNhap], [ThanhTien], [GhiChu], [idND]) VALUES (3, CAST(N'2023-01-01T00:00:00.000' AS DateTime), 681811800.0000, NULL, 1)
INSERT [dbo].[NHAPHANG] ([idNH], [NgayNhap], [ThanhTien], [GhiChu], [idND]) VALUES (4, CAST(N'2023-02-01T00:00:00.000' AS DateTime), 765141800.0000, NULL, 1)
INSERT [dbo].[NHAPHANG] ([idNH], [NgayNhap], [ThanhTien], [GhiChu], [idND]) VALUES (5, CAST(N'2023-03-01T00:00:00.000' AS DateTime), 771341800.0000, NULL, 1)
INSERT [dbo].[NHAPHANG] ([idNH], [NgayNhap], [ThanhTien], [GhiChu], [idND]) VALUES (6, CAST(N'2023-04-01T00:00:00.000' AS DateTime), 725666800.0000, NULL, 1)
INSERT [dbo].[NHAPHANG] ([idNH], [NgayNhap], [ThanhTien], [GhiChu], [idND]) VALUES (7, CAST(N'2023-05-01T00:00:00.000' AS DateTime), 701281800.0000, NULL, 1)
INSERT [dbo].[NHAPHANG] ([idNH], [NgayNhap], [ThanhTien], [GhiChu], [idND]) VALUES (8, CAST(N'2023-06-01T00:00:00.000' AS DateTime), 787456800.0000, NULL, 1)
INSERT [dbo].[NHAPHANG] ([idNH], [NgayNhap], [ThanhTien], [GhiChu], [idND]) VALUES (9, CAST(N'2023-07-01T00:00:00.000' AS DateTime), 734731800.0000, NULL, 1)
INSERT [dbo].[NHAPHANG] ([idNH], [NgayNhap], [ThanhTien], [GhiChu], [idND]) VALUES (10, CAST(N'2023-08-01T00:00:00.000' AS DateTime), 1006361800.0000, NULL, 1)
INSERT [dbo].[NHAPHANG] ([idNH], [NgayNhap], [ThanhTien], [GhiChu], [idND]) VALUES (11, CAST(N'2023-09-01T00:00:00.000' AS DateTime), 921093800.0000, NULL, 1)
INSERT [dbo].[NHAPHANG] ([idNH], [NgayNhap], [ThanhTien], [GhiChu], [idND]) VALUES (12, CAST(N'2023-10-01T00:00:00.000' AS DateTime), 887396800.0000, NULL, 1)
INSERT [dbo].[NHAPHANG] ([idNH], [NgayNhap], [ThanhTien], [GhiChu], [idND]) VALUES (13, CAST(N'2023-11-01T00:00:00.000' AS DateTime), 692101800.0000, NULL, 1)
INSERT [dbo].[NHAPHANG] ([idNH], [NgayNhap], [ThanhTien], [GhiChu], [idND]) VALUES (14, CAST(N'2023-12-01T00:00:00.000' AS DateTime), 679966800.0000, NULL, 1)
SET IDENTITY_INSERT [dbo].[NHAPHANG] OFF
GO
INSERT [dbo].[PHANQUYEN] ([idLND], [idCN]) VALUES (1, 1)
INSERT [dbo].[PHANQUYEN] ([idLND], [idCN]) VALUES (1, 2)
INSERT [dbo].[PHANQUYEN] ([idLND], [idCN]) VALUES (1, 3)
INSERT [dbo].[PHANQUYEN] ([idLND], [idCN]) VALUES (1, 5)
INSERT [dbo].[PHANQUYEN] ([idLND], [idCN]) VALUES (1, 6)
INSERT [dbo].[PHANQUYEN] ([idLND], [idCN]) VALUES (1, 8)
INSERT [dbo].[PHANQUYEN] ([idLND], [idCN]) VALUES (1, 10)
INSERT [dbo].[PHANQUYEN] ([idLND], [idCN]) VALUES (2, 3)
INSERT [dbo].[PHANQUYEN] ([idLND], [idCN]) VALUES (2, 4)
INSERT [dbo].[PHANQUYEN] ([idLND], [idCN]) VALUES (2, 6)
INSERT [dbo].[PHANQUYEN] ([idLND], [idCN]) VALUES (2, 9)
INSERT [dbo].[PHANQUYEN] ([idLND], [idCN]) VALUES (3, 5)
INSERT [dbo].[PHANQUYEN] ([idLND], [idCN]) VALUES (3, 6)
INSERT [dbo].[PHANQUYEN] ([idLND], [idCN]) VALUES (3, 7)
GO
SET IDENTITY_INSERT [dbo].[PTTHANHTOAN] ON 

INSERT [dbo].[PTTHANHTOAN] ([idPT], [TenPT], [MoTa]) VALUES (1, N'Tiền mặt', N'')
INSERT [dbo].[PTTHANHTOAN] ([idPT], [TenPT], [MoTa]) VALUES (2, N'MoMo', N'')
INSERT [dbo].[PTTHANHTOAN] ([idPT], [TenPT], [MoTa]) VALUES (3, N'Ngân hàng', N'')
INSERT [dbo].[PTTHANHTOAN] ([idPT], [TenPT], [MoTa]) VALUES (4, N'ZaloPay', N'')
SET IDENTITY_INSERT [dbo].[PTTHANHTOAN] OFF
GO
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 

INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (1, N'Tiếng Gọi', N'Sách về thiên nhiên và môi trường', 1)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (2, N'Dế Mèn', N'Truyện kể về cuộc phiêu lưu của Dế Mèn', 1)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (3, N'Đất Rừng', N'Tác phẩm văn học nổi tiếng của nhà văn Knut Hamsun', 1)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (4, N'Nhà Giả Kim', N'Cuốn sách triết học nổi tiếng của Paulo Coelho', 1)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (5, N'Chí Phèo', N'Truyện ngắn nổi tiếng của nhà văn Nam Cao', 1)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (6, N'Hai Đứa Trẻ', N'Trinh thám của tác giả Higashino Keigo', 1)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (7, N'Chúng Ta', N'Truyện tình cảm của tác giả Federico Moccia', 1)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (8, N'The Alchemist', N'Novel by Paulo Coelho', 1)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (9, N'The Little Prince', N'Novel by Antoine de Saint-Exupéry', 1)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (10, N'One Hundred ', N'Novel by Gabriel García Márquez', 1)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (11, N'Bút Bi', N'Bút bi chất lượng cao cho việc viết', 2)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (12, N'Blocknote A5', N'Blocknote nhỏ gọn, tiện lợi', 2)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (13, N'FX-991ES Plus', N'Máy tính kỹ thuật số chính xác', 2)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (14, N'Bút Chì ', N'Bút chì chất lượng cho học sinh và nghệ sĩ', 2)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (15, N'USB', N'USB lưu trữ dữ liệu dung lượng cao', 2)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (16, N'Giấy A4', N'Giấy in chất lượng cao', 2)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (17, N'File GCC', N'File gia công chắc chắn', 2)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (18, N'Máy In', N'Máy in laser đen trắng', 2)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (19, N'Gọng Kính', N'Gọng kính thời trang cho văn phòng', 2)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (20, N'Túi Xách', N'Túi xách da thời trang', 2)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (21, N'Xe DK', N'Xe đồ chơi có thể điều khiển từ xa', 3)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (22, N'Búp Bê', N'Búp bê Barbie xinh xắn cho bé gái', 3)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (23, N'Xe Đạp', N'Xe đạp dành cho trẻ em', 3)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (24, N'Lego Duplo', N'Bộ xây dựng Lego cho trẻ em', 3)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (25, N'Đồ Chơi', N'Đồ chơi giáo dục cho bé', 3)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (26, N'Mô Hình Robot', N'Mô hình robot điều khiển bằng điện thoại', 3)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (27, N'Gấu Bông ', N'Gấu bông mềm mại cho bé', 3)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (28, N'Ô Tô Điện', N'Xe ô tô mini điều khiển từ xa', 3)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (29, N'Đồ Chơi TT', N'Đồ chơi giúp phát triển trí tuệ cho bé', 3)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (30, N'Đồ Chơi VD', N'Đồ chơi giúp trẻ phát triển vận động', 3)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (31, N'Bút Mực ', N'Bút mực cao cấp cho việc viết và vẽ', 4)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (32, N'Kéo Màu', N'Kéo màu chất lượng cho học sinh và nghệ sĩ', 4)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (33, N'FX-570ES Plus', N'Máy tính kỹ thuật số chính xác', 4)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (34, N'VDSV', N'Bộ vật dụng học tập cần thiết cho sinh viên', 4)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (35, N'Đèn Học', N'Đèn học LED có thể điều chỉnh độ sáng', 4)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (36, N'Phấn Màu ', N'Phấn màu chất lượng cho học sinh', 4)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (37, N'GCVB', N'Dịch vụ gia công văn bản chất lượng', 4)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (38, N'Túi Đựng Laptop', N'Túi đựng laptop chống sốc', 4)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (39, N'FX-85ES Plus', N'Máy tính kỹ thuật số chính xác', 4)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (40, N'Vật Dụng Học Tập', N'Bộ vật dụng học tập cần thiết cho học sinh', 4)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (41, N'Móc Khóa', N'Móc khóa lưu niệm độc đáo', 5)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (42, N'Ấn Độ Huyền Bí', N'Du lịch ảo đến những địa điểm nổi tiếng ở Ấn Độ', 5)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (43, N'Chibi Nhật Bản', N'Mô hình chibi về văn hóa Nhật Bản', 5)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (44, N'Tranh Cổ Điển', N'Bức tranh nghệ thuật cổ điển đẹp mắt', 5)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (45, N'Đèn Trang Trí', N'Đèn trang trí phòng ngủ tạo không gian ấm cúng', 5)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (46, N'Quạt Trang Trí', N'Quạt trang trí vintage cho phòng khách', 5)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (47, N'Gối Trang Trí', N'Gối trang trí phòng khách và phòng ngủ', 5)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (48, N'Tượng Phật', N'Tượng phật Di Lặc mang lại sự may mắn', 5)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (49, N'Chai Nước ', N'Chai nước lưu niệm với hình ảnh độc đáo', 5)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (50, N'Tranh Trừu Tượng', N'Bức tranh trừu tượng tạo điểm nhấn cho phòng khách', 5)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (51, N'The Great Gatsby', N'Novel by F. Scott Fitzgerald', 6)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (52, N'Pride', N'Novel by Jane Austen', 6)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (53, N'To Kill', N'Novel by Harper Lee', 6)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (54, N'1984', N'Novel by George Orwell', 6)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (55, N'Brave ', N'Novel by Aldous Huxley', 6)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (56, N'The Catcher', N'Novel by J.D. Salinger', 6)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (57, N'One Hundred', N'Novel by Gabriel García Márquez', 6)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (58, N'Moby-Dick', N'Novel by Herman Melville', 6)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (59, N'The Odyssey', N'Epic poem attributed to Homer', 6)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (60, N'The Iliad', N'Epic poem attributed to Homer', 6)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (61, N'SGK Toán 12', N'Sách giáo khoa dành cho học sinh lớp 12 môn Toán', 7)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (62, N'SGK Văn 10', N'Sách giáo khoa dành cho học sinh lớp 10 môn Văn', 7)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (63, N'SGK Lịch Sử 8', N'Sách giáo khoa dành cho học sinh lớp 8 môn Lịch Sử', 7)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (64, N'SGK Địa Lý 6', N'Sách giáo khoa dành cho học sinh lớp 6 môn Địa Lý', 7)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (65, N'SGK Ngữ Văn 11', N'Sách giáo khoa dành cho học sinh lớp 11 môn Ngữ Văn', 7)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (66, N'SGK Vật Lý 9', N'Sách giáo khoa dành cho học sinh lớp 9 môn Vật Lý', 7)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (67, N'SGK Hóa Học 7', N'Sách giáo khoa dành cho học sinh lớp 7 môn Hóa Học', 7)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (68, N'SGK Sinh Học 10', N'Sách giáo khoa dành cho học sinh lớp 10 môn Sinh Học', 7)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (69, N'SGK Ngoại Ngữ 8', N'Sách giáo khoa dành cho học sinh lớp 8 môn Ngoại Ngữ', 7)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (70, N'SGK Công Nghệ 12', N'Sách giáo khoa dành cho học sinh lớp 12 môn Công Nghệ', 7)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (71, N'GT Python', N'Giáo trình hướng dẫn lập trình Python từ cơ bản đến nâng cao', 8)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (72, N'GT Kế Toán ', N'Giáo trình hướng dẫn kế toán tài chính trong doanh nghiệp', 8)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (73, N'GT Marketing ', N'Giáo trình về chiến lược và kỹ thuật marketing online', 8)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (74, N'GT Quản Trị Dự Án', N'Giáo trình hướng dẫn quản lý dự án hiệu quả', 8)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (75, N'Giáo Trình HDH', N'Giáo trình về hệ điều hành trong lập trình', 8)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (76, N'GT Blockchain', N'Giáo trình về nền tảng công nghệ Blockchain', 8)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (77, N'GT Web', N'Giáo trình hướng dẫn lập trình web và phát triển ứng dụng', 8)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (78, N'GT Quản Lý Nhân Sự', N'Giáo trình về quản lý nhân sự trong tổ chức', 8)
INSERT [dbo].[SANPHAM] ([idSP], [TenSP], [MoTa], [idDM]) VALUES (79, N'GT Thống Kê', N'Giáo trình về thống kê trong lĩnh vực kinh tế', 8)
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NGUOIDUN__4CF96558C8EE1417]    Script Date: 1/3/2024 8:01:56 AM ******/
ALTER TABLE [dbo].[NGUOIDUNG] ADD UNIQUE NONCLUSTERED 
(
	[TenDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD FOREIGN KEY([idCTSP])
REFERENCES [dbo].[CTSP] ([idCTSP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD FOREIGN KEY([idHD])
REFERENCES [dbo].[HOADON] ([idHD])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTSP]  WITH CHECK ADD FOREIGN KEY([idNH])
REFERENCES [dbo].[NHAPHANG] ([idNH])
GO
ALTER TABLE [dbo].[CTSP]  WITH CHECK ADD FOREIGN KEY([idSP])
REFERENCES [dbo].[SANPHAM] ([idSP])
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD FOREIGN KEY([idKH])
REFERENCES [dbo].[KHACHHANG] ([idKH])
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD FOREIGN KEY([idKM])
REFERENCES [dbo].[KHUYENMAI] ([idKM])
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD FOREIGN KEY([idLKH])
REFERENCES [dbo].[LOAIKHACHHANG] ([idLKH])
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD FOREIGN KEY([idND])
REFERENCES [dbo].[NGUOIDUNG] ([idND])
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD FOREIGN KEY([idPT])
REFERENCES [dbo].[PTTHANHTOAN] ([idPT])
GO
ALTER TABLE [dbo].[KHACHHANG]  WITH CHECK ADD FOREIGN KEY([idLKH])
REFERENCES [dbo].[LOAIKHACHHANG] ([idLKH])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KHUYENMAI]  WITH CHECK ADD FOREIGN KEY([idLKH])
REFERENCES [dbo].[LOAIKHACHHANG] ([idLKH])
GO
ALTER TABLE [dbo].[KHUYENMAI]  WITH CHECK ADD FOREIGN KEY([idND])
REFERENCES [dbo].[NGUOIDUNG] ([idND])
GO
ALTER TABLE [dbo].[NGUOIDUNG]  WITH CHECK ADD FOREIGN KEY([idLND])
REFERENCES [dbo].[LOAINGUOIDUNG] ([idLND])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NGUOIDUNG]  WITH CHECK ADD FOREIGN KEY([idNV])
REFERENCES [dbo].[NHANVIEN] ([idNV])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NHAPHANG]  WITH CHECK ADD FOREIGN KEY([idND])
REFERENCES [dbo].[NGUOIDUNG] ([idND])
GO
ALTER TABLE [dbo].[PHANQUYEN]  WITH CHECK ADD FOREIGN KEY([idCN])
REFERENCES [dbo].[CHUCNANG] ([idCN])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PHANQUYEN]  WITH CHECK ADD FOREIGN KEY([idLND])
REFERENCES [dbo].[LOAINGUOIDUNG] ([idLND])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD FOREIGN KEY([idDM])
REFERENCES [dbo].[DANHMUC] ([idDM])
GO
ALTER TABLE [dbo].[SANPHAMLOI]  WITH CHECK ADD FOREIGN KEY([idCTSP])
REFERENCES [dbo].[CTSP] ([idCTSP])
GO
ALTER TABLE [dbo].[SANPHAMLOI]  WITH CHECK ADD FOREIGN KEY([idND])
REFERENCES [dbo].[NGUOIDUNG] ([idND])
GO
USE [master]
GO
ALTER DATABASE [QLNS] SET  READ_WRITE 
GO
