
DROP TABLE IF EXISTS  #LocalTempTable
go
CREATE TABLE #LocalTempTable(
  ID INT, 
  Name VARCHAR(255), 
  StartDate DATE,
  Priority varchar(255)
)
go
select * from #LocalTempTable
go
select * from Task
go
--insert the record from Task Table which have priority low.--
INSERT INTO #LocalTempTable (ID, Name, StartDate,Priority) 
SELECT TaskId, TaskName,StartDate,Priority
FROM Task where Priority='Low';
go
DROP TABLE IF EXISTS ##GlobalTempTable
go
CREATE TABLE ##GlobalTempTable
(
  ID INT, 
  ProjectName varchar(255), 
  Budget DECIMAL(10, 2),
  Priority varchar(255)
)
go
INSERT INTO ##GlobalTempTable (ID, ProjectName, Budget,Priority) 
select TaskId,Project.ProjectName,Project.Budget,Priority from Task JOIN Project on Task.ProjectID=
Project.ProjectID where Priority='Medium'
go
select * from ##GlobalTempTable
go
DECLARE @TableVariable TABLE (
TaskID int,
TaskName varchar(255),
DueDate varchar(255),
Priority varchar(255)
)
Insert into @TableVariable 
(TaskID,TaskName,DueDate,Priority)
select TaskID,TaskName,DueDate,Priority from Task where Priority='High'
select * from @TableVariable
