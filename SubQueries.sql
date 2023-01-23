
--Sub Queries
select *from emp


select*from Dept
insert  into dept values(6,'HR')


select max(salary)from Emp where salary <(select max(salary)from emp where salary<(select max (salary)from emp) )


--display emp who get less salary than average salary of dept
select*from emp where salary<
(select AVG (salary)from emp where deptid=(select deptid from Dept where deptname = 'Dev' ))
--Select employe whose contry is same empid 2
select empname from emp where country =
(
select country from emp where empid=2
)
--Select employe whose salary is more than empid=3
select *from emp where salary >
(
select salary from Emp where empid =3
)

--display average salary of all dept
select deptid, AVG(salary) as'avg'from emp 
group by deptid 
-- find employe who has less salary than average dept salary
select *from emp where salary <all
(
select  AVG(salary) as'avg'from emp 
group by deptid 
)
--insert with subquery
create table productw(
pid int,
pname varchar(20),
price int)
create table Orders(
Oid int,
Oname varchar(20),
Oprice int)

select *from productw 
select *from Orders
insert into productw values(1,'Mobile',7000)
insert into productw values(2,'laptop',10000)
insert into productw values(3,'watch',5000)
insert into productw values(4,'Table',2000)

insert into Orders select pid,pname,price from productw where pid in(
select pid from productw where price >3000
)
--Update with subquery
--add 20% hike where product name is laptop
update productw set price =price*1.20 where pid=
(select pid from productw where pname ='laptop')
--delete with subqury
--delete product which has price less than 3000
delete from productw where pid=
(select pid from productw where price<3000)