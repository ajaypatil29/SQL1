create table Students(
Stid int primary key identity,
Sname varchar(20),
City varchar(20))

insert into Students values('Ram','Pune')
insert into Students values('Sham','Mumbai')
insert into Students values('Sita','Pune')
insert into Students values('Gita','Nashik')
select*from Students

create table Subjects(
Subid int primary key identity,
SubName varchar(20),
MaxMarks int,
Passing int)
insert into Subjects values('Maths',100,40),('English',100,40),('Marathi',50,15),('Hindi',50,15)
select*from Subjects 

create table Exam (
Stid int 
constraint fk_Student foreign key (Stid)references Students(Stid),
Subid int
constraint fk_Subject foreign key (Subid)references subjects(Subid),
Marks int)

insert into Exam values(1,1,100),(1,2,85),(1,3,40),(1,4,45)
insert into Exam values(2,1,35),(2,2,55),(2,3,25)
insert into Exam values(3,1,95),(3,2,87),(3,3,45),(3,4,42)
select*from Exam

--1)insert a new student (id=5,name=ramesh,city=hydrabad)into students table
insert into Students values ('Ramesh','Hydrabad')

select*from Students

--2)change the city of stid=4 to sangali
update students set City ='Sangali' where Stid =4

--3)return the list of studnts with column stid,name ,city
select*from Students 
--4)return list containing columns stid,name,subname,marks,maxmarks,percentage

select s.stid,s.sname ,e.Marks ,sb.subname ,maxmarks from Students s
inner join Exam e on s.Stid =e.Stid  
inner join subjects sb on sb.Subid =e.Subid

--5)return list containing columns stid,name,subname,marks,maxmarks,pass or fail
alter table exam  add  Remark varchar(20)

select s.stid,s.sname,sb.subname,e.marks,sb.Maxmarks,e.Remark from Students s
inner join Exam e on s.Stid =e.Stid 
inner join Subjects sb on sb.Subid =e.Subid 

