DECLARE @version varchar(10)
DECLARE @program varchar(10)

SET @version = '1.33.3'
SET @program = 'A380'
--SELECT count(*)  FROM application_setup where application_program = @program and application_version+'.'+application_patch like @version+'%'

IF((SELECT count(*) FROM application_setup where application_program = @program and application_version+'.'+application_patch like @version+'%') = 1)
BEGIN
	DECLARE @Counter varchar (255)
	--PDDS
	PRINT ('Traitment on PDDS object')
	SELECT @Counter=count(id_pdds) FROM dbo.T_PDDS
	PRINT('Number of records before Deletion : '+  @Counter)
	DELETE  FROM dbo.T_PDDS WHERE id_pdds = $(ID_PDDS)
	SELECT @Counter=count(id_pdds) FROM dbo.T_PDDS
	PRINT('Number of records After Deletion : '+  @Counter)

END
ELSE
BEGIN
	print 'This script can be run only  on the '+@program+' program and for PSE '+@version
	print 'Please contact support level 3 of PSE'
END

