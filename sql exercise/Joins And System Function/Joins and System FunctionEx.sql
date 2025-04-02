--query1--
select * from Task JOIN Project on Project.ProjectID=Task.ProjectId 
go
--query2--
select * from Project LEFT JOIN Task on Project.ProjectID=Task.ProjectId 
go
--query3--
select * from Project RIGHT JOIN Task on Project.ProjectID=Task.ProjectId 
go
--query4--
alter table Project drop COLUMN ParentProjectId
alter table Project add ParentProjectId int
go
update Project Set ParentProjectId=1 where ProjectID=2;
go
update Project Set ParentProjectId=2 where ProjectID=3;
go
update Project Set ParentProjectId=3 where ProjectID=4;
SELECT pa.ProjectID, p.ProjectName as ParentProject,pa.ProjectName  as Project FROM 
Project as p JOIN Project as pa on  p.ParentProjectId= pa.ProjectID
go
--query5 Returns the current date and time (there are two function verify those).--
select CURRENT_TIMESTAMP
go
select GETDATE();
go
---query 6--Extracts a specific part of a date of Any record in Project Start and End Date.

select DATEPART(year, StartDate) as yearParts,DATEPART(month,StartDate)as monthOfDate,DATEPART(day,StartDate)as dayOf from Project
go
select DATEPART(year, EndDate) as yearParts,DATEPART(month,EndDate)as monthOfDate,DATEPART(day,EndDate)as dayOf from Project
go
--query7--
select DATEDIFF(month,StartDate,EndDate) as monthDiff from Project 
go
select DATEDIFF(day,StartDate,EndDate) as dayDiff from Project 
go
select DATEDIFF(year,StartDate,EndDate) as yearDiff from Project 
go
--query8--
SELECT FORMAT(CAST(StartDate as date),'MM-yyyy-dd') as formatDate from Project
go
SELECT FORMAT(CAST(StartDate as date),'yyyy-MMMM-dd') as formatDate from Project
go
SELECT FORMAT(CAST(StartDate as date),'dd-MM-yyyy') as formatDate from Project
go
--query 9--
SELECT ProjectName,task.TaskName FROM Project as p
CROSS APPLY (
select * from Task where ProjectID=p.ProjectID
)AS task;





