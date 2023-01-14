
create table Trainer(
trainer_id int primary key identity,
trainer_name varchar(30),
Join_date date,
Temail varchar(50),
Experience int)

create table course (
course_id int primary key identity,
course_name varchar(30),
Duration int,
trainer_id int
constraint fk_trainer foreign key(trainer_id)references trainer(trainer_id),
Total_fees decimal)

create table student
(
RollNo int identity,
Sname varchar(20),
Degree varchar(20),
birthdate date,
course_id int
constraint fk_course foreign key(course_id)references course (course_id),
batch_id int ,
fees_paid decimal,
remark varchar(20),
is_placesd varchar(10))




insert into trainer values('Rajesh','2019-02-23','rajesh@gmail.com',3),
('Amit',  '2004-12-22', 'amit@gmail.com', 9),    
('Manik',  '2006-07-04', 'Manik@gmail.com', 7),   
('Nitin',  '2005-03-14', 'Nitin@gmail.com', 8),    
('Priya',  '2007-07-24', 'Priya@gmail.com', 6),      
('Pritam',  '2008-01-04', 'Pritam@gmail.com', 5)   
sele


insert into course values('Csharp',3,4,10000)
insert into course values('Java',4,3,20000)
insert into course values('Python',5,4,15000)
insert into course values('C++',2,6,9000)
insert into course values('Testing',2,7,20000)
insert into course values('Database',1,8,10000)
select*from course 
create table student
(
RollNo int identity,
Sname varchar(20),
Degree varchar(20),
birthdate date,
course_id int
constraint fk_course foreign key(course_id)references course (course_id),
batch_id int ,
fees_paid decimal,
remark varchar(20),
is_placesd varchar(10))

insert into student values ('Ajay','BE-Mechanical','1998-05-29',1,1,10000,'Good','No')
insert into student values ('rahul','BE-Electrical','1999-07-02',2,3,15000,'Better','yes')
insert into student values ('vaibhav','BSc','2000-04-09',4,6,9000,'Good','No')
insert into student values ('pranit','BE-Mechanical','1999-07-20',3,5,10000,'best','No')
insert into student values ('sourabh','BE-Comp','1998-02-22',2,3,5000,'Good','yes')
insert into student values ('Akshay','BE-Civil','2000-03-12',4,6,5000,'Good','No')
insert into student values ('Kishor','BE-E&tc','1998-08-14',3,5,8000,'better','No')
insert into student values ('Raj','BE-comp','1998-05-19',5,7,12000,'Good','yes')
insert into student values ('Nitin','BE-Mechanical','2000-01-29',1,1,5000,'best','No')
insert into student values ('Abhi','BE-Civil','1999-04-21',2,3,14000,'Good','yes')
insert into student values ('Shrii','BE-Electrical','1999-02-20',5,7,15000,'best','No')

--1.Show list of students. List contains roll no , student name , course name , trainer name in order of course name and student name

select s.rollno,s.Sname,c.course_name from student s
inner join course c
on c.course_id=s.course_id 

--2. Show list of students who have pending fees more than 1000rs . List should have student name , course name , balance fees . Show this list in descending order of balance fees.
select s.sname,c.course_name,(c.total_fees -s.fees_paid) as 'Pendng Fees' from student s
inner join course c on (c.Total_fees -s.fees_paid )>1000 and s.course_id =c.course_id
--3. Append letter ‘_spl’ to all batch ids of trainer ‘Manik’.
alter table student alter column batch_id varchar(20)
update student set batch_id ='_spl'+batch_id where course_id  in
(select course_id  from Trainer where trainer_name ='Manik')
--4. Update table student. Update ‘remark’ field. Remark should be ‘Eligible for exam’ if fees paid by student is more than 60%.
update student set remark ='Eligible for exam' where RollNo in
(select s.RollNo from student s
inner join course c on  s.fees_paid > =(0.6*c.Total_fees ) )

--5. Create a index to make retrieval faster based on course name.
create unique index incourse on course (course_name)

--6. List name of course for which more than 2 students are enrolled.
 select c.course_name ,COUNT(s.rollno) as 'count'from course c
inner join student s
on c.course_id =s.course_id   
group by course_name 
--7 List name of course for which maximum revenue was generated. ( max fee collection)
select top 1 c.course_name ,sum(s.fees_paid)as 'Total Revanue'
from student s inner join course c on s.course_id =c.course_id
group by course_name 
order by 'Total Revanue' desc
--8. Select name of student who are in same batch as ‘Ajay’.

select sname from student where batch_id =
(select batch_id from student where Sname ='Ajay')
--9. Delete all students who are in course which is less than 2 months duration.
delete from student where course_id in
(select course_id from course where Duration>2)

--10. Delete all students for whom is placed is ‘yes’ and who have paid all the fees of their course.
delete from student where Sname  =(
select s.sname from student s
inner join course c on c.course_id =s.course_id where s.is_placesd ='Yes' and c.Total_fees =s.fees_paid  )

--11. Create a trigger to add student data in ex-student table if student is deleted from student table.

--12. Create a view which shows name of trainer and number of students he is training.
create view Trainer_stud as
select t.trainer_name ,count(s.rollno)as 'count' from Trainer t
inner join student s
on t.trainer_id  =s.batch_id 
group by trainer_name 
select*from Trainer_stud 
--13. Show names of students who are more than 20 years old.

select sname from student where (year(cast(current_timestamp as date))- year(cast(birthdate as date )))>=20
--14. Show names of students who have paid all the fees.

select s.sname from student s
inner join course c
on s.fees_paid =c.Total_fees 
--15. Write a procedure which accepts student id and returns his balance fees
alter proc Check_balFees(@rollno int) as
(select s.sname ,(c.total_fees-s.fees_paid) as 'Balance fees'from student s
inner join course c on s.course_id =c.course_id 
where (c.Total_fees -s.fees_paid )>0 and @rollno =s.RollNo )

exec Check_balFees 
@rollno=4
