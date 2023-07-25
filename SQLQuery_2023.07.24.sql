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

CREATE FUNCTION FN_AlphabeticValuess (@Name varchar(100))
RETURNS varchar(100)
AS   
BEGIN  
    WHILE PATINDEX('%[0-9]%', @Name) > 0
		
        SET @Name = REPLACE(@Name, SUBSTRING(@Name, PATINDEX('%[0-9]%', @Name), 1), '')
	
    WHILE PATINDEX('%[^a-zA-Z]%', @Name) > 0
        SET @Name = REPLACE(@Name, SUBSTRING(@Name, PATINDEX('%[^a-zA-Z]%', @Name), 1), '')

    RETURN @Name;
END;

SELECT dbo.FN_AlphabeticValuess('praba123Welcome+2Tescom') AS Name;


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


 Select  REPLACE('praba', SUBSTRING('praba', PATINDEX('%[0-9]%', 'pr6666aba'), 1), '')

 Select SUBSTRING('praba',PATINDEX('%[a-zA-Z]%','praba'), 1)

  Select PATINDEX('%[0-9]%', 'pr6666aba')


  /*Scalar Functions 
  
  Input String : 'PrabaTwilightItsolution'

  length, upper, lower, concat, round
  */

  Declare @Name varchar(50) = 'PrabaTwilight';
  
  Select LEN(@Name) as Name;
  Select UPPER(@Name) as Name;
  Select LOWER(@Name) as Name;
  Select CONCAT(@Name, 'Itsolution') as Name;
  Select Round(25.156354564564,2) as roundedNumber --25.160000000000 --

  /*Date and Time Functions
  
  1. DateAdd() - We can add the (year, month, Day ), That Number mentions how many count we want to increase, If you give negative it will decrease.
  2. DATEDIFF()
  
  */

SELECT DATEADD(DAY, -3, '2017/08/25') AS DateAdd; --2017-08-22 00:00:00.000--
SELECT DATEADD(Month, -2, '2017/08/25') AS DateAdd; --2017-06-25 00:00:00.000--
SELECT DATEADD(day, 1, '2017/08/25') AS DateAdd;--2018-08-25 00:00:00.000--

/*DateDiff*/
SELECT DATEDIFF( month, '2021/10/27', '2023/07/25') AS DateDiff;

/*DATEFROMPARTS */ 
SELECT DATEFROMPARTS(2018, 12, 25) AS DateFromParts;

/*Conditional Function */
Select IIF(10001>1000, 'yes', 'no')--yes-- 
Select COALESCE(NULL, NULL,'Praba', NULL) -- Praba -- 


/*String Function */ 
Declare @Name varchar(50) = 'PrabaTwilight';
Select LTRIM(   @Name)
Select RTRIM(   @Name   )
Select TRIM(   @Name   )
Select Replace(@Name,'Twilight', 'karan')--Prabakaran--
Select Substring(@Name,0,11) --rab --
Select PATINDEX('%[0-9A-Z]%', @Name)--9
SELECT REPLICATE(@Name, 5)--copy the text in 5 time--

Select * from employee

SELECT EmployeeID, First_Name, Last_Name, Department, 
       CASE WHEN Salary > 65000.00 THEN '5%' ELSE '1%' END AS SalaryIncrease
FROM employee;

Alter table employee
Add DOB datetime;

Update employee set DOB='2014-05-12' Where Eid=2

Select [EmpFirstName], [EmpLastName], [EmpEmail], [Experience], [Gender],[Created_at], [Modified_date], [DOB],
	CASE WHEN DATEDIFF(YEAR, DOB,'2023-07-25') >20 THEN 'He is eligible to Work'
	else 'He is not eligible to Work' END as EligibilityStatus
from employee

Select DATEDiff(YEAR, '2023-07-25','1993-08-25')