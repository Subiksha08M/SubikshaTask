create view  vw_HighPriorityTasks
AS
select * from Task where Priority='High'
go
alter view vw_ActiveProjects
AS
select * from Project where EndDate IS null or EndDate= '';

go
select * from vw_ActiveProjects
select * from vw_HighPriorityTasks
select * from Project
select * from Task

DECLARE @ProjectID int;
DECLARE @ProjectName varchar(255)
DECLARE Project_Name CURSOR FOR
select ProjectID,ProjectName from Project where EndDate IS NOT NULL 
OPEN Project_Name;
FETCH NEXT FROM Project_Name INTO @ProjectID,@ProjectName;
WHILE @@FETCH_STATUS=0
BEGIN
 PRINT CONCAT('projectID: ', @ProjectID, ' / project name: ', @ProjectName);
    FETCH NEXT FROM Project_Name INTO @ProjectID, @ProjectName;
END;
CLOSE Project_Name;
DEALLOCATE Project_Name;
go

DECLARE Status_Update CURSOR FOR
select * from Task 
OPEN Status_Update;
FETCH NEXT FROM Status_Update;
WHILE @@FETCH_STATUS=0
BEGIN
 update Task SET Status='Overdue' where DueDate<=GETDATE();
 FETCH NEXT from Status_Update
END;
CLOSE Status_Update;
DEALLOCATE Status_Update;

select * from Task
INSERT INTO Task (TaskName, Description, StartDate, DueDate, Priority, Status, ProjectID)
VALUES 
    ('Crud', 'Design phase for the new website', '2024-01-02', '2025-04-06', 'High', 'Completed', 1)

