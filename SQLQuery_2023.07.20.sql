create Database AppExpert
/*
Table LIst:
1. Role
2. Employee Table
3. Salary Table
4. Increment Table

*/

Create table Role
(
roleid int identity(1,1) primary key,
role varchar(25) unique,
Created_at DATETIME DEFAULT CURRENT_TIMESTAMP ,
)

INSERT INTO Role (role)
VALUES
    ('MD'),
    ('CEO'),
    ('CTO'),
    ('SE'),
    ('HR'),
    ('PM'),
    ('TL'),
    ('TM'),
    ('TESTER');

Select * from Role

/*Employee Table */

create table Employees(
Eid Bigint identity(1,1) primary key,
EmpFirstName varchar(50) Not Null,
EmpLastName varchar(50) Not Null,
EmpEmail varchar(250) Not Null unique,
Address varchar(500) Not Null,
DOJ datetime Not Null,
Experience int Not Null,
Gender varchar(10),
MobileNumber varchar(20),
salaryId int Not Null,
roleid int Not Null ,
isActive bit Not Null Default(1),
Foreign key(salaryId) references Salaries(Sid),
Foreign key(roleid) references Role(roleid),
Created_at DATETIME DEFAULT CURRENT_TIMESTAMP ,
Modified_date DATETIME
)

INSERT INTO Employees (EmpFirstName, EmpLastName, EmpEmail, Address, DOJ, Experience, Gender, MobileNumber, salaryId, roleid,Created_at)
VALUES 
('John', 'Doe', 'john.doe@example.com', '123 Main St, Anytown, USA', '2022-07-20', 3, 'Male', '+1 (555) 123-4567', 1, 6, CURRENT_TIMESTAMP),
('Jane', 'Smith', 'jane.smith@example.com', '456 Oak Ave, Somewhere City, USA', '2022-10-15', 5, 'Female', '+1 (555) 987-6543', 2, 7, CURRENT_TIMESTAMP);


/*Salary Table*/
create Table Salaries(
Sid int identity(1,1) primary key,
roleid int Not Null,
BasicSalary varchar(30),
DA varchar(30),
HRA varchar(30),
ConvAll varchar(30),
MedicalExpenses varchar(30),
Special varchar(30),
Bonus varchar(30),
ExtraPay varchar(30),
Total varchar(30),
Foreign key(roleid) references Role(roleid),
Created_at DATETIME DEFAULT CURRENT_TIMESTAMP ,
Modified_date DATETIME
)
INSERT INTO Salaries (roleid, BasicSalary, DA, HRA, ConvAll, MedicalExpenses, Special, Bonus, ExtraPay, Created_at)
VALUES 
(6, '40000', '6000', '4000', '3000', '2000', '1000', '5000','21000',CURRENT_TIMESTAMP),
(7, '35000', '5500', '3500', '2500', '1500', '800', '4000','17800', CURRENT_TIMESTAMP);

/*Increment Table */
create Table Increment(
Iid int identity(1,1) primary key,
roleid int Not Null,
BasicSalary varchar(20),
January varchar(20) Default '0',
February varchar(20)  Default '0',
March varchar(20)  Default '0',
April varchar(20) Default '0',
May varchar(20)  Default '0',
June varchar(20)  Default '0',
July varchar(20)  Default '0',
August varchar(20)  Default '0',
September varchar(20) Default '0',
October varchar(20) Default '0',
November varchar(20) Default '0',
December varchar(20) Default '0',

Total varchar(20) Default '0',
Foreign key(roleid) references Role(roleid),
Created_at DATETIME DEFAULT CURRENT_TIMESTAMP ,
Modified_date DATETIME

)

INSERT INTO Increment (roleid, BasicSalary, January, February, March, April, May, June, July, August, September, October, November, December, Total, Created_at)
VALUES 
(7, '40000', '40000', '41000', '41000', '41000', '41000', '43000', '43000', '43000', '43000', '43000', '46000', '46000', '551000', CURRENT_TIMESTAMP),
(6, '35000', '36000', '36000', '36000', '36000', '36000', '39000', '39000', '39000', '39000', '39000', '41000', '41000', '522000', CURRENT_TIMESTAMP);











SELECT E.Eid, E.EmpFirstName, E.EmpLastName, R.role, SUM(CONVERT(INT, I.Total)) AS TotalIncrement, SUM(CONVERT(INT, S.ExtraPay)) AS TotalExtraPay, 
       SUM(CONVERT(INT, I.Total) + CONVERT(INT, S.ExtraPay)) AS 'CTC'
FROM Employees E
JOIN Role R ON E.roleid = R.roleid
JOIN Increment I ON E.roleid = I.roleid
JOIN Salaries S ON E.roleid = S.roleid
GROUP BY E.Eid, E.EmpFirstName, E.EmpLastName, R.role;



