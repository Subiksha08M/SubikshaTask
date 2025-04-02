use exercise;
select * from authors;
select au_fname,au_lname from authors where state='UT';
select au_lname from authors where au_lname LIKE '%A%';
select * from authors where phone='707 448-4982';

select fname,lname,hire_date from employee where hire_date BETWEEN CAST('1991' as date) and CAST('1992' as date);
select * from employee where  ISNULL(minit,'')='';
select CONCAT(fname,lname)as Name,hire_date as startDate from employee ORDER BY  CAST(hire_date as date);
select * from employee JOIN jobs on employee.job_id=jobs.job_id where jobs.job_desc='Sales Representative';

select COUNT(*) as total_publishers from publishers;
select  * from employee JOIN jobs on jobs.job_id=employee.job_id where jobs.job_id=(select job_id from employee where fname='Howard')
select  employee.fname,employee.lname,employee.job_id from employee JOIN jobs on jobs.job_id=employee.job_id where NOT job_desc ='Managing Editor'


select MAX(CAST(REPLACE(price,'$','')AS DECIMAL(10,2)))as maximum from titles
select MIN(CAST(REPLACE(price,'$','')AS DECIMAL(10,2)))as maximum from titles
select type,SUM(CAST(REPLACE(price,'$','')AS DECIMAL(10,2))) from titles GROUP BY type 
select pub_id from titles where title in ('Cooking with Computers: Surreptitious Balance Sheets','Silicon Valley Gastronomic Treats','Is Anger the Enemy?','Fifty Years in Buckingham Palace Kitchens')

select CONCAT(address,city,state,zip) as address from authors where au_lname='Panteley' and au_fname='Sylvia'
select CONCAT(fname,minit,lname) as employeeName , hire_date as hireDate from employee 
select * from titles where type='Psychology';

select COUNT(*) as countOfBook from titles where type='Business';
select pubdate from titles where title='Life Without Fear'
select * from titles where pub_id = (select pub_id from publishers where pub_name='Binnet & Hardley');
select authors.au_lname,authors.au_fname from authors 
JOIN titleauthor on authors.au_id=titleauthor.au_id 
where title_id=(select title_id from titles where title='Straight Talk About Computers');


select AVG(CAST(REPLACE(price,'$','')AS DECIMAL(10,2))) from titles where pub_id='1389'
select COUNT(*) as TotalNumberOfRow from titles
select CONCAT(address,city,state,zip) as address,state from authors where state='WA' or state='CA';
select * from  employee where hire_date BETWEEN CAST('1989 ' as date) and CAST('1992 ' as date)
select fname,lname from employee where job_id=6


select state,COUNT(store_name) from stores GROUP BY state 
select title,price from titles where CAST(REPLACE(price,'$','')AS DECIMAL(10,2)) > '10.00' ORDER BY price ASC;

select * from publishers where pub_id=1389;
select * from jobs
select * from authors
select * from employee;
select * from titles;
select * from stores
select * from titleauthor


