INSERT INTO Project (ProjectName, StartDate, EndDate, Budget, Status)
VALUES 
    ('Website Redesign', '2024-01-01', '2024-06-30', 15000.00, 'In Progress'),
    ('Mobile App Development', '2024-02-15', '2024-07-15', 25000.00, 'Not Started'),
    ('Market Research', '2024-03-01', '2024-05-31', 10000.00, 'Completed'),
    ('Annual Report Preparation', '2024-04-01', '2024-12-31', 12000.00, 'In Progress');
INSERT INTO Task (TaskName, Description, StartDate, DueDate, Priority, Status, ProjectID)
VALUES 
    ('Initial Design', 'Design phase for the new website', '2024-01-02', '2024-02-28', 'High', 'Completed', 1),
    ('UI Development', 'Development of user interface components', '2024-03-01', '2024-05-15', 'Medium', 'In Progress', 1),
    ('Quality Assurance', 'Testing and quality assurance', '2024-05-16', '2024-06-15', 'High', 'Pending', 1),
    ('API Development', 'Developing APIs for the mobile app', '2024-02-16', '2024-04-30', 'Medium', 'Completed', 2),
    ('Beta Testing', 'Conducting beta testing for the mobile app', '2024-05-01', '2024-06-30', 'High', 'In Progress', 2),
    ('Survey Analysis', 'Analyzing market research surveys', '2024-03-02', '2024-04-15', 'Low', 'Completed', 3),
    ('Report Drafting', 'Drafting the final report based on research', '2024-04-16', '2024-05-30', 'Medium', 'Pending', 3),
    ('Financial Statements', 'Preparing financial statements for the annual report', '2024-04-02', '2024-07-15', 'High', 'In Progress', 4),
    ('Final Review', 'Final review and submission of the annual report', '2024-07-16', '2024-12-15', 'High', 'Pending', 4),
    ('Client Feedback Incorporation', 'Incorporating feedback from the client into the project', '2024-02-01', '2024-03-15', 'Medium', 'In Progress', 1),
    ('Launch Preparation', 'Preparing for the official launch of the mobile app', '2024-06-01', '2024-07-01', 'High', 'Pending', 2);

alter table project add  Description varchar(max)CONSTRAINT Description NOT NULL default ''
EXEC sp_rename 'project.Description',  'ProjectDescription', 'COLUMN';
alter table project alter column ProjectDescription varchar(max) NULL
 --1--
 select * from Task ORDER BY StartDate 
 --2--
select COUNT(*)noOfTask,MIN(Project.ProjectName) as projectName from Task JOIN Project on Project.ProjectID=Task.ProjectID GROUP BY Project.ProjectID  ORDER BY noOfTask DESC
--3--
select COUNT(*) as totalNumber,sum(Project.Budget) as totalBudget from Task JOIN Project on Project.ProjectID=Task.ProjectID GROUP BY Project.ProjectID;
--4--
select * from Project where  Budget BETWEEN 10000 and 50000 and Status='In Progress';
--5--
select * from Task where DATENAME(year,StartDate) ='2024' and Status='Completed'
--6--
SELECT StartDate, DueDate,DATEDIFF(month,StartDate,DueDate)as different from Task where DATEDIFF(month,StartDate,DueDate)=1 and Status='Pending'
--7--
select * from Task JOIN Project on Project.ProjectID = Task.ProjectID where Project.ProjectName='Website Redesign' and Task.Priority='High'
--8--

--9--
select TOP 1* from Task ORDER BY StartDate DESC;
--10---
select Project.ProjectName,Task.Priority from Task JOIN 
Project on Task.ProjectID = Project.ProjectID  
where Task.ProjectID IN(select ProjectID from Task where Priority='High')

select * from Task JOIN Project on Task.ProjectID=Project.ProjectID where Task.Priority='High'

select * from Task where TaskName LIKE 'Design%';
select * from Task where TaskName LIKE '%Review' and TaskName NOT LIKE 'Pre%'
select * from Task where TaskName LIKE '%___[A-M]%';

select * from Project;
select * from Task
