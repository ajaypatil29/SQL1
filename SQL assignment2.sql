CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);
create table worker(
Worker_id int not null primary key,
Firstname varchar(20),
Last_name varchar(20),
Salary int,
Joining_date datetime,
Department varchar(20)
)

INSERT INTO Worker 
	(Worker_id ,Firstname ,Last_name ,Salary ,Joining_date ,Department ) VALUES
		(001, 'Monika', 'Arora', 100000, 14-02-20 , 'HR'),
		(002, 'Niharika', 'Verma', 80000, 14-06-11 , 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, 14-02-20 , 'HR'),
		(004, 'Amitabh', 'Singh', 500000, 14-02-20 , 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, 14-06-11 , 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, 14-06-11, 'Account'),
		(007, 'Satish', 'Kumar', 75000, 14-01-20 , 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, 14-04-11 , 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);
INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, 16-02-20),
		(002, 3000, 16-06-11),
		(003, 4000, 16-02-20),
		(001, 4500, 16-02-20),
		(002, 3500, 16-06-11);
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE varchar(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', 2016-02-20 ),
 (002, 'Executive', 2016-06-11 ),
 (008, 'Executive', 2016-06-11),
 (005, 'Manager', 2016-06-11 ),
 (004, 'Asst. Manager', 2016-06-11 ),
 (007, 'Executive', 2016-06-11 ),
 (006, 'Lead', 2016-06-11 ),
 (003, 'Lead', 2016-06-11 );

 select *from worker
 select *from Bonus 
 select *from Title

 --Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>

 select Firstname as WORKER_NAME from 
 worker 
 --Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.

 select upper(firstname) as WORKER_NAME from worker

 --Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.

 select distinct Department from worker

 --Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table

 select substring(firstname,1,3) from worker

 --Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.


 --Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.

 select rtrim(firstname)from worker

 --Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.

 select ltrim(department) as 'dept' from worker

 --Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.

 select distinct department as'Dept Name',len(department)as 'Length ' from worker 

 --Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
 Select REPLACE(firstname,'a','A') from Worker;

 --Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.

 select CONCAT (firstname,' ',last_name) as 'Name' from worker 

 --Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

 select *from worker order by firstname asc

 --Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

 select*from worker order by firstname , department desc 

 --Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.

 select*from worker where firstname in('Vipul','Satish')

 --Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
 select*from worker where firstname not in('Vipul','Satish')
 --Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.

 select*from worker where Department ='Admin'

 --Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

 select *from worker where firstname like '%a%'

 --Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

  select *from worker where firstname like '%a'

  --Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

  select *from worker where firstname like '_____h'

  --Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

  select *from worker where Salary between 100000 and 500000

  --Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.

  select *from worker where YEAR(joining_date)=14 and MONTH(joining_date)=02;

  --Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.

  select count(worker_id) as'count ' from worker where Department ='Admin'

  --Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
  select CONCAT (firstname,' ',Last_name )as'Name',Salary  from worker where Worker_id in
  (select worker_id from worker where Salary between 50000 and 100000)

  --Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.

  select distinct department, COUNT (worker_id) as'Count' from worker 
group by Department 
order by 'Count' desc

--Q-24. Write an SQL query to print details of the Workers who are also Managers.

select w.firstname ,t.WORKER_TITLE 
from worker w
inner join Title t
on w.worker_id=t.WORKER_REF_ID 
and t.WORKER_TITLE ='Manager'

--Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.

SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

--Q-26. Write an SQL query to show only odd rows from a table.
select*from worker where (worker_id)%2=0
--Q-27. Write an SQL query to show only even rows from a table.

--Q-28. Write an SQL query to clone a new table from another table.
SELECT * INTO WorkerClone FROM Worker;
--
--
--
--Q-32. Write an SQL query to show the top n (say 10) records of a table.
select *from worker order by Worker_id 
offset 0 rows
fetch next 10 row only

--Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table

select*from worker order by Salary 
offset 4 rows
fetch next 1 row only

--Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
select*from worker order by Salary 
offset 4 rows
fetch next 1 row only

--Q-35. Write an SQL query to fetch the list of employees with the same salary.

select distinct w.salary,w.worker_id,w.Firstname
from worker w,worker w1
where w1.Salary =w.Salary 
and w1.Worker_id !=w.Worker_id 

--Q-36. Write an SQL query to show the second highest salary from a table.
select *from worker order by salary desc
offset 1 rows
fetch next 1 row only
--or
select max(salary) from worker where Salary not in
(select max(salary)from worker )

--Q-37. Write an SQL query to show one row twice in results from a table.
--Q-38. Write an SQL query to fetch intersecting records of two tables.
--Q-39. Write an SQL query to fetch the first 50% records from a table.

select *from worker where Worker_id <=(select COUNT(worker_id)/2 from worker )

--Q-40. Write an SQL query to fetch the departments that have less than five people in it.
select distinct department,COUNT(worker_id) from worker 
group by Department 
having COUNT (worker_id)<5
--Q-41. Write an SQL query to show all departments along with the number of people in there.
select distinct department,COUNT(worker_id) from worker 
group by Department 

--Q-42. Write an SQL query to show the last record from a table.
select*from worker where Worker_id =(select max(worker_id)from worker )

--Q-43. Write an SQL query to fetch the first row of a table.

select top 1* from worker 
--or
select*from worker where Worker_id =(select min(worker_id)from worker )

--Q-44. Write an SQL query to fetch the last five records from a table.

select*from worker order by worker_id
offset 3 rows
fetch next 5 row only
--Q-45. Write an SQL query to print the name of employees having the highest salary in each department.

--Q-46. Write an SQL query to fetch three max salaries from a table.
select *from worker order by Salary desc
offset 0 rows
fetch next 3 row only

--Q-47. Write an SQL query to fetch three min salaries from a table.
select *from worker order by Salary desc
offset 5 rows
fetch next 3 row only