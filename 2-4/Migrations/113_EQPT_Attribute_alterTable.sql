/******************************************************************************************
		Alter R_Equipment   
*******************************************************************************************/

-------- EQPT_TCIForManufacturingDateMonth  
IF(
	NOT EXISTS (
		SELECT *
		FROM syscolumns
		WHERE syscolumns.id = (	SELECT sysobjects.id
								FROM sysobjects
								WHERE name = 'R_Equipment'
							  )
		 AND syscolumns.name = 'EQPT_TCIForManufacturingDateMonth'
	)
)
	BEGIN
		--Add the column
		ALTER TABLE R_Equipment ADD [EQPT_TCIForManufacturingDateMonth] int  NULL
	END
ELSE
	BEGIN
		PRINT 'Column EQPT_TCIForManufacturingDateMonth is already exist'
	END


-------- EQPT_TCIForWeightDateMonth  
IF(
	NOT EXISTS (
		SELECT *
		FROM syscolumns
		WHERE syscolumns.id = (	SELECT sysobjects.id
								FROM sysobjects
								WHERE name = 'R_Equipment'
							  )
		 AND syscolumns.name = 'EQPT_TCIForWeightDateMonth'
	)
)
	BEGIN
		--Add the column
		ALTER TABLE R_Equipment ADD [EQPT_TCIForWeightDateMonth] int  NULL
	END
ELSE
	BEGIN
		PRINT 'Column EQPT_TCIForWeightDateMonth is already exist'
	END


-------- EQPT_TCIForDateOfHydrostaticTestMonth  
IF(
	NOT EXISTS (
		SELECT *
		FROM syscolumns
		WHERE syscolumns.id = (	SELECT sysobjects.id
								FROM sysobjects
								WHERE name = 'R_Equipment'
							  )
		 AND syscolumns.name = 'EQPT_TCIForDateOfHydrostaticTestMonth'
	)
)
	BEGIN
		--Add the column
		ALTER TABLE R_Equipment ADD [EQPT_TCIForDateOfHydrostaticTestMonth] int  NULL
	END
ELSE
	BEGIN
		PRINT 'Column EQPT_TCIForDateOfHydrostaticTestMonth is already exist'
	END



-------- EQPT_TCIForBatteryExpiryDateMonth   
IF(
	NOT EXISTS (
		SELECT *
		FROM syscolumns
		WHERE syscolumns.id = (	SELECT sysobjects.id
								FROM sysobjects
								WHERE name = 'R_Equipment'
							  )
		 AND syscolumns.name = 'EQPT_TCIForBatteryExpiryDateMonth '
	)
)
	BEGIN
		--Add the column
		ALTER TABLE R_Equipment ADD [EQPT_TCIForBatteryExpiryDateMonth] int  NULL
	END
ELSE
	BEGIN
		PRINT 'Column EQPT_TCIForBatteryExpiryDateMonth  is already exist'
	END






























