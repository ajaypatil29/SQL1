--Stored Procedure

create proc GetAllempById(@id int)
as begin
select*from Emp where empid=@id
end

exec GetAllempById 
@id=2

--insert stored procedure
create proc Sp_insertEMP(
@empid int,
@empname varchar(20),
@email varchar(50),
@age int,
@country varchar(20),
@deptid int,
@Sal int,
@Manid int)
as begin
insert into Emp values(@empid,@empname,@email,@age,@country,@deptid,@sal,@Manid)
end

exec Sp_insertEMP
@empid =7,
@empname ='ghj',
@email ='hgh@jhj',
@age =26,
@country ='India',
@deptid=2,
@Sal= 26400,
@Manid =2

--update stored procedure
create proc Sp_updatedEMP(
@empid int,
@empname varchar(20),
@email varchar(50),
@age int,
@country varchar(20),
@deptid int,
@Sal int,
@Manid int)
as begin
update emp set empname=@empname,email=@email,age=@age,country=@country,deptid=@deptid,salary=@sal,managerid=@Manid where empid=@empid
return
End


exec Sp_updatedEMP
@empid =8,
@empname ='jitesh',
@email ='jitesh@gmail',
@age =27,
@country ='India',
@deptid=2,
@Sal= 25000,
@Manid =2

--delete
create proc Sp_deleteEMP(
@empid int,
as begin
delete from emp where empid =@empid
end

exec Sp_deleteEMP
@empid =7
