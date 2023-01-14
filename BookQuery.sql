create table MasterAward(
Award_type_id int primary key,
Award_name varchar(50),
Award_price int)



create table Author(
author_id int primary key ,
author_name Varchar(30),
ph_no int,
email varchar(50), 
address varchar(50),
city varchar(50)
)
alter table author alter column ph_no decimal


create table Book(
Book_id int primary key,
book_name varchar(30) , 
author_id  int
constraint fk_Author foreign key (author_id) references Author(Author_id),
price int not null , 
published_date datetime
)



Create table Awards(
award_id int,
 award_type_id int
 constraint fk_Awards foreign key (award_type_id) references MasterAward( award_type_id),
 author_id int
constraint fk_Author2 foreign key (author_id) references Author(Author_id),
 book_id int
 constraint fk_Books foreign key (Book_id) references Book(Book_id),
Award_year int)

insert into MasterAward values(1,'Sahitya Akademi Best book',500000)
insert into MasterAward values(2,'JCB Prize for Literature',800000)
insert into MasterAward values(3,'TATA Literature Live Awards',400000)
insert into MasterAward values(4,'The Hindu Literary Prize',200000)
insert into MasterAward values(5,'Crossword Book Awards',100000)
select*from MasterAward 


insert into Author values(1,'Chetan Bhagat',7896454661,'ChetanB@gmail.com','India','Delhi')
insert into Author values(2,'Harivansh Rai Bachchan',9596468661,'HB@gmail.com','India','Agra')
insert into Author values(3,'Balakumaran',9854263201,'BKB@gmail.com','India','Chennai')
insert into Author values(4,'Kunal Basu',7485961425,'KB@gmail.com','India','Calcutta')
insert into Author values(5,'Jagadish Bhagwati',9536214457,'JB@gmail.com','India','Bombay')
select*from Author


--cB-400 days-250,half girlfriend-170,two states-190
--HB--Meri Shreshtha Kavitayen-350,Madhushala-120,Satrangini-150
--BK--Kadigai-300,Mercuri Pookkal--310
--KB--Kalkatta-400
--jB--defence of globlization-400

insert into Book values(1,'400 days',1,250,10-10-20)
insert into Book values(2,'Meri Shreshtha Kavitayen',2,350,11-08-10)
insert into Book values(3,'half girlfriend',1,170,12-11-22)
insert into Book values(4,'Kalkatta',4,400,13-05-29)
insert into Book values(5,'Madhushala',2,120,14-02-25)
insert into Book values(6,'Mercuri Pookkal',3,310,16-03-14)
insert into Book values(7,'Satrangini',2,150,15-11-20)
insert into Book values(8,'defence of globlization',5,400,18-09-20)
insert into Book values(9,'Kadigai',3,300,19-10-10)
insert into Book values(10,'two states',1,190,20-06-02)

select*from book


insert into Awards values(1,2,1,1,2010)
insert into Awards values(2,1,1,1,2010)
insert into Awards values(3,3,2,2,2011)
insert into Awards values(4,4,3,1,2012)
insert into Awards values(5,4,4,4,2013)
insert into Awards values(6,5,4,4,2013)
insert into Awards values(7,1,3,6,2017)
insert into Awards values(8,2,2,7,2016)
insert into Awards values(9,3,5,8,2019)
insert into Awards values(10,5,3,9,2020)
select*from Awards 

--1.	Write a query to show book name , author name and award name for all books which has received any award. 
select b.book_name,a.author_name,aw.Award_name
from Book b inner join Author a
on b.author_id  =a.author_id 
inner join Awards d on a.author_id =d.author_id 
inner join MasterAward aw on aw.Award_type_id =d.award_type_id 
--2.	Write a query to update author name of authors whose book price is > 100. Prefix author name with ‘Honourable’ .

update author set author_name =concat('Honrable',author_name  ) where author_id in
(select author_id from Book where price >100)

--3.	Write a query to display authors and number of books written by that author. Show author who has written maximum books at the top.


select a.author_name,COUNT (b.book_id)as 'Book count' from Book b
inner join Author a on a.author_id =b.author_id 
group by a.author_name order by 'book count' desc


--4.	Write a query to select book name with 5 th highest price.

select Book_name ,price from Book 
order by price desc
offset 4 rows
fetch next 1 row only

--5.	Select list of books which have same price as book ‘Two states’.
select *from book where price =(
select price from Book where book_name ='Two states')
--6.	Increase price of all books written by Mr. Chetan Bhagat by 5%.

update Book set price =1.05*price from Book where author_id =
(select author_id from Author where author_name ='Chetan bhagat')

--7.	Show award names and number of books which got these awards. 
Select a.Award_name ,COUNT(b.book_id) from Awards b
inner join MasterAward a
on b.award_type_id =a.Award_type_id 
group by a.Award_name 
--8.	Delete all books written by ‘Chetan Bhagat’ 

delete from Book where author_id =
(select author_id from Author where author_name ='Chetan bhagat')
--9.	Create view to show name of book and year when it has received award. 

create view book_Award as
select b.book_name,a.award_year from Book b
inner join Awards a on 
b.Book_id =a.book_id 

select*from book_Award
--10.	Create trigger to ensure min price of any book must be Rs. 100. 
--11.	Increase price of book by 10% if that book has received any award.
update Book set price=1.1*price from Book where Book_id in
(select Book_id from Awards )
--12.	Show names of author and number of books written by that Author.
select a.author_name ,COUNT (b.book_id) as 'count 'from Author a
inner join Book b on
b.author_id =a.author_id 
group by author_name order by 'Count' desc

--13.	Show names of authors whose books are published before year 2020.
select a.author_name from Author a
inner join Book
on published_date < 20-01-01

--14.	Show name of books which has published within 1 year after 15 August 2020.
select book_name from book where published_date between 20-08-15 and 21-08-15

--15.	Delete all authors whose no book is published in year 2020.
delete from author_id where author_id in
(select author_id from Book where year(cast(published_date as date)) not in( YEAR (cast('2020' as date)))