create database Organization

Create table Roles
(
roleid int identity(1,1) primary key,
role varchar(25) unique,
Created_at DATETIME DEFAULT CURRENT_TIMESTAMP ,
Modified_date DATETIME DEFAULT CURRENT_TIMESTAMP Not Null

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

create table Employee(
Eid Bigint identity(1,1) primary key,
FirstName varchar(50) Not Null,
LastName varchar(50) Not Null,
Email varchar(250) Not Null unique,
Address varchar(500) Not Null,
DOJ date Not Null,
Experience int Not Null,
Gender varchar(10),
MobileNumber varchar(20),
roleid int Not Null ,
isActive bit Not Null Default(1),
Foreign key(roleid) references Role(roleid),
Created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
Modified_date DATETIME DEFAULT CURRENT_TIMESTAMP
)

INSERT INTO Employee (FirstName, LastName, Email, Address, DOJ, Experience, Gender, MobileNumber, roleid, isActive)
VALUES
  
	 ('John', 'Doe', 'john.doe@gmail.com', '123 Main Street, Anytown', '2010-08-16', 5, 'Male', '5551234567', 2, 1),
    ('Alice', 'Smith', 'alice.smith@gmail.com', '456 Oak Avenue, Springfield', '2015-03-20', 3, 'Female', '7779876543', 1, 1),
    ('Michael', 'Johnson', 'michael.johnson@gmail.com', '789 Pine Road, Cityville', '2018-11-10', 2, 'Male', '9994567890', 3, 1),
    ('Emily', 'Brown', 'emily.brown@gmail.com', '321 Elm Street, Smalltown', '2019-07-05', 1, 'Female', '2223334445', 4, 1),
    ('James', 'Wilson', 'james.wilson@gmail.com', '567 Cedar Lane, Metro City', '2020-02-15', 4, 'Male', '1112223334', 1, 1),
    ('Sarah', 'Davis', 'sarah.davis@gmail.com', '789 Birch Court, Countryside', '2016-09-28', 6, 'Female', '4445556667', 3, 1),
    ('Matthew', 'Martinez', 'matthew.martinez@gmail.com', '111 Maple Street, Riverside', '2017-12-03', 3, 'Male', '7778889990', 2, 1),
    ('Emma', 'Lee', 'emma.lee@gmail.com', '222 Willow Road, Woodland', '2021-04-12', 2, 'Female', '4440001112', 4, 1),
    ('Daniel', 'Taylor', 'daniel.taylor@gmail.com', '555 Oakwood Drive, Lakeside', '2014-06-22', 7, 'Male', '2221110003', 2, 1),
    ('Olivia', 'Anderson', 'olivia.anderson@gmail.com', '777 Elmwood Lane, Mountainside', '2013-09-01', 4, 'Female', '7778889990', 1, 1),
    ('William', 'White', 'william.white@gmail.com', '999 Pinecrest Avenue, Riverdale', '2022-01-07', 5, 'Male', '5556667778', 2, 1),
    ('Ava', 'Harris', 'ava.harris@gmail.com', '444 Birchwood Road, Hillside', '2018-04-20', 2, 'Female', '2223334445', 4, 1),
    ('David', 'Martin', 'david.martin@gmail.com', '888 Maple Lane, Lakeview', '2016-12-15', 3, 'Male', '4445556667', 3, 1),
    ('Sophia', 'Thompson', 'sophia.thompson@gmail.com', '777 Oakwood Drive, Lakeside', '2023-03-22', 1, 'Female', '2221110003', 1, 1),
    ('Christopher', 'Garcia', 'christopher.garcia@gmail.com', '222 Birchwood Road, Hillside', '2017-08-09', 6, 'Male', '7778889990', 2, 1),
    ('Isabella', 'Brown', 'isabella.brown@gmail.com', '666 Pinecrest Avenue, Riverdale', '2021-02-05', 4, 'Female', '5556667778', 3, 1),
    ('Mia', 'Rodriguez', 'mia.rodriguez@gmail.com', '222 Elmwood Lane, Mountainside', '2019-11-18', 2, 'Female', '2223334445', 4, 1),
    ('Joseph', 'Wilson', 'joseph.wilson@gmail.com', '555 Maple Lane, Lakeview', '2015-07-30', 7, 'Male', '4445556667', 1, 1),
    ('Evelyn', 'Garcia', 'evelyn.garcia@gmail.com', '888 Birchwood Road, Hillside', '2014-09-26', 3, 'Female', '2221110003', 2, 1),
    ('Alexander', 'Martinez', 'alexander.martinez@gmail.com', '999 Oakwood Drive, Lakeside', '2016-02-14', 5, 'Male', '7778889990', 1, 1),
    ('Charlotte', 'Brown', 'charlotte.brown@gmail.com', '333 Pinecrest Avenue, Riverdale', '2020-06-10', 4, 'Female', '5556667778', 3, 1);


Select * from Employee
Select * from Salary
/*Salary Table*/
CREATE TABLE Salary (
   id INT IDENTITY(1, 1) PRIMARY KEY,
   Eid BIGINT,
   roleid INT,
   Month VARCHAR(25) NOT NULL,
  
   BasicSalary VARCHAR(50) NOT NULL,
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
   FOREIGN KEY (Eid) REFERENCES Employee (Eid),
   FOREIGN KEY (roleid) REFERENCES Role (roleid)
);




CREATE PROCEDURE SP_EmpSalary (
    @Eid INT,
    @roleid INT,
    @month VARCHAR(50),
    @Increment VARCHAR(50),
    @isIncrement BIT,
    @BasicSalary varchar(50),
	@Salarydate date
)
AS
BEGIN
    INSERT INTO Salary (
        Eid,
        roleid,
        Month,
		SalaryDate,
		BasicSalary,
        Increment,
        isIncrement,
        DA,
        HRA,
        ConvAll,
        MedicalExpenses,
        ESI,
        PF,
        Gross_Salary,
        Net_Salary,
        Created,
        Modified
    )
    VALUES (
        @Eid,
        @roleid,
        @month,
		@Salarydate,
		@BasicSalary,
        @Increment,
        @isIncrement,
        '100',
        '500',
        '120',
        '200',
        '1000',
        '800',
        ( Convert(int,@BasicSalary)+Convert(int,@Increment) +Convert(int,100) +Convert(int,500) +Convert(int,120) +Convert(int,200) +Convert(int,1000) +convert(int,800)),
        ( Convert(int,@BasicSalary)+Convert(int,@Increment) +Convert(int,100) +Convert(int,500) +Convert(int,120) +Convert(int,200)),
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    );
END;

update Employee set DOJ='2022-01-01' Where Eid>0
update Salary Set SalaryDate='2022-02-29' Where id=10
Delete Salary Where id=15


Drop table Salary

Select * from Salary Where Eid=2 ORDER BY BasicSalary; 


Select * from Role
Select * from Employee
Select * from Salary

Select E.FirstName,R.role,S.Month, S.Gross_Salary from Employee E 

join Salary S on E.Eid=5 and E.FirstName='Emily' E.roleid=S.roleid
join Role R on E.Eid=5 and E.roleid=R.roleid











