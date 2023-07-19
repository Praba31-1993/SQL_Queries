Create Database Twilight
/*1. Admin
2. Employee
3. Salary
*/


Create table Admin
(
  ID int identity(1,1) primary key,
  Name varchar(35),
  MailID varchar(360) UNIQUE,
  IsActive bit,
  Created_at DATETIME DEFAULT CURRENT_TIMESTAMP ,
  Modified_date DATETIME

)

insert into Admin (Name, MailID, IsActive, Created_at) Values ('Praba', 'praba@gmail.com',1,CURRENT_TIMESTAMP),('karthik', 'karthik@gmail.com',1, CURRENT_TIMESTAMP),('Naren', 'naren@gmail.com',1, CURRENT_TIMESTAMP)

Select * from Admin
Drop table Admin
Drop Database Twilight


Create table Employee
(
EmpId Bigint identity(1,1) primary key,
FirstName varchar(50),
LastName varchar(50),
Email varchar(360) unique,
MobileNumber varchar(15) unique,
Address varchar(500) Not Null,
Designation varchar(100) Not Null,
Experience int Not Null,
ID int,
Gender varchar(10),
isActive bit,
SalaryID int,
Foreign key(ID) References Admin(ID),
Foreign key(SalaryID) References Salaries(SalaryID),
Created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
Modified_date DATETIME
)

INSERT INTO Employee (FirstName, LastName, Email, MobileNumber, Address, Designation, Experience, ID, Gender, isActive, SalaryID, Created_at, Modified_date)
VALUES
  ('John', 'Doe', 'johndoe@example.com', '1234567890', '123 Main St', 'FrontEnd Developer', 3, 1, 'Male', 1, 1, CURRENT_TIMESTAMP, NULL),
  
  ('Jane', 'Smith', 'janesmith@example.com', '9876543210', '456 Elm St', 'BackEnd Developer', 2, 2, 'Female', 1, 2, CURRENT_TIMESTAMP, NULL),
  
  ('Mike', 'Johnson', 'mikejohnson@example.com', '5551112222', '789 Oak St', 'FrontEnd Developer', 5, 3, 'Male', 1, 3, CURRENT_TIMESTAMP, NULL),
  
  ('Emily', 'Brown', 'emilybrown@example.com', '4445556666', '987 Maple Ave', 'Architect', 4, 1, 'Female', 1, 5, CURRENT_TIMESTAMP, NULL),
  
  ('David', 'Wilson', 'davidwilson@example.com', '7778889999', '321 Pine St', 'Full Stack Developer', 1, 2, 'Male', 1, 3, CURRENT_TIMESTAMP, NULL);


Create table Salaries
(
SalaryID int identity(1,1) primary key,
CTC varchar(10) Not Null,
Role varchar(50) Not Null,
BasicSalary varchar(10) Not Null,
DA varchar(10) Not Null,
HRA varchar(10) Not Null,
Medical varchar(10) Not Null,
ConvenientAllowance varchar(10),
Bonus varchar(10),
NetPay varchar(10) Not Null,
ID int,
Foreign key(ID) References Admin(ID),
Created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
Modified_date DATETIME
)




INSERT INTO Salaries (Role, CTC, BasicSalary, DA, HRA, Medical, ConvenientAllowance, Bonus, NetPay, ID, Created_at, Modified_date)
VALUES
  ('FrontEnd Developer', '16000', '12000', '800', '200', '500', '500', '500',
   (CONVERT(INT, '12000') + CONVERT(INT, '800') + CONVERT(INT, '200') + CONVERT(INT, '500') + CONVERT(INT, '500') + CONVERT(INT, '500')),
   1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
   
  ('BackEnd Developer', '17000', '12000', '800', '200', '500', '500', '500',
   (CONVERT(INT, '12000') + CONVERT(INT, '800') + CONVERT(INT, '200') + CONVERT(INT, '500') + CONVERT(INT, '500') + CONVERT(INT, '500')),
   2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
   
  ('Full Stack Developer', '16000', '12000', '800', '200', '500', '500', '500',
   (CONVERT(INT, '12000') + CONVERT(INT, '800') + CONVERT(INT, '200') + CONVERT(INT, '500') + CONVERT(INT, '500') + CONVERT(INT, '500')),
   1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
   
  ('Cloud Engineer', '16000', '12000', '800', '200', '500', '500', '500',
   (CONVERT(INT, '12000') + CONVERT(INT, '800') + CONVERT(INT, '200') + CONVERT(INT, '500') + CONVERT(INT, '500') + CONVERT(INT, '500')),
   3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
   
  ('Architect', '16000', '12000', '800', '200', '500', '500', '500',
   (CONVERT(INT, '12000') + CONVERT(INT, '800') + CONVERT(INT, '200') + CONVERT(INT, '500') + CONVERT(INT, '500') + CONVERT(INT, '500')),
   2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);




Select * from Salaries
Select * from Admin
Select * from Employee

CREATE PROCEDURE SoftDeleteRecord(@aid int,@RecordID int)
   
AS
BEGIN
    UPDATE Employee SET isActive = 0,ID=@aid,  Modified_date=getDate() WHERE EmpId = @RecordID;
END






