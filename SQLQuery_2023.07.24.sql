Select * from Employees
use AppExpert


Create trigger TR_EmployeesTable 
ON Employees
For UPDATE
AS
BEGIN
Select * from Employees

END



Update Employees SET Experience =5 Where Eid=2


/*Task 1 
Give input as 'praba123Welcome2Tescom'. But My Output is prabaWelcomeTescom using Function
*/

DECLARE @FirstName varchar(100)
SET @FirstName = 'praba123W5555elcome2Tescom'


WHILE PATINDEX('%[0-9]%', @FirstName) > 0
    SET @FirstName = REPLACE(@FirstName, SUBSTRING(@FirstName, PATINDEX('%[0-9]%', @FirstName), 1), '')


WHILE PATINDEX('%[^a-zA-Z]%', @FirstName) > 0
    SET @FirstName = REPLACE(@FirstName, SUBSTRING(@FirstName, PATINDEX('%[^a-zA-Z]%', @FirstName), 1), '')

SELECT @FirstName

/*Task 2 
Give input as '2023-07-20 13:03:49 687'. But My Output is '2023-07-20' using Function
*/

Select Convert(date, DOJ) as DOJ FROM Employees





