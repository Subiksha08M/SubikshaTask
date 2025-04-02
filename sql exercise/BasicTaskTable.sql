create table authors(
au_id varchar(255) PRIMARY KEY,
au_lname varchar(255),
au_fname varchar(255),
phone varchar(255),
address varchar(255),
city varchar(255),
state varchar(255),
zip varchar(255),
isActive bit
)
go
create table publishers(
pub_id varchar(255) PRIMARY KEY,
pub_name varchar(255),
city varchar(255),
state varchar(255),
country varchar(255)
)
go
create table titles(
title_id varchar(255) PRIMARY KEY,
title varchar(255),
type varchar(255),
pub_id varchar(255) FOREIGN KEY references Publishers(pub_id),
price varchar(255),
advance varchar(255),
royalty int,
ytd_sales int,
notes varchar(max),
pubdate nvarchar(255)
)
go
create table titleauthor(
au_id varchar(255) FOREIGN KEY  references Authors(au_id),
title_id varchar(255) FOREIGN KEY references  Titles(title_id),
au_ord int,
royaltyper int
)
go
create table pub_info(
pubInfo_id int PRIMARY KEY IDENTITY(1,1),
logo varchar(255),
pr_info varchar(255)
)
go
create table stores(
store_id  varchar(255) PRIMARY KEY,
store_name varchar(255),
store_address varchar(255),
city varchar(255),
state varchar(255),
zip varchar(255)
)
go
create  table sales(
store_id  varchar(255) FOREIGN KEY REFERENCES Stores(store_id),
ord_num varchar(255),
ord_date varchar(255),
qty int,
payterms varchar(255),
title_id varchar(255) FOREIGN KEY REFERENCES Titles(title_id),
)
go
create table roysched(
title_id varchar(255) FOREIGN KEY references  Titles(title_id),
lorange int,
hirange int,
royalty int
)
go
create table discounts(
discounttype varchar(255),
store_id varchar(255) FOREIGN KEY REFERENCES Stores(store_id),
lowqty int,
highqty int,
discount decimal(10,2)
)
go
create table jobs(
job_id int PRIMARY KEY IDENTITY(1,1),
job_desc varchar(255),
min_lvl int,
max_lvl int
)
go
create table employee(
emp_id varchar(255) PRIMARY KEY,
fname varchar(255),
minit varchar(255),
lname varchar(255),
job_id int FOREIGN KEY REFERENCES Jobs(job_id),
job_lvl int,
pub_id varchar(255) FOREIGN KEY REFERENCES Publishers(pub_id),
hire_date varchar(255)
)
go
