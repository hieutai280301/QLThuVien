CREATE DATABASE QLTHUVIEN
GO

USE QLTHUVIEN
GO

CREATE TABLE ThuThu(
	MaThuThu VARCHAR(10) PRIMARY KEY,
	HoTen NVARCHAR(50),
	NgaySinh DATE,
	ChucVu NVARCHAR(20)
)

CREATE TABLE TaiKhoanNV(
	TK VARCHAR(10) NOT NULL,
	MK VARCHAR(10) NOT NULL,
	MaThuThu VARCHAR(10) REFERENCES dbo.ThuThu(MaThuThu)
)

CREATE TABLE DocGia(
	MaDocGia VARCHAR(10) PRIMARY KEY,
	TenDocGia NVARCHAR(50),
	NgaySinh DATE,
	GioiTinh CHAR(4) CHECK (GioiTinh IN ('NAM', 'NU')),
	SDT INT,
	Email NVARCHAR(50),
)

CREATE TABLE TaiKhoanDG(
	TK VARCHAR(10) NOT NULL,
	MK VARCHAR(10) NOT NULL,
	MaDocGia VARCHAR(10) REFERENCES dbo.DocGia(MaDocGia)
)

CREATE TABLE TheThuVien(
	MaThe VARCHAR(10) PRIMARY KEY,
	NgayDangKy DATE,
	NgayHetHan DATE,
	MaDocGia VARCHAR(10) REFERENCES dbo.DocGia(MaDocGia)
)

CREATE TABLE PhieuMuonTra(
	MaPhieuMT VARCHAR(10) PRIMARY KEY,
	NgayMuon DATE,
	HanTra DATE,
	MaDocGia VARCHAR(10) REFERENCES dbo.DocGia(MaDocGia),
	MaThuThu VARCHAR(10) REFERENCES dbo.ThuThu(MaThuThu)
)

CREATE TABLE NhaXuatBan(
	MaNXB VARCHAR(10) PRIMARY KEY,
	TenNXB NVARCHAR(50),
	DiaChi NVARCHAR(50)
)

CREATE TABLE ViTri(
	MaViTri VARCHAR(10) PRIMARY KEY,
	Tang INT,
	Ngan INT
)

CREATE TABLE TacGia(
	MaTacGia VARCHAR(10) PRIMARY KEY,
	TenTacGia NVARCHAR(50)
)

CREATE TABLE DauSach(
	MaDauSach VARCHAR(10) PRIMARY KEY,
	TenDauSach NVARCHAR(50),
	TheLoai NVARCHAR(50),
	GiaThanh INT,
	MaNXB VARCHAR(10) REFERENCES dbo.NhaXuatBan(MaNXB)
)

CREATE TABLE CuonSach(
	MaCuonSach VARCHAR(10) PRIMARY KEY,
	TinhTrang NVARCHAR(50),
	MaViTri VARCHAR(10) REFERENCES dbo.ViTri(MaViTri),
	MaDauSach VARCHAR(10) REFERENCES dbo.DauSach(MaDauSach)
)

CREATE TABLE PhieuPhat(
	MaPhieuPhat VARCHAR(10) PRIMARY KEY,
	NgayPhat DATE,
	TongTien INT,
	MaPhieuMT VARCHAR(10) REFERENCES dbo.PhieuMuonTra(MaPhieuMT)
)

CREATE TABLE DanhMucXuPhat(
	MaPhieuPhat VARCHAR(10) REFERENCES dbo.PhieuPhat(MaPhieuPhat),
	LiDo NVARCHAR(50),
	TienPhat INT,
	CONSTRAINT phat_dmuc PRIMARY KEY(MaPhieuPhat,LiDo)
)

CREATE TABLE LichSuMuonTra(
	MaPhieuMT VARCHAR(10) REFERENCES dbo.PhieuMuonTra(MaPhieuMT),
	MaCuonSach VARCHAR(10) REFERENCES dbo.CuonSach(MaCuonSach),
	TinhTrang NVARCHAR(50),
	NgayTra DATE,
	CONSTRAINT ma_Muon_Sach PRIMARY KEY(MaPhieuMT,MaCuonSach)
)

