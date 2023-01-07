create table Customerr (
CustomerId int not null,
customerName varchar(20),
country varchar(20),
city varchar(20),
product varchar(20),
price int,
postalcode int,
)
select*from Customerr
insert into Customerr values(1,'AJAY','INDIA','KOLHAPUR','BIKE',50000,416122)
insert into Customerr values(2,'OMKAR','UK','LONDON','CAR',100000,145625)
insert into Customerr values(3,'VAIBHAV','USA','NY','BYCICLE',10000,785466)
insert into Customerr values(4,'RAHUL','UK','BRISTOL','MOBILE',5000,123456)
insert into Customerr values(5,'JAY','INDIA','PUNE','LAPTOP',8000,415200)
insert into Customerr values(6,'SOURABH','GERMANY','BIRLIN','CAR',80000,416122)
insert into Customerr values(7,'ABHI','USA','CHICAGO','BIKE',60000,121110)
insert into Customerr values(8,'JIT','INDIA','MOMBAI','WATCH',3000,41110)


--1.	Write a statement that will select the City column from the Customers table
select city from Customerr
--2.	Select all the different values from the Country column in the Customers table.
select distinct country from Customerr
--3.	Select all records where the City column has the value "London
select *from Customerr where city  like 'London'
--4.	Use the NOT keyword to select all records where City is NOT "Berlin".
select *from Customerr where not city='birlin'
--5.	Select all records where the CustomerID column has the value 5.
select*from Customerr where CustomerId like 5
--6.	Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.
select*from Customerr where city like 'birlin' and  postalcode like 121110
--7.	Select all records where the City column has the value 'Berlin' or 'London'.
select *from Customerr where city = 'birlin' or city='london'
--8.	Select all records from the Customers table, sort the result alphabetically by the column City.
select *from Customerr order by city
--9.	Select all records from the Customers table, sort the result reversed alphabetically by the column City.
select *from Customerr order by city desc
--10.Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City
select *from Customerr order by country,city
--11.	Select all records from the Customers where the PostalCode column is empty.
select*from Customerr where postalcode=null
--12.	Select all records from the Customers where the PostalCode column is NOT empty.
select *from Customerr where postalcode is not null
--13.	Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "birlin".
update Customerr set city ='Oslo' where city ='birlin' 
--14.	Delete all the records from the Customers table where the Country value is 'Norway'.
delete from Customerr where country='norway'
--15.	Use the MIN function to select the record with the smallest value of the Price column.
select min(price) from Customerr
--16.	Use an SQL function to select the record with the highest value of the Price column.
select top 1 *from Customerr order by  price desc
--17.	Use the correct function to return the number of records that have the Price value set to 50000
select *from Customerr where price =50000
--18.	Use an SQL function to calculate the average price of all products.
select AVG(price) from Customerr
--19.	Use an SQL function to calculate the sum of all the Price column values in the Products table
select sum(price) from Customerr
--20.	Select all records where the value of the City column starts with the letter "k".
select*from Customerr where city like 'k%'
--21.	Select all records where the value of the City column ends with the letter "a".
select *from Customerr where city like '%n'
--22.	Select all records where the value of the City column contains the letter "a".
select*from Customerr where city like'%a%'
--23.	Select all records where the value of the City column starts with letter "a" and ends with the letter "b".
select*from Customerr where city Like 'k%R%'
--24.	Select all records where the value of the City column does NOT start with the letter "k".
select *from Customerr where city not like 'k%'
--25.	Select all records where the second letter of the City is an "u".
select*from Customerr where city like '_u%'
--26.	Select all records where the first letter of the City is an "k" or a "p" or an "l".
select*from Customerr where city like 'k%' or city like'p%' or city like 'l%'
--27.	Select all records where the first letter of the City starts with anything from an "a" to an "f".
select*from Customerr where city like '[a-f]%'
--28.	Select all records where the first letter of the City is NOT an "k" or a "p" or an "l".
select*from Customerr where city not like 'k%' or city not like'p%' or city not like 'l%'
--29.	Use the IN operator to select all the records where the Country is either "India" or "UK".
select*from Customerr where country in('india','uk')
--30.	Use the IN operator to select all the records where Country is NOT "India" and NOT "UK".
select*from Customerr where country not in('india','uk')
--31.	Use the BETWEEN operator to select all the records where the value of the Price column is between 3000 and 80000
select *from Customerr where price between 3000 and 80000 
--32.	Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 3000 and 80000
select*from Customerr where price not between 3000 and 80000
--33.	Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between 'Geitost' and 'Pavlova'.
SELECT * FROM Customerr 
WHERE product 
BETWEEN 'car' AND 'watch'

--34.	When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
select c.postalcode as 'Pno'
from Customerr c
--35.	When displaying the Customers table, refer to the table as Consumers instead of Customers.
select consumer.*
from Customerr consumer

--36.	List the number of customers in each country.
select country,count(customerid) as 'CustCount' from Customerr 
group by country
order by  'CustCount'

--37.	List the number of customers in each country, ordered by the country with the most customers first.
select country ,count(customerid) as 'Custcount'  from customerr 
group by country 
--38.	Write the correct SQL statement to create a new database called testDB.
create database testDB
--39.	Write the correct SQL statement to delete a database named tesDB
drop database testDB
--40.	Add a column of type DATE called Birthday in Persons table
alter table customerr add DOB date
update Customerr set DOB=cast('12-12-2022' as date ) where CustomerId=6
--41.	Delete the column Birthday from the Persons table
alter table customerr drop column DOB







