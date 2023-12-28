﻿DROP DATABASE QLNS
GO
CREATE DATABASE QLNS
GO
USE QLNS

GO
CREATE TABLE CHUCNANG (
	idCN int primary key IDENTITY(1,1),
	MaCN AS CAST('CN' + right('000' + CAST(idCN as varchar(3)), 3) as char(6))persisted,
	TenCN NVARCHAR(MAX) NOT NULL, 
	MoTa NVARCHAR(MAX),
);

GO
CREATE TABLE LOAINGUOIDUNG (
	idLND int IDENTITY(1,1) primary key,
	MaLND AS CAST('LND' + right('000' + CAST(idLND as varchar(3)), 3) AS CHAR(6)) persisted ,
	TenLND NVARCHAR(MAX) NOT NULL,
	MoTa NVARCHAR(MAX),
);

GO
CREATE TABLE PHANQUYEN (
	idLND INT FOREIGN KEY REFERENCES LOAINGUOIDUNG on delete cascade,
    idCN INT FOREIGN KEY REFERENCES CHUCNANG on delete cascade,
    PRIMARY KEY (idLND, idCN),
);

GO
CREATE TABLE NHANVIEN (
	idNV INT IDENTITY(1,1) PRIMARY KEY,
	MaNV AS CAST('NV'+ RIGHT('000000' + CAST(idNV AS VARCHAR(4)), 4) AS CHAR(8)) PERSISTED,
	TenNV NVARCHAR(MAX) NOT NULL,
	NgaySinh DATETIME NOT NULL, 
	GioiTinh NVARCHAR(MAX) NOT NULL,
	DiaChi NVARCHAR(MAX),
	SDT VARCHAR(10),
	NgayVL Datetime NOT NULL, 
	ChucVu NVARCHAR(MAX) NOT NULL,
	TinhTrang INT NOT NULL,
	GhiChu NVARCHAR(MAX),
);

GO
CREATE TABLE NGUOIDUNG (
	idND INT IDENTITY(1,1) PRIMARY KEY,
	MaND AS CAST('ND'+ RIGHT('000000' + CAST(idND AS VARCHAR(4)), 4) AS CHAR(8)) PERSISTED,
	TenDN VARCHAR(50) UNIQUE NOT NULL,
	MatKhau VARCHAR(MAX) NOT NULL,
	NgayTao DATETIME NOT NULL,
	TinhTrang INT NOT NULL,
	idNV INT REFERENCES NHANVIEN ON DELETE CASCADE NOT NULL,
    idLND INT REFERENCES LOAINGUOIDUNG on delete cascade NOT NULL,
);

GO
CREATE TABLE LOAIKHACHHANG (
	idLKH INT IDENTITY(1,1) PRIMARY KEY,
	MaLKH AS CAST('LKH'+ RIGHT('000' + CAST(idLKH AS VARCHAR(3)), 3) AS CHAR(6))PERSISTED,
	TenLKH NVARCHAR(MAX) NOT NULL,
	MoTa NVARCHAR(MAX),
	DiemTichLuyToiThieu INT NOT NULL,
);

GO
CREATE TABLE KHACHHANG (
	idKH int IDENTITY(1,1) PRIMARY KEY,
	MaKH AS CAST('KH'+ RIGHT('00000' + CAST(idKH AS VARCHAR(5)), 5) AS CHAR(10))PERSISTED,
	TenKH NVARCHAR(MAX) NOT NULL,
	GioiTinh NVARCHAR(MAX) NOT NULL,
	NgaySinh DATETIME,
	DiaChi NVARCHAR(MAX),
	SDT VARCHAR(10) NOT NULL,
	NgayTG DATETIME NOT NULL, 
	DiemTichLuy INT NOT NULL,
    idLKH INT REFERENCES LOAIKHACHHANG on delete cascade NOT NULL,
);

GO
CREATE TABLE DANHMUC (
	idDM int IDENTITY(1,1)  primary key,
	MaDM As Cast('DM' + right('000' + CAST(idDM as varchar(3)), 3) as char(6)) persisted,  
	TenDM NVARCHAR(MAX) NOT NULL,
	MoTa NVARCHAR(MAX),
);

--GO 
--CREATE TABLE DONVITINH(
--	idDVT INT IDENTITY(1,1) PRIMARY KEY,
--	MaDVT AS cast('DVT'+ right('000' + CAST(idDVT AS VARCHAR(3)), 3) as char(6)) PERSISTED,
--	TenDVT NVARCHAR(MAX) NOT NULL,
--);

GO
CREATE TABLE SANPHAM (
	idSP INT IDENTITY(1,1) PRIMARY KEY,
	MaSP AS cast('TTSP'+ right('0000000' + CAST(idSP AS VARCHAR(4)), 4) as char(8)) PERSISTED,
	TenSP NVARCHAR(MAX) NOT NULL,
	MoTa NVARCHAR(MAX),
	idDM int references DANHMUC NOT NULL,
);

