create database quanlynhathuoc1
go
USE [quanlynhathuoc1]
GO
/****** Object:  StoredProcedure [dbo].[sp_DoanhThu]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SELECT 
			convert(nvarchar(10), NgayBan, 103) AS NgayBan,		
			COUNT(DISTINCT HoaDon.MaHD) AS TongHoaDon,
			SUM(HoaDonChiTiet.SoLuong * HoaDonChiTiet.DonGia) AS DoanhThu,
			SUM(HoaDonChiTiet.SoLuong * HangHoa.GiaVon) AS TongGiaVon,
			SUM(HoaDonChiTiet.SoLuong * HoaDonChiTiet.DonGia) - SUM(HoaDonChiTiet.SoLuong * HangHoa.GiaVon) AS LoiNhuan
		FROM HoaDon INNER JOIN HoaDonChiTiet ON HoaDon.MAHD = HoaDonChiTiet.MaHDCT INNER JOIN HangHoa ON HoaDonChiTiet.MaHH = HangHoa.MAHH
		WHERE MONTH(HoaDon.NgayBan) = 8
		GROUP BY NgayBan
CREATE PROC [dbo].[sp_DoanhThu] (@Month varchar)
AS BEGIN
		SELECT 
			convert(nvarchar(10), NgayBan, 103) AS NgayBan,		
			COUNT(DISTINCT HoaDon.MaHD) AS TongHoaDon,
			SUM(HoaDonChiTiet.SoLuong * HoaDonChiTiet.DonGia) AS DoanhThu,
			SUM(HoaDonChiTiet.SoLuong * HangHoa.GiaVon) AS TongGiaVon,
			SUM(HoaDonChiTiet.SoLuong * HoaDonChiTiet.DonGia) - SUM(HoaDonChiTiet.SoLuong * HangHoa.GiaVon) AS LoiNhuan
		FROM HoaDon INNER JOIN HoaDonChiTiet ON HoaDon.MAHD = HoaDonChiTiet.MaHDCT INNER JOIN HangHoa ON HoaDonChiTiet.MaHH = HangHoa.MAHH
		WHERE MONTH(HoaDon.NgayBan) = @Month
		GROUP BY NgayBan
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DoanhThu_Ngay]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DoanhThu_Ngay] (@varchar varchar(10))
AS BEGIN 
		SELECT 
			convert(nvarchar(10), NgayBan, 103) AS NgayBan,		
			COUNT(DISTINCT HoaDon.MaHD) AS TongHoaDon,
			SUM(HoaDonChiTiet.SoLuong * HoaDonChiTiet.DonGia) AS DoanhThu,
			SUM(HoaDonChiTiet.SoLuong * HangHoa.GiaVon) AS TongGiaVon,
			SUM(HoaDonChiTiet.SoLuong * HoaDonChiTiet.DonGia) - SUM(HoaDonChiTiet.SoLuong * HangHoa.GiaVon) AS LoiNhuan
		FROM HoaDon INNER JOIN HoaDonChiTiet ON HoaDon.MAHD = HoaDonChiTiet.MaHDCT INNER JOIN HangHoa ON HoaDonChiTiet.MaHH = HangHoa.MAHH
		WHERE convert(nvarchar(10), NgayBan, 103)= @varchar
		GROUP BY NgayBan
END
GO
/****** Object:  StoredProcedure [dbo].[sp_HangHoa_ConHang]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_HangHoa_ConHang] AS
BEGIN
	SELECT 
		hh.MAHH,
		dmt.TenThuoc,
		hh.SoLo,
		hh.HSD,
		hh.SoLuongGoc,
		hh.DonViGoc
	FROM HangHoa hh JOIN DanhMucThuoc dmt ON hh.MaThuoc =dmt.MATHUOC
	WHERE SoLuongGoc > 5 
	ORDER BY SoLuongGoc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_HangHoa_DaHet]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_HangHoa_DaHet] AS
BEGIN
	SELECT 
		hh.MAHH,
		dmt.TenThuoc,
		hh.SoLo,
		hh.HSD,
		hh.SoLuongGoc,
		hh.DonViGoc
	FROM HangHoa hh JOIN DanhMucThuoc dmt ON hh.MaThuoc =dmt.MATHUOC
	WHERE SoLuongGoc <= 0
	ORDER BY SoLuongGoc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_HangHoa_SapHet]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_HangHoa_SapHet] AS
BEGIN
	SELECT 
		hh.MAHH,
		dmt.TenThuoc,
		hh.SoLo,
		hh.HSD,
		hh.SoLuongGoc,
		hh.DonViGoc
	FROM HangHoa hh JOIN DanhMucThuoc dmt ON hh.MaThuoc =dmt.MATHUOC
	WHERE SoLuongGoc <= 5 AND SoLuongGoc > 0
	ORDER BY SoLuongGoc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_HanSuDung_HetHan]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_HanSuDung_HetHan] AS 
BEGIN
	SELECT 
		hh.MAHH,
		dmt.TenThuoc,
		hh.SoLo,
		convert(nvarchar(10), hh.HSD, 103) AS HSD,
		hh.SoLuongGoc,
		hh.DonViGoc
	FROM HangHoa hh JOIN DanhMucThuoc dmt ON hh.MaThuoc =dmt.MATHUOC
	WHERE HSD <=GETDATE()
	ORDER BY SoLuongGoc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_HanSuDung_SapHetHan]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_HanSuDung_SapHetHan] AS 
BEGIN
	SELECT 
		hh.MAHH,
		dmt.TenThuoc,
		hh.SoLo,
		convert(nvarchar(10), hh.HSD, 103) AS HSD,
		hh.SoLuongGoc,
		hh.DonViGoc
	FROM HangHoa hh JOIN DanhMucThuoc dmt ON hh.MaThuoc =dmt.MATHUOC
	WHERE HSD <= DATEADD(month, 1, GETDATE()) AND HSD > GETDATE()
	ORDER BY SoLuongGoc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_HanSuDung_Tot]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_HanSuDung_Tot] AS 
BEGIN
	SELECT 
		hh.MAHH,
		dmt.TenThuoc,
		hh.SoLo,
		convert(nvarchar(10), hh.HSD, 103) AS HSD,
		hh.SoLuongGoc,
		hh.DonViGoc
	FROM HangHoa hh JOIN DanhMucThuoc dmt ON hh.MaThuoc =dmt.MATHUOC
	WHERE HSD > DATEADD(month, 1, GETDATE())
	ORDER BY SoLuongGoc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHangThanThiet]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_KhachHangThanThiet]
AS BEGIN
		SELECT 
			hd.MAKH, 
			kh.TenKH,
			kh.SDT,			
			COUNT(hd.MaKH) AS SoLanMua,
			kh.Diem		
		FROM HoaDon hd JOIN KhachHang kh ON hd.MaKH = kh.MAKH
		GROUP BY hd.MAKH, kh.TenKH, kh.SDT, kh.Diem		
		ORDER BY SoLanMua DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHangThanThiet_Ten]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_KhachHangThanThiet_Ten] (@thang varchar, @ten nvarchar(100)) AS
BEGIN
	SELECT 
			hd.MAKH, 
			kh.TenKH,
			kh.SDT,			
			COUNT(hd.MaKH) AS SoLanMua,
			kh.Diem		
	FROM HoaDon hd JOIN KhachHang kh ON hd.MaKH = kh.MAKH
	WHERE MONTH(hd.NgayBan) = @thang AND kh.TenKH = @ten
	GROUP BY hd.MAKH, kh.TenKH, kh.SDT, kh.Diem		
	ORDER BY SoLanMua DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHangThanThiet_Ten_TatCa]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_KhachHangThanThiet_Ten_TatCa] (@ten nvarchar(100)) AS
BEGIN
	SELECT 
			hd.MAKH, 
			kh.TenKH,
			kh.SDT,			
			COUNT(hd.MaKH) AS SoLanMua,
			kh.Diem		
	FROM HoaDon hd JOIN KhachHang kh ON hd.MaKH = kh.MAKH
	WHERE kh.TenKH =  @ten
	GROUP BY hd.MAKH, kh.TenKH, kh.SDT, kh.Diem		
	ORDER BY SoLanMua DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHangThanThiet_TheoThang]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_KhachHangThanThiet_TheoThang] (@Month varchar)
AS BEGIN
	SELECT 
			hd.MAKH, 
			kh.TenKH,
			kh.SDT,			
			COUNT(hd.MaKH) AS SoLanMua,
			kh.Diem		
		FROM HoaDon hd JOIN KhachHang kh ON hd.MaKH = kh.MAKH
		WHERE MONTH(hd.NgayBan) = @Month
		GROUP BY hd.MAKH, kh.TenKH, kh.SDT, kh.Diem		
		ORDER BY SoLanMua DESC

END
GO
/****** Object:  StoredProcedure [dbo].[sp_ThuocNoiBat]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ThuocNoiBat] AS 
BEGIN
	SELECT 
		HangHoa.MAHH,
		DanhMucThuoc.TenThuoc,	
		COUNT(HoaDonChiTiet.MaHH) AS SoLanBan
	FROM  HoaDonChiTiet JOIN HangHoa ON HoaDonChiTiet.MaHH = HangHoa.MAHH JOIN DanhMucThuoc 
		ON HangHoa.MaThuoc = DanhMucThuoc.MATHUOC JOIN HoaDon ON HoaDon.MAHD = HoaDonChiTiet.MaHDCT
	GROUP BY DanhMucThuoc.TenThuoc, HangHoa.MAHH
	ORDER BY SoLanBan DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ThuocNoiBat_Thang]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ThuocNoiBat_Thang] (@Month varchar) AS 
BEGIN
	SELECT
		HangHoa.MAHH,
		DanhMucThuoc.TenThuoc,
		COUNT(HoaDonChiTiet.MaHH) AS SoLanBan
	FROM  HoaDonChiTiet JOIN HangHoa ON HoaDonChiTiet.MaHH = HangHoa.MAHH JOIN DanhMucThuoc 
		ON HangHoa.MaThuoc = DanhMucThuoc.MATHUOC JOIN HoaDon ON HoaDon.MAHD = HoaDonChiTiet.MaHDCT
	WHERE MONTH(HoaDon.NgayBan) = @Month
	GROUP BY DanhMucThuoc.TenThuoc, HangHoa.MAHH
	ORDER BY SoLanBan DESC
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ThuocNoiBat_Thuoc]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ThuocNoiBat_Thuoc] (@thuoc nvarchar(50), @thang varchar) AS
BEGIN
	SELECT
		COUNT(HoaDonChiTiet.MaHH) AS SoLanBan,
		HangHoa.MAHH,
		DanhMucThuoc.TenThuoc		
	FROM  HoaDonChiTiet JOIN HangHoa ON HoaDonChiTiet.MaHH = HangHoa.MAHH JOIN DanhMucThuoc 
		ON HangHoa.MaThuoc = DanhMucThuoc.MATHUOC JOIN HoaDon ON HoaDon.MAHD = HoaDonChiTiet.MaHDCT
	WHERE DanhMucThuoc.TenThuoc = @thuoc AND MONTH(HoaDon.NgayBan) = @thang
	GROUP BY DanhMucThuoc.TenThuoc, HangHoa.MAHH
	ORDER BY SoLanBan DESC		
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ThuocNoiBat_Thuoc_TatCa]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_ThuocNoiBat_Thuoc_TatCa] (@thuoc nvarchar(50)) AS
BEGIN
	SELECT
		COUNT(HoaDonChiTiet.MaHH) AS SoLanBan,
		HangHoa.MAHH,
		DanhMucThuoc.TenThuoc		
	FROM  HoaDonChiTiet JOIN HangHoa ON HoaDonChiTiet.MaHH = HangHoa.MAHH JOIN DanhMucThuoc 
		ON HangHoa.MaThuoc = DanhMucThuoc.MATHUOC JOIN HoaDon ON HoaDon.MAHD = HoaDonChiTiet.MaHDCT
	WHERE DanhMucThuoc.TenThuoc = @thuoc 
	GROUP BY DanhMucThuoc.TenThuoc, HangHoa.MAHH
	ORDER BY SoLanBan DESC		
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TonKho]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_TonKho] AS 
BEGIN
	SELECT 
		hh.MAHH,
		dmt.TenThuoc,
		hh.SoLo,
		convert(nvarchar(10), hh.HSD, 103) AS HSD,			
		hh.SoLuongGoc,
		hh.DonViGoc
	FROM HangHoa hh JOIN DanhMucThuoc dmt ON hh.MaThuoc =dmt.MATHUOC
	ORDER BY SoLuongGoc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TonKho_Tim]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_TonKho_Tim] (@ten nvarchar(100)) AS 
BEGIN
	SELECT 
		hh.MAHH,
		dmt.TenThuoc,
		hh.SoLo,
		convert(nvarchar(10), hh.HSD, 103) AS HSD,			
		hh.SoLuongGoc,
		hh.DonViGoc
	FROM HangHoa hh JOIN DanhMucThuoc dmt ON hh.MaThuoc =dmt.MATHUOC
	WHERE dmt.TenThuoc = @ten
	ORDER BY SoLuongGoc
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDDMT]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDDMT]()
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @ID VARCHAR(7)
	IF (SELECT COUNT(MATHUOC) FROM DANHMUCTHUOC) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MATHUOC, 5)) FROM DANHMUCTHUOC
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'TH0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'TH000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 and @ID < 999  THEN 'TH00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 and @ID < 9999  THEN 'TH0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >=9999 and @ID < 99999 THEN 'TH' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDHD]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDHD]()
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @ID VARCHAR(7)
	IF (SELECT COUNT(MAHD) FROM HOADON) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MAHD, 5)) FROM HOADON
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'HD0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'HD000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 and @ID < 999  THEN 'HD00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 and @ID < 9999  THEN 'HD0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >=9999 and @ID < 99999 THEN 'HD' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDHH]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDHH]()
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @ID VARCHAR(7)
	IF (SELECT COUNT(MAHH) FROM HANGHOA) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MAHH, 5)) FROM HANGHOA
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'HH0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'HH000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 and @ID < 999  THEN 'HH00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 and @ID < 9999  THEN 'HH0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >=9999 and @ID < 99999 THEN 'HH' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDKH]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDKH]()
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @ID VARCHAR(7)
	IF (SELECT COUNT(MAKH) FROM KHACHHANG) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MAKH, 5)) FROM KHACHHANG
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'KH0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'KH000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 and @ID < 999  THEN 'KH00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 and @ID < 9999  THEN 'KH0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >=9999 and @ID < 99999 THEN 'KH' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDNT]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDNT]()
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @ID VARCHAR(7)
	IF (SELECT COUNT(MANT) FROM NHOMTHUOC) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MANT, 5)) FROM NHOMTHUOC
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'NT0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'NT000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 and @ID < 999  THEN 'NT00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 and @ID < 9999  THEN 'NT0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >=9999 and @ID < 99999 THEN 'NT' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO
/****** Object:  Table [dbo].[DanhMucThuoc]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DanhMucThuoc](
	[MATHUOC] [char](7) NOT NULL,
	[TenThuoc] [nvarchar](50) NOT NULL,
	[SoDK] [nvarchar](50) NULL,
	[HangSX] [nvarchar](50) NULL,
	[NoiSX] [nvarchar](30) NULL,
	[DonViGoc] [nvarchar](20) NOT NULL,
	[DonViQuiDoi] [nvarchar](20) NOT NULL,
	[SoLuongQuiDoi] [float] NOT NULL,
	[DongGoi] [nvarchar](50) NULL,
	[MaNT] [char](7) NOT NULL,
	[HoatChat] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MATHUOC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HangHoa](
	[MAHH] [char](7) NOT NULL,
	[MaThuoc] [char](7) NOT NULL,
	[SoLo] [nvarchar](30) NOT NULL,
	[HSD] [date] NOT NULL,
	[SoLuongGoc] [float] NOT NULL,
	[DonViGoc] [nvarchar](20) NOT NULL,
	[SLSauQuiDoi] [float] NOT NULL,
	[DonViQuiDoi] [nvarchar](20) NOT NULL,
	[GiaVon] [float] NOT NULL,
	[GiaBan] [float] NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
	[NgayTao] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MAHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MAHD] [char](7) NOT NULL,
	[MaNV] [nvarchar](10) NOT NULL,
	[NgayBan] [date] NOT NULL,
	[MaKH] [char](7) NOT NULL,
	[TongTien] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MAHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDonChiTiet]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDonChiTiet](
	[MaHDCT] [char](7) NOT NULL,
	[MaHH] [char](7) NOT NULL,
	[SoLuong] [float] NOT NULL,
	[DonGia] [float] NOT NULL,
 CONSTRAINT [PK_HoaDonChiTiet] PRIMARY KEY CLUSTERED 
(
	[MaHDCT] ASC,
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MAKH] [char](7) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[SDT] [nchar](10) NULL,
	[NamSinh] [int] NULL,
	[Diem] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MAKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](10) NOT NULL,
	[TenNV] [nvarchar](50) NOT NULL,
	[SDT] [nchar](10) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[VaiTro] [bit] NOT NULL,
	[Hinh] [nvarchar](100) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhomThuoc]    Script Date: 8/13/2021 8:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhomThuoc](
	[MANT] [char](7) NOT NULL,
	[TenNT] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MANT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00001', N'Panadol', N'VN-22261-19', N'GlaxoSmithKline Pte., Ltd.', N'Singapore', N'Hộp', N'Viên', 150, N'Hộp 15 vỉ x 10 viên', N'NT00003', N'Paracetamol 500mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00002', N'Amoxicillin', N'VD-22625-15', N'CTCP xuất nhập khẩu y tế Domesco', N'Việt Nam', N'Hộp', N'Viên', 100, N'Hộp 10 vỉ x 10 viên', N'NT00007', N'Amoxicillin 500 mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00003', N'Tetracyclin', N'VD-33628-19', N'Công ty cổ phần Dược phẩm TW 25', N'Việt Nam', N'Hộp', N'Viên', 100, N'Hộp 10 vỉ x 10 viên', N'NT00007', N'Tetracyclin hydroclorid 500 mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00004', N'Azihasan 250', N'VD-25024-16', N'Công ty TNHH Hasan-Dermapharm', N'Việt Nam', N'Hộp', N'Viên', 60, N'Hộp 10 vỉ x 6 viên', N'NT00017', N'Azithromycin 250mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00005', N'Clamoxyl 250mg', N'VN-18308-14', N'GlaxoSmithKline Pte., Ltd.', N'Singapore', N'Hộp', N'Gói', 12, N'Hộp 12 gói', N'NT00007', N'Amoxicilin trihydrat 250mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00006', N'Augmentin 625mg tablets', N'VN-20169-16', N'GlaxoSmithKline Pte., Ltd.', N'Singapore', N'Hộp', N'Viên', 14, N'Hộp 2 vỉ x 7 viên', N'NT00007', N'Amoxcillin trihydrate 500mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00007', N'Klamentin 500/125', N'VD-24616-16', N'CÔNG TY CỔ PHẦN DƯỢC HẬU GIANG', N'Việt Nam', N'Hộp', N'Viên', 12, N'Hộp 3 vỉ x 4 viên', N'NT00007', N'Amoxicilin trihydrat) 500 mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00008', N'Klamentin 250/31.25', N'VD-24615-16', N'CÔNG TY CỔ PHẦN DƯỢC HẬU GIANG', N'Việt Nam', N'Hộp', N'Gói', 24, N'Hộp 24 gói x 1g', N'NT00007', N' Amoxicilin trihydrat 250 mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00009', N'Terp-Cod S', N'VD-29289-18', N'Công ty cổ phần dược Vacopharm', N'Việt Nam', N'Hộp', N'Viên', 300, N'Hộp 20 vỉ x 15 viên', N'NT00004', N'Terpin hydrat 100mg; Dextromethorphan hydrobromid 10mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00010', N'Vacomuc 200mg', N'VD-19543-13', N'Công ty cổ phần dược Vacopharm', N'Việt Nam', N'Hộp', N'Viên', 200, N'Hộp 20 vỉ x 10 viên', N'NT00004', N'Acetylcystein 200mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00011', N'Terp-Cod S', N'VD-17075-12', N'Công ty cổ phần dược Vacopharm', N'Việt Nam', N'Hộp', N'Viên', 100, N'Hộp 10 vỉ x 10 viên', N'NT00004', N'Terpin hydrat 100 mg / Dextromethorphan.HBr 10mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00012', N'Acemuc', N'VD-33020-19', N'Công ty Cổ phần Sanofi Việt Nam', N'Việt Nam', N'Hộp', N'Gói', 30, N'Hộp 30 gói', N'NT00004', N'Acetylcysteine 200mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00013', N'Hasalfast', N'VD-22663-15', N'Công ty TNHH Ha san-Dermapharm', N'Việt Nam', N'Hộp', N'Viên', 100, N'Hộp 10 vỉ x 10 viên', N'NT00006', N'Fexofenadin HCl 60 mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00014', N'Clorpheniramin', N'VD-21132-14', N'CÔNG TY CỔ PHẦN DƯỢC HẬU GIANG', N'Việt Nam', N'Hộp', N'Viên', 200, N'Hộp 10 vỉ x 20 viên', N'NT00006', N'Clorpheniramin maleat 4mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00015', N'Cetirizin', N'VD-27222-17', N'Công ty cổ phần dược Vacopharm', N'Việt Nam', N'Hộp', N'Viên', 100, N'Hộp 10 vỉ x 10 viên', N'NT00006', N'Cetirizin')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00016', N'Cezil', N'VD-24210-16', N'Công ty cổ phần dược phẩm IMEXPHARM', N'Việt Nam', N'Hộp', N'Viên', 100, N'Hộp 10 vỉ x10 viên', N'NT00006', N'Cetirizin dihydroclorid 10 mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00017', N'Stadnex 20', N'VD-22345-15', N'Công ty TNHH Liên Doanh Stellapharm', N'Việt Nam', N'Hộp', N'Viên', 28, N'Hộp 4 vỉ x 7 viên', N'NT00001', N'Esomeprazol 20 mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00018', N'Ocid', N'VN-10166-10', N'Cadila Healthcare Ltd.', N'Ấn Độ', N'Hộp', N'Viên', 100, N'hộp 10 vỉ x 10 viên', N'NT00001', N'Omeprazole 20mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00019', N'Pantostad', N'VD-33096-19', N'Công ty TNHH LD Stada', N'Việt Nam', N'Hộp', N'Viên', 28, N'Hộp 4 vỉ x 7 viên', N'NT00001', N'Pantoprazole 40mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00020', N'H-Inzole', N'VN-18555-14', N'CTCP dược phẩm và thiết bị y tế C.A.T', N'Việt Nam', N'Hộp', N'Viên', 100, N'Hộp 10 vỉ x 10 viên', N'NT00001', N'Omeprazole 20mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00021', N'No-spa', N'VD-34026-20', N'Công ty Cổ phần Sanofi Việt Nam', N'Việt Nam', N'Hộp', N'Viên', 50, N'Hộp 5 vỉ x 10 viên', N'NT00018', N'Drotaverine hydrochloride 40mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00022', N'Spasovanin', N'VD-32464-19', N'Công ty TNHH SX-TM dược phẩm Thành Nam', N'Việt Nam', N'Lọ', N'Viên', 200, N'Lọ 200 viên', N'NT00018', N'Alverin citrat 40mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00023', N'Trimebutin', N'VD-22914-15', N'Công ty cổ phần dược phẩm Khánh Hoà', N'Việt Nam', N'Hộp', N'Viên', 100, N'Hộp 10 vỉ x 10 viên', N'NT00018', N'Trimebutin maleat 100mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00024', N'Mutecium-M', N'VD-23185-15', N'Công ty cổ phần hoá-dược phẩm Mekophar', N'Việt Nam', N'Hộp', N'Gói', 30, N'Hộp 30 gói x 1g', N'NT00018', N'Domperidon 2,5 mg; Simeticon 50 mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00025', N'Motilium', N'VN-20784-17', N'Olic (Thailand) Limited', N'Thái Lan', N'Hộp', N'Lọ', 1, N'Hộp 1 lọ 30ml', N'NT00018', N'Domperidon 1mg/ml')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00026', N'Smecta', N'VN-19485-15', N'Beaufour Ipsen Industrie', N'Pháp', N'Hộp', N'Gói', 30, N'Hộp 30 gói', N'NT00019', N'Diosmectit 3,00g')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00027', N'Loperamid 2 mg', N'VD-28384-17', N'Công ty cổ phần xuất nhập khẩu y tế Domesco', N'Việt Nam', N'Hộp', N'Viên', 50, N'Hộp 5 vỉ x 10 viên', N'NT00019', N'Loperamid hydroclorid 2mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00028', N'Bisalaxyl', N'VD-24874-16', N'CTCP dược phẩm trung ương Vidipha Bình Dương', N'Việt Nam', N'Hộp', N'Viên', 50, N'Hộp 5 vỉ x 10 viên', N'NT00019', N'Bisacodyl 5mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00029', N'BisacodylDHG', N'VD-21129-14', N'Công ty cổ phần dược Hậu Giang', N'Việt Nam', N'Hộp', N'Viên', 100, N'Hộp 4 vỉ x 25 viên', N'NT00019', N'Bisacodyl 5 mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00030', N'Sorbitol Sanofi', N'VD-29366-18', N'Công ty Cổ phần Sanofi Việt Nam', N'Việt Nam', N'Hộp', N'Gói', 20, N'Hộp 20 gói x 5g', N'NT00019', N'Sorbitol 5g')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00031', N'Probio', N'VD-10260-10', N'Công ty cổ phần dược phẩm IMEXPHARM', N'Việt Nam', N'Hộp', N'Gói', 14, N'Hộp 14 gói 1 gam', N'NT00019', N'lactobacillus acidophilus')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00032', N'Hapacol sủi', N'VD-20571-14', N'CÔNG TY CỔ PHẦN DƯỢC HẬU GIANG', N'Việt Nam', N'Hộp', N'Viên', 16, N'	Hộp 4 vỉ x 4 viên', N'NT00003', N'Paracetamol 500 mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00033', N'Paracetamol 500mg', N'VD-26310-17', N'Công ty cổ phần dược phẩm trung ương VIDIPHA', N'Việt Nam', N'Lọ', N'Viên', 200, N'Lọ 200 viên', N'NT00003', N'Paracetamol 500mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00034', N'Hapacol 325', N'VD-20559-14', N'CÔNG TY CỔ PHẦN DƯỢC HẬU GIANG', N'Việt Nam', N'Hộp', N'Viên', 100, N'Hộp 10 vỉ × 10 viên', N'NT00003', N'Paracetamol 325 mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00035', N'PARALMAX EXTRA', N'VD-21248-14', N'	Công ty Cổ phần Dược phẩm Bos Ton Việt Nam', N'Việt Nam', N'Hộp', N'Viên', 120, N'Hộp 10 vỉ x 12 viên', N'NT00003', N'	Paracetamol 500mg; Cafein 65mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00036', N'Homtamin Ginseng ext', N'VD-24417-16', N'Công ty cổ phần Korea United Pharm. Int', N'Việt Nam', N'Hộp', N'Viên', 60, N'Hộp 2 túi nhôm x 6 vỉ x 5 viên', N'NT00020', N'Cao nhân sâm đã định chuẩn Ginseng ext. (tương đương với 0,9 mg Ginsenoid Rb1, Rg1 và Re) 40 mg;')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00037', N'Vitamin B6 250mg', N'VD-15533-11', N'Công ty cổ phần hoá dược phẩm Mekophar', N'Việt Nam', N'Hộp', N'Viên', 100, N'Hộp 10 vỉ x 10 viên bao đường', N'NT00020', N'Pyridoxin HCl 250mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00038', N'Neurobion', N'VN-20021-16', N'PT. Merck Tbk', N'Indonesia', N'Hộp', N'Viên', 50, N'Hộp 5 vỉ x 10 viên', N'NT00020', N'Vitamin B6 200mg; Vitamin B1 100mg; Vitamin B12 200mcg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00039', N'Mibecerex', N'VD-33101-19', N'Công ty TNHH Liên doanh HASAN - DERMAPHARM', N'Việt Nam', N'Hộp', N'Viên', 50, N'Hộp 05 vỉ x 10 viên', N'NT00003', N'Celecoxib 200mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00040', N'Pỉroxicam', N'GC-302-18', N'Công ty cổ phần dược phẩm & dịch vụ y tế Khánh Hội', N'Việt Nam', N'Hộp', N'Viên', 100, N'Hộp 10 vỉ x 10 viên', N'NT00003', N'Piroxicam 10mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00041', N'I-Pain', N'VD-23210-15', N'Công ty cổ phần Pymepharco', N'Việt Nam', N'Hộp', N'Viên', 100, N'Hộp 10 vỉ x 10 viên', N'NT00003', N'Ibuprofen 400 mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00042', N'Fugacar (tablet)', N'VN-16500-13', N'Olic (Thailand) Ltd', N'Thái Lan', N'Hộp', N'Viên', 1, N'Hộp 1 vỉ x 1 viên', N'NT00021', N'Mebendazole 500mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00043', N'Albendazole STELLA 400 mg', N'VD-25032-16', N'Công ty TNHH Liên Doanh Stellapharm', N'Việt Nam', N'Hộp', N'Viên', 1, N'Hộp 1 vỉ x 1 viên', N'NT00021', N'Albendazol 400mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00044', N'Griseofulvin 500mg', N'VD-30678-18', N'Công ty cổ phần hoá-dược phẩm Mekophar', N'Việt Nam', N'Hộp', N'Viên', 20, N'Hộp 2 vỉ x 10 viên', N'NT00021', N'Griseofulvin 500mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00045', N'Neo-Tergynan', N'VN-18967-15', N'Sophartex', N'Pháp', N'Hộp', N'Viên', 10, N'Hộp 1 vỉ x 10 viên nén', N'NT00021', N'Metronidazol 500mg ; Neomycin sulfate 65000 IU; Nystatin 100000 IU')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00046', N'Fluconazole AL 150 mg', N'VD-22350-15', N'Công ty TNHH LD Stada-Việt Nam', N'Việt Nam', N'Hộp', N'Viên', 1, N'Hộp 1 vỉ x 1 viên', N'NT00021', N'Fluconazol 150 mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00047', N'Drosperin', N'VN-16308-13', N'Laboratorios Recalcine S.A', N'Chile', N'Hộp', N'Viên', 28, N'	Hộp 2 vỉ x 14 viên', N'NT00022', N'Drospirenone 3mg; Ethinylestradiol 0,03mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00048', N'Marvelon', N'VN-18818-15', N'N.V. Organon', N'Hà Lan', N'Hộp', N'Viên', 21, N'Hộp 1 vỉ x 21 viên', N'NT00022', N'Desogestrel 0,15mg; Ethinyl estradiol 0,03mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00049', N'Diane-35', N'VN-18817-15', N'Bayer Weimar GmbH und Co. KG', N'Đức', N'Hộp', N'Viên', 21, N'Hộp 1 vỉ x 21 viên', N'NT00022', N'Cyproterone acetate 2mg; Ethinylestradiol 0,035mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00050', N'Prospan Forte', N'VN-17872-14', N'Engelhard Arzneimittel GmbH & Co..KG', N'Đức', N'Hộp ', N'Lọ', 1, N'Hộp 1 chai 100ml', N'NT00023', N'	Cao khô lá thường xuân chiết bằng ethanol 30% theo tỷ lệ (5-7,5)/1 35mg/5ml')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00051', N'Mifestad 10', N'VD-29503-18', N'Công ty TNHH LD Stada-Việt Nam', N'Việt Nam', N'Hộp', N'Viên', 1, N'Hộp 1 vỉ x 1 viên', N'NT00022', N'Mifepriston 10mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00052', N'Bảo Thanh', N'VD-22646-15', N'Công ty TNHH Dược phẩm Hoa Linh', N'Việt Nam', N'Hộp ', N'Lọ', 1, N'Hộp 1 chai 125ml', N'NT00023', N'Dịch chiết;Xuyên bối mẫu;Cao lỏng;Tinh dầu bạc hà;Mật ong')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00053', N'Thuốc ho trẻ em OPC', N'VD-24238-16', N'Công ty cổ phần Dược phẩm OPC', N'Việt Nam', N'Hộp', N'Lọ', 1, N'Hộp 1 chai 90ml', N'NT00023', N'Tỳ bà diệp;Cát cánh;Bách bộ;Tiền hồ;Tang Bạch Bì;Thiên môn;Phục linh/Bạch linh...')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00054', N'Ho astex', N'VD-25220-16', N'Công ty cổ phần Dược phẩm OPC', N'Việt Nam', N'Hộp', N'Lọ', 1, N'Hộp 1 chai 90ml', N'NT00023', N'Húng chanh 45g; Núc nác 11,25g; Cineol 83,7mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00055', N'Pectol-E', N'VD-22333-15', N'Công ty TNHH dược phẩm Sài Gòn (Sagophar)', N'Việt Nam', N'Hộp', N'Lọ', 1, N'Hộp 1 chai 90 ml', N'NT00023', N'Cồn bọ mắm;Eucalypto;Natri benzoat; Cao Núc nác;Dịch chiết Viễn chí;Dịch chiết Trần bì...')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00056', N'Voltaren', N'VN-11972-11', N'Novartis Farma S.p.A', N'Ý', N'Hộp', N'Viên', 100, N'Hộp 10 vỉ x 10 viên', N'NT00003', N'Natri diclofenac')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00057', N'Viên nén đặt âm đạo', N'VD-20290-13', N'Công ty cổ phần dược TW Mediplantex', N'Việt Nam', N'Hộp', N'Viên', 12, N'Hộp 3 vỉ x 4 viên', N'NT00022', N'Metronidazol 500mg; Nystatin 100.000IU; Neomycin sulfat 65.000IU')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00058', N'Thiên môn bổ phổi', NULL, N'Công ty TNHH Dược Phẩm Bình Đông', N'Việt Nam', N'Hộp', N'Lọ', 1, N'Hộp 1 chai 280ml', N'NT00023', N'Thiên môn đông;Bạc hà;Trần bì;Bách Bộ;Tang bạch bị;Bình vôi;Gừng;Kinh giới;Atiso')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00059', N'No-Spa forte', N'VN-18876-15', N'Chinoin Private Co. Ltd', N'Hungary', N'Hộp', N'Viên', 20, N'Hộp 2 vỉ x 10 viên', N'NT00018', N'Drotaverin hydroclorid 80mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00060', N'Bostacet', N'VD-30311-18', N'Công ty Cổ phần Dược phẩm Boston Việt Nam', N'Việt Nam', N'Hộp', N'Viên', 20, N'Hộp 2 vỉ x 10 viên', N'NT00003', N'Paracetamol 325mg; Tramadol hydroclorid 37,5mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00061', N'Rofcal', N'VD-11637-10', N'Công ty Cổ phần Dược phẩm OPC', N'Việt Nam', N'Hộp', N'Viên', 30, N'Hộp 3 vỉ x 10 viên nang mềm', N'NT00020', N'Calcitriol 0,25mcg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00062', N'Methionine 250mg', N'VD-20954-14', N'Công ty cổ phần hoá - dược phẩm Mekophar', N'Việt Nam', N'Lọ', N'Viên', 100, N'Chai 100 viên', N'NT00024', N'DL-Methionin 250mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00063', N'Bar thuốc lợi gan mật', N'', N'Công ty CPDP Dược liệu Pharmedic - VIỆT NAM', N'Việt Nam', N'Hộp', N'Hộp', 1, N'Hộp 1 lọ 60 viên', N'NT00025', N'Cynarin, flavonoid, chất nhầy, pectin..')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00064', N'Hapacol 250', N'VD-20558-14', N'CÔNG TY CỔ PHẦN DƯỢC HẬU GIANG', N'Việt Nam', N'Hộp ', N'Gói', 24, N'Hộp 24 gói x 1,5g thuốc bột', N'NT00003', N'Paracetamol 250 mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00065', N'Klamentin 625', N'VD-22768-15', N'Công ty cổ phần Dược Hậu Giang', N'Việt Nam', N'Hộp', N'Viên', 12, N'Hộp 3 vỉ x 4 viên', N'NT00017', N'Amoxicilin;Acid clavulanic.')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00066', N'Prednison 5 mg', N'VD-15558-11', N'Công ty cổ phần xuất nhập khẩu y tế Domesco', N'Việt Nam', N'Hộp', N'Viên', 100, N'Hộp 10 vỉ x 10 viên', N'NT00005', N'Prednison 5 mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00067', N'Siro Sara', N'VD-29552-18', N'Công ty TNHH Thai Nakorn Patana Việt Nam', N'Việt Nam', N'Hộp ', N'Chai', 1, N'Hộp 1 chai', N'NT00003', N'Paracetamol 500 mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00068', N'Benthasone ', N'VD-22402-15', N'Công ty cổ phần Dược phẩm Đồng Nai ', N'Việt Nam', N'Chai', N'Viên', 500, N'Chai 500 viên', N'NT00003', N'Betamethason 0,5 mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00069', N'Mekocefaclor', N'VD-11251-10', N'Công ty cổ phần hóa - Dược phẩm Mekophar', N'Việt Nam', N'Hộp', N'Gói', 12, N'Hộp 12 gói', N'NT00017', N' Cefaclor 125mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00070', N'Silkyron', N'VN-5434-01', N'Dongkwang Pharm Co., Ltd', N'HÀN QUỐC', N'Hộp', N'Tuýp', 1, N'Hộp 1 tuýp', N'NT00026', N'Betamethasone, Clotrimazole, Gentamicin')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00071', N'Acyclovir', N'VD-31638-19', N'CTCP Dược phẩm Dược liệu Pharmedic', N'Việt Nam', N'Hộp', N'Tuýp', 1, N'Hộp 1 tuýp', N'NT00026', N'Acyclorvir 250mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00072', N'Dibetalic', N'VNB-3129-05', N'Công ty cổ phần TRAPHACO ', N'VIỆT NAM', N'Hộp', N'Tuýp', 1, N'Hộp 1 tuýp', N'NT00026', N'Betamethasone dipropionate, Salicylic acid')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00073', N'Betacylic', N'VNB-2108-04', N'Công ty cổ phần hóa - Dược phẩm Mekophar', N'VIỆT NAM', N'Hộp', N'Tuýp', 1, N'Hộp 1 tuýp', N'NT00026', N'Betamethasone dipropionate, Salicylic acid')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00074', N'Salonpas liniment', N'VD-28644-17', N'Công ty TNHH Dược phẩm Hisamitsu', N' Việt Nam', N'Hộp', N'Chai', 1, N'Hộp 1 chai', N'NT00027', N'Methyl salicylat 2640mg; L-Menthol 2700mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00075', N'Maica', N'VD-30092-18', N'Công ty TNHH Dược phẩm Việt Phúc', N'VIỆT NAM', N'Hộp', N'Lọ', 1, N'Hộp 1 lọ', N'NT00026', N'Acid boric 800mg, Xanh Methylen 0.1mg;')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00076', N'Salonship gel-patch', N'VD-28645-17', N'Công ty TNHH Dược phẩm Hisamitsu ', N'Việt Nam', N'Hộp', N'bao', 10, N'Hộp 10 bao ', N'NT00027', N'Glycol salisylat 1,25g; L-menthol 1g; dl-Camphor 0,03g; Tocopherol acetat 1g')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00077', N'Kary Uni Ophthalmic Suspension', N'VN-15629-12', N'Santen Pharm Co., Ltd', N'NHẬT BẢN', N'hộp', N'lọ', 1, N'Hộp 1 lọ', N'NT00010', N'Pirenoxine')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00078', N'V Rohto Dry Eye', N'VD-21160-14', N'Công ty TNHH Rohto-Mentholatum ', N'Việt Nam', N'Hộp', N'Lọ', 1, N'Hộp 1 lọ', N'NT00010', N'Hydroxyethylcellulose 78mg/13ml')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00079', N'New V Rhoto', N'NB-0669-03', N'Công ty TNHH Rohto-Mentholatum ', N'Việt Nam ', N'Hộp', N'Lọ', 1, N'Hộp 1 lọ', N'NT00010', N'Chlorpheniramine, Dipotassium glycyrrhizinate, Pyridoxine hydrochloride, Tetra hydro zolin')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00080', N'Tobrex', N'VN-8039-04', N'S.A Alkon Couvreur N.V', N'Mỹ', N'Hộp', N'Lọ', 1, N'hộp 1 lọ', N'NT00010', N'Tobramycin')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00081', N'Natri Clorid 0,9', N'VD-4454-07', N'Công ty cổ phần TRAPHACO', N'VIỆT NAM', N'Hộp', N'Lọ', 1, N'Hộp 1 lọ', N'NT00010', N'Natri chloride')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00082', N'Vacolaren', N'VD-20909-14', N'Công ty cổ phần dược Vacopharm', N'VIỆT NAM', N'Hộp', N'Vỉ', 2, N'Hộp 2 vỉ ', N'NT00028', N'Trimetazidin dihydroclorid 20mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00083', N'Nifedipin Hasan 20 Retard', N'VD-32593-19', N'Công ty TNHH Hasan-Dermapharm', N'VIỆT NAM', N'Hộp', N'Vỉ', 10, N'Hộp 10 vỉ', N'NT00028', N'Nifedipin 20mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00084', N'Stadovas 5', N'VNB-2631-04', N'Công ty liên doanh TNHH Stada', N'Việt Nam', N'Hộp', N'Vỉ', 3, N'Hộp 3 vỉ', N'NT00028', N'Amlodipine')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00085', N'Lostad T25', N'VNB-2418-04', N'Công ty liên doanh TNHH Stada', N'Việt Nam', N'Hộp', N'Vỉ', 3, N'Hộp 3 vỉ', N'NT00028', N'Kalium Losartan')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00086', N'Avasboston 20', N'VD-26117-17', N'Công ty Cổ phần Dược phẩm Boston ', N'Việt Nam', N'Hộp', N'Vỉ', 5, N'Hộp 5 vỉ', N'NT00028', N'Atorvastatin')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00087', N'Glimiwel 2', N'VN-21980-19', N'Akums Drugs & Pharmaceuticals Ltd. ', N'ẤN ĐỘ', N'Hộp', N'Vỉ', 3, N'Hộp 3 vỉ', N'NT00013', N'Glimepirid 2mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00088', N'Cephlaxein 500', N'VNA-1660-04', N'Công ty cổ phần Pymepharco', N'VIỆT NAM', N'Hộp', N'Viên', 100, N'Hộp 10 vỉ x 10 viên nang', N'NT00017', N'Cephalexin')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00089', N'Alaxan ', N'VD-23414-15', N'CtyTNHH United International Pharma', N'VIỆT NAM', N'Hộp', N'Viên', 100, N'Hộp 100 viên', N'NT00003', N' Paracetamol 325 mg; Ibuprofen 200 mg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00090', N'AlphaChoay', N'VD-23000-15', N'Công ty Cổ phần Dược phẩm Sanofi', N'Việt Nam', N'Hộp', N'Viên', 30, N'Hộp 2 vỉ 15 viên', N'NT00003', N'Chymotrypsin 21 microkatals')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00091', N'Ferrovit', N'VN-17746-14', N'Mega Lifesciences., Ltd', N'THÁI LAN', N'Hộp', N'Viên', 100, N'Hộp 10 vỉ x 10 viên', N'NT00020', N'Sắt (dưới dạng Sắt fumarate) 53,25mg; Acid Folic 0,75mg; Vitamin B12 7,5mcg')
INSERT [dbo].[DanhMucThuoc] ([MATHUOC], [TenThuoc], [SoDK], [HangSX], [NoiSX], [DonViGoc], [DonViQuiDoi], [SoLuongQuiDoi], [DongGoi], [MaNT], [HoatChat]) VALUES (N'TH00092', N'Calci Corbie', N'VNB-0653-03', N'Công ty liên doanh Dược phẩm Sanofi-Synthelabo', N'Việt Nam', N'Hộp', N'Ống', 30, N'Hộp 30 ống', N'NT00020', N'Vitamin C, Calcium glucoheptonat, Vitamin PP, acid hypophosphoro')
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00001', N'TH00001', N'abc', CAST(0xF2420B00 AS Date), 10, N'Hộp', 1500, N'Viên', 500, 1000, N'', CAST(0xD4420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00002', N'TH00002', N'18719', CAST(0xC8440B00 AS Date), 10, N'Hộp', 1000, N'Viên', 500, 1000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00003', N'TH00003', N'200723', CAST(0x29440B00 AS Date), 10, N'Hộp', 1000, N'Viên', 500, 1000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00004', N'TH00004', N'00820', CAST(0x34460B00 AS Date), 10, N'Hộp', 600, N'Viên', 500, 1000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00005', N'TH00005', N'2N5P', CAST(0xB6430B00 AS Date), 0, N'Hộp', 0, N'Gói', 500, 1000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00006', N'TH00006', N'2929', CAST(0x62450B00 AS Date), 1.5714285714285714, N'Hộp', 22, N'Viên', 500, 1000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00007', N'TH00007', N'520321', CAST(0x19450B00 AS Date), 2, N'Hộp', 24, N'Viên', 500, 1000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00008', N'TH00008', N'550121', CAST(0x5B460B00 AS Date), 10, N'Hộp', 240, N'Gói', 500, 1000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00009', N'TH00011', N'0710321', CAST(0x9E460B00 AS Date), 10, N'Hộp', 1000, N'Viên', 500, 1000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00010', N'TH00010', N'0250421', CAST(0x49450B00 AS Date), 9.925, N'Hộp', 1985, N'Viên', 500, 1000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00011', N'TH00011', N'0040421', CAST(0x4A450B00 AS Date), 10, N'Hộp', 1000, N'Viên', 500, 1000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00012', N'TH00012', N'bvh1166', CAST(0x76450B00 AS Date), 8.4, N'Hộp', 252, N'Gói', 500, 1000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00013', N'TH00014', N'030621', CAST(0xDF460B00 AS Date), 9.58, N'Hộp', 1916, N'Viên', 500, 1000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00014', N'TH00013', N'00421', CAST(0xA6460B00 AS Date), 9.7, N'Hộp', 970, N'Viên', 500, 1000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00015', N'TH00015', N'0280521', CAST(0x65450B00 AS Date), 9.96, N'Hộp', 996, N'Viên', 500, 1000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00016', N'TH00016', N'00618', CAST(0xB4420B00 AS Date), 8, N'Hộp', 800, N'Viên', 500, 1000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00017', N'TH00017', N'170621', CAST(0x77450B00 AS Date), 13, N'Hộp', 364, N'Viên', 600, 1200, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00018', N'TH00018', N'G100949', CAST(0x85460B00 AS Date), 14, N'Hộp', 1400, N'Viên', 700, 1400, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00019', N'TH00020', N'ht45-03', CAST(0xF2440B00 AS Date), 16, N'Hộp', 1600, N'Viên', 400, 1000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00020', N'TH00021', N'DV044', CAST(0xE9450B00 AS Date), 10, N'Hộp', 500, N'Viên', 1000, 1600, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00021', N'TH00022', N'020421', CAST(0xA4460B00 AS Date), 8, N'Lọ', 1600, N'Viên', 1000, 1400, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00022', N'TH00023', N'210320', CAST(0x2C450B00 AS Date), 7, N'Hộp', 700, N'Viên', 400, 800, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00023', N'TH00024', N'21002GN', CAST(0x40450B00 AS Date), 15, N'Hộp', 450, N'Gói', 400, 700, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00024', N'TH00025', N'2002048', CAST(0x97450B00 AS Date), 20, N'Hộp', 20, N'Lọ', 39000, 45000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00025', N'TH00026', N'T12671', CAST(0x8E450B00 AS Date), 15, N'Hộp', 450, N'Gói', 4000, 7500, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00026', N'TH00027', N'00121', CAST(0x65460B00 AS Date), 7, N'Hộp', 350, N'Viên', 400, 700, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00027', N'TH00028', N'331220', CAST(0x29460B00 AS Date), 13, N'Hộp', 650, N'Viên', 400, 600, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00028', N'TH00029', N'020221A', CAST(0x7E460B00 AS Date), 5, N'Hộp', 500, N'Viên', 2000, 4000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00029', N'TH00030', N'AVH1694', CAST(0x7A440B00 AS Date), 13, N'Hộp', 260, N'Gói', 2200, 5000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00030', N'TH00031', N'01621', CAST(0x1B450B00 AS Date), 11, N'Hộp', 154, N'Gói', 1400, 2000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00031', N'TH00032', N'180621', CAST(0x74450B00 AS Date), 10, N'Hộp', 160, N'Viên', 1400, 2000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00032', N'TH00033', N'031219', CAST(0xCB440B00 AS Date), 11.82, N'Lọ', 2364, N'Viên', 1300, 1500, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00033', N'TH00035', N'090521', CAST(0xC5460B00 AS Date), 11.8, N'Hộp', 1416, N'Viên', 1300, 1500, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00034', N'TH00034', N'080519', CAST(0xFF430B00 AS Date), 9, N'Hộp', 900, N'Viên', 300, 500, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00035', N'TH00036', N'1012029', CAST(0xDF450B00 AS Date), 13, N'Hộp', 780, N'Viên', 1900, 2500, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00036', N'TH00037', N'19003AN', CAST(0x71440B00 AS Date), 15, N'Hộp', 1500, N'Viên', 600, 1000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00037', N'TH00038', N'W0965164', CAST(0xB8450B00 AS Date), 12.7, N'Hộp', 635, N'Viên', 500, 1000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00038', N'TH00039', N'00621', CAST(0xED460B00 AS Date), 7, N'Hộp', 350, N'Viên', 1000, 1500, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00039', N'TH00040', N'070421', CAST(0xAE460B00 AS Date), 11, N'Hộp', 1100, N'Viên', 700, 1000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00040', N'TH00041', N'050820', CAST(0xC4450B00 AS Date), 10, N'Hộp', 1000, N'Viên', 700, 1000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00041', N'TH00042', N'2014025', CAST(0xE8480B00 AS Date), 1, N'Hộp', 1, N'Viên', 19000, 25000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00042', N'TH00043', N'081020', CAST(0x74470B00 AS Date), 13, N'Hộp', 13, N'Viên', 4500, 5000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00043', N'TH00044', N'20010HN', CAST(0x30460B00 AS Date), 9, N'Hộp', 180, N'Viên', 1500, 1800, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00044', N'TH00045', N'M120', CAST(0xD8440B00 AS Date), 5, N'Hộp', 50, N'Viên', 1300, 1500, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00045', N'TH00046', N'061120', CAST(0x1E460B00 AS Date), 5, N'Hộp', 5, N'Viên', 4500, 5000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00046', N'TH00047', N'E200653-1', CAST(0x50450B00 AS Date), 13, N'Hộp', 364, N'Viên', 1300, 1600, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00047', N'TH00048', N'U001267', CAST(0x26460B00 AS Date), 11, N'Hộp', 231, N'Viên', 2000, 2500, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00048', N'TH00049', N'KT094KJ', CAST(0xF0450B00 AS Date), 13, N'Hộp', 273, N'Viên', 1200, 1500, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00049', N'TH00050', N'20L094A', CAST(0x07460B00 AS Date), 14, N'Hộp ', 14, N'Lọ', 70000, 72000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00050', N'TH00051', N'060820', CAST(0x2A470B00 AS Date), 5, N'Hộp', 5, N'Viên', 18000, 20000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00051', N'TH00052', N'1621', CAST(0x0F450B00 AS Date), 2, N'Hộp ', 2, N'Lọ', 43000, 46000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00052', N'TH00053', N'020321', CAST(0x98460B00 AS Date), 17, N'Hộp', 17, N'Lọ', 53000, 56000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00053', N'TH00054', N'20137', CAST(0x33460B00 AS Date), 5, N'Hộp', 5, N'Lọ', 35000, 39000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00054', N'TH00055', N'0171220', CAST(0x27460B00 AS Date), 15, N'Hộp', 15, N'Lọ', 35000, 39000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00055', N'TH00056', N'TEW98', CAST(0x50450B00 AS Date), 14.4, N'Hộp', 1440, N'Viên', 6000, 6600, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00056', N'TH00057', N'287418', CAST(0x5F430B00 AS Date), 12, N'Hộp', 144, N'Viên', 10000, 12000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00057', N'TH00058', N'020321', CAST(0x98460B00 AS Date), 4, N'Hộp', 4, N'Lọ', 53000, 56000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00058', N'TH00059', N'DV044', CAST(0xE9450B00 AS Date), 10, N'Hộp', 200, N'Viên', 1200, 1400, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00059', N'TH00060', N'040321', CAST(0x8C460B00 AS Date), 3.45, N'Hộp', 69, N'Viên', 2400, 3000, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00060', N'TH00061', N'20002', CAST(0xD9450B00 AS Date), 9.8666666666666671, N'Hộp', 296, N'Viên', 1200, 1500, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00061', N'TH00062', N'20016CN', CAST(0xA1450B00 AS Date), 7.82, N'Lọ', 782, N'Viên', 400, 500, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00063', N'TH00064', N'150421', CAST(0xA5460B00 AS Date), 1.7083333333333333, N'Hộp ', 41, N'Gói', 2000, 2500, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00064', N'TH00065', N'550121', CAST(0x5B460B00 AS Date), 2.8333333333333335, N'Hộp', 34, N'Viên', 1200, 1400, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00065', N'TH00066', N'02119', CAST(0x72440B00 AS Date), 6.43, N'Hộp', 643, N'Viên', 500, 600, N'', CAST(0xD7420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00066', N'TH00063', N'0810920', CAST(0xCB450B00 AS Date), 5, N'Hộp', 5, N'Hộp', 24000, 30000, N'', CAST(0xD8420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00067', N'TH00067', N'0110320', CAST(0xD0400B00 AS Date), 6, N'Hộp ', 6, N'Chai', 15000, 21000, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00068', N'TH00068', N'340121', CAST(0x5E460B00 AS Date), 5, N'Chai', 2500, N'Viên', 400, 500, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00069', N'TH00069', N'21005GN', CAST(0x89460B00 AS Date), 9, N'Hộp', 108, N'Gói', 3000, 4000, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00070', N'TH00070', N'TZ707', CAST(0x37450B00 AS Date), 10, N'Hộp', 10, N'Tuýp', 10000, 19000, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00071', N'TH00071', N'010121', CAST(0xE6440B00 AS Date), 10, N'Hộp', 10, N'Tuýp', 14000, 18000, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00072', N'TH00072', N'6520', CAST(0x26440B00 AS Date), 10, N'Hộp', 10, N'Tuýp', 15000, 18000, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00073', N'TH00073', N'20001LH', CAST(0x8F430B00 AS Date), 10, N'Hộp', 10, N'Tuýp', 10000, 15000, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00074', N'TH00074', N'7601', CAST(0x32450B00 AS Date), 9, N'Hộp', 9, N'Chai', 39000, 42000, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00075', N'TH00075', N'011120', CAST(0xAA440B00 AS Date), 8, N'Hộp', 8, N'Lọ', 5000, 7000, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00076', N'TH00076', N'3606', CAST(0xBE440B00 AS Date), 4.8, N'Hộp', 48, N'bao', 18000, 20000, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00077', N'TH00077', N'KRU9158', CAST(0x35450B00 AS Date), 10, N'hộp', 10, N'lọ', 30000, 34000, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00078', N'TH00078', N'EW01', CAST(0x56450B00 AS Date), 8, N'Hộp', 8, N'Lọ', 40000, 45000, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00079', N'TH00079', N'EX01-2', CAST(0xCF460B00 AS Date), 9, N'Hộp', 9, N'Lọ', 45000, 49000, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00080', N'TH00080', N'19K14HE', CAST(0xB2440B00 AS Date), 5, N'Hộp', 5, N'Lọ', 40000, 45000, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00081', N'TH00081', N'4120421', CAST(0x1E4D0B00 AS Date), 20, N'Hộp', 20, N'Lọ', 3000, 4000, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00082', N'TH00082', N'043321', CAST(0x9E460B00 AS Date), 4, N'Hộp', 8, N'Vỉ', 8000, 10000, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00083', N'TH00083', N'01221', CAST(0xEB460B00 AS Date), 10, N'Hộp', 100, N'Vỉ', 5000, 7000, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00084', N'TH00084', N'2021020', CAST(0x4C460B00 AS Date), 6, N'Hộp', 18, N'Vỉ', 5000, 8000, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00085', N'TH00085', N'230820', CAST(0xB4450B00 AS Date), 10, N'Hộp', 30, N'Vỉ', 14000, 16000, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00086', N'TH00086', N'010221', CAST(0x7D460B00 AS Date), 10, N'Hộp', 50, N'Vỉ', 25000, 28000, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00087', N'TH00087', N'417BD01', CAST(0xA8440B00 AS Date), 7, N'Hộp', 21, N'Vỉ', 15000, 18000, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00088', N'TH00088', N'410621', CAST(0xDD460B00 AS Date), 1.88, N'Hộp', 188, N'Viên', 1000, 1200, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00089', N'TH00089', N'020101', CAST(0x3F470B00 AS Date), 9.88, N'Hộp', 988, N'Viên', 1000, 1300, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00090', N'TH00090', N'BVH0513', CAST(0x69440B00 AS Date), 2.5, N'Hộp', 75, N'Viên', 2000, 2400, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00091', N'TH00091', N'1C12C1', CAST(0x1D450B00 AS Date), 9.74, N'Hộp', 974, N'Viên', 1000, 1800, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HangHoa] ([MAHH], [MaThuoc], [SoLo], [HSD], [SoLuongGoc], [DonViGoc], [SLSauQuiDoi], [DonViQuiDoi], [GiaVon], [GiaBan], [GhiChu], [NgayTao]) VALUES (N'HH00092', N'TH00092', N'20499', CAST(0x51440B00 AS Date), 4.3, N'Hộp', 129, N'Ống', 4000, 5400, N'', CAST(0xD9420B00 AS Date))
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00001', N'phucnh', CAST(0xB3420B00 AS Date), N'KH00001', 9500)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00002', N'phucnh', CAST(0xB4420B00 AS Date), N'KH00013', 43500)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00003', N'phucnh', CAST(0xB5420B00 AS Date), N'KH00002', 34800)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00004', N'phucnh', CAST(0xB5420B00 AS Date), N'KH00005', 69600)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00005', N'phucnh', CAST(0xB6420B00 AS Date), N'KH00010', 12100)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00006', N'phucnh', CAST(0xB7420B00 AS Date), N'KH00015', 14500)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00007', N'phucnh', CAST(0xB8420B00 AS Date), N'KH00015', 46000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00008', N'phucnh', CAST(0xB9420B00 AS Date), N'KH00004', 92000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00009', N'phucnh', CAST(0xB9420B00 AS Date), N'KH00015', 56000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00010', N'phucnh', CAST(0xB9420B00 AS Date), N'KH00012', 75000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00011', N'phucnh', CAST(0xBA420B00 AS Date), N'KH00007', 106000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00012', N'phucnh', CAST(0xBA420B00 AS Date), N'KH00006', 34800)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00013', N'phucnh', CAST(0xBB420B00 AS Date), N'KH00001', 9500)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00014', N'phucnh', CAST(0xBB420B00 AS Date), N'KH00002', 34800)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00015', N'phucnh', CAST(0xB9420B00 AS Date), N'KH00015', 69600)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00016', N'phucnh', CAST(0xB9420B00 AS Date), N'KH00009', 30000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00017', N'phucnh', CAST(0xB9420B00 AS Date), N'KH00015', 168000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00018', N'phucnh', CAST(0xBA420B00 AS Date), N'KH00006', 75000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00019', N'phucnh', CAST(0xBA420B00 AS Date), N'KH00007', 13800)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00020', N'phucnh', CAST(0xBB420B00 AS Date), N'KH00003', 40700)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00021', N'phucnh', CAST(0xBB420B00 AS Date), N'KH00003', 12100)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00022', N'phucnh', CAST(0xBB420B00 AS Date), N'KH00010', 39000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00023', N'phucnh', CAST(0xBC420B00 AS Date), N'KH00002', 12100)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00024', N'phucnh', CAST(0xBC420B00 AS Date), N'KH00004', 148000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00025', N'phucnh', CAST(0xBC420B00 AS Date), N'KH00013', 40700)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00026', N'phucnh', CAST(0xBD420B00 AS Date), N'KH00003', 46000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00027', N'phucnh', CAST(0xBD420B00 AS Date), N'KH00010', 39000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00028', N'phucnh', CAST(0xBE420B00 AS Date), N'KH00013', 50000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00029', N'phucnh', CAST(0xBE420B00 AS Date), N'KH00002', 34800)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00030', N'phucnh', CAST(0xBF420B00 AS Date), N'KH00010', 39000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00031', N'phucnh', CAST(0xBF420B00 AS Date), N'KH00010', 43500)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00032', N'phucnh', CAST(0xC0420B00 AS Date), N'KH00001', 12100)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00033', N'phucnh', CAST(0xC0420B00 AS Date), N'KH00015', 56000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00034', N'phucnh', CAST(0xC1420B00 AS Date), N'KH00002', 60500)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00035', N'phucnh', CAST(0xC1420B00 AS Date), N'KH00003', 69600)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00036', N'phucnh', CAST(0xC1420B00 AS Date), N'KH00013', 50000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00037', N'phucnh', CAST(0xC1420B00 AS Date), N'KH00010', 39000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00038', N'phucnh', CAST(0xC2420B00 AS Date), N'KH00015', 21600)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00039', N'phucnh', CAST(0xC2420B00 AS Date), N'KH00001', 28500)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00040', N'phucnh', CAST(0xC3420B00 AS Date), N'KH00012', 14500)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00041', N'phucnh', CAST(0xC4420B00 AS Date), N'KH00011', 34800)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00042', N'phucnh', CAST(0xBA420B00 AS Date), N'KH00015', 12100)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00043', N'phucnh', CAST(0xC5420B00 AS Date), N'KH00005', 38300)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00044', N'phucnh', CAST(0xC5420B00 AS Date), N'KH00003', 75000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00045', N'phucnh', CAST(0xC6420B00 AS Date), N'KH00007', 13800)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00046', N'phucnh', CAST(0xC6420B00 AS Date), N'KH00008', 33500)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00047', N'phucnh', CAST(0xC7420B00 AS Date), N'KH00013', 28800)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00048', N'phucnh', CAST(0xC7420B00 AS Date), N'KH00001', 12100)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00049', N'phucnh', CAST(0xC7420B00 AS Date), N'KH00006', 40000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00050', N'phucnh', CAST(0xC8420B00 AS Date), N'KH00015', 27600)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00051', N'phucnh', CAST(0xC9420B00 AS Date), N'KH00001', 43500)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00052', N'phucnh', CAST(0xC9420B00 AS Date), N'KH00003', 43500)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00053', N'phucnh', CAST(0xCA420B00 AS Date), N'KH00011', 34800)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00054', N'phucnh', CAST(0xCA420B00 AS Date), N'KH00005', 38300)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00055', N'phucnh', CAST(0xCB420B00 AS Date), N'KH00003', 150000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00056', N'phucnh', CAST(0xCC420B00 AS Date), N'KH00008', 24200)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00057', N'phucnh', CAST(0xCD420B00 AS Date), N'KH00004', 86000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00058', N'phucnh', CAST(0xCD420B00 AS Date), N'KH00015', 50000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00059', N'phucnh', CAST(0xCE420B00 AS Date), N'KH00007', 54000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00060', N'phucnh', CAST(0xCF420B00 AS Date), N'KH00006', 40000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00061', N'phucnh', CAST(0xCF420B00 AS Date), N'KH00013', 24200)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00062', N'phucnh', CAST(0xD0420B00 AS Date), N'KH00002', 28800)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00063', N'phucnh', CAST(0xD0420B00 AS Date), N'KH00001', 24200)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00064', N'phucnh', CAST(0xD1420B00 AS Date), N'KH00002', 90800)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00065', N'phucnh', CAST(0xD1420B00 AS Date), N'KH00002', 42100)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00066', N'phucnh', CAST(0xD1420B00 AS Date), N'KH00004', 87000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00067', N'phucnh', CAST(0xD2420B00 AS Date), N'KH00010', 39000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00068', N'phucnh', CAST(0xD2420B00 AS Date), N'KH00004', 148000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00069', N'phucnh', CAST(0xD3420B00 AS Date), N'KH00012', 69600)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00070', N'phucnh', CAST(0xD3420B00 AS Date), N'KH00013', 39000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00071', N'phucnh', CAST(0xD4420B00 AS Date), N'KH00013', 89000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00072', N'phucnh', CAST(0xD4420B00 AS Date), N'KH00011', 28500)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00073', N'phucnh', CAST(0xD5420B00 AS Date), N'KH00015', 63000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00074', N'phucnh', CAST(0xD6420B00 AS Date), N'KH00001', 12000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00075', N'phucnh', CAST(0xD6420B00 AS Date), N'KH00011', 69600)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00076', N'phucnh', CAST(0xDA420B00 AS Date), N'KH00015', 46000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00077', N'phucnh', CAST(0xDA420B00 AS Date), N'KH00015', 46000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00078', N'phucnh', CAST(0xDA420B00 AS Date), N'KH00003', 25000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00079', N'phucnh', CAST(0xDA420B00 AS Date), N'KH00015', 25000)
INSERT [dbo].[HoaDon] ([MAHD], [MaNV], [NgayBan], [MaKH], [TongTien]) VALUES (N'HD00080', N'phucnh', CAST(0xDB420B00 AS Date), N'KH00011', 9000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00001', N'HH00005', 2, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00001', N'HH00012', 2, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00001', N'HH00013', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00001', N'HH00063', 1, 2500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00002', N'HH00005', 6, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00002', N'HH00012', 6, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00002', N'HH00013', 9, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00002', N'HH00063', 9, 2500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00003', N'HH00037', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00003', N'HH00055', 3, 6600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00003', N'HH00059', 3, 3000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00003', N'HH00060', 2, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00004', N'HH00037', 6, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00004', N'HH00055', 6, 6600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00004', N'HH00059', 6, 3000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00004', N'HH00060', 4, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00005', N'HH00010', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00005', N'HH00032', 3, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00005', N'HH00064', 2, 1400)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00005', N'HH00065', 3, 600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00006', N'HH00005', 2, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00006', N'HH00012', 2, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00006', N'HH00013', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00006', N'HH00051', 1, 46000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00006', N'HH00063', 3, 2500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00007', N'HH00051', 1, 46000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00008', N'HH00051', 2, 46000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00008', N'HH00057', 1, 56000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00009', N'HH00057', 1, 56000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00010', N'HH00041', 3, 25000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00011', N'HH00041', 2, 25000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00011', N'HH00052', 1, 56000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00012', N'HH00037', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00012', N'HH00055', 3, 6600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00012', N'HH00059', 3, 3000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00012', N'HH00060', 2, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00013', N'HH00005', 2, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00013', N'HH00012', 2, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00013', N'HH00013', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00013', N'HH00063', 1, 2500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00014', N'HH00037', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00014', N'HH00055', 3, 6600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00014', N'HH00059', 3, 3000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00014', N'HH00060', 2, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00015', N'HH00037', 6, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00015', N'HH00055', 6, 6600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00015', N'HH00059', 6, 3000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00015', N'HH00060', 4, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00016', N'HH00066', 1, 30000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00017', N'HH00052', 1, 56000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00017', N'HH00057', 2, 56000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00018', N'HH00013', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00018', N'HH00053', 1, 39000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00018', N'HH00067', 1, 21000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00018', N'HH00069', 3, 4000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00019', N'HH00032', 3, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00019', N'HH00065', 3, 600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00019', N'HH00088', 3, 1200)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00019', N'HH00089', 3, 1300)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00020', N'HH00006', 2, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00020', N'HH00032', 3, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00020', N'HH00055', 3, 6600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00020', N'HH00090', 6, 2400)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00021', N'HH00014', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00021', N'HH00033', 3, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00021', N'HH00064', 2, 1400)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00021', N'HH00065', 3, 600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00022', N'HH00037', 2, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00022', N'HH00061', 2, 500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00022', N'HH00082', 2, 10000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00022', N'HH00084', 2, 8000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00023', N'HH00010', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00023', N'HH00032', 3, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00023', N'HH00064', 2, 1400)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00023', N'HH00065', 3, 600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00024', N'HH00051', 2, 46000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00024', N'HH00057', 1, 56000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00025', N'HH00006', 2, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00025', N'HH00032', 3, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00025', N'HH00055', 3, 6600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00025', N'HH00090', 6, 2400)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00026', N'HH00051', 1, 46000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00027', N'HH00037', 2, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00027', N'HH00061', 2, 500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00027', N'HH00082', 2, 10000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00027', N'HH00084', 2, 8000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00028', N'HH00041', 2, 25000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00029', N'HH00037', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00029', N'HH00055', 3, 6600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00029', N'HH00059', 3, 3000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00029', N'HH00060', 2, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00030', N'HH00037', 2, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00030', N'HH00061', 2, 500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00030', N'HH00082', 2, 10000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00030', N'HH00084', 2, 8000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00031', N'HH00005', 6, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00031', N'HH00012', 6, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00031', N'HH00013', 9, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00031', N'HH00063', 9, 2500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00032', N'HH00014', 3, 1000)
GO
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00032', N'HH00033', 3, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00032', N'HH00064', 2, 1400)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00032', N'HH00065', 3, 600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00033', N'HH00057', 1, 56000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00034', N'HH00005', 2, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00034', N'HH00012', 2, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00034', N'HH00013', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00034', N'HH00051', 1, 46000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00034', N'HH00063', 3, 2500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00035', N'HH00037', 6, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00035', N'HH00055', 6, 6600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00035', N'HH00059', 6, 3000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00035', N'HH00060', 4, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00036', N'HH00041', 2, 25000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00037', N'HH00053', 1, 39000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00038', N'HH00091', 3, 1800)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00038', N'HH00092', 3, 5400)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00039', N'HH00005', 6, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00039', N'HH00012', 6, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00039', N'HH00013', 9, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00039', N'HH00063', 3, 2500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00040', N'HH00005', 2, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00040', N'HH00012', 2, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00040', N'HH00013', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00040', N'HH00063', 3, 2500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00041', N'HH00037', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00041', N'HH00055', 3, 6600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00041', N'HH00059', 3, 3000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00041', N'HH00060', 2, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00042', N'HH00010', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00042', N'HH00032', 3, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00042', N'HH00064', 2, 1400)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00042', N'HH00065', 3, 600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00043', N'HH00014', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00043', N'HH00015', 2, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00043', N'HH00061', 3, 500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00043', N'HH00065', 3, 600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00043', N'HH00066', 1, 30000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00044', N'HH00013', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00044', N'HH00053', 1, 39000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00044', N'HH00067', 1, 21000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00044', N'HH00069', 3, 4000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00045', N'HH00032', 3, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00045', N'HH00065', 3, 600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00045', N'HH00088', 3, 1200)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00045', N'HH00089', 3, 1300)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00046', N'HH00006', 2, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00046', N'HH00032', 3, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00046', N'HH00055', 3, 6600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00046', N'HH00090', 3, 2400)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00047', N'HH00091', 4, 1800)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00047', N'HH00092', 4, 5400)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00048', N'HH00014', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00048', N'HH00033', 3, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00048', N'HH00064', 2, 1400)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00048', N'HH00065', 3, 600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00049', N'HH00037', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00049', N'HH00061', 2, 500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00049', N'HH00082', 2, 10000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00049', N'HH00084', 2, 8000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00050', N'HH00032', 6, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00050', N'HH00065', 6, 600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00050', N'HH00088', 6, 1200)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00050', N'HH00089', 6, 1300)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00051', N'HH00005', 6, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00051', N'HH00012', 6, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00051', N'HH00013', 9, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00051', N'HH00063', 9, 2500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00052', N'HH00005', 6, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00052', N'HH00012', 6, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00052', N'HH00013', 9, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00052', N'HH00063', 9, 2500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00053', N'HH00037', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00053', N'HH00055', 3, 6600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00053', N'HH00059', 3, 3000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00053', N'HH00060', 2, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00054', N'HH00014', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00054', N'HH00015', 2, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00054', N'HH00061', 3, 500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00054', N'HH00065', 3, 600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00054', N'HH00066', 1, 30000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00055', N'HH00013', 6, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00055', N'HH00053', 2, 39000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00055', N'HH00067', 2, 21000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00055', N'HH00069', 6, 4000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00056', N'HH00010', 6, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00056', N'HH00032', 6, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00056', N'HH00064', 4, 1400)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00056', N'HH00065', 6, 600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00057', N'HH00052', 1, 56000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00057', N'HH00066', 1, 30000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00058', N'HH00041', 2, 25000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00059', N'HH00092', 10, 5400)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00060', N'HH00037', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00060', N'HH00061', 2, 500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00060', N'HH00082', 2, 10000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00060', N'HH00084', 2, 8000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00061', N'HH00014', 6, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00061', N'HH00033', 6, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00061', N'HH00064', 4, 1400)
GO
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00061', N'HH00065', 6, 600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00062', N'HH00091', 4, 1800)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00062', N'HH00092', 4, 5400)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00063', N'HH00014', 6, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00063', N'HH00033', 6, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00063', N'HH00064', 4, 1400)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00063', N'HH00065', 6, 600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00064', N'HH00037', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00064', N'HH00055', 3, 6600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00064', N'HH00057', 1, 56000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00064', N'HH00059', 3, 3000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00064', N'HH00060', 2, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00065', N'HH00014', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00065', N'HH00033', 3, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00065', N'HH00064', 2, 1400)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00065', N'HH00065', 3, 600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00065', N'HH00066', 1, 30000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00066', N'HH00074', 1, 42000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00066', N'HH00078', 1, 45000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00067', N'HH00041', 1, 25000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00067', N'HH00075', 2, 7000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00068', N'HH00051', 2, 46000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00068', N'HH00057', 1, 56000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00069', N'HH00037', 6, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00069', N'HH00055', 6, 6600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00069', N'HH00059', 6, 3000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00069', N'HH00060', 4, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00070', N'HH00037', 2, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00070', N'HH00061', 2, 500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00070', N'HH00082', 2, 10000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00070', N'HH00084', 2, 8000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00071', N'HH00076', 2, 20000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00071', N'HH00079', 1, 49000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00072', N'HH00005', 6, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00072', N'HH00012', 6, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00072', N'HH00013', 9, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00072', N'HH00063', 3, 2500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00073', N'HH00078', 1, 45000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00073', N'HH00091', 10, 1800)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00074', N'HH00005', 2, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00074', N'HH00012', 2, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00074', N'HH00013', 3, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00074', N'HH00063', 2, 2500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00075', N'HH00037', 6, 1000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00075', N'HH00055', 6, 6600)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00075', N'HH00059', 6, 3000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00075', N'HH00060', 4, 1500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00076', N'HH00051', 1, 46000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00077', N'HH00051', 1, 46000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00078', N'HH00041', 1, 25000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00079', N'HH00041', 1, 25000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHH], [SoLuong], [DonGia]) VALUES (N'HD00080', N'HH00091', 5, 1800)
INSERT [dbo].[KhachHang] ([MAKH], [TenKH], [GioiTinh], [SDT], [NamSinh], [Diem]) VALUES (N'KH00001', N'Nguyễn Quốc Bảo', 1, N'456       ', 1992, 151.4)
INSERT [dbo].[KhachHang] ([MAKH], [TenKH], [GioiTinh], [SDT], [NamSinh], [Diem]) VALUES (N'KH00002', N'Nguyễn Thị Hương Lan', 0, N'789       ', 1998, 338.70000000000005)
INSERT [dbo].[KhachHang] ([MAKH], [TenKH], [GioiTinh], [SDT], [NamSinh], [Diem]) VALUES (N'KH00003', N'Nguyễn Thị Liễu', 0, N'123       ', 1978, 461.9)
INSERT [dbo].[KhachHang] ([MAKH], [TenKH], [GioiTinh], [SDT], [NamSinh], [Diem]) VALUES (N'KH00004', N'Nguyễn Kim Ngọc', 0, N'789       ', 1998, 561)
INSERT [dbo].[KhachHang] ([MAKH], [TenKH], [GioiTinh], [SDT], [NamSinh], [Diem]) VALUES (N'KH00005', N'Lê Thành Nhân', 1, N'123       ', 2000, 146.2)
INSERT [dbo].[KhachHang] ([MAKH], [TenKH], [GioiTinh], [SDT], [NamSinh], [Diem]) VALUES (N'KH00006', N'Nguyễn Yến Nhi', 0, N'753       ', 1996, 189.8)
INSERT [dbo].[KhachHang] ([MAKH], [TenKH], [GioiTinh], [SDT], [NamSinh], [Diem]) VALUES (N'KH00007', N'Nguyễn Thị Nở', 0, N'123       ', 1975, 187.60000000000002)
INSERT [dbo].[KhachHang] ([MAKH], [TenKH], [GioiTinh], [SDT], [NamSinh], [Diem]) VALUES (N'KH00008', N'Phan Hữu Phước', 1, N'235       ', 1996, 57.7)
INSERT [dbo].[KhachHang] ([MAKH], [TenKH], [GioiTinh], [SDT], [NamSinh], [Diem]) VALUES (N'KH00009', N'Nguyễn Văn Quang', 1, N'123       ', 1990, 30)
INSERT [dbo].[KhachHang] ([MAKH], [TenKH], [GioiTinh], [SDT], [NamSinh], [Diem]) VALUES (N'KH00010', N'Nguyễn Văn Tèo', 1, N'123       ', 1992, 250.60000000000002)
INSERT [dbo].[KhachHang] ([MAKH], [TenKH], [GioiTinh], [SDT], [NamSinh], [Diem]) VALUES (N'KH00011', N'Nguyễn Văn Trang', 1, N'123       ', 1975, 176.7)
INSERT [dbo].[KhachHang] ([MAKH], [TenKH], [GioiTinh], [SDT], [NamSinh], [Diem]) VALUES (N'KH00012', N'Nguyễn Ngọc Tuấn', 1, N'123       ', 1995, 159.1)
INSERT [dbo].[KhachHang] ([MAKH], [TenKH], [GioiTinh], [SDT], [NamSinh], [Diem]) VALUES (N'KH00013', N'Nguyễn Ngọc Xuân', 0, N'123       ', 2002, 365.2)
INSERT [dbo].[KhachHang] ([MAKH], [TenKH], [GioiTinh], [SDT], [NamSinh], [Diem]) VALUES (N'KH00014', N'Lan', 1, N'0325678942', 2000, 0)
INSERT [dbo].[KhachHang] ([MAKH], [TenKH], [GioiTinh], [SDT], [NamSinh], [Diem]) VALUES (N'KH00015', N'Khách Vãng Lai', 1, N'          ', 0, 701.40000000000009)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [SDT], [Email], [GioiTinh], [MatKhau], [VaiTro], [Hinh]) VALUES (N'baodq', N'Đinh Quốc Bảo', N'0322366599', N'baodq90@gmail.com', 1, N'123', 0, N'80559920_2611627615732340_3297990947194798080_n.jpg')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [SDT], [Email], [GioiTinh], [MatKhau], [VaiTro], [Hinh]) VALUES (N'dainq', N'Nguyễn Quốc Đại', N'0123456789', N'dainq123@gmail.com', 1, N'123', 0, N'IMG_3996.JPG')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [SDT], [Email], [GioiTinh], [MatKhau], [VaiTro], [Hinh]) VALUES (N'diemnn', N'Nguyễn Ngọc Diễm', N'0978456365', N'diemnn@hmail.com', 0, N'123', 0, NULL)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [SDT], [Email], [GioiTinh], [MatKhau], [VaiTro], [Hinh]) VALUES (N'linhltt', N'Liễu Thị Thùy Linh', N'0365413698', N'linhlt@gmail.com', 0, N'123', 0, NULL)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [SDT], [Email], [GioiTinh], [MatKhau], [VaiTro], [Hinh]) VALUES (N'linhnk', N'Ngô Khánh Linh', N'0984569822', N'linhnk@gmail.com', 0, N'123', 0, NULL)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [SDT], [Email], [GioiTinh], [MatKhau], [VaiTro], [Hinh]) VALUES (N'nhanph', N'Phùng Hạc Nhân', N'0365239965', N'nhanph@gmail.com', 1, N'123', 0, NULL)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [SDT], [Email], [GioiTinh], [MatKhau], [VaiTro], [Hinh]) VALUES (N'phucnh', N'Nguyễn Hoàng Phúc', N'0389021414', N'phucnguyenhoang769@gmail.com', 1, N'123', 1, N'about.png')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [SDT], [Email], [GioiTinh], [MatKhau], [VaiTro], [Hinh]) VALUES (N'thunt', N'Nguyễn Trang Thư', N'0325688965', N'thunt2k@gmail.com', 0, N'123', 0, NULL)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [SDT], [Email], [GioiTinh], [MatKhau], [VaiTro], [Hinh]) VALUES (N'vietdvn', N'Đoàn Văn Nhật Việt', N'0359965411', N'vietdvnps09874@fpt.edu.vn', 1, N'123', 1, N'223144129_425203345420166_7517317690354378964_n.jpg')
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00001', N'Nhóm dạ dày', N'')
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00002', N'Nhóm giãn cơ', N'')
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00003', N'Nhóm giảm đau hạ sốt', N'Nhóm giảm đau hạ sốt')
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00004', N'Nhóm hô hấp', N'')
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00005', N'Nhóm hóc môn nội tiết', N'')
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00006', N'Nhóm kháng histamin', N'')
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00007', N'Nhóm kháng sinh', N'Nhóm kháng sinh')
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00008', N'Nhóm kháng viêm', N'')
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00009', N'Nhóm nhỏ mũi', N'')
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00010', N'Nhóm nhỏ mắt', N'')
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00011', N'Nhóm nhỏ tai', N'')
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00012', N'Nhóm sát trùng', N'')
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00013', N'Nhóm tiểu đường', NULL)
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00014', N'Nhóm tuần hoàn não - an thần', N'')
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00015', N'Nhóm xương khớp', N'')
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00016', N'Nhóm thực phẩm chức năng', N'')
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00017', N'Nhóm kháng nấm, trị ký sinh trùng', N'')
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00018', N'Nhóm sỏi thận - sỏi mật', N'')
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00019', N'Nhóm tiêu chảy - táo bón', NULL)
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00020', N'Nhóm vitamin - khoáng chất', NULL)
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00021', N'Nhóm giun - sán - nấm', NULL)
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00022', N'Nhóm sản - phụ khoa - tránh thai', NULL)
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00023', N'Nhóm siro trị ho', NULL)
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00024', N'Nhóm cấp cứu giải độc', NULL)
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00025', N'Nhóm thuốc gan', NULL)
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00026', N'Nhóm da liễu', N'')
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00027', N'Nhóm dầu, thuốc dán', N'')
INSERT [dbo].[NhomThuoc] ([MANT], [TenNT], [MoTa]) VALUES (N'NT00028', N'Nhóm tim mạch', N'')
ALTER TABLE [dbo].[DanhMucThuoc] ADD  CONSTRAINT [IDDMT]  DEFAULT ([DBO].[AUTO_IDDMT]()) FOR [MATHUOC]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [IDHH]  DEFAULT ([DBO].[AUTO_IDHH]()) FOR [MAHH]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [IDHD]  DEFAULT ([DBO].[AUTO_IDHD]()) FOR [MAHD]
GO
select * from HoaDonChiTiet
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [IDKH]  DEFAULT ([DBO].[AUTO_IDKH]()) FOR [MAKH]
GO
ALTER TABLE [dbo].[NhomThuoc] ADD  CONSTRAINT [IDNT]  DEFAULT ([DBO].[AUTO_IDNT]()) FOR [MANT]
GO
ALTER TABLE [dbo].[DanhMucThuoc]  WITH CHECK ADD  CONSTRAINT [FK_DanhMucThuoc_NhomThuoc] FOREIGN KEY([MaNT])
REFERENCES [dbo].[NhomThuoc] ([MANT])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DanhMucThuoc] CHECK CONSTRAINT [FK_DanhMucThuoc_NhomThuoc]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_DanhMucThuoc] FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[DanhMucThuoc] ([MATHUOC])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_DanhMucThuoc]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MAKH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonChiTiet_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MAHH])
GO
ALTER TABLE [dbo].[HoaDonChiTiet] CHECK CONSTRAINT [FK_HoaDonChiTiet_HangHoa]
GO
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonChiTiet_HoaDon] FOREIGN KEY([MaHDCT])
REFERENCES [dbo].[HoaDon] ([MAHD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDonChiTiet] CHECK CONSTRAINT [FK_HoaDonChiTiet_HoaDon]
GO
select * from NhanVien
