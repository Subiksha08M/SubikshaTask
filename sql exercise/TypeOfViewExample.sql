---normal view and materialized view--



create table Department(
dept_id int PRIMARY KEY IDENTITY(1,1),
dept_name varchar(255)
)


insert into Department VALUES('sales'),('Customer Service'),('Finance'),('IT')
insert into emp_detail VALUES('johns',3,23000),('smith',2,49300),('king',1,21000),('Johnson',4,40000)


create table emp_detail(
Emp_id  int PRIMARY KEY IDENTITY(1,1),
Last_Name varchar(255),
dept_id int FOREIGN KEY REFERENCES Department(dept_id),
salary int
)
-----employee_detail---
create View employee_details AS 
SELECT
Emp_id,Last_Name FROM emp_detail;

INSERT INTO employee_details (Last_Name)
VALUES ('Grover');

update employee_details set Last_Name='gowri' where Emp_id=6
delete employee_details where Emp_id=5
select * from Department
select *  from emp_detail
SELECT Emp_id,Last_Name FROM employee_details;

---- Emp dept---
CREATE VIEW empdept AS
SELECT
e.Emp_id,
e.Last_Name,
e.salary,
d.dept_id,
d.dept_name
FROM emp_detail e
INNER JOIN Department d ON e.dept_id = d.dept_id;

create view employee_rst  as 
SELECT
Emp_id,Last_Name,dept_id
FROM emp_detail;
SELECT * FROM employee_rst;
select * from empdept 

CREATE MATERIALIZED VIEW maempdept AS
SELECT
e.Emp_id,
e.Last_Name,
e.salary,
d.dept_id,
d.dept_name
FROM emp_detail e
INNER JOIN department d ON e.dept_id = d.dept_id;