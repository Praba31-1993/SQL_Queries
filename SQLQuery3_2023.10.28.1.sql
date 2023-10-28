USE [Industry]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SP_Pagination]
		@PageNO = 1,
		@PageSize = 4

SELECT	'Return Value' = @return_value

GO

Delete from Employee where SNO=1;
Select * from Employee


INSERT INTO Employee (Eid, FName, LName, Email, DOJ, Role, Address) Values ()

Drop table Employee;
CREATE TABLE Employee 
(
  SNO int primary key identity(1,1),
  Eid int not null,
  FName varchar(30) not null,
  LName varchar(30) not null,
  Email varchar(150) not null,
  DOJ datetime ,
  Role varchar(50) not null,
  Address varchar(300) not null
)



INSERT INTO Employee (Eid, FName, LName, Email, DOJ, Role, Address)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', '2023-10-01', 'Manager', '123 Main St'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', '2023-10-02', 'Supervisor', '456 Elm St'),
    (3, 'Michael', 'Johnson', 'michael.johnson@example.com', '2023-10-03', 'Developer', '789 Oak St'),
    (4, 'Emily', 'Williams', 'emily.williams@example.com', '2023-10-04', 'Designer', '101 Pine St'),
    (5, 'Robert', 'Brown', 'robert.brown@example.com', '2023-10-05', 'Analyst', '222 Birch St'),
    (6, 'Sarah', 'Davis', 'sarah.davis@example.com', '2023-10-06', 'Manager', '333 Cedar St'),
    (7, 'Daniel', 'Miller', 'daniel.miller@example.com', '2023-10-07', 'Supervisor', '444 Maple St'),
    (8, 'Olivia', 'Wilson', 'olivia.wilson@example.com', '2023-10-08', 'Developer', '555 Walnut St'),
    (9, 'William', 'Jones', 'william.jones@example.com', '2023-10-09', 'Designer', '666 Pine St'),
    (10, 'Ava', 'Martinez', 'ava.martinez@example.com', '2023-10-10', 'Analyst', '777 Oak St'),
    (11, 'James', 'Harris', 'james.harris@example.com', '2023-10-11', 'Manager', '888 Birch St'),
    (12, 'Sophia', 'Clark', 'sophia.clark@example.com', '2023-10-12', 'Supervisor', '999 Cedar St'),
    (13, 'Benjamin', 'Young', 'benjamin.young@example.com', '2023-10-13', 'Developer', '111 Maple St'),
    (14, 'Chloe', 'Lee', 'chloe.lee@example.com', '2023-10-14', 'Designer', '222 Walnut St'),
    (15, 'Ethan', 'Gonzalez', 'ethan.gonzalez@example.com', '2023-10-15', 'Analyst', '333 Pine St'),
    (16, 'Mia', 'Rodriguez', 'mia.rodriguez@example.com', '2023-10-16', 'Manager', '444 Elm St'),
    (17, 'Liam', 'Perez', 'liam.perez@example.com', '2023-10-17', 'Supervisor', '555 Oak St'),
    (18, 'Isabella', 'Turner', 'isabella.turner@example.com', '2023-10-18', 'Developer', '666 Cedar St'),
    (19, 'Lucas', 'Scott', 'lucas.scott@example.com', '2023-10-19', 'Designer', '777 Maple St'),
    (20, 'Avery', 'Hall', 'avery.hall@example.com', '2023-10-20', 'Analyst', '888 Walnut St');


	Select * from Employee;