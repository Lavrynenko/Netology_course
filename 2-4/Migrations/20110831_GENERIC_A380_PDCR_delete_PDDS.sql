DECLARE @pdds_to_delete int

-- You must replace 0 by id of pdds that you want delete.
SET @pdds_to_delete = 0


DECLARE @Counter varchar (255)
--PDDS
PRINT ('Traitment on PDDS object')
SELECT @Counter=count(id_pdds) FROM dbo.T_PDDS
PRINT('Number of records before Deletion : '+  @Counter)
DELETE  FROM dbo.T_PDDS WHERE id_pdds IN (@pdds_to_delete)
SELECT @Counter=count(id_pdds) FROM dbo.T_PDDS
PRINT('Number of records After Deletion : '+  @Counter)

