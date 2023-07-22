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




Select * from Roles
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
DOJ  datetime Not Null,
Experience int Not Null,
roleId int,
Gender varchar(10),
isActive bit,
SalaryID int,
Foreign key(roleId) References Role(roleid),
Foreign key(SalaryID) References Salaries(SalaryID),
Created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
Modified_date DATETIME
)




Create table Salary
(
SalaryID int identity(1,1) primary key,
CTC varchar(10) Not Null,
Role varchar(50) Not Null,
BasicSalary varchar(10) Not Null,
DA varchar(10) Not Null,
HRA varchar(10) Not Null,
Medical varchar(10) Not Null,
ConvenientAllowance varchar(10),
Special varchar(10),
Bonus varchar(10),
Increment varchar(10) Not Null,
Hike varchar(10) Not Null,
roleId int,
Foreign key(roleId) References Role(roleid),
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


   INSERT INTO Salaries (Role, CTC, BasicSalary, DA, HRA, Medical, ConvenientAllowance, Bonus, NetPay, ID, Created_at, Modified_date)
VALUES
  ('SQL Developer', '32000', '12000', '800', '200', '500', '500', '500',
   (CONVERT(INT, '12000') + CONVERT(INT, '800') + CONVERT(INT, '200') + CONVERT(INT, '500') + CONVERT(INT, '500') + CONVERT(INT, '500')),
   3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)



Select * from Admin
Select * from Salaries
Select * from Employee

CREATE PROCEDURE SoftDeleteRecords(@aid int,@RecordID int)
   
AS
BEGIN
    UPDATE Employee SET isActive = 0,roleid=@aid,  Modified_date=getDate() WHERE EmpId = @RecordID;
END


UPDATE Salaries
SET CTC = 
    CASE 
        WHEN Role = 'Full Stack Developer' THEN 25000
        WHEN Role = 'Cloud Engineer' THEN 30000
        WHEN Role = 'Architect' THEN 35000
        ELSE CTC
    END,
Modified_date = GETDATE()
WHERE Role IN ('Full Stack Developer', 'Cloud Engineer', 'Architect');

/*JOINS
1. JOIN
2. Inner Join
3. Right Join
4. Left Join
5. Self Join
6. Full Join

*/

/*Tables(Employee, Salaries, Admin)*/ 


/* Inner Join*/
Select Employee.FirstName, Employee.LastName, Employee.EmpId, Employee.Email, Employee.Designation, Employee.Experience, Employee.Gender, 
(CONVERT(Int,Salaries.DA)+Convert(Int,Salaries.Bonus)+Convert(INT,Salaries.HRA)+Convert(int,Salaries.Medical)+Convert(int,Salaries.ConvenientAllowance)+Convert(int,Salaries.Bonus))as Hike,Salaries.CTC as Salary,Created_at=getDate()
from Employee
inner join Salaries
ON Employee.SalaryID = Salaries.SalaryID


/*Right Join*/
Select Employee.FirstName, Employee.LastName, Employee.EmpId, Employee.Email, Employee.Designation, Employee.Experience, Employee.Gender, 
(CONVERT(Int,Salaries.DA)+Convert(Int,Salaries.Bonus)+Convert(INT,Salaries.HRA)+Convert(int,Salaries.Medical)+Convert(int,Salaries.ConvenientAllowance)+Convert(int,Salaries.Bonus))as Hike,Salaries.CTC as Salary,Created_at=getDate()
from Employee
right join Salaries
ON Employee.SalaryID = Salaries.SalaryID

/*Left Join*/
Select Employee.FirstName, Employee.LastName, Employee.EmpId, Employee.Email, Employee.Designation, Employee.Experience, Employee.Gender, 
(CONVERT(Int,Salaries.DA)+Convert(Int,Salaries.Bonus)+Convert(INT,Salaries.HRA)+Convert(int,Salaries.Medical)+Convert(int,Salaries.ConvenientAllowance)+Convert(int,Salaries.Bonus))as Hike,Salaries.CTC as Salary,Created_at=getDate()
from Employee
left join Salaries
ON Employee.SalaryID = Salaries.SalaryID



/*Self Join */
Select A.EmpId, A.FirstName, A.Email, B.Designation, B.Address
from Employee A
join Employee B
ON A.SalaryID = B.EmpId


/*Full Outer Join */
Select Employee.FirstName, Employee.LastName, Employee.EmpId, Employee.Email, Employee.Designation, Employee.Experience, Employee.Gender, 
(CONVERT(Int,Salaries.DA)+Convert(Int,Salaries.Bonus)+Convert(INT,Salaries.HRA)+Convert(int,Salaries.Medical)+Convert(int,Salaries.ConvenientAllowance)+Convert(int,Salaries.Bonus))as Hike,Salaries.CTC as Salary,Created_at=getDate()
from Employee
full outer join Salaries
ON Employee.SalaryID = Salaries.SalaryID

/*For the Year, Employees how much salary he got for every month wise */


















