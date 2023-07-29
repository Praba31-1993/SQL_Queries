
/*Task1 Join All employees*/
create Proc SP_ShowEmployeeSalaryDetails
AS
BEGIN
Select E.Eid, E.FirstName, E.LastName, E.Email,E.DOJ, R.role, S.Month, S.BasicSalary, S.Gross_Salary as CTC,
 E.Created_at  AS CreatedBy, E.Modified_date  AS ModifiedBy
FROM EMPLOYEE E
left Join Role R on E.roleid= R.roleid
left Join Salary S on E.roleid= S.roleid

END

/*Task2 Filter EmpTable by using Name and Id employees*/
Select * from Employee
Select * from Salary
Select * from Employee


create Proc SP_ShowEmployeeTableById(@Eid int,@Name varchar(50))
AS
BEGIN
Select E.Eid, E.FirstName, E.LastName, E.Email,E.DOJ, R.role, S.Month, S.BasicSalary, S.Gross_Salary as CTC,
 E.Created_at  AS CreatedBy, E.Modified_date  AS ModifiedBy
from Employee E 
join Salary S on E.Eid=@Eid and E.FirstName=@Name and E.roleid=S.roleid
join Role R on E.Eid=@Eid and E.roleid=R.roleid
END


/*Task3 Sort the Employees*/
create Proc SP_SortEmployeeSalary(@sortValue int)
AS
BEGIN
Select E.Eid, E.FirstName, E.LastName, E.Email,E.DOJ, R.role, S.Month, S.BasicSalary, S.Gross_Salary as CTC,
 E.Created_at  AS CreatedBy, E.Modified_date  AS ModifiedBy
FROM EMPLOYEE E
left Join Role R on E.roleid= R.roleid
left Join Salary S on E.roleid= S.roleid
Order By 
       CASE WHEN @sortValue =1 then E.Eid End ASC,
       CASE WHEN @sortValue = -1 then E.Eid End DESC;

END


/*Task4 Pagination*/

CREATE PROCEDURE SP_PageEmployeeSalary
(
    @Page int,
    @PageSize int
)
AS
BEGIN
    DECLARE @PageNo int = (@Page - 1) * @PageSize;

    SELECT E.Eid, E.FirstName, E.LastName, E.Email, E.DOJ, R.role, S.Month, S.BasicSalary, S.Gross_Salary AS CTC, 
            E.Created_at  AS CreatedBy, E.Modified_date  AS ModifiedBy
    FROM Employee E
    LEFT JOIN Role R ON E.roleid = R.roleid
    LEFT JOIN Salary S ON E.roleid = S.roleid
    ORDER BY E.Eid
    OFFSET @PageNo ROWS FETCH NEXT @PageSize ROWS ONLY;
END


/*SP for Filter, Sort, Pagination*/
CREATE PROC SP_EmployeeSalaryDetails (
    @Eid INT,
    @Name VARCHAR(50),
    @sortValue INT,
    @Page INT,
    @PageSize INT
)
AS
BEGIN
    DECLARE @PageNo INT = (@Page - 1) * @PageSize;

    SELECT E.Eid,
           E.FirstName,
           E.LastName,
           E.Email,
           E.DOJ,
           R.role,
           S.Month,
           S.BasicSalary,
           S.Gross_Salary AS CTC,
           E.Created_at AS Created,
           E.Modified_date AS Modified
    FROM Employee E
    LEFT JOIN Role R ON E.roleid = R.roleid
    LEFT JOIN Salary S ON E.roleid = S.roleid
    WHERE (@Eid IS NULL OR E.Eid = @Eid)
      AND (@Name IS NULL OR E.FirstName = @Name)
    ORDER BY
        CASE
            WHEN @sortValue = 1 THEN E.Eid
        END ASC,
        CASE
            WHEN @sortValue = -1 THEN E.Eid
        END DESC
    OFFSET 1 ROWS FETCH NEXT 10 ROWS ONLY;
END
