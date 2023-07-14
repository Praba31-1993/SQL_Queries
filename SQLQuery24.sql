create proc createstudent
AS
BEGIN
create table students(
studid int identity(1,1) primary key,
studname varchar(255),
studaddr varchar(255),
)
END

CREATE PROC insertstudent (@name nvarchar(255), @addr nvarchar(255))
AS
BEGIN
insert into students values(@name, @addr)
END

CREATE PROC Selectstudent
as
BEGIN
select * from students
END

exec createstudent
exec insertstudent
exec Selectstudent