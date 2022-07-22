create table regions (
	region_id int primary key,
	region_name varchar(25)
);

create table countries (
	country_id char(2),
	country_name varchar(40),
	region_id int,
	CONSTRAINT country_id_key PRIMARY KEY(country_id),
	CONSTRAINT FK_region FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

create table locations (
	location_id int,
	street_address varchar(25),
	postal_code varchar(12),
	city varchar(30),
	state_province varchar(12),
	country_id char(2),
	CONSTRAINT loaction_id_key PRIMARY KEY(location_id),
	CONSTRAINT FK_country FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

create table jobs(
	job_id varchar(10) primary key,
	job_title varchar(35),
	min_salary int,
	max_salary int
);

create table departments (
	department_id int,
	department_name varchar(30),
	manager_id int,
	location_id int,
	CONSTRAINT department_id_key PRIMARY KEY(department_id),
	CONSTRAINT FK_location FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

create table job_history(
	employee_id int,
	start_date date,
	end_date date,
	job_id varchar(10),
	department_id int,
	CONSTRAINT pk_job_his primary key(employee_id, start_date),
	UNIQUE(employee_id),
	CONSTRAINT FK_department FOREIGN KEY (department_id) REFERENCES departments(department_id),
	CONSTRAINT FK_job FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

create table employees(
	employee_id int,
	first_name varchar(20),
	last_name varchar(25),
	email varchar(25),
	phone_number varchar(20),
	hire_date date,
	job_id varchar(10),
	salary int,
	commission_pct int,
	manager_id int,
	department_id int,
	CONSTRAINT employee_id_key PRIMARY KEY(employee_id),
	CONSTRAINT FK_employee FOREIGN KEY (employee_id) REFERENCES job_history(employee_id),
	CONSTRAINT FK_job_2 FOREIGN KEY (job_id) REFERENCES jobs(job_id),
	CONSTRAINT FK_department_2 FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

create table job_grades (
	grade_level varchar(2) primary key,
	lowest_sal int,
	highest_sal int
);

--1
ALTER TABLE countries RENAME TO country_new;

--2 
ALTER TABLE locations ADD COLUMN region_id int;

--3
ALTER TABLE locations RENAME COLUMN location_id TO id;
ALTER TABLE locations ADD COLUMN location_id int;

--4
ALTER TABLE locations DROP COLUMN region_id;
ALTER TABLE locations RENAME COLUMN country_id TO region_id;
ALTER TABLE locations ADD COLUMN country_id int;

--5
ALTER TABLE locations ALTER COLUMN country_id type int;

--6
ALTER TABLE locations DROP COLUMN city;

--7
ALTER TABLE locations RENAME COLUMN state_province TO state;

--8
da tao o tren

--9
ALTER TABLE locations DROP CONSTRAINT loaction_id_key CASCADE;
ALTER TABLE locations ADD CONSTRAINT pk_location_key PRIMARY KEY(location_id,country_id);

--10
ALTER TABLE locations DROP CONSTRAINT pk_location_key;

--11,12
ALTER TABLE job_history ADD CONSTRAINT fk_job_id FOREIGN KEY (job_id) REFERENCES jobs(job_id);

--13
ALTER TABLE job_history DROP CONSTRAINT fk_job_id;

--14
CREATE INDEX indx_job_id ON job_history(job_id);

--15
DROP INDEX indx_job_id;