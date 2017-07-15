/******************************************************************************************
		Alter T_OPERATION_TABLE   
*******************************************************************************************/

-------- Comment  
IF(
	NOT EXISTS (
		SELECT *
		FROM syscolumns
		WHERE syscolumns.id = (	SELECT sysobjects.id
								FROM sysobjects
								WHERE name = 'T_OPERATION_TABLE'
							  )
		 AND syscolumns.name = 'Comment'
	)
)
	BEGIN
		--Add the column
		ALTER TABLE T_OPERATION_TABLE ADD [Comment] varchar(8000) NULL
	END
ELSE
	BEGIN
		PRINT 'Column Comment is already exist'
	END









