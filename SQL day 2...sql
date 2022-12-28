create table Dept(
deptid int primary key,
deptname varchar(10)
)
create table Emp(
empid int primary key,
empname varchar(20) not null,
email varchar(40) unique,
age int check (age>18),
country varchar(20) default 'India',
deptid int,
constraint fk_empdept foreign key (deptid) references dept(deptid)
)

insert into Dept values(1,'HR')
insert into Dept values(2,'Sales')
insert into Dept values(3,'Dev')
insert into Dept values(4,'Marketing')
insert into Dept values(5,'Account')

insert into Emp(empid,empname,email,age,country,deptid )values(1,'ajay','AJAY@gmail.com',24,'India',1)
insert into Emp(empid,empname,email,age,country,deptid )values(2,'jay','JAY@gmail.com',24,'UK',2)
insert into Emp(empid,empname,email,age,country,deptid )values(3,'Rhaul','rahul@gmail.com',24,'india',3)
insert into Emp(empid,empname,email,age,country,deptid )values(4,'vaibhav','vaibh@gmail.com',24,'USA',4)
insert into Emp(empid,empname,email,age,country,deptid )values(5,'Sourabh','sou@gmail.com',24,'India',5)

select *from Emp
select *from Dept
alter table emp add salary int
update Emp set salary=25000 where empid =1
update Emp set salary=26000 where empid =2
update Emp set salary=27000 where empid =3
update Emp set salary=28000 where empid =4
update Emp set salary=29000 where empid =5
update emp set country='India'where empid=1
update Emp set country='UK'where empid =2
update Emp set country='India' where empid =3
update Emp set country='USA' where empid =4
update Emp set country='India'where empid =5
update emp set deptid =1 where empid=1
update Emp set deptid =2 where empid =2
update Emp set deptid =3 where empid =3
update Emp set deptid =4 where empid =4
update Emp set deptid =5 where empid =5

select * from emp 
select empname,salary from emp where empid =5
select empname,salary,country from emp where salary>25000
select empname, salary ,empid from emp where country='India'

select * from Emp where empid=1

select * from Emp where deptid=4

select * from Emp where salary<35000
select * from Emp where salary>=35000

select * from Emp where age >30
--range
select * from Emp where salary between 25000 and 35000
