use Twilight

create table PsfDownload(
LineNumber int primary key identity(1,1),
PsfNo varchar(50) unique not null,
Trade varchar (10) null,
ServicePsf varchar(10) null,
Voyage varchar(10) null,
VesselName varchar(50) null,
Agency varchar(10) null,
ActiveStatus varchar(20)
);

INSERT INTO PsfDownload (PsfNo, Trade, ServicePsf, Voyage, VesselName, Agency, ActiveStatus)
VALUES
('AEJEA04125', 'SPR', 'SGp', '20251', 'Celsius Nicosa', 'AX01', 'Live'),
('AEJEA049070', 'SIP', 'SGX', '2000', 'Celsius Nicosa', 'AX03', 'Live'),
('AEJEA042150', 'SIX', 'RGX', '2001', 'Celsius Nicosa', 'AX03', 'Live'),
('AEJEA4557070', 'NGX', 'TRE', '2520', 'Celsius Nicosa', 'AS03', 'Suspended'),
('INCOK049070', 'RNT', 'RGX', '2000', 'Celsius Nicosa', 'AS01', 'Live'),
('INNMA056450', 'VBJ', 'PLM', '23015', 'Celsius Nicosa', 'BT01', 'Live'),
('INCOK056970', 'SRS', 'NGX', '25250', 'DHAULAGIR', 'AX01', 'Live'),
('SAJED056970', 'SIS', 'TTX', '2521', 'DHAULAGIR', 'AZ01', 'Live'),
('INCOK0596970', 'RCS', 'NGT', '23012', 'DHAULAGIR', 'AX01', 'Live'),
('INCOK052670', 'TTK', 'NTX', '3020', 'DHAULAGIR', 'AX01', 'Suspended'),
('INCOK056125', 'SRS', 'NGX', '25250', 'DHAULAGIR', 'AS01', 'Live'),
('INNMA056970', 'VBJ', 'PLM', '2235', 'MACHU PICCHU', 'BT01', 'Live'),
('INNMA051270', 'VBJ', 'PXM', '21535', 'MACHU PICCHU', 'JT01', 'Live'),
('INNMA456970', 'VBJ', 'PLM', '1256', 'MACHU PICCHU', 'BT01', 'Live'),
('INNMA056945', 'ASK', 'LLM', '30135', 'MACHU PICCHU', 'BT01', 'Live');

ALTER PROCEDURE GetPsfDownloads
    @PageNumber INT,
    @PageSize INT
AS
BEGIN
    DECLARE @StartRow INT
    SET @StartRow = (@PageNumber - 1) * @PageSize
	if @StartRow <0
	set @StartRow=0
  SELECT LineNumber, PsfNo, Trade, ServicePsf, Voyage, VesselName, Agency, ActiveStatus
    FROM PsfDownload
    ORDER BY LineNumber
    OFFSET @StartRow ROWS
    FETCH NEXT @PageSize ROWS ONLY

END

EXEC GetPsfDownloads @PageNumber = 3, @PageSize = 5;

----CREATE

CREATE PROCEDURE InsertPsfDownload    @PsfNo VARCHAR(50),    @Trade VARCHAR(10),    @ServicePsf VARCHAR(10),    @Voyage VARCHAR(10),    @VesselName VARCHAR(50),    @Agency VARCHAR(10),    @ActiveStatus VARCHAR(20)ASBEGIN    INSERT INTO PsfDownload (PsfNo, Trade, ServicePsf, Voyage, VesselName, Agency, ActiveStatus)    VALUES (@PsfNo, @Trade, @ServicePsf, @Voyage, @VesselName, @Agency, @ActiveStatus);END
EXEC InsertPsfDownload INCOK125871,ASR,AZ01,23014,XPDHA,A09,Live;
select*from PsfDownload
----UPDATE
ALTER PROCEDURE UpdatePsfDownload
    @LineNumber int,
    @PsfNo varchar(50),  -- Specify the maximum length, e.g., varchar(50)
    @NewTrade VARCHAR(50),   
    @NewServicePsf VARCHAR(10),
    @NewVoyage VARCHAR(10),  
    @NewVesselName VARCHAR(50), 
    @NewAgency VARCHAR(10),
    @NewActiveStatus VARCHAR(20)
AS
BEGIN
    UPDATE PsfDownload
    SET PsfNo = @PsfNo,
        Trade = @NewTrade,
        ServicePsf = @NewServicePsf,
        Voyage = @NewVoyage,
        VesselName = @NewVesselName,
        Agency = @NewAgency,
        ActiveStatus = @NewActiveStatus
    WHERE LineNumber = @LineNumber;
END

EXEC UpdatePsfDownload 18, 'INCOK125871', 'ASR', 'AZ01', '23014', 'XPDHA', 'AS09', 'Live';


----DELETE

CREATE PROCEDURE DeletePsfDownload
    @LineNumber INT
AS
BEGIN
    DELETE FROM PsfDownload
    WHERE LineNumber = @LineNumber;
END
 EXEC DeletePsfDownload 16


 Select * from Employee