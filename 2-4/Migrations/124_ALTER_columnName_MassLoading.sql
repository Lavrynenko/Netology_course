------------------------------------------------------------------------------------
---------------------------------------- R_FIN_CI AND EQPT ---------------------------------
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- FINCI_PsFinCiNameForMassLoading
------------------------------------------------------------------------------------

IF(EXISTS (SELECT * FROM syscolumns WHERE syscolumns.id = 
				( SELECT sysobjects.id FROM sysobjects WHERE name = 'R_FIN_CI')
					AND syscolumns.name = 'FINCI_PsFinCiNameForMassLoading'
	)
)
	BEGIN
		--Modify the column name
		EXEC sp_RENAME 'R_FIN_CI.FINCI_PsFinCiNameForMassLoading', 'FINCI_NameForMassLoading' , 'COLUMN'
	END
ELSE
	BEGIN
		PRINT 'Column R_FIN_CI.FINCI_PsFinCiNameForMassLoading does not exist'
	END



IF(EXISTS(SELECT * FROM infobase WHERE object_value = 'FINCI_PsFinCiNameForMassLoading' AND table_name = 'R_FIN_CI'))
	BEGIN
		UPDATE infobase 
				SET object_value = 'FINCI_NameForMassLoading' 
				WHERE object_value = 'FINCI_PsFinCiNameForMassLoading' AND table_name = 'R_FIN_CI'
	END

------------------------------------------------------------------------------------
-- FINDS_PsFinDsNameForMassLoading
------------------------------------------------------------------------------------


IF(EXISTS (SELECT * FROM syscolumns WHERE syscolumns.id = 
				( SELECT sysobjects.id FROM sysobjects WHERE name = 'R_FIN_DS')
					AND syscolumns.name = 'FINDS_PsFinDsNameForMassLoading'
	)
)
	BEGIN
		--Modify the column name
		EXEC sp_RENAME 'R_FIN_DS.FINDS_PsFinDsNameForMassLoading', 'FINDS_NameForMassLoading' , 'COLUMN'
	END
ELSE
	BEGIN
		PRINT 'Column R_FIN_DS.FINDS_PsFinDsNameForMassLoading does not exist'
	END





IF(EXISTS(SELECT * FROM infobase WHERE object_value = 'FINDS_PsFinDsNameForMassLoading' AND table_name = 'R_FIN_DS'))
BEGIN
		UPDATE infobase 
				SET object_value = 'FINDS_NameForMassLoading' 
				WHERE object_value = 'FINDS_PsFinDsNameForMassLoading' AND table_name = 'R_FIN_DS'
	END



------------------------------------------------------------------------------------
-- EQPT_TCIFForManufDatMoun
------------------------------------------------------------------------------------


IF(EXISTS (SELECT * FROM syscolumns WHERE syscolumns.id = 
				( SELECT sysobjects.id FROM sysobjects WHERE name = 'R_Equipment')
					AND syscolumns.name = 'EQPT_TCIForManufacturingDateMonth'
	)
)
	BEGIN
		--Modify the column name
		EXEC sp_RENAME 'R_Equipment.EQPT_TCIForManufacturingDateMonth', 'EQPT_TCIFForManufDatMoun' , 'COLUMN'
	END
ELSE
	BEGIN
		PRINT 'Column R_Equipment.EQPT_TCIForManufacturingDateMonth does not exist'
	END





IF(EXISTS(SELECT * FROM infobase WHERE object_value = 'EQPT_TCIForManufacturingDateMonth' AND table_name = 'R_Equipment'))
BEGIN
		UPDATE infobase 
				SET object_value = 'EQPT_TCIFForManufDatMoun' 
				WHERE object_value = 'EQPT_TCIForManufacturingDateMonth' AND table_name = 'R_Equipment'
	END


------------------------------------------------------------------------------------
-- EQPT_TCIFForDatOfHydTestMoun
------------------------------------------------------------------------------------


IF(EXISTS (SELECT * FROM syscolumns WHERE syscolumns.id = 
				( SELECT sysobjects.id FROM sysobjects WHERE name = 'R_Equipment')
					AND syscolumns.name = 'EQPT_TCIForDateOfHydrostaticTestMonth'
	)
)
	BEGIN
		--Modify the column name
		EXEC sp_RENAME 'R_Equipment.EQPT_TCIForDateOfHydrostaticTestMonth', 'EQPT_TCIFForDatOfHydTestMoun' , 'COLUMN'
	END
ELSE
	BEGIN
		PRINT 'Column R_Equipment.EQPT_TCIForDateOfHydrostaticTestMonth does not exist'
	END





IF(EXISTS(SELECT * FROM infobase WHERE object_value = 'EQPT_TCIForDateOfHydrostaticTestMonth' AND table_name = 'R_Equipment'))
BEGIN
		UPDATE infobase 
				SET object_value = 'EQPT_TCIFForDatOfHydTestMoun' 
				WHERE object_value = 'EQPT_TCIForDateOfHydrostaticTestMonth' AND table_name = 'R_Equipment'
	END


------------------------------------------------------------------------------------
-- EQPT_TCIFForBatExpDatMoun
------------------------------------------------------------------------------------


IF(EXISTS (SELECT * FROM syscolumns WHERE syscolumns.id = 
				( SELECT sysobjects.id FROM sysobjects WHERE name = 'R_Equipment')
					AND syscolumns.name = 'EQPT_TCIForBatteryExpiryDateMonth'
	)
)
	BEGIN
		--Modify the column name
		EXEC sp_RENAME 'R_Equipment.EQPT_TCIForBatteryExpiryDateMonth', 'EQPT_TCIFForBatExpDatMoun' , 'COLUMN'
	END
ELSE
	BEGIN
		PRINT 'Column R_Equipment.EQPT_TCIForBatteryExpiryDateMonth does not exist'
	END





IF(EXISTS(SELECT * FROM infobase WHERE object_value = 'EQPT_TCIForBatteryExpiryDateMonth' AND table_name = 'R_Equipment'))
BEGIN
		UPDATE infobase 
				SET object_value = 'EQPT_TCIFForBatExpDatMoun' 
				WHERE object_value = 'EQPT_TCIForBatteryExpiryDateMonth' AND table_name = 'R_Equipment'
	END