SELECT E.Eid, E.EmpFirstName, E.EmpLastName, R.role, SUM(CONVERT(INT, I.Total)) AS TotalIncrement, SUM(CONVERT(INT, S.ExtraPay)) AS TotalExtraPay,
       SUM(CONVERT(INT, I.Total) + CONVERT(INT, S.ExtraPay)) AS 'CTC'
FROM Employees E
JOIN Role R ON E.roleid = R.roleid
JOIN Increment I ON E.roleid = I.roleid
JOIN Salaries S ON E.roleid = S.roleid
GROUP BY E.Eid, E.EmpFirstName, E.EmpLastName, R.role;

create PROC EMPSALARYDATE
AS
BEGIN


SELECT  E.Eid, E.EmpFirstName, E.EmpLastName, R.role
       SUM(CONVERT(INT, Increment.Total)) AS TotalIncrement
       SUM(CONVERT(INT, S.ExtraPay)) AS TotalExtraPay,
       SUM(CONVERT(INT, I.Total) + CONVERT(INT, S.ExtraPay)) AS 'CTC',
       AVG((CONVERT(INT, I.Total)) + (CONVERT(INT, S.ExtraPay))) AS AverageCTC
FROM Employees E
JOIN Role R ON E.roleid = R.roleid
JOIN Increment I ON E.roleid = I.roleid
JOIN Salaries S ON E.roleid = S.roleid
GROUP BY E.Eid, E.EmpFirstName, E.EmpLastName, R.role;

END





Select * from Employees
Select * from Salaries
Select * from Employees

Select AVG(Convert(int,BasicSalary)) from Salaries

SELECT roleid, BasicSalary, Total, AVG(CONVERT(int, Total )) AS Average
FROM Increment
GROUP BY roleid, BasicSalary, Total;


CREATE VIEW EmployeeSalaryView AS
SELECT E.Eid, E.EmpFirstName, E.DOJ, S.BasicSalary
FROM Employees AS E
JOIN Salaries AS S ON E.roleid = S.roleid;


Select * from EmployeeSalaryView


Create table Emp_Salary(
   id int identity(1,1) primary key,
   Eid Bigint,
   roleid int,
   Month varchar(25) Not Null,
   CTC varchar(25) Not Null,
   Increment varchar(15) Not Null,
   isIncrement bit Not Null,
   DA varchar(30)  Not Null,
   HRA varchar(30)  Not Null,
   ConvAll varchar(30)  Not Null,
   MedicalExpenses varchar(30)  Not Null,
   ESI varchar(30)  Not Null,
   PF varchar(30)  Not Null,
   Gross_Salary varchar(30)  Not Null,
   Net_Salary varchar(30)  Not Null,
   Foreign key(Eid) references Employees(Eid),
   Foreign key(roleid) references Role(roleid),
   Created datetime default current_timestamp,
   Modified datetime default current_timestamp,
)


Insert into Emp_Salary (Eid, roleid,Month, CTC, Increment,isIncrement,DA,HRA, ConvAll,MedicalExpenses,ESI,PF,Gross_Salary,Net_Salary,Created, Modified )
Values(1,6,'January','20000','1000',0,'100','50','200','150','100','200',SUM(Convert(int,DA)+Convert(int,HRA)+Convert(int,ConvAll)+Convert(int,MedicalExpenses)+Convert(int,ESI)+Convert(int,PF)),SUM(Convert(int,DA)+Convert(int,HRA)+Convert(int,ConvAll)+Convert(int,MedicalExpenses)),current_timestamp,current_timestamp )


/*(@id int,@rid int,@Month varchar(50),@CTC varchar(50),@Increment varchar(50),@IsIncrement varchar(15), @DA varchar(20), @HRA varchar(20),@ConvAll varchar(20), @MedicalExpenses varchar(20),
@ESI, @PF,@Gross_Salary,@Net_Salary,@created, @modified)*/

create Proc SP_EmpSalary_Averages (@id int,@rid int,@Month varchar(50),@CTC varchar(50),@Increment varchar(50),@IsIncrement varchar(15), @DA varchar(20), @HRA varchar(20),@ConvAll varchar(20), @MedicalExpenses varchar(20),
@ESI varchar(20), @PF varchar(20),@Gross_Salary varchar(20),@Net_Salary varchar(20),@created datetime, @modified datetime)
AS
BEGIN
Insert into Emp_Salary Values(@id,@rid,@Month,@CTC,@Increment,@IsIncrement,@DA,@HRA,@ConvAll,@MedicalExpenses,@ESI,@PF,@Gross_Salary,@Net_Salary,@created, @modified )
END



