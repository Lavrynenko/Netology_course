DECLARE @Counter varchar (255)
SELECT @Counter=count(id_pdds) FROM dbo.T_PDDS
PRINT('Number of records before Deletion : '+  @Counter)
DELETE  FROM dbo.T_PDDS WHERE id_pdds IN (26487,26489,26692,26694,26707,26715,26760,26790,26824,26828)
SELECT @Counter=count(id_pdds) FROM dbo.T_PDDS
PRINT('Number of records After Deletion : '+  @Counter)