/******************************************************************************************
		Alter R_FIN_DS   
*******************************************************************************************/

-------- FINDS_RCCBTypeCard  
IF(
	NOT EXISTS (
		SELECT *
		FROM syscolumns
		WHERE syscolumns.id = (	SELECT sysobjects.id
								FROM sysobjects
								WHERE name = 'R_FIN_DS'
							  )
		 AND syscolumns.name = 'FINDS_RCCBTypeCard'
	)
)
	BEGIN
		--Add the column
		ALTER TABLE R_FIN_DS ADD [FINDS_RCCBTypeCard] varchar(255) NULL
	END
ELSE
	BEGIN
		PRINT 'Column FINDS_RCCBTypeCard is already exist'
	END


-------- FINDS_RCCBSlotFIN  
IF(
	NOT EXISTS (
		SELECT *
		FROM syscolumns
		WHERE syscolumns.id = (	SELECT sysobjects.id
								FROM sysobjects
								WHERE name = 'R_FIN_DS'
							  )
		 AND syscolumns.name = 'FINDS_RCCBSlotFIN'
	)
)
	BEGIN
		--Add the column
		ALTER TABLE R_FIN_DS  ADD [FINDS_RCCBSlotFIN] varchar(255) NULL
	END
ELSE
	BEGIN
		PRINT 'Column FINDS_RCCBSlotFIN is already exist'
	END



-------- FINDS_DirectSignalDefault  
IF(
	NOT EXISTS (
		SELECT *
		FROM syscolumns
		WHERE syscolumns.id = (	SELECT sysobjects.id
								FROM sysobjects
								WHERE name = 'R_FIN_DS'
							  )
		 AND syscolumns.name = 'FINDS_DirectSignalDefault'
	)
)
	BEGIN
		--Add the column
		ALTER TABLE R_FIN_DS  ADD  [FINDS_DirectSignalDefault] varchar(20) NULL
	END
ELSE
	BEGIN
		PRINT 'Column FINDS_DirectSignalDefault is already exist'
	END