CREATE TABLE Emp_Salarys (
   id INT IDENTITY(1, 1) PRIMARY KEY,
   Eid BIGINT,
   roleid INT,
   Month VARCHAR(25) NOT NULL,
   CTC  VARCHAR(50) NOT NULL,
   Increment VARCHAR(15) NOT NULL,
   isIncrement BIT NOT NULL,
   DA  VARCHAR(25) NOT NULL,
   HRA  VARCHAR(25) NOT NULL,
   ConvAll  VARCHAR(25) NOT NULL,
   MedicalExpenses  VARCHAR(25) NOT NULL,
   ESI  VARCHAR(25) NOT NULL,
   PF  VARCHAR(25) NOT NULL,
   Gross_Salary  VARCHAR(25) NOT NULL,
   Net_Salary  VARCHAR(25) NOT NULL,
   Created DATETIME DEFAULT CURRENT_TIMESTAMP,
   Modified DATETIME DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (Eid) REFERENCES Employees (Eid),
   FOREIGN KEY (roleid) REFERENCES Role (roleid)
);

INSERT INTO Emp_Salarys (Eid, roleid, Month, CTC, Increment, isIncrement, DA, HRA, ConvAll, MedicalExpenses, ESI, PF, Gross_Salary, Net_Salary, Created, Modified)
VALUES
(1,5,'February','21000','1000',1,'100','50','180','60','150','200',(Convert(int,21000)+Convert(int,1000)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)),(Convert(int,21000)+Convert(int,1000)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)+Convert(int,200)+Convert(int,200)), current_timestamp,current_timestamp),
(1,5,'March','21000','0',0,'100','50','180','60','150','200',(Convert(int,21000)+Convert(int,0)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)),(Convert(int,21000)+Convert(int,0)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)+Convert(int,200)+Convert(int,200)), current_timestamp,current_timestamp),
(1,5,'April','21000','0',0,'100','50','180','60','150','200',(Convert(int,21000)+Convert(int,0)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)),(Convert(int,21000)+Convert(int,0)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)+Convert(int,200)+Convert(int,200)), current_timestamp,current_timestamp),
(1,5,'May','21000','0',0,'100','50','180','60','150','200',(Convert(int,21000)+Convert(int,0)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)),(Convert(int,21000)+Convert(int,0)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)+Convert(int,200)+Convert(int,200)), current_timestamp,current_timestamp),
(1,5,'June','22000','1000',1,'100','50','180','60','150','200',(Convert(int,22000)+Convert(int,1000)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)),(Convert(int,22000)+Convert(int,1000)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)+Convert(int,200)+Convert(int,200)), current_timestamp,current_timestamp),
(1,5,'July','22000','0',0,'100','50','180','60','150','200',(Convert(int,22000)+Convert(int,0)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)),(Convert(int,22000)+Convert(int,0)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)+Convert(int,200)+Convert(int,200)), current_timestamp,current_timestamp),
(1,5,'August','22000','0',0,'100','50','180','60','150','200',(Convert(int,22000)+Convert(int,0)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)),(Convert(int,22000)+Convert(int,0)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)+Convert(int,200)+Convert(int,200)), current_timestamp,current_timestamp),
(1,5,'September','22000','0',0,'100','50','180','60','150','200',(Convert(int,22000)+Convert(int,0)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)),(Convert(int,22000)+Convert(int,0)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)+Convert(int,200)+Convert(int,200)), current_timestamp,current_timestamp),
(1,5,'October','22000','0',0,'100','50','180','60','150','200',(Convert(int,22000)+Convert(int,0)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)),(Convert(int,22000)+Convert(int,0)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)+Convert(int,200)+Convert(int,200)), current_timestamp,current_timestamp),
(1,5,'November','23000','1000',1,'100','50','180','60','150','200',(Convert(int,23000)+Convert(int,1000)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)),(Convert(int,23000)+Convert(int,1000)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)+Convert(int,200)+Convert(int,200)), current_timestamp,current_timestamp),
(1,5,'December','23000','0',0,'100','50','180','60','150','200',(Convert(int,23000)+Convert(int,0)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)),(Convert(int,23000)+Convert(int,0)+Convert(int,100)+Convert(int,50)+Convert(int,180)+Convert(int,60)+Convert(int,150)+Convert(int,200)+Convert(int,200)+Convert(int,200)), current_timestamp,current_timestamp);


Select * from Emp_Salarys

CREATE PROCEDURE SP_EmployeeAverages
    @id INT,
    @firstName NVARCHAR(50),
    @lastname NVARCHAR(50),
    @roleid INT
AS
BEGIN
    SELECT
        E.Eid,
        E.EmpFirstName,
        E.EmpLastName,
        R.role,
        AVG(CONVERT(INT, S.Gross_Salary)) AS [Average Gross Salary],
        AVG(CONVERT(INT, S.Net_Salary)) AS [Average Net Salary]
      
    FROM
        Employees E
    INNER JOIN
        Emp_Salarys S ON E.Eid = S.Eid
    INNER JOIN
        Role R ON E.roleid = R.roleid
    WHERE
        E.Eid = @id
        AND E.EmpFirstName = @firstName
        AND E.EmpLastName = @lastname
        AND E.roleid = @roleid
    GROUP BY
        E.Eid,
        E.EmpFirstName,
        E.EmpLastName,
        R.role,
        E.roleid;

Select * from Employees