GO
CREATE TABLE NHAPHANG (
	idNH INT IDENTITY(1,1) PRIMARY KEY,
	MaNH AS CAST('NH'+ RIGHT('000000' + CAST(idNH AS VARCHAR(5)), 5) AS CHAR(10)) PERSISTED,
	NgayNhap DATETIME NOT NULL,
	ThanhTien MONEY NOT NULL,
	GhiChu NVARCHAR(MAX),
	idND INT REFERENCES NGUOIDUNG NOT NULL,
);

GO
CREATE TABLE CTSP (
	idCTSP int IDENTITY(1,1) primary key,
	MaCTSP AS CAST('SP'+ RIGHT('000000' + CAST(idCTSP AS VARCHAR(5)), 5) AS CHAR(10)) PERSISTED,
	DonGiaNhap MONEY NOT NULL,
	SoLuongNhap SMALLINT NOT NULL,
	SoLuongLoi SMALLINT NOT NULL,
	DonGiaXuat MONEY NOT NULL,
	DaBan SMALLINT NOT NULL,
	SLConLai SMALLINT NOT NULL,
	GhiChu NVARCHAR(MAX),
	--Tình trạng: 
	--0 Đã bán hết
	--1 Còn hàng
	--2 Đã ẩn
	--3 Ngừng bán
	TinhTrang INT NOT NULL,
	idSP INT REFERENCES SANPHAM NOT NULL,
	idNH INT REFERENCES NHAPHANG NOT NULL,
);

GO 
CREATE TABLE SANPHAMLOI (
	idSPL INT IDENTITY(1,1) PRIMARY KEY,
	MaSPL AS CAST('SPL'+ RIGHT('0000' + CAST(idSPL AS VARCHAR(4)), 4) AS CHAR(8)) PERSISTED,
	idCTSP INT REFERENCES CTSP NOT NULL,
	SoLuongLoi SMALLINT NOT NULL,
	NgayLoi DATETIME NOT NULL,
	ChiTietLoi NVARCHAR(MAX),
	GhiChu NVARCHAR(MAX),
	idND INT REFERENCES NGUOIDUNG NOT NULL,
);

GO
CREATE TABLE KHUYENMAI (
	idKM INT IDENTITY(1,1) PRIMARY KEY,
	MaKM AS CAST('KM'+ RIGHT('000' + CAST(idKM AS VARCHAR(3)), 3) AS CHAR(6)) PERSISTED,
	TenKM NVARCHAR(MAX) NOT NULL,
	MoTa NVARCHAR(MAX),
	idLKH INT REFERENCES LOAIKHACHHANG NOT NULL, 
	NgayBD DATETIME NOT NULL,
	NgayKT DATETIME NOT NULL,
	GiamGia SMALLINT NOT NULL,
	idND INT REFERENCES NGUOIDUNG NOT NULL,
);

GO 
CREATE TABLE PTTHANHTOAN (
	idPT INT IDENTITY(1,1) PRIMARY KEY,
	MaPT AS CAST('PT' + RIGHT('000' + CAST(idPT AS VARCHAR(2)), 2) AS CHAR(4)) PERSISTED,
	TenPT NVARCHAR(MAX) NOT NULL,
	MoTa NVARCHAR(MAX),
);

GO
CREATE TABLE HOADON (
	idHD int IDENTITY(1,1) primary key,
	SoHD AS CAST('HD'+ RIGHT('000000' + CAST(idHD AS VARCHAR(6)), 6) AS CHAR(12)) PERSISTED,
	NgayHD DATETIME NOT NULL,
	SLSP INT NOT NULL,
	ThanhTien MONEY NOT NULL,
	GiamGia MONEY NOT NULL,
	ThanhToan MONEY NOT NULL,
	GhiChu NVARCHAR(MAX),
	idLKH INT REFERENCES LOAIKHACHHANG,
	idKH INT REFERENCES KHACHHANG,
	idKM INT REFERENCES KHUYENMAI,
	idND INT REFERENCES NGUOIDUNG NOT NULL,
	idPT INT REFERENCES PTTHANHTOAN NOT NULL,
);

GO
CREATE TABLE CTHD (
	idCTHD int IDENTITY(1,1) primary key,
	idHD INT FOREIGN KEY REFERENCES HOADON on delete cascade NOT NULL,
    idCTSP INT FOREIGN KEY REFERENCES CTSP on delete cascade NOT NULL,
	SoLuong INT NOT NULL,
	DonGia MONEY NOT NULL,
	ThanhTien MONEY NOT NULL,
);