BEGIN TRY
BEGIN TRANSACTION
INSERT INTO Project (ProjectName, StartDate, EndDate, Budget, Status)
VALUES 
    ('testing', '2024-02-10', '2024-05-28', 15000.00, 'In Progress')
	DECLARE @LastInsertedId int;
	SET @LastInsertedId = SCOPE_IDENTITY();
INSERT INTO Task (TaskName, Description, StartDate, DueDate, Priority, Status, ProjectID)
VALUES 
    ('Initial Design', 'Design phase for the new website', '2024-01-02', '2024-02-28', 'High', 'Completed', @LastInsertedId),
    ('UI Development', 'Development of user interface components', '2024-03-01', '2024-05-15', 'Medium', 'In Progress', @LastInsertedId),
    ('Quality Assurance', 'Testing and quality assurance', '2024-05-16', '2024-06-15', 'High', 'Pending', @LastInsertedId),
    ('API Development', 'Developing APIs for the mobile app', '2024-02-16', '2024-04-30', 'Medium', 'Completed', @LastInsertedId),
    ('Beta Testing', 'Conducting beta testing for the mobile app', '2024-05-01', '2024-06-30', 'High', 'In Progress', @LastInsertedId),
    ('Survey Analysis', 'Analyzing market research surveys', '2024-03-02', '2024-04-15', 'Low', 'Completed', @LastInsertedId),
    ('Report Drafting', 'Drafting the final report based on research', '2024-04-16', '2024-05-30', 'Medium', 'Pending', @LastInsertedId),
    ('Financial Statements', 'Preparing financial statements for the annual report', '2024-04-02', '2024-07-15', 'High', 'In Progress', @LastInsertedId),
    ('Final Review', 'Final review and submission of the annual report', '2024-07-16', '2024-12-15', 'High', 'Pending', @LastInsertedId),
    ('Client Feedback Incorporation', 'Incorporating feedback from the client into the project', '2024-02-01', '2024-03-15', 'Medium', 'In Progress', @LastInsertedId),
    ('Launch Preparation', 'Preparing for the official launch of the mobile app', '2024-06-01', '2024-07-01', 'High', 'Pending', @LastInsertedId);
	commit TRANSACTION
END TRY
BEGIN CATCH
  SELECT 
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage;
        ROLLBACK TRANSACTION;
END CATCH;
go

--EXEC Sp_Insert 'Initial Design', 'Design phase for the new website', 
--'2024-01-02', '2024-02-28', 'high', 'Completed',90

Create or alter procedure Sp_Insert(
@TaskName varchar(255),
@Description varchar(max),
@StartDate varchar(255),
@DueDate varchar(255),
@Priorirty varchar(255),
@Status varchar(255),
@ProjectId int 
)
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
insert into Task(TaskName,Description,StartDate,DueDate,Priority,Status,ProjectID)
VALUES(@TaskName,@Description,@StartDate,@DueDate,@Priorirty,@Status,@ProjectId)
COMMIT TRANSACTION 
END TRY
BEGIN CATCH
 SELECT 
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage;
        ROLLBACK TRANSACTION;
END CATCH
END
go

--EXEC Sp_Update_Task 'Initial Design','Design phase for the new website',
--'2024-01-02','2024-02-28''High', 'Completed', 1
--EXEC Sp_Update_Task 17,'Review','Review comments','2024-01-02','2024-02-28','low','pending',2

create or alter procedure Sp_Update_Task(
@TaskId int,
@TaskName varchar(255),
@Description varchar(max),
@StartDate varchar(255),
@DueDate varchar(255),
@Priorirty varchar(255),
@Status varchar(255),
@ProjectId int 
)

AS
BEGIN TRANSACTION
BEGIN
BEGIN TRY
update Task SET TaskName=@TaskName,Description=@Description,StartDate=@StartDate,
DueDate=@DueDate,Priority=@Priorirty,Status=@Status,ProjectID=@ProjectId where TaskId=@TaskId
COMMIT TRANSACTION 
END TRY
BEGIN CATCH
SELECT 
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage;
        ROLLBACK TRANSACTION;
END CATCH
END
go

--EXEC Sp_DeleteTask 4
create or alter procedure Sp_DeleteTask
(
@ProjectId int 
)
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
delete from Project  where ProjectID=@ProjectId
COMMIT TRANSACTION 
END TRY
BEGIN CATCH
select 
  ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage;
 ROLLBACK TRANSACTION;
END CATCH
END
go

create or alter TRIGGER changeBudget on Project for UPDATE 
AS
BEGIN
if UPDATE(Budget)
update Task  SET Priority= CASE WHEN i.Budget<30000 THEN 'Low'  
WHEN i.Budget>30000 and i.Budget<70000 THEN 'Medium' 
WHEN i.Budget>70000 THEN 'High' End 
from inserted i
where Task.ProjectID= i.ProjectID
END
go
--select * from Project
--EXEC Sp_UpdateBudgetProject 7,8000,'20/3/2025'
create or alter procedure Sp_UpdateBudgetProject
(
@ProjectId int,
@Ammount decimal(10,2),
@EndDate varchar(255)
)
AS
BEGIN
BEGIN TRY
BEGIN TRANSACTION
IF EXISTS(select ProjectID from Project where ProjectID=@ProjectId) or @Ammount>0
update Project Set Budget=@Ammount  where ProjectID=@ProjectId;
ELSE 
throw 99001,'Given project Id does not exits in project table',1
IF @Ammount<0
throw 99001,'Give a valid budget amount',1;
IF @EndDate <=GETDATE()
throw 99001,'cannot update the budget for already completed project',1;
COMMIT TRANSACTION
END TRY
BEGIN CATCH 
select 
ERROR_MESSAGE() as message,
ERROR_LINE() as errorLine
rollback TRANSACTION
END CATCH
END