CREATE TABLE SangTac(
	MaDauSach VARCHAR(10) REFERENCES dbo.DauSach(MaDauSach),
	MaTacGia VARCHAR(10) REFERENCES dbo.TacGia(MaTacGia),
	ViTriVaiTro NVARCHAR(50),
	CONSTRAINT ma_Sach_Tgia PRIMARY KEY(MaDauSach,MaTacGia)
)

--Thêm dữ liệu ThuThu
INSERT [dbo].[ThuThu] VALUES (N'TT01',N'Nguyễn A', CAST(N'1990-01-01' AS DATE), NULL)
INSERT [dbo].[ThuThu] VALUES (N'TT02',N'Nguyễn B', CAST(N'1991-01-02' AS DATE), NULL)
INSERT [dbo].[ThuThu] VALUES (N'TT03',N'Nguyễn C', CAST(N'1990-01-03' AS DATE), NULL)
INSERT [dbo].[ThuThu] VALUES (N'TT04',N'Nguyễn D', CAST(N'1992-01-04' AS DATE), NULL)
INSERT [dbo].[ThuThu] VALUES (N'TT05',N'Nguyễn E', CAST(N'1990-01-05' AS DATE), NULL)
INSERT [dbo].[ThuThu] VALUES (N'TT06',N'Nguyễn F', CAST(N'1991-02-04' AS DATE), NULL)

--Thêm dữ liệu TaiKhoanNV
INSERT [dbo].[TaiKhoanNV] VALUES (N'TK01',N'MK01',N'TT01')
INSERT [dbo].[TaiKhoanNV] VALUES (N'TK02',N'MK02',N'TT02')
INSERT [dbo].[TaiKhoanNV] VALUES (N'TK03',N'MK03',N'TT03')
INSERT [dbo].[TaiKhoanNV] VALUES (N'TK04',N'MK04',N'TT04')
INSERT [dbo].[TaiKhoanNV] VALUES (N'TK05',N'MK05',N'TT05')
INSERT [dbo].[TaiKhoanNV] VALUES (N'TK06',N'MK06',N'TT06')

--Thêm dữ liệu DocGia
INSERT [dbo].[DocGia] VALUES (N'DG01',N'Lê A', CAST(N'2001-01-01' AS DATE),N'NAM',NULL,NULL)
INSERT [dbo].[DocGia] VALUES (N'DG02',N'Lê B', CAST(N'2000-01-01' AS DATE),N'NAM',NULL,NULL)
INSERT [dbo].[DocGia] VALUES (N'DG03',N'Lê C', CAST(N'1999-01-01' AS DATE),N'NU',NULL,NULL)
INSERT [dbo].[DocGia] VALUES (N'DG04',N'Lê D', CAST(N'2001-02-02' AS DATE),N'NU',NULL,NULL)
INSERT [dbo].[DocGia] VALUES (N'DG05',N'Lê E', CAST(N'2001-01-02' AS DATE),N'NAM',NULL,NULL)
INSERT [dbo].[DocGia] VALUES (N'DG06',N'Lê F', CAST(N'2001-05-06' AS DATE),N'NAM',NULL,NULL)

--Thêm dữ liệu TaiKhoanDG
INSERT [dbo].[TaiKhoanDG] VALUES (N'TK01',N'MK01',N'DG01')
INSERT [dbo].[TaiKhoanDG] VALUES (N'TK02',N'MK02',N'DG02')
INSERT [dbo].[TaiKhoanDG] VALUES (N'TK03',N'MK03',N'DG03')
INSERT [dbo].[TaiKhoanDG] VALUES (N'TK04',N'MK04',N'DG04')
INSERT [dbo].[TaiKhoanDG] VALUES (N'TK05',N'MK05',N'DG05')
INSERT [dbo].[TaiKhoanDG] VALUES (N'TK06',N'MK06',N'DG06')

