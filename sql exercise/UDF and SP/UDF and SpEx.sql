
alter procedure CrudOperation 
(
@TaskId int=null,
@TaskName varchar(255)=null,
@Description varchar(255)=null,
@StartDate varchar(255)=null,
@DueDate varchar(255)=null,
@Priority varchar(255)=null,
@Status varchar(255)=null,
@ProjectId int=null,
@Name varchar(255)=null
)
AS
BEGIN
IF @Name='insert'
begin
INSERT INTO Task (TaskName, Description, StartDate, DueDate, Priority, Status, ProjectID)
VALUES 
    ('Initial Design', 'Design phase for the new website', '2024-01-02', '2024-02-28', 'High', 'Completed', 1)

end
ELSE if @Name ='update'
begin
update Task set TaskName=@TaskName,Description=@Description,
StartDate=@StartDate,DueDate=@DueDate,
Priority=@Priority,
Status=@Status,
ProjectID=@ProjectId
end
ELSE IF @Name='selectAll'
begin
select * from Task
end
ELSE IF @Name ='Select'
begin
select * from Task where TaskId=@TaskId
end
END
go
alter function GetTask(@taskId int)
RETURNS TABLE
AS
RETURN(
select * from Task where @taskId IS NULL or TaskId=@taskId
)


