create table books(
bookid int ,
bookprice int,
bookname varchar(20)
)
create table bookCat(bookid int,categery varchar(20))

alter table books alter column bookname varchar(40)
alter table books add  catagery varchar(20)
alter table books drop column catagery
sp_rename 'books.bookid','id'
sp_rename 'books.id','bookid'
alter table books alter column bookid int not null
alter table books alter column bookid int null
alter table books alter column bookid int not null
alter table books add constraint pk_books primary key (bookid)
alter table bookcat add constraint pk_bookcat primary key (bookid)
alter table books add constraint uniqu_books unique (bookname)
alter table books add constraint fk_books foreign key (bookid) references bookcat(bookid)