--Thêm dữ liệu TheThuVien
INSERT [dbo].[TheThuVien] VALUES (N'MT01', CAST(N'2019-01-01' AS DATE),CAST(N'2024-01-01' AS DATE),N'DG01')
INSERT [dbo].[TheThuVien] VALUES (N'MT02', CAST(N'2018-01-01' AS DATE),CAST(N'2023-01-01' AS DATE),N'DG02')
INSERT [dbo].[TheThuVien] VALUES (N'MT03', CAST(N'2017-01-01' AS DATE),CAST(N'2022-01-01' AS DATE),N'DG03')
INSERT [dbo].[TheThuVien] VALUES (N'MT04', CAST(N'2016-01-01' AS DATE),CAST(N'2021-01-01' AS DATE),N'DG04')
INSERT [dbo].[TheThuVien] VALUES (N'MT05', CAST(N'2019-01-01' AS DATE),CAST(N'2024-01-01' AS DATE),N'DG05')
INSERT [dbo].[TheThuVien] VALUES (N'MT06', CAST(N'2019-01-01' AS DATE),CAST(N'2024-01-01' AS DATE),N'DG06')

--Thêm dữ liệu PhieuMuonTra
INSERT [PhieuMuonTra] VALUES (N'MT01',CAST(N'2022-04-18' AS DATE), CAST(N'2022-10-18' AS DATE),N'DG01',N'TT01')
INSERT [PhieuMuonTra] VALUES (N'MT02',CAST(N'2022-03-05' AS DATE), CAST(N'2022-03-05' AS DATE),N'DG02',N'TT01')
INSERT [PhieuMuonTra] VALUES (N'MT03',CAST(N'2021-10-12' AS DATE), CAST(N'2022-04-12' AS DATE),N'DG03',N'TT02')
INSERT [PhieuMuonTra] VALUES (N'MT04',CAST(N'2021-08-06' AS DATE), CAST(N'2022-02-06' AS DATE),N'DG04',N'TT05')
INSERT [PhieuMuonTra] VALUES (N'MT05',CAST(N'2021-09-10' AS DATE), CAST(N'2022-03-10' AS DATE),N'DG05',N'TT03')
INSERT [PhieuMuonTra] VALUES (N'MT06',CAST(N'2020-06-10' AS DATE), CAST(N'2021-06-10' AS DATE),N'DG06',N'TT06')

--Thêm dữ liệu NhaXuatBan
INSERT [NhaXuatBan] VALUES (N'NXB01',N'Kim Đồng',NULL)
INSERT [NhaXuatBan] VALUES (N'NXB02',N'Quân đội nhân dân',NULL)
INSERT [NhaXuatBan] VALUES (N'NXB03',N'Giáo dục',NULL)
INSERT [NhaXuatBan] VALUES (N'NXB04',N'Trẻ',NULL)
INSERT [NhaXuatBan] VALUES (N'NXB05',N'Đại học Quốc Gia Hà Nội',NULL)
INSERT [NhaXuatBan] VALUES (N'NXB06',N'Văn học',NULL)

--Thêm dữ liệu ViTri
INSERT [ViTri] VALUES ('VT01',1,1)
INSERT [ViTri] VALUES ('VT02',1,2)
INSERT [ViTri] VALUES ('VT03',2,1)
INSERT [ViTri] VALUES ('VT04',2,2)
INSERT [ViTri] VALUES ('VT05',3,3)
INSERT [ViTri] VALUES ('VT06',3,1)
INSERT [ViTri] VALUES ('VT07',3,2)

--Thêm dữ liệu TacGia
INSERT [TacGia] VALUES (N'TG01',N'Nam Cao')
INSERT [TacGia] VALUES (N'TG02',N'Nguyễn Du')
INSERT [TacGia] VALUES (N'TG03',N'Tố Hữu')
INSERT [TacGia] VALUES (N'TG04',N'Hồ Chí Minh')
INSERT [TacGia] VALUES (N'TG05',N'Nguyễn Nhật Ánh')
INSERT [TacGia] VALUES (N'TG06',N'Aoyama Gosho')

