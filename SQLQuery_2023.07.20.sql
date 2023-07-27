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

Select * from Salaries
Select * from Emp_Salarys
Select * from Role



INSERT INTO Employees (EmpFirstName, EmpLastName, EmpEmail, Address, DOJ, Experience, Gender, MobileNumber, salaryId, roleid,Created_at)
VALUES 
('John', 'Doe', 'john.doe@example.com', '123 Main St, Anytown, USA', '2022-07-20', 3, 'Male', '+1 (555) 123-4567', 1, 6, CURRENT_TIMESTAMP),
('Jane', 'Smith', 'jane.smith@example.com', '456 Oak Ave, Somewhere City, USA', '2022-10-15', 5, 'Female', '+1 (555) 987-6543', 2, 7, CURRENT_TIMESTAMP);

INSERT INTO Salaries (roleid, BasicSalary, DA, HRA, ConvAll, MedicalExpenses, Special, Bonus, ExtraPay, Total)
VALUES (4, '48000', '2000', '3000', '1000', '500', '200', '1000', '300', '56600'),
       (5, '45000', '1800', '2800', '900', '400', '150', '900', '250', '51900'),
       (6, '40000', '2200', '3200', '1200', '600', '250', '1200', '350', '60100'),
       (7, '38000', '1900', '2900', '1100', '450', '180', '950', '280', '54660'),
       (8, '36000', '2100', '3100', '1000', '550', '220', '1100', '320', '58950'),
       (9, '34000', '2300', '3400', '1300', '700', '300', '1300', '400', '67600'),
       (1, '53000', '2000', '3000', '1000', '500', '200', '1000', '300', '58600'),
       (2, '57000', '2100', '3100', '1100', '600', '250', '1100', '320', '63550'),
       (3, '50000', '2400', '3500', '1400', '800', '350', '1400', '450', '72200');


