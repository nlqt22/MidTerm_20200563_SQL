CREATE TABLE GiangVien(
	[GV#] CHAR(5),
	[HoTen] NVARCHAR(30),
	[NamSinh] INT,
	[DiaChi] NVARCHAR(50),
	PRIMARY KEY([GV#])
);

CREATE TABLE DeTai(
	[DT#] CHAR(5),
	[TenDT] NVARCHAR(50),
	[TheLoai] NVARCHAR(20)
	PRIMARY KEY([DT#])
);

CREATE TABLE SinhVien(
	[SV#] CHAR(5),
	[TenSV] NVARCHAR(30),
	[NgaySinh] DATE,
	[QueQuan] NVARCHAR(20),
	[Lop] NVARCHAR(20)
	PRIMARY KEY([SV#])
);

CREATE TABLE HuongDan(
	[GV#] CHAR(5),
	[SV#] CHAR(5),
	[DT#] CHAR(5),
	[NamThucHien] INT,
	[KetQua] FLOAT
	PRIMARY KEY([GV#], [SV#], [DT#], [NamThucHien])
	FOREIGN KEY([GV#]) REFERENCES GiangVien,
	FOREIGN KEY([SV#]) REFERENCES SinhVien,
	FOREIGN KEY([DT#]) REFERENCES DeTai
);

INSERT INTO GiangVien([GV#],[HoTen],[NamSinh],[DiaChi]) 
VALUES
('GV001', N'Nguyễn Xuân Dũng', 1980, N'Hà Nam'),
('GV002', N'Nguyễn Văn Thủy', 1992, N'Hà Nội'),
('GV003', N'Trần Lâm Quân', 1995, N'Bắc Ninh'),
('GV004', N'Nguyễn Duy Tiến', 1975, N'Phú Thọ'),
('GV005', N'Phạm Việt Cường', 1972, N'Hà Nội'),
('GV006', N'Đoàn Trung Kiên', 1985, N'Hà Nội'),
('GV007', N'Phạm Thu Thủy', 1976, N'Hải Phòng'),
('GV008', N'Lưu Thanh Bình', 1972, N'Quảng Ninh'),
('GV009', N'Hoàng Bích Ngọc', 1970, N'Thanh Hóa'),
('GV010', N'Nguyễn Trung Kiên', 1981, N'Cà Mau'),
('GV012', N'Nguyễn Sơn Tùng', 1978, N'Thái Bình')

INSERT INTO SinhVien([SV#],[TenSV], [NgaySinh], [QueQuan], [Lop])
VALUES
('SV001', N'Nguyễn Quang Tuấn', '2002-02-22', N'Hải Phòng', N'K65 VN04'),
('SV002', N'Đinh Thành Long', '2002-05-27', N'Hà Nội', N'K65 VN04'),
('SV003', N'Nguyễn Thế Thương', '2002-01-03', N'Bắc Giang', N'K65 VN04'),
('SV004', N'Nguyễn Thành Vinh', '2002-07-08', N'Thanh Hóa', N'K65 VN04'),
('SV005', N'Nguyễn Văn Nam', '2000-02-24', N'Bắc Ninh', N'K63 VN03'),
('SV006', N'Nguyễn Văn Nam', '2001-09-21', N'Bắc Giang', N'K64 KTMT03'),
('SV007', N'Phạm Ngọc Sơn', '2002-08-02', N'Hải Phòng', N'K65 VN03'),
('SV008', N'Tạ Đức Tiến', '2002-04-06', N'Hà Nội', N'K65 VN04'),
('SV009', N'Lưu Đức Quý', '2002-12-01', N'Thái Bình', N'K65 VN04'),
('SV010', N'Nguyễn Trung Hải', '2002-01-19', N'Hải Phòng', N'K65 ĐT01'),
('SV011', N'Đào Minh Hiếu', '2002-02-25', N'Hải Phòng', N'K65 ĐT04'),
('SV012', N'Nguyễn Đức Thắng', '2002-04-08', N'Hải Phòng', N'K66 KTHH05'),
('SV013', N'Bùi Hoàng Dũng', '2002-11-19', N'Hưng Yên', N'K65 ĐTVT01'),
('SV014', N'Phan Giang Minh', '2002-11-21', N'Hải Phòng', N'K65 ĐTVT09'),
('SV015', N'Vũ Trọng Nghĩa', '2002-11-20', N'Hải Phòng', N'K65 KTVL04'),
('SV016', N'Nguyễn Xuân Dũng', '2001-04-29', N'Hà Nam', N'K64 KTVL02')


INSERT INTO DeTai([DT#], [TenDT], [TheLoai])
VALUES
('DT001', N'Lâp trình ứng dụng di động', N'Ứng dụng'),
('DT002', N'Phân tích dữ liệu lớn', N'KTMT'),
('DT003', N'Lí thuyết tổ hợp và đồ thị', N'KHMT'),
('DT004', N'Semantic Image Segmentation', N'KHMT'),
('DT005', N'Tính toán lưới', N'KTMT'),
('DT006', N'Phát hiện tri thức', N'KHMT' ),
('DT007', N'Phân loại văn bản', N'Ứng dụng'),
('DT008', N'Dịch tự động Anh Việt', N'Ứng dụng'),
('DT009', N'Nghiên cứu lỗ hổng XSS', N'An ninh mạng'),
('DT010', N'Mạng nội bộ cho doanh nghiệp', N'An ninh mạng')

INSERT INTO HuongDan([DT#], [SV#], [GV#], [NamThucHien], [KetQua])
VALUES
('DT001', 'SV001', 'GV002', 2021, 8.5),
('DT001', 'SV001', 'GV012', 2021, 8.5),
('DT001', 'SV001', 'GV001', 2022, 9.5),
('DT003', 'SV001', 'GV001', 2020, 7),
('DT002', 'SV007', 'GV010', 2021, 8.5),
('DT004', 'SV007', 'GV012', 2022, 10),
('DT007', 'SV006', 'GV006', 2020, 4),
('DT009', 'SV010', 'GV012', 2020, 9.5),
('DT010', 'SV002', 'GV001', 2020, 7),
('DT002', 'SV007', 'GV010', 2020, 8.5),
('DT005', 'SV009', 'GV009', 2022, 10),
('DT005', 'SV009', 'GV003', 2022, 10),
('DT005', 'SV009', 'GV007', 2022, 10),
('DT005', 'SV009', 'GV004', 2022, 10),
('DT005', 'SV009', 'GV005', 2022, 10)

SELECT *
FROM GiangVien
WHERE [GV#] = 'GV001'

SELECT *
FROM DeTai
WHERE TheLoai = N'Ứng dụng'

SELECT hd.*, sv.QueQuan
FROM HuongDan hd
JOIN SinhVien sv ON hd.SV# = sv.SV#
JOIN GiangVien gv ON hd.GV# = gv.GV#
WHERE hd.GV# = 'GV012' AND sv.QueQuan = N'Hải Phòng';

SELECT dt.*
FROM DeTai dt
LEFT JOIN HuongDan hd ON hd.DT# = dt.DT#
WHERE hd.DT# IS NULL

UPDATE SinhVien
SET NgaySinh = '1991-11-12'
WHERE TenSV = N'Nguyễn Xuân Dũng' AND QueQuan = N'Hà Nam';

/*
ALTER TABLE HuongDan 
ADD CONSTRAINT fk_cas_sv_hd
	FOREIGN KEY(SV#) REFERENCES SinhVien(SV#)
	ON DELETE CASCADE;
*/
DELETE
FROM SinhVien
WHERE TenSV = N'Nguyễn Văn Nam' AND QueQuan = N'Bắc Giang';

/*
CREATE VIEW v_HuongDan AS
SELECT dt.TenDT, sv.TenSV, gv.HoTen, hd.NamThucHien, hd.KetQua
FROM HuongDan hd
JOIN DeTai dt ON hd.DT# = dt.DT#
JOIN SinhVien sv ON hd.SV# = sv.SV#
JOIN GiangVien gv ON hd.GV# = gv.GV#;
*/
SELECT * FROM v_HuongDan;

/*

CREATE USER ThuyNV FOR LOGIN ThuyNV WITH PASSWORD = 'thuy123'
CREATE USER QuanTL FOR LOGIN QuanTL WITH PASSWORD = 'quan123'

GRANT SELECT ON GiangVien TO ThuyNV
GRANT SELECT ON HuongDan TO ThuyNV

*/