--Thêm dữ liệu DauSach
INSERT [DauSach] VALUES (N'DS01',N'Thám tử lừng danh Conan - Tập 1',N'Truyện',18000,N'NXB01')
INSERT [DauSach] VALUES (N'DS02',N'Truyện Kiều',N'Văn học',89000,N'NXB06')
INSERT [DauSach] VALUES (N'DS03',N'Chí Phèo',N'Văn học',38000,N'NXB06')
INSERT [DauSach] VALUES (N'DS04',N'Nhật ký trong tù',N'Nhật ký',65000,N'NXB01')
INSERT [DauSach] VALUES (N'DS05',N'Thơ Tố Hữu',N'Thơ',46000,N'NXB06')
INSERT [DauSach] VALUES (N'DS06',N'Mắt biếc',N'Truyện',93500,N'NXB04')
INSERT [DauSach] VALUES (N'DS07',N'Phòng trọ ba người',N'Truyện',72000,N'NXB04')
INSERT [DauSach] VALUES (N'DS08',N'Cảm ơn người lớn',N'Truyện',110000,N'NXB04')

--Thêm dữ liệu CuonSach
INSERT [CuonSach] VALUES (N'CS01',N'Đã mượn',N'VT01','DS01')
INSERT [CuonSach] VALUES (N'CS02',N'Đã mượn',N'VT02','DS02')
INSERT [CuonSach] VALUES (N'CS03',N'Đã mượn',N'VT03','DS03')
INSERT [CuonSach] VALUES (N'CS04',N'Đã mượn',N'VT04','DS04')
INSERT [CuonSach] VALUES (N'CS05',N'Đã mượn',N'VT05','DS05')
INSERT [CuonSach] VALUES (N'CS06',N'Sẵn sàng',N'VT01','DS01')
INSERT [CuonSach] VALUES (N'CS07',N'Sẵn sàng',N'VT06','DS06')
INSERT [CuonSach] VALUES (N'CS08',N'Sẵn sàng',N'VT06','DS07')
INSERT [CuonSach] VALUES (N'CS09',N'Sẵn sàng',N'VT06','DS08')


--Thêm dữ liệu PhieuPhat
INSERT [PhieuPhat] VALUES (N'P01',CAST(N'2022-04-20' AS DATE),23000,N'MT01')
INSERT [PhieuPhat] VALUES (N'P02',CAST(N'2022-03-10' AS DATE),5000,N'MT02')
INSERT [PhieuPhat] VALUES (N'P03',CAST(N'2022-04-22' AS DATE),10000,N'MT03')
INSERT [PhieuPhat] VALUES (N'P04',CAST(N'2022-02-10' AS DATE),74000,N'MT04')
INSERT [PhieuPhat] VALUES (N'P05',CAST(N'2022-03-11' AS DATE),1000,N'MT05')

--Thêm dữ liệu DanhMucXuPhat
INSERT [DanhMucXuPhat] VALUES (N'P01',N'Mất sách + 5000đ/quyển',23000)
INSERT [DanhMucXuPhat] VALUES (N'P02',N'Trả trễ 5 ngày',5000)
INSERT [DanhMucXuPhat] VALUES (N'P03',N'Trả trễ 10 ngày',10000)
INSERT [DanhMucXuPhat] VALUES (N'P04',N'Mất sách + 5000đ/quyển',70000)
INSERT [DanhMucXuPhat] VALUES (N'P04',N'Trả trễ 4 ngày',4000)
INSERT [DanhMucXuPhat] VALUES (N'P05',N'Trả trễ 1 ngày',1000)

