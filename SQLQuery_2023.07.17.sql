/*Create */
create table employee(
EmpId int identity(1,1) primary key,
EmpFirtstName varchar(100),
EmpLastName varchar(100),
EmpEmail varchar(100),
EmpAddress varchar(100),
EmpDOB datetime,
EmpMobileNumber Bigint,
EmpRole varchar(100),
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
modified_date DATETIME 

)


/*Insert*/

INSERT INTO employee (EmpFirtstName, EmpLastName, EmpEmail, EmpAddress, EmpDOB, EmpMobileNumber, EmpRole)
VALUES
('Praba', 'IDY', 'prabaidy@gmail.com', 'Pondy', '1993-10-30', 7845692527, 'Frontenddeveloper'),
('Karthik', 'S', 'karthik@gmail.com', 'Pondy', '1993-10-15', 9791986542, 'React JS developer'),
('Sanjay', 'D', 'sanjay@gmail.com', 'Pondy', '1993-05-15', 9887455632, 'Backend developer'),
('Deepak', 'S', 'deepak@gmail.com', 'Pondy', '1993-10-15', 7889455632, 'React JS developer');

Select * from employee 

/*Select */
Select modified_date from employee 

/*Update */
Update employee set EmpRole = 'Angular Developer ',  modified_date = GETDATE() where EmpId =3

/*Delete */
DELETE FROM employee WHERE EMPiD =1

/*AND OR NOT */
Select EmpFirtstName, EmpEmail from employee WHERE EmpId = 2 AND EmpId=3
Select EmpFirtstName, EmpEmail from employee WHERE EmpId = 2 OR EmpId=3
Select EmpFirtstName, EmpEmail from employee WHERE NOT EmpId=3

/*ORDER BY*/

Select EmpFirtstName, EmpEmail from employee ORDER BY EmpFirtstName DESC

Select EmpFirtstName, EmpEmail from employee ORDER BY EmpFirtstName ASC

/*NULL and Not Null */
Select EmpEmail from employee WHERE EmpRole IS NULL
Select EmpEmail from employee WHERE EmpRole IS NOT NULL

ALTER TABLE employee ADD Salary int;
Update employee Set Salary=4000000, modified_date = GETDATE() WHERE EmpId=1
Update employee Set Salary=5000000, modified_date = GETDATE() WHERE EmpId=4
Update employee Set Salary=6000000, modified_date = GETDATE() WHERE EmpId=2

/*Max and Min */
Select Max(Salary) as Salary from employee
Select Min(Salary) as Salary from employee

/*Like pattern */

Select * from employee Where EmpFirtstName Like 'D%'
Select * from employee Where EmpFirtstName Like '%k'
Select * from employee Where EmpFirtstName Like 'a_'

/*IN and Between */
Select * from employee Where Salary IN (3000000,5000000)
Select * from employee Where Salary between 2000000 and 4000000


