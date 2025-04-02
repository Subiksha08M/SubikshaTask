create or alter TRIGGER trg_UpdateProjectStatus ON Project FOR INSERT
NOT FOR REPLICATION 
AS
BEGIN
insert into project_Log select ProjectId,EndDate,
case
WHEN
inserted.EndDate IS NULL THEN 'In Progress'
ELSE 'Completed' END,
'Inserted'
FROM inserted
END
go

create or alter TRIGGER trg_UpdateProjectStatusUpdate ON Project FOR UPDATE
NOT FOR REPLICATION 
AS
BEGIN
insert into project_Log select ProjectId,EndDate,
case WHEN
inserted.EndDate IS NULL THEN 'In Progress'
ELSE 'Completed' END,'Updated'
FROM inserted
END
go

create table project_Log(
Project_id int,
EndDate varchar(255),
Status varchar(255),
Action varchar(255)
)
go

CREATE table TaskAuditLog(
TaskId int,
TaskName varchar(255),
Description varchar(max),
StartDate varchar(255),
DueDate varchar(255),
Priority varchar(255),
Status varchar(255),
ProjectId int,
Action varchar(255)
)
go

create or alter TRIGGER trg_AuditTaskChanges ON Task 
FOR INSERT
NOT FOR REPLICATION 
AS
BEGIN
insert into TaskAuditLog select TaskId,TaskName,Description,StartDate,DueDate,
Priority,Status,ProjectID,'Inserted' from inserted
END
go

create or alter TRIGGER trg_AuditTaskChangesUpdate On Task 
AFTER UPDATE 
NOT FOR REPLICATION 
AS
BEGIN
insert into TaskAuditLog  
SELECT TaskId,TaskName,Description,StartDate,DueDate,Priority,Status,ProjectID,'Updated' from DELETED
END
go

create or alter TRIGGER trg_AuditTaskChangesDelete ON Task 
FOR DELETE
NOT FOR REPLICATION
AS
BEGIN
insert into TaskAuditLog select TaskId,TaskName,Description,StartDate,DueDate,
Priority,Status,ProjectID,'Deleted' from deleted
END




--	INSERT INTO Task (TaskName, Description, StartDate, DueDate, Priority, Status, ProjectID)
--VALUES 
--    ('new update', 'Design phase for the new website', '2024-01-02', '2024-02-28', 'High', 'Completed', 1)
--update Task set TaskName='New Update',Description='Design phase for the new website',
--StartDate='2024-01-02',DueDate ='2024-02-28' , Priority='High',Status='Completed',ProjectID=2 where TaskId=1

--INSERT INTO Project (ProjectName, StartDate, EndDate, Budget, Status)
--VALUES 
--    ('New', '2024-01-01', '19-03-2025', 15000.00, 'In Progress')
--INSERT INTO Project (ProjectName, StartDate, Budget, Status)
--VALUES 
--    ('New', '2024-01-01', 15000.00, 'In Progress')

--	update Project set ProjectName='Tasking',StartDate='2024-01-01' ,
--	EndDate='2025-03-19',Budget=15000.00,Status='In Progress' where ProjectID=22
--select * from project_Log
--select * from Project
