--Example--
Declare @task_id int,@name varchar(255),@desc varchar(255)
DECLARE Status_Update CURSOR FOR
select TaskId,TaskName,Description from Task 
OPEN Status_Update;
FETCH NEXT FROM Status_Update into @task_id,@name,@desc;
WHILE @@FETCH_STATUS=0
BEGIN
 update Task SET Test_data = @name+' '+ @desc
 where TaskId =@task_id;
 FETCH NEXT from Status_Update into @task_id,@name,@desc
END;
CLOSE Status_Update;
DEALLOCATE Status_Update;
