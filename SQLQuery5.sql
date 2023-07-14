CREATE DATABASE School;



CREATE TABLE MarkCaluculations (
    ID int,
	Student_Role int,
    Average varchar(255),
	Total_Marks int,
	Percentage int,


);



INSERT into Students(ID, Role,Name, Email, Address, Subject,Marks) VALUES (1,100,'Praba','praba"gmail.com', 'Pondy', 'English', 80), (1,101,'Surya','surya"gmail.com', 'Pondy', 'English', 75);
INSERT into MarkCaluculations(ID, Student_Role,Average, Total_Marks, Percentage) VALUES (1,100,50,80,100), (1,101,50,75,100);

SELECT * from Students;
SELECT * from MarkCaluculations;

DELETE Students WHERE ID=1;

DELETE MarkCaluculations WHERE ID=1;

SELECT Students.Name,Students.Email,Students.Address,Students.Marks,Students.Subject, MarkCaluculations.Average, MarkCaluculations.Percentage from Students JOIN MarkCaluculations ON Students.Role=MarkCaluculations.Student_Role


INSERT into Students(ID, Role,Name, Email, Address, Subject,Marks) VALUES (1,100,'Praba','praba"gmail.com', 'Pondy', 'English', 80), (1,101,'Surya','surya"gmail.com', 'Pondy', 'English', 75);

ALTER TABLE Students ADD Maths varchar(255), Tamil varchar(255), Science varchar(255)
SELECT * from Students;

INSERT into Students(ID, Role,Name, Email, Address, Tamil, English, Maths, Science,Total_Marks) VALUES (1,100,'Praba','praba@gmail.com', 'Pondy',70 , 100,100,99, ((70+100+100+99)/4))), (2,101,'Surya','surya@gmail.com', 'Pondy',60 , 90,100,99, ((60+90+100+99)/4))),(3,103,'Geeths','geetha@gmail.com', 'Pondy',50 , 80,100,95),(4,104,'Seetha','seetha@gmail.com', 'Pondy',40 , 60,80,50),
(5,105,'Arjun','arjun@gmail.com', 'Pondy',60 , 40,60,80);



INSERT into StudentData(Role,Name, Email, Address, Tamil, English, Maths, Science,Total_Marks) VALUES (100,'Praba','praba@gmail.com', 'Pondy',70 , 100,100,99,100), (101,'Surya','surya@gmail.com', 'Pondy',60,90,100,99,100)





CREATE TABLE StudentDatas (
  
	Role int,
    Name varchar(255) NOT NULL,
    Email varchar(255),
    Address varchar(255),
	English int,
	Tamil int,
	Maths int,
	Science int,
	Total_Marks int,


);
Select * from StudentDatas;
ALTER TABLE StudentDatas ADD Average int;

INSERT INTO StudentDatas (Role, Name, Email, Address, Tamil, English, Maths, Science, Total_Marks, Average)
VALUES
    
	(102, 'Aravind', 'aravind@gmail.com','kerala', 65, 54, 85, 93, (65 + 54 + 85 + 93), (SELECT AVG(Total_Marks) FROM StudentDatas)),
	(103, 'arun', 'arun@gmail.com', 'Pondy', 40, 80, 90, 89, (40 + 80 + 90 + 89), (SELECT AVG(Total_Marks) FROM StudentDatas)),
	(104, 'Leela', 'leela@gmail.com', 'Pondy', 30, 90, 45, 62, (30 + 90 + 45 + 62), (SELECT AVG(Total_Marks) FROM StudentDatas)),
	(105, 'Vidya', 'vidya@gmail.com', 'Pondy', 20, 70, 45, 63, (20 + 70 + 45 + 63), (SELECT AVG(Total_Marks) FROM StudentDatas)),
	(105, 'Vidya', 'vidya@gmail.com', 'Pondy', 20, 70, 45, 63, (20 + 70 + 45 + 63), (SELECT AVG(Total_Marks) FROM StudentDatas));


DELETE FROM StudentDatas WHERE Average< 100;

Select DISTINCT * FROM StudentDatas;
Select * FROM MarkCaluculations;


/*AND(&) _Query, OR(||), NOT(<>)*/


SELECT Name, Email from StudentDatas WHERE Name ='Prabaidy' AND Email='vidya@gmail.com'
SELECT Name, Email from StudentDatas WHERE Name ='Prabaidy' OR Email='vidya@gmail.com'
SELECT * from StudentDatas WHERE Email <> 'vidya@gmail.com'

/*ORDER BY'*/

SELECT Name, Email FROM StudentDatas ORDER BY Name ASC;
SELECT Name, Email FROM StudentDatas ORDER BY Name DESC;

/*Null*/
Select Student_Role, Average, Total_Marks from MarkCaluculations WHERE Percentage is NOT NULL;
Select Student_Role, Average, Total_Marks from MarkCaluculations WHERE Percentage is NULL;

/*UPDATE*/

UPDATE MarkCaluculations SET Percentage=NULL WHERE Student_Role=101

/*DELETE*/

DELETE MarkCaluculations WHERE Student_Role=101

INSERT INTO MarkCaluculations VALUES (2,101,80,50,NULL),(3,102,90,40,20)

/*MIN AND MAX*/
SELECT MIN(Total_Marks) FROM StudentDatas
SELECT MAX(Total_Marks) FROM StudentDatas

/*LIKE it has two symbols or wildcards, (% , _) %: represent the position of the character, _: represents the length and sometimes position */

Select * from StudentDatas;

SELECT Name  from StudentDatas Where Name LIKE '__r%';
SELECT Name, Email from StudentDatas Where Name LIKE '%m';
SELECT Name, Email from StudentDatas Where Email LIKE 'p%m';

