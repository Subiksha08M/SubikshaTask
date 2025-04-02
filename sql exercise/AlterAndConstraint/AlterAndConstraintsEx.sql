alter table project add  Description varchar(max)CONSTRAINT Description NOT NULL default ''
EXEC sp_rename 'project.Description',  'ProjectDescription', 'COLUMN';
alter table project alter column ProjectDescription varchar(max) NULL
