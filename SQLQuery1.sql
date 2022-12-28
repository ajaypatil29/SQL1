
create Table Person(
personid int,
name varchar(20)
)

create  Table Employee(
empid int,
empname varchar,
salary numeric(6,2),
Age int,
deptname varchar(25)
)
-- is used for comments in sql.

-- alter to modify the datatype or its size
alter table person alter column name varchar(30)
sp_help person
--to rename the column
sp_rename 'person.name','pname'
sp_help person
--to remove the column
alter table person drop column pname

--to add a column
alter table person add name varchar(30)

alter table employee add dress varchar(50)
sp_help employee
alter table employee drop column dress 
sp_rename 'employee.deptname','department'