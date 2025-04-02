--1--
 select * from Task ORDER BY StartDate 
 --2--
select COUNT(*)noOfTask,MIN(Project.ProjectName) as projectName from Task JOIN Project on Project.ProjectID=Task.ProjectID GROUP BY Project.ProjectID  ORDER BY noOfTask DESC
--3--
select COUNT(*) as totalNumber,sum(Project.Budget) as totalBudget from Task JOIN Project on Project.ProjectID=Task.ProjectID GROUP BY Project.ProjectID ORDER BY totalBudget;
--4--
select * from Project where  Budget BETWEEN 10000 and 50000 and Status='In Progress';
--5--
select * from Task where DATENAME(year,StartDate) ='2024' and Status='Completed'
--6--
select * from Task where Month(DATEADD(month,1,GETDATE()))=Month(DueDate) and Year(GETDATE())=Year(DueDate) and Status='Pending'
insert into Task VALUES('Initial Design', 'Design phase for the new website', '2024-01-02', '2025-04-28', 'High', 'pending', 1);
--7--
select * from Task JOIN Project on Project.ProjectID = Task.ProjectID where Project.ProjectName='Website Redesign' and Task.Priority='High'
--8--
select * from Project JOIN Task on Project.ProjectID=Task.ProjectID where Task.DueDate<GETDATE() and Task.Status!='Completed'
--9-- 
select TOP 1* from Task ORDER BY StartDate DESC;
--10---
select * from Project
where ProjectID IN(select ProjectID from Task where Priority='High' or Priority='Low')
--query11--
select * from Task where TaskName LIKE 'Design%';
--query12--
select * from Task where TaskName LIKE '%Review%' and TaskName NOT LIKE 'Pre%'
---query13---
select * from Task where TaskName LIKE '[A-M]___';