Drop table Salaries
INSERT INTO Employees (EmpFirstName, EmpLastName, EmpEmail, Address, DOJ, Experience, Gender, MobileNumber, salaryId, roleid,Created_at)
VALUES
('Navi', 'Kum', 'Navi@example.com', '221B  Baker st, London', '2010-06-01', 12, 'Male', '+1 (555) 111-2222', 1, 2,CURRENT_TIMESTAMP),
('Michael', 'Johnson', 'michael.johnson@example.com', '789 Elm Rd, Another City, USA', '2022-06-01', 2, 'Male', '+1 (555) 111-2222', 1, 8,CURRENT_TIMESTAMP),
('Emily', 'Williams', 'emily.williams@example.com', '321 Pine St, Townsville, USA', '2023-01-10', 8, 'Female', '+1 (555) 333-4444', 3, 5,CURRENT_TIMESTAMP),
('William', 'Brown', 'william.brown@example.com', '987 Cedar Ave, Countryside, USA', '2022-12-05', 4, 'Male', '+1 (555) 555-1234', 2, 4,CURRENT_TIMESTAMP),
('Sophia', 'Davis', 'sophia.davis@example.com', '555 Elm St, Metropolis, USA', '2023-02-20', 6, 'Female', '+1 (555) 444-7777', 1, 5,CURRENT_TIMESTAMP),
('James', 'Miller', 'james.miller@example.com', '777 Oak St, Riverside, USA', '2022-09-12', 7, 'Male', '+1 (555) 666-9999', 1, 2,CURRENT_TIMESTAMP),
('Olivia', 'Garcia', 'olivia.garcia@example.com', '444 Pine Ave, Cityville, USA', '2022-04-30', 9, 'Female', '+1 (555) 111-3333', 2, 3,CURRENT_TIMESTAMP),
('Robert', 'Martinez', 'robert.martinez@example.com', '222 Elm St, Suburbia, USA', '2023-03-25', 3, 'Male', '+1 (555) 888-1111', 1, 4,CURRENT_TIMESTAMP),
('Emma', 'Lee', 'emma.lee@example.com', '777 Oak Ave, Hometown, USA', '2022-11-28', 5, 'Female', '+1 (555) 999-5555', 3, 2,CURRENT_TIMESTAMP),
('David', 'Jones', 'david.jones@example.com', '555 Pine St, City Central, USA', '2022-08-17', 2, 'Male', '+1 (555) 222-4444', 2, 8,CURRENT_TIMESTAMP),
('Ava', 'Williams', 'ava.williams@example.com', '123 Cedar Ave, Uptown, USA', '2023-04-02', 7, 'Female', '+1 (555) 777-2222', 3, 3,CURRENT_TIMESTAMP),
('Michael', 'Smith', 'michael.smith@example.com', '321 Oak St, Downtown, USA', '2023-05-19', 1, 'Male', '+1 (555) 444-5555', 1, 7,CURRENT_TIMESTAMP),
('Sophia', 'Davis', 'sophia.davis@example.com', '777 Pine St, Midtown, USA', '2022-11-10', 5, 'Female', '+1 (555) 111-7777', 2, 8,CURRENT_TIMESTAMP),
('Oliver', 'Johnson', 'oliver.johnson@example.com', '456 Elm Ave, Suburbia, USA', '2022-08-05', 3, 'Male', '+1 (555) 222-8888', 3, 6,CURRENT_TIMESTAMP),
('Charlotte', 'Brown', 'charlotte.brown@example.com', '789 Oak Ave, City Central, USA', '2023-02-15', 6, 'Female', '+1 (555) 555-2222', 2, 5,CURRENT_TIMESTAMP),
('James', 'Williams', 'james.williams@example.com', '321 Main St, Uptown, USA', '2022-12-20', 2, 'Male', '+1 (555) 333-9999', 1, 3,CURRENT_TIMESTAMP),
('Emma', 'Garcia', 'emma.garcia@example.com', '555 Elm Ave, Metropolis, USA', '2022-09-27', 7, 'Female', '+1 (555) 888-7777', 3, 4,CURRENT_TIMESTAMP),
('William', 'Smith', 'william.smith@example.com', '123 Oak St, Hometown, USA', '2023-04-05', 4, 'Male', '+1 (555) 222-4444', 2, 6,CURRENT_TIMESTAMP),
('Olivia', 'Johnson', 'olivia.johnson@example.com', '456 Main St, Anytown, USA', '2023-06-12', 8, 'Female', '+1 (555) 777-8888', 3, 2,CURRENT_TIMESTAMP),
('Liam', 'Miller', 'liam.miller@example.com', '789 Pine Ave, Townsville, USA', '2022-11-30', 5, 'Male', '+1 (555) 444-7777', 1, 7,CURRENT_TIMESTAMP),
('Sophia', 'Martinez', 'sophia.martinez@example.com', '555 Elm St, Another City, USA', '2022-08-25', 1, 'Female', '+1 (555) 888-9999', 2, 5,CURRENT_TIMESTAMP),
('Noah', 'Smith', 'noah.smith@example.com', '777 Main St, Metropolis, USA', '2023-03-15', 9, 'Male', '+1 (555) 333-1111', 1, 3,CURRENT_TIMESTAMP),
('Olivia', 'Garcia', 'olivia.garcia@example.com', '444 Oak Ave, Cityville, USA', '2022-10-02', 6, 'Female', '+1 (555) 111-7777', 2, 8,CURRENT_TIMESTAMP),
('Emma', 'Johnson', 'emma.johnson@example.com', '222 Elm Ave, Somewhere City, USA', '2023-05-28', 2, 'Female', '+1 (555) 777-5555', 3, 2,CURRENT_TIMESTAMP),
('Oliver', 'Brown', 'oliver.brown@example.com', '555 Pine St, Anytown, USA', '2022-12-15', 4, 'Male', '+1 (555) 111-3333', 1, 6,CURRENT_TIMESTAMP),
('Isabella', 'Davis', 'isabella.davis@example.com', '777 Main St, Countryside, USA', '2023-01-20', 3, 'Female', '+1 (555) 444-6666', 2, 4,CURRENT_TIMESTAMP),
('Liam', 'Martinez', 'liam.martinez@example.com', '123 Elm Ave, Hometown, USA', '2022-08-07', 5, 'Male', '+1 (555) 888-5555', 1, 3,CURRENT_TIMESTAMP),
('Olivia', 'Smith', 'olivia.smith@example.com', '321 Oak St, Suburbia, USA', '2023-06-02', 2, 'Female', '+1 (555) 222-8888', 2, 6,CURRENT_TIMESTAMP),
('Noah', 'Davis', 'noah.davis@example.com', '789 Pine Ave, Somewhere City, USA', '2022-10-18', 7, 'Male', '+1 (555) 777-9999', 3, 7,CURRENT_TIMESTAMP),
('Charlotte', 'Brown', 'charlotte.brown@example.com', '555 Elm St, Townsville, USA', '2022-07-25', 1, 'Female', '+1 (555) 111-4444', 1, 4,CURRENT_TIMESTAMP),
('James', 'Williams', 'james.williams@example.com', '777 Main St, Anytown, USA', '2023-04-12', 6, 'Male', '+1 (555) 666-7777', 3, 8,CURRENT_TIMESTAMP),
('Isabella', 'Garcia', 'isabella.garcia@example.com', '444 Oak Ave, City Central, USA', '2023-01-30', 3, 'Female', '+1 (555) 222-3333', 1, 5,CURRENT_TIMESTAMP),
('William', 'Johnson', 'william.johnson@example.com', '321 Pine St, Hometown, USA', '2022-09-02', 8, 'Male', '+1 (555) 888-7777', 2, 6,CURRENT_TIMESTAMP),
('Oliver', 'Smith', 'oliver.smith@example.com', '123 Elm Ave, Another City, USA', '2022-12-28', 5, 'Male', '+1 (555) 777-3333', 1, 3,CURRENT_TIMESTAMP)



