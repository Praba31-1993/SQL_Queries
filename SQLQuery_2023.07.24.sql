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

CREATE FUNCTION FN_AlphabeticValues (@Name varchar(100))
RETURNS varchar(100)
AS   
BEGIN  
    WHILE PATINDEX('%[0-9]%', @Name) > 0
        SET @Name = REPLACE(@Name, SUBSTRING(@Name, PATINDEX('%[0-9]%', @Name), 1), '')

    WHILE PATINDEX('%[^a-zA-Z]%', @Name) > 0
        SET @Name = REPLACE(@Name, SUBSTRING(@Name, PATINDEX('%[^a-zA-Z]%', @Name), 1), '')

    RETURN @Name;
END;

SELECT dbo.FN_AlphabeticValues('praba123Welcome+2Tescom') AS Name;


/*Task 2 
Give input as '2023-07-20 13:03:49 687'. But My Output is '2023-07-20' using Function
*/

CREATE FUNCTION FN_Dates(@date datetime)
RETURNS date
AS   
BEGIN  
    RETURN Convert(date, @date) 
END;   

SELECT dbo.FN_Dates('2025-05-10 18:20:30') AS Date;


