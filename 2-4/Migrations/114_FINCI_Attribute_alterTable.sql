/******************************************************************************************
		Alter R_FIN_CI   
*******************************************************************************************/

-------- FINCI_PsFinCiNameForMassLoading  
IF(
	NOT EXISTS (
		SELECT *
		FROM syscolumns
		WHERE syscolumns.id = (	SELECT sysobjects.id
								FROM sysobjects
								WHERE name = 'R_FIN_CI'
							  )
		 AND syscolumns.name = 'FINCI_PsFinCiNameForMassLoading'
	)
)
	BEGIN
		--Add the column
		ALTER TABLE R_FIN_CI ADD [FINCI_PsFinCiNameForMassLoading] varchar(13) NULL
	END
ELSE
	BEGIN
		PRINT 'Column FINCI_PsFinCiNameForMassLoading is already exist'
	END



-------- FINCI_429InputBusName  
IF(
	NOT EXISTS (
		SELECT *
		FROM syscolumns
		WHERE syscolumns.id = (	SELECT sysobjects.id
								FROM sysobjects
								WHERE name = 'R_FIN_CI'
							  )
		 AND syscolumns.name = 'FINCI_429InputBusName'
	)
)
	BEGIN
		--Add the column
		ALTER TABLE R_FIN_CI ADD [FINCI_429InputBusName] varchar(33) NULL
	END
ELSE
	BEGIN
		PRINT 'Column FINCI_429InputBusName is already exist'
	END


-------- FINCI_ParameterLocalName  
IF(
	NOT EXISTS (
		SELECT *
		FROM syscolumns
		WHERE syscolumns.id = (	SELECT sysobjects.id
								FROM sysobjects
								WHERE name = 'R_FIN_CI'
							  )
		 AND syscolumns.name = 'FINCI_ParameterLocalName'
	)
)
	BEGIN
		--Add the column
		ALTER TABLE R_FIN_CI ADD [FINCI_ParameterLocalName] varchar(54) NULL
	END
ELSE
	BEGIN
		PRINT 'Column FINCI_ParameterLocalName is already exist'
	END



-------- FINCI_Sensitive  
IF(
	NOT EXISTS (
		SELECT *
		FROM syscolumns
		WHERE syscolumns.id = (	SELECT sysobjects.id
								FROM sysobjects
								WHERE name = 'R_FIN_CI'
							  )
		 AND syscolumns.name = 'FINCI_Sensitive'
	)
)
	BEGIN
		--Add the column
		ALTER TABLE R_FIN_CI ADD [FINCI_Sensitive] varchar(3) NULL
	END
ELSE
	BEGIN
		PRINT 'Column FINCI_Sensitive is already exist'
	END
