update StudentDatas set Name= 'praba Lokesh' WHERE Role=100

SELECT * from StudentDatas WHERE Email IN ('vidya@gmail.com', 'praba@gmail.com', 'surya@gmail.com')
SELECT Total_Marks from StudentDatas WHERE Total_Marks Between 270 AND 400

/*JOINS*/
Select * from StudentDatas;
Select * from MarkCaluculations;
/*lEFT jOIN*/
Select StudentDatas.Name, StudentDatas.Email, StudentDatas.Address,StudentDatas.Role,MarkCaluculations.Average 
from StudentDatas
left join MarkCaluculations ON StudentDatas.Role =MarkCaluculations.Student_Role
ORDER BY Name desc

/*rIGHT JOIN*/
Select StudentDatas.Name, StudentDatas.Email, StudentDatas.Address,StudentDatas.Role,MarkCaluculations.Average 
from StudentDatas
right join MarkCaluculations ON StudentDatas.Role = MarkCaluculations.Student_Role
ORDER BY Name desc

/* Inner JOIN*/
Select StudentDatas.Name, StudentDatas.Email, StudentDatas.Address,StudentDatas.Role,MarkCaluculations.Average 
from StudentDatas
inner join MarkCaluculations ON StudentDatas.Role = MarkCaluculations.Student_Role
ORDER BY Name desc

/*Self JOIN */
Select StudentDatas.Name AS T1Name , StudentDatas.Email, MarkCaluculations.Average
FROM StudentDatas, MarkCaluculations
Where StudentDatas.Role = MarkCaluculations.Student_Role


Select * from StudentDatas
Select * from MarkCaluculations


Select * from StudentDatas where Role in (Select Student_Role from MarkCaluculations )

/*Union allow only unique Value, Union all allows all Values*/
Select Role from StudentDatas UNION  Select Student_Role from MarkCaluculations
Select Role from StudentDatas UNION ALL  Select Student_Role from MarkCaluculations

/*Group By */ 
Select count(Role), Email from StudentDatas Group By Email

/*We can't able to use default or aggregate function in Where, If we need to use aggregate function We can use Having */
	Select count(Role) from StudentDatas HAVING COUNT(Total_Marks)>50;
/*Functions */
Select GetDate() as Date from MarkCaluculations;
Select * from MarkCaluculations

CREATE TABLE studenttableone2 (
   id INT identity(1,1) NOT NULL,
   Name VARCHAR(255),
   Age INT
   PRIMARY KEY(id),
);

INSERT INTO studenttableone2 (Name, Age) VALUES ('Prabalokesh', 13);

CREATE TABLE EMPLOYEE
(
EMPID int identity (1,1) Not Null,
EmpName nvarchar(50),
EmpAge int,
Primary key (EMPID)
)

CREATE TABLE SALARYS
(
	ID int identity(2,2) Not Null,
	EmpID int,
	SYEAR int,
	Slary int,
	Primary key (ID),
	
)

insert into SALARYS(EmpID, SYEAR,Slary) values (100, 2023, 100000), (101, 2022, 50000)

select * from SALARYS

CREATE PROCEDURE EmployeesDatas
as
insert into SALARYS(EmpID, SYEAR,Slary) values (222, 250, 5320)


CREATE PROCEDURE EmployeesTable
as
Select * from SALARYS 

Exec EmployeesDatas
Exec EmployeesTable


CREATE TABLE TeacherDatas
(
	tid int identity(1,1) Not Null,
	Name varchar(255),
	Subject varchar(255),
	Experienced float,
	Primary key(tid)
)

CREATE TABLE SubjectData
(
	
	Sid int identity(1,1) Not Null,
	Name varchar(255),
	Studid int,
	English varchar(255),
	Tamil varchar(255),
	Maths varchar(255),
	Science varchar(255),
    Primary key(Sid),
	Total int,
	Average float,
	

)


/* ('karthik', 101, 35,40,50,60, (35+40+50+50), (35+40+50+50)/4), ('Govind', 102, 25, 50,80,60, (25+50+80+60), (25+50+80+60)/4) , ('Vamsi', 104, 28, 40,70,60, (28+40+70+60), (28+40+70+60)/4)*//
insert into SubjectData Values ('Lakshmi', 104, 50,60,50,80,(50+60+50+80),(50+60+50+80)/4),('Radha', 105, 30,50,60,70, (30+50+60+70), (30+50+60+70)/4), ('Sara', 106, 25,40,50,80, (25+40+50+80), (25+40+50+80)/4) , ('Lara', 107, 29, 50,80,90, (29+50+80+90), (29+50+80+90)/4)



UPDATE SubjectData SET Studid=103 where Studid=104
Insert into TeacherDatas Values ('ArunaDevi', 'Science', 1),('Varalakshmi', 'Tamil', 2)
 
Select * from TeacherDatas
Select * from SubjectData


Create table Branch
(
 BranchID int identity(1,1) NOT NULL,
 branch_name varchar(255),
 address varchar(255),
 primary key (BranchID),

);

insert into branch values('chennai', 'no 21 thambabaram'), ('london', 'no 581 madurai')

DROP TABLE Branch


CREATE TABLE EMPLOYEEDATA1
(
	EmpId int ,
	Employee_Name varchar(255),
	Emp_desc varchar(255),
	Salary int,
	BranchID int,
	primary key(EmpId),
	FOREIGN KEY (BranchID) REFERENCES Branch  (BranchID)
		
);
insert into EMPLOYEEDATA1 values(105, 'lokesh', 'tester',800000,3 )

CREATE PROCEDURE EMPLOYEDATA
AS
Select * from EMPLOYEEDATA1

Exec EMPLOYEDATA