--Thêm dữ liệu LichSuMuonTra
INSERT [LichSuMuonTra] VALUES (N'MT01',N'CS01',N'Mất',CAST(N'2022-04-20' AS DATE))
INSERT [LichSuMuonTra] VALUES (N'MT02',N'CS02',N'Tốt',CAST(N'2022-03-10' AS DATE))
INSERT [LichSuMuonTra] VALUES (N'MT03',N'CS03',N'Tốt',CAST(N'2022-04-22' AS DATE))
INSERT [LichSuMuonTra] VALUES (N'MT04',N'CS04',N'Mất',CAST(N'2022-02-10' AS DATE))
INSERT [LichSuMuonTra] VALUES (N'MT05',N'CS05',N'Tốt',CAST(N'2022-03-11' AS DATE))
INSERT [LichSuMuonTra] VALUES (N'MT06',N'CS01',N'Tốt',CAST(N'2021-04-10' AS DATE))

--Thêm dữ liệu SangTac
INSERT [SangTac] VALUES (N'DS01',N'TG06',N'Chủ biên')
INSERT [SangTac] VALUES (N'DS02',N'TG02',N'Chủ biên')
INSERT [SangTac] VALUES (N'DS03',N'TG01',N'Chủ biên')
INSERT [SangTac] VALUES (N'DS04',N'TG04',N'Chủ biên')
INSERT [SangTac] VALUES (N'DS05',N'TG03',N'Chủ biên')
INSERT [SangTac] VALUES (N'DS06',N'TG05',N'Chủ biên')
INSERT [SangTac] VALUES (N'DS07',N'TG05',N'Chủ biên')
INSERT [SangTac] VALUES (N'DS08',N'TG05',N'Chủ biên')

--DSQH
--1. Đưa ra thông tin học viên mượn nhiều sách nhất
SELECT TOP 1 WITH TIES DG.MaDocGia, COUNT(MT.MaDocGia) TONGSACHMUON
FROM dbo.DocGia DG, dbo.PhieuMuonTra MT
WHERE DG.MaDocGia=MT.MaDocGia 
GROUP BY DG.MaDocGia
ORDER BY COUNT(MT.MaDocGia) DESC

--2. Đưa ra thông tin NXB của sách có nhiều ở thư viện nhất
SELECT TOP 1 WITH TIES NXB.MaNXB, NXB.TenNXB, COUNT(DS.MaDauSach) TONGSACH
FROM dbo.NhaXuatBan NXB, dbo.DauSach DS
WHERE NXB.MaNXB=DS.MaNXB
GROUP BY NXB.MaNXB, NXB.TenNXB
ORDER BY COUNT(DS.MaDauSach) DESC

--3. Đưa ra thông tin Thể loại sách ít nhất ở thư viện
SELECT TOP 1 WITH TIES TheLoai,COUNT(TheLoai) TONGTHELOAI
FROM dbo.DauSach
GROUP BY TheLoai
ORDER BY COUNT(TheLoai) ASC

--4. Đưa ra thông tin những cuốn sách bị mất
SELECT CS.MaCuonSach, DS.TenDauSach, LS.TinhTrang
FROM dbo.CuonSach CS, dbo.LichSuMuonTra LS, dbo.DauSach DS
WHERE LS.TinhTrang=N'Mất' AND CS.MaCuonSach=LS.MaCuonSach AND CS.MaDauSach=DS.MaDauSach

--5. Đưa ra thông tin những cuốn sách NXB Kim Đồng
SELECT CS.MaCuonSach,DS.TenDauSach,NXB.TenNXB
FROM dbo.CuonSach CS, dbo.DauSach DS, dbo.NhaXuatBan NXB
WHERE DS.MaNXB=NXB.MaNXB AND CS.MaDauSach=DS.MaDauSach AND NXB.TenNXB=N'Kim Đồng'

--6. Đưa ra thông tin những độc giả bị phạt và lý do
SELECT DG.MaDocGia,DG.TenDocGia,DM.LiDo
FROM dbo.DocGia DG, dbo.PhieuMuonTra MT, dbo.PhieuPhat PP, dbo.DanhMucXuPhat DM
WHERE DG.MaDocGia=MT.MaDocGia AND MT.MaPhieuMT=PP.MaPhieuMT AND PP.MaPhieuPhat=DM.MaPhieuPhat

