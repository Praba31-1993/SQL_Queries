USE [Industry]
GO

/****** Object: StoredProcedure [dbo].[SP_Pagination] Script Date: 10/28/2023 6:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_Pagination]
    @PageNO INT,
    @PageSize INT
AS
BEGIN
    DECLARE @StartRow INT
    SET @StartRow = (@PageNO - 1) * @PageSize
	if @StartRow <0
	set @StartRow=0
    SELECT *
    FROM Employee
    ORDER BY SNO -- Change the column for ordering as needed
  
    OFFSET @StartRow ROWS
    FETCH NEXT @PageSize ROWS ONLY
END
