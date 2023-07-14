Select * from School
Select * from Student
Select * from Teacher

ALTER TABLE Student
DROP COLUMN DOB;

ALTER TABLE Teacher
DROP COLUMN DOB;

DROP TABLE Student
DROP TABLE Teacher

select * from School
select * from student
CREATE TABLE Student(
	Sid int identity(1,1) primary key,
	Sname varchar(255),
	DOB datetime,
	Schoolid int,
    FOREIGN KEY (Schoolid) REFERENCES School(Schoolid)
)

Select School.Schoolename, School.Schooltype, Student.Sname, Student.DOB
from School
join Student ON School.Schoolid = Student.Schoolid

insert into Student Values('Praba', '1993-10-31', 1)

Create table Teacher(
	Tid int identity(1,1) primary key,
	TName varchar(255),
	Temail varchar(255),
	DOB datetime,
	Schoolid int,
	FOREIGN KEY (Schoolid) REFERENCES School(Schoolid)
)
/*
1. Create Table(School, Student, Teacher) completed
2. Join table using Store Procedure
3. Link table using Foreign keys
*/

CREATE PROC insertTValues(@tname varchar(255),@tmail varchar(255),@tdob datetime, @tschoolid int )
AS
BEGIN
insert into Teacher Values(@tname,@tmail,@tdob,@tschoolid)
END


Select * from Teacher

/*left Join using Store Procedure*/
create PROC JoinTableValues
AS
BEGIN
SELECT  School.Schoolename, School.Schooltype, Student.Sname, Student.DOB,Teacher.TName, Teacher.Temail,Teacher.DOB
from School
left join Student ON School.Schoolid = Student.Schoolid
left join Teacher ON School.Schoolid = Teacher.Schoolid
END

exec JoinTableValues

/* Triggers
When I Insert datas in Teacher table, I need to show student Record
*/

Create Trigger TteacherRecord
ON Student
For insert
AS
BEGIN
insert into Teacher Values('radha', 'radha@gmail.com',19931031,1)
END


Select * from Student
Select * from Teacher

/*Emmployee Table*/
CREATE TABLE Employee  
(  
  Id INT PRIMARY KEY,  
  Name VARCHAR(45),  
  Salary INT,  
  Gender VARCHAR(12),  
  DepartmentId INT  
)  

INSERT INTO Employee VALUES (1,'Steffan', 82000, 'Male', 3),  
(2,'Amelie', 52000, 'Female', 2),  
(3,'Antonio', 25000, 'male', 1),  
(4,'Marco', 47000, 'Male', 2),  
(5,'Eliana', 46000, 'Female', 3)  

Select * from Employee
Select * from Employee_Audit_Test 

CREATE TABLE Employee_Audit_Test  
(    
Id int IDENTITY,   
Audit_Action text   
)  



INSERT INTO Employee VALUES (8,'Radha', 62002, 'Female', 5)  



/* Trigger Values*/
create trigger trinsertValue
ON EMPLOYEE
FOR INSERT
AS
BEGIN
Select * from Teacher
END