--7. Đưa ra thông tin những độc giả làm mất sách
SELECT MT.MaDocGia,DG.TenDocGia 
FROM dbo.DocGia DG,dbo.PhieuMuonTra MT,dbo.LichSuMuonTra LS
WHERE MT.MaDocGia=DG.MaDocGia AND MT.MaPhieuMT=LS.MaPhieuMT AND LS.TinhTrang=N'Mất'

--8. Đưa ra thông tin cuốn sách giá thành trên 50.000đ
SELECT CS.MaCuonSach,DS.TenDauSach,DS.GiaThanh
FROM dbo.CuonSach CS, dbo.DauSach DS
WHERE DS.MaDauSach=CS.MaDauSach AND DS.GiaThanh>=50000
  
--9. Đưa ra thông tin những cuốn sách đã được mượn
SELECT CS.MaCuonSach,DS.TenDauSach,CS.TinhTrang
FROM dbo.CuonSach CS,dbo.DauSach DS
WHERE CS.MaDauSach=DS.MaDauSach AND CS.TinhTrang=N'Đã mượn'

--10. Đưa ra thông tin những cuốn sách chưa được mượn 
SELECT CS.MaCuonSach,DS.TenDauSach,CS.TinhTrang
FROM dbo.CuonSach CS,dbo.DauSach DS
WHERE CS.MaDauSach=DS.MaDauSach AND CS.TinhTrang=N'Sẵn sàng'

--11. Đưa ra thông tin những cuốn sách được đặt ở tầng 2
SELECT CS.MaCuonSach,DS.TenDauSach, VT.Tang, VT.Ngan
FROM dbo.CuonSach CS,dbo.DauSach DS, dbo.ViTri VT
WHERE CS.MaDauSach=DS.MaDauSach AND CS.MaViTri=VT.MaViTri AND VT.Tang=2

--12. Đưa ra thông tin những cuốn sách được đặt ở ngăn thứ 3, tầng 3
SELECT CS.MaCuonSach,DS.TenDauSach, VT.Tang, VT.Ngan
FROM dbo.CuonSach CS,dbo.DauSach DS, dbo.ViTri VT
WHERE CS.MaDauSach=DS.MaDauSach AND CS.MaViTri=VT.MaViTri AND VT.Tang=3 AND VT.Ngan=3

--13. Đưa ra thông tin những độc giả là có thẻ thư viện đăng ký từ năm 2019
SELECT DG.MaDocGia, DG.TenDocGia, T.NgayDangKy
FROM dbo.DocGia DG, dbo.TheThuVien T
WHERE DG.MaDocGia=T.MaDocGia AND YEAR(T.NgayDangKy)=2019

--14. Đưa ra thông tin những độc giả mượn sách trên 3 quyển
SELECT DG.MaDocGia,DG.TenDocGia,COUNT(MT.MaDocGia) TONGSACH
FROM dbo.DocGia DG, dbo.PhieuMuonTra MT
WHERE DG.MaDocGia=MT.MaDocGia
GROUP BY DG.MaDocGia,DG.TenDocGia
HAVING COUNT(MT.MaDocGia)>=3

--15. Đưa ra thông tin độc giả bị phạt nhiều lý do nhất
SELECT TOP 1 WITH TIES DG.MaDocGia,DG.TenDocGia,COUNT(DM.MaPhieuPhat) TONGLYDO
FROM dbo.DocGia DG,dbo.PhieuMuonTra MT,dbo.PhieuPhat PP,dbo.DanhMucXuPhat DM
WHERE DG.MaDocGia=MT.MaDocGia AND MT.MaPhieuMT=PP.MaPhieuMT AND PP.MaPhieuPhat=DM.MaPhieuPhat
GROUP BY DG.MaDocGia,DG.TenDocGia
ORDER BY COUNT(DM.MaPhieuPhat) DESC

--16. Đưa ra thông tin những tác giả là chủ biên của 2 đầu sách trở lên
SELECT TG.MaTacGia,TG.TenTacGia,COUNT(ST.MaTacGia) TONGSACH
FROM dbo.SangTac ST, dbo.TacGia TG
WHERE ST.MaTacGia=TG.MaTacGia AND ST.ViTriVaiTro=N'Chủ biên'
GROUP BY TG.MaTacGia,TG.TenTacGia
HAVING COUNT(ST.MaTacGia)>=2

