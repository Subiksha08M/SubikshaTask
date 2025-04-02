
create table Project(
ProjectID int PRIMARY KEY IDENTITY(1,1),
ProjectName varchar(255) UNIQUE,
StartDate varchar(255),
EndDate varchar(255),
Budget decimal(10,2),
Status varchar(255) default 'Not Started',
CONSTRAINT EndDate CHECK(StartDate<=EndDate)
)

create table Task(
TaskId int PRIMARY KEY IDENTITY(1,1),
TaskName varchar(255),
Description varchar(max),
StartDate varchar(255),
DueDate varchar(255),
Priority varchar(255),
Status varchar(255) default 'Pending',
ProjectID int FOREIGN KEY  REFERENCES Project(ProjectID),
CONSTRAINT DueDate CHECK (StartDate<=DueDate),
CONSTRAINT Priority CHECK (Priority='Low'or Priority='Medium'or Priority='High')

)




