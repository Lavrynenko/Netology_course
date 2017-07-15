DECLARE @Counter varchar (255)

--PDCI
PRINT ('Traitment on PDCI object')
SELECT @Counter=count(id_pdci) FROM dbo.T_PDCI
PRINT('Number of records before Deletion : '+  @Counter)
DELETE  FROM dbo.T_PDCI WHERE id_pdci IN (0)
SELECT @Counter=count(id_pdci) FROM dbo.T_PDCI
PRINT('Number of records After Deletion : '+  @Counter)

PRINT ('')
PRINT ('-----------------------------------')
PRINT ('')

--PDDS
PRINT ('Traitment on PDDS object')
SELECT @Counter=count(id_pdds) FROM dbo.T_PDDS
PRINT('Number of records before Deletion : '+  @Counter)
DELETE  FROM dbo.T_PDDS WHERE id_pdds IN (0,28285,28286)
SELECT @Counter=count(id_pdds) FROM dbo.T_PDDS
PRINT('Number of records After Deletion : '+  @Counter)