--17. Đưa ra những vị trí còn trống
SELECT DISTINCT VT.MaViTri,VT.Tang,VT.Ngan
FROM dbo.ViTri VT,dbo.CuonSach CS
WHERE VT.MaViTri NOT IN (SELECT MaViTri FROM dbo.CuonSach)

--18. Đưa ra thông tin độc giả và sách mượn tương ứng
SELECT DG.MaDocGia,DG.TenDocGia,CS.MaCuonSach, DS.TenDauSach
FROM dbo.DocGia DG,dbo.PhieuMuonTra MT,dbo.LichSuMuonTra LS, dbo.CuonSach CS,dbo.DauSach DS
WHERE DG.MaDocGia=MT.MaDocGia AND MT.MaPhieuMT=LS.MaPhieuMT AND LS.MaCuonSach=CS.MaCuonSach AND CS.MaDauSach=DS.MaDauSach

--19. Đưa ra thông tin độc giả bị phạt và mức phạt
SELECT DG.MaDocGia,DG.TenDocGia,PP.TongTien
FROM dbo.DocGia DG,dbo.PhieuMuonTra MT,dbo.PhieuPhat PP
WHERE DG.MaDocGia=MT.MaDocGia AND MT.MaPhieuMT=PP.MaPhieuMT

--20. Đưa ra thông tin những học viên trả sách trước hạn
SELECT DG.MaDocGia,DG.TenDocGia,MT.NgayMuon,LS.NgayTra, MT.HanTra
FROM dbo.DocGia DG,dbo.PhieuMuonTra MT,dbo.LichSuMuonTra LS
WHERE DG.MaDocGia=MT.MaDocGia AND MT.MaPhieuMT=LS.MaPhieuMT AND LS.NgayTra<MT.HanTra

--21. Đưa ra tổng số sách hỏng hoặc mất và tổng số tiền phạt
SELECT COUNT(LS.MaPhieuMT) TONGSACH, SUM(PP.TongTien) TIENPHAT
FROM dbo.LichSuMuonTra LS,dbo.PhieuPhat PP,dbo.PhieuMuonTra MT
WHERE LS.TinhTrang=N'Hỏng' OR LS.TinhTrang=N'Mất' AND MT.MaPhieuMT=LS.MaPhieuMT AND MT.MaPhieuMT=PP.MaPhieuMT

--22. Đưa ra thống kê từ cao xuống thấp số tiền mà các học viên phải nộp phạt (nếu có)
SELECT  DocGia.MaDocGia,TenDocGia, TongTien
FROM dbo.DocGia JOIN dbo.PhieuMuonTra ON PhieuMuonTra.MaDocGia = DocGia.MaDocGia
				LEFT JOIN dbo.PhieuPhat ON PhieuPhat.MaPhieuMT = PhieuMuonTra.MaPhieuMT
ORDER BY TongTien DESC

--23. Đưa ra thông tin đầu sách được học viên mượn nhiều nhất
SELECT TOP 1 WITH TIES DS.MaDauSach, DS.TenDauSach, COUNT(LS.MaCuonSach) SL_MUON
FROM dbo.DauSach DS, dbo.LichSuMuonTra LS, dbo.CuonSach CS
WHERE DS.MaDauSach=CS.MaDauSach AND LS.MaCuonSach=CS.MaCuonSach
GROUP BY DS.MaDauSach, DS.TenDauSach
ORDER BY COUNT(LS.MaCuonSach) DESC

--24. Đưa ra danh sách độc giả mượn quá thời hạn
SELECT DG.MaDocGia,DG.TenDocGia,LS.MaCuonSach,MT.NgayMuon,MT.HanTra,LS.NgayTra
FROM dbo.DocGia DG, dbo.PhieuMuonTra MT, dbo.LichSuMuonTra LS
WHERE DG.MaDocGia=MT.MaDocGia AND MT.MaPhieuMT=LS.MaPhieuMT AND MT.HanTra<LS.NgayTra

