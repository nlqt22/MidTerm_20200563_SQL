create table phongban(
	tenphg varchar(15),
	maPH int primary key,
	trphg int,
	ng_nhanchuc date
)

create table nhanvien(
	honv varchar(8),
	tenlot varchar(8),
	ten varchar(8),
	maNV int primary key,
	birth date,
	diachi varchar(100),
	phai char(3),
	luong money,
	ma_NQL int,
	phg int,
	foreign key (phg) references phongban(maPH)
)

create table diadiem_phg(
	maPHG int,
	diadiem varchar(10),
	foreign key (maPHG) references phongban(maPH)
)

create table thannhan(
	ma_nvien int,
	tentn varchar(8),
	phai char(3),
	birth date,
	quanhe varchar(10),
	foreign key (ma_nvien) references nhanvien(maNV)
)

create table dean(
	tenda varchar(15),
	maDA int primary key,
	ddiem_da varchar(10),
	phong int,
	foreign key (phong) references phongban(maPH)
)

create table phancong(
	ma_nvien int,
	soDA int,
	thoigian float,
	foreign key (ma_nvien) references nhanvien(maNV),
	foreign key (soDA) references dean(maDA)
)

insert into phongban values
('Nghien cuu', 5, 333445555, '1978/05/22'),
('Dieu hanh', 4, 987987987, '1985/01/01'),
('Quan ly', 1, 888665555, '1971/06/19');

insert into nhanvien values 
('Dinh', 'Ba', 'Tien', 123456789, '1955/09/01', '731 Tran Hung Dao, Q1, TPHCM', 'Nam', 30000, 333445555, 5),
('Nguyen', 'Thanh', 'Tung', 333445555, '1945/08/12', '638 Nguyen Van Cu,Q5 , TPHCM', 'Nam', 40000, 888665555, 5),
('Bui', 'Thuy', 'Vu', 999887777, '1958/07/19', '332 Nguyen Thai Hoc, Q1, TPHCM', 'Nam', 25000, 987654321, 4),
('Le', 'Thi', 'Nhan', 987654321, '1931/06/20', '291 Ho Van Hue, QPN, TPHCM', 'Nu', 43000, 888665555, 4),
('Nguyen', 'Manh', 'Hung', 666884444, '1952/09/15', '975 Ba Ria, Vung Tau', 'Nam', 38000, 333445555, 5),
('Tran', 'Thanh', 'Tam', 453453453, '1962/07/31', '543 Mai Thi Luu, Q1, TPHCM', 'Nam', 25000, 333445555, 5),
('Tran', 'Hong', 'Quan', 987987987, '1959/03/29', '980 Le Hong Phong, Q10, TPHCM', 'Nam', 25000, 987654321, 4),
('Vuong', 'Ngoc', 'Quyen', 888665555, '1927/10/10', '450 Trung Vuong, Ha Noi', 'Nu', 55000,'', 1);

insert into diadiem_phg values
(1, 'TP HCM'),
(4, 'HA NOI'),
(5, 'VUNG TAU'),
(5, 'NHA TRANG'),
(5, 'TP HCM');

insert into thannhan values
(333445555, 'Quang', 'Nu', '1976/04/05', 'Con gai'),
(333445555, 'Khang', 'Nam', '1973/10/25', 'Con trai'),
(333445555, 'Duong', 'Nu', '1948/05/03', 'Vo chong'),
(987654321, 'Dang', 'Nam', '1932/02/29', 'Vo chong'),
(123456789, 'Duy', 'Nam', '1978/01/01', 'Con trai'),
(123456789, 'Chau', 'Nu', '1978/12/31', 'Con gai');

insert into dean values
('San pham X', 1, 'VUNG TAU', 5),
('San pham Y', 2, 'NHA TRANG', 5),
('San pham Z', 3, 'TP HCM', 5),
('Tin hoc hoa', 10, 'HA NOI', 4),
('Cap quang', 20, 'TP HCM', 1),
('Dao tao', 30, 'HA NOI', 4);

insert into phancong values
(123456789, 1, 32.5),
(123456789, 2, 7.5),
(666884444, 3, 40.0),
(453453453, 1, 20.0),
(453453453, 2, 20.0),
(333445555, 3, 10.0),
(333445555, 10, 10.0),
(333445555, 20, 10.0),
(999887777, 30, 30.0),
(999887777, 10, 10.0),
(987987987, 10, 35.0),
(987987987, 30, 5.0),
(987654321, 30, 20.0),
(987654321, 20, 15.0),
(888665555, 20, null);

Ex.I
task 1
create procedure sp_1 @S date, @f date
as 
select nv.ten, nv.maNV, pb.ng_nhanchuc, nv.ma_NQL, c.ten from nhanvien nv
	inner join phongban pb on nv.phg = pb.maPH
	inner join (select b.ten, a.ma_NQL
				from nhanvien a, nhanvien b
				where a.ma_NQL = b.maNV
				group by a.ma_NQL, b.ten) c 
				on c.ma_NQL = nv.ma_NQL
where pb.ng_nhanchuc between @S AND @f

exec sp_1 @S = '1971/06/19', @f = '1985/01/01';								  

task 2
create procedure sp_2 as
	select avg(luong) trung_binh from nhanvien
	select ten, maNV, luong from nhanvien
	group by ten, maNV, luong
	having luong > (select avg(luong) from nhanvien)

exec sp_2

task 3
create procedure sp_3 @N int 
as
	select top (@N) * from nhanvien
	order by luong desc

exec sp_3 @N = 3

task 4
create procedure sp_4 @a varchar(7) 
as
	update nhanvien 
	set luong = luong * 110
	where right (diachi, (select len(@a))) = @a

exec sp_4 @a = 'TPHCM'

task 5