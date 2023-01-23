--Trigger


create table EmpLog(
logid int identity(1,1),
discription varchar(500)
)
--inserted
create trigger tr_employee_insert
on emp for insert
as begin
declare @eid int
select @eid=empid from inserted
insert into EmpLog values('New record with id '+cast(@eid as varchar(10))
+' added at '+cast(getdate() as varchar(30)))
end

select*from emplog
insert into Emp values(7,'test3','test3@gmail.com',22,'India',3,23000,5)

--deleted
create trigger tr_employee_Delete
on emp for Delete
as begin
declare @eid int
select @eid=empid from deleted
insert into EmpLog values('Deleted record with id '+cast(@eid as varchar(10))
+' deleted at '+cast(getdate() as varchar(30)))
end
delete from Emp where empid=7
select*from EmpLog 
--Update
