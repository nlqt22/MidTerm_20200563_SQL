create table categories (
	category_id varchar(10) primary key,
	category_name varchar(50)	
)

create table brands (
	brand_id varchar(10) primary key,
	brand_name varchar(50)
)

create table products (
	product_id varchar(10) primary key,
	product_name varchar(50),
	brand_id varchar(10),
	category_id varchar(10),
	model_year date,
	list_price money,
	constraint cate_fk foreign key (category_id) references categories,
	constraint brand_fk foreign key (brand_id) references brands
)

insert into categories (category_id, category_name) values 
('CT01', 'Roofing (Asphalt)'),
('CT02', 'Roofing (Metal)'),
('CT03', 'Landscaping & Irrigation'),
('CT04', 'Glass & Glazing'),
('CT05', 'Framing (Steel)'),
('CT06', 'Temp Fencing, Decorative Fencing and Gates'),
('CT07', 'Landscaping & Irrigation'),
('CT08', 'Construction Clean and Final Clean'),
('CT09', 'Rebar & Wire Mesh Install'),
('CT10', 'Drywall & Acoustical (FED)')

insert into brands (brand_id, brand_name) values 
('BR01', 'UNIQLO'),
('BR02', 'NIVEA'),
('BR03', 'PANTENE'),
('BR04', 'DOVE'),
('BR05', 'ADIDAS'),
('BR06', 'NIKE')

insert into products (product_id, product_name, brand_id, category_id, model_year, list_price) values
('PR01', 'PANTENE Cham soc toc hu ton', 'BR03', 'CT09', '2013/10/31', 141874),
('PR02', 'DOVE Ngan rung toc', 'BR04', 'CT10', '2013/10/08', 147674),
('PR03', 'ADIDAS Dep adilette Comfort', 'BR05', 'CT01', '2014/03/03', 73294),
('PR04', 'UNIQLO Ao Polo-EX ngan tay', 'BR01', 'CT06', '2001/11/19', 64338),
('PR05', 'ADIDAS Giay Stan Smith', 'BR05', 'CT07', '1997/07/08', 165743),
('PR06', 'UNIQLO MEN Ao Polo Dry Pique ngan tay', 'BR01', 'CT10', '2001/11/05', 57332),
('PR07', 'UNIQLO Parka Blocktech', 'BR01', 'CT03', '2008/02/03', 129531),
('PR08', 'UNIQLO Ao khoac the thao sieu co gian', 'BR01', 'CT03', '1997/09/26', 71651),
('PR09', 'ADIDAS Giay Fluidflow 2.0', 'BR05', 'CT08', '2008/07/09', 181672),
('PR10', 'ADIDAS Ao thun chay bo', 'BR05', 'CT02', '2017/05/22', 145809),
('PR11', 'NIVEA Xit ngan mui kho thoang', 'BR02', 'CT06', '2022/03/08', 160113),
('PR12', 'NIVEA Kem duong lam mem da', 'BR02', 'CT04', '1996/07/09', 98405),
('PR13', 'NIKE Air Max 90', 'BR06', 'CT09', '2007/07/08', 85206),
('PR14', 'NIKE JORDAN BREAK', 'BR06', 'CT02', '2022/04/09', 188082),
('PR15', 'NIKE ACG Air Deschutz+', 'BR06', 'CT09', '2004/12/13', 87200),
('PR16', 'DOVE Sua tam duong the', 'BR04', 'CT05', '2022/05/08', 166924),
('PR17', 'DOVE Xit khu mui', 'BR04', 'CT01', '1999/10/11', 187616),
('PR18', 'DOVE Sua tam thien nhien', 'BR04', 'CT10', '2005/07/19', 73883),
('PR19', 'PANTENE Dau goi tri gau', 'BR03', 'CT03',	'2015/02/02', 155556),
('PR20', 'PANTENE Micellar thanh loc & duong am', 'BR03', 'CT04', '2022/11/24', 189507)

cau b
create view v_product 
as
	select * from products;

select * from v_product
where year(model_year) = 2022

alter view 