--25. Đưa ra thông tin đầu sách và số độc giả mượn trong năm 2021
SELECT DG.MaDocGia,DG.TenDocGia,LS.MaCuonSach,MT.NgayMuon
FROM dbo.DocGia DG, dbo.PhieuMuonTra MT, dbo.LichSuMuonTra LS
WHERE DG.MaDocGia=MT.MaDocGia AND MT.MaPhieuMT=LS.MaPhieuMT AND YEAR(MT.NgayMuon)=2021

--26. Đưa ra thông tin những đầu sách từng tác giả
SELECT DS.MaDauSach, DS.TenDauSach,TG.TenTacGia
FROM dbo.TacGia TG, dbo.SangTac ST, dbo.DauSach DS
WHERE TG.MaTacGia=ST.MaTacGia AND DS.MaDauSach=ST.MaDauSach

--27. Đưa ra thông tin thủ thư cho mượn nhiều sách nhất
SELECT TOP 1 WITH TIES TT.MaThuThu, TT.HoTen, COUNT(MT.MaThuThu) SL
FROM dbo.ThuThu TT, dbo.PhieuMuonTra MT
WHERE TT.MaThuThu=MT.MaThuThu
GROUP BY TT.MaThuThu, TT.HoTen
ORDER BY COUNT(MT.MaThuThu) DESC

--28. Đưa ra thông tin những đầu sách của tác giả có nhiều tác phẩm nhất
SELECT DS.MaDauSach, DS.TenDauSach,TG.TenTacGia
FROM dbo.TacGia TG, dbo.SangTac ST, dbo.DauSach DS
WHERE TG.MaTacGia=ST.MaTacGia AND DS.MaDauSach=ST.MaDauSach 
AND TG.MaTacGia IN (SELECT TG.MaTacGia
					FROM (SELECT DISTINCT TOP 1 WITH TIES dbo.TacGia.MaTacGia,COUNT(dbo.SangTac.MaTacGia)
					FROM dbo.SangTac, dbo.TacGia 
					WHERE dbo.SangTac.MaTacGia=dbo.TacGia.MaTacGia
					GROUP BY dbo.TacGia.MaTacGia
					ORDER BY COUNT(dbo.SangTac.MaTacGia) DESC
					))
					
--29. Đưa ra thông tin những thủ thư chưa cho mượn sách bao giờ
SELECT DISTINCT TT.MaThuThu,TT.HoTen
FROM dbo.ThuThu TT, dbo.PhieuMuonTra MT
WHERE TT.MaThuThu NOT IN (SELECT MaThuThu FROM dbo.PhieuMuonTra)

--30. Đưa ra thông tin sách mà độc giả làm mất được đền và số tiền trả
SELECT DS.TenDauSach, PP.TongTien
FROM dbo.DauSach DS, dbo.CuonSach CS, dbo.LichSuMuonTra LS, dbo.PhieuMuonTra MT, dbo.PhieuPhat PP
WHERE DS.MaDauSach=CS.MaDauSach AND CS.MaCuonSach=LS.MaCuonSach AND LS.MaPhieuMT=MT.MaPhieuMT 
		AND MT.MaPhieuMT=PP.MaPhieuMT AND LS.TinhTrang=N'Mất'

--31. Tạo produce để thêm sách


CREATE PROC sp_GetAllThuThu
AS
SELECT * FROM dbo.ThuThu

CREATE PROC proc_logic_nv
@TK nvarchar(50),
@MK nvarchar(50)
AS 
BEGIN 
	SELECT * FROM dbo.TaiKhoanNV WHERE TK=@TK AND MK=@MK
END 
 
 CREATE PROC proc_logic_dg
@TK nvarchar(50),
@MK nvarchar(50)
AS 
BEGIN 
	SELECT * FROM dbo.TaiKhoanDG WHERE TK=@TK AND MK=@MK
END 
