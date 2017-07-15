DECLARE @Counter varchar (255)
SELECT @Counter=count(id_pdds) FROM dbo.T_PDDS
PRINT('Number of records before Deletion : '+  @Counter)
DELETE  FROM dbo.T_PDDS WHERE id_pdds IN (26945,26963,27035)
SELECT @Counter=count(id_pdds) FROM dbo.T_PDDS
PRINT('Number of records After Deletion : '+  @Counter)