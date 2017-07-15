IF(
	EXISTS (
		SELECT *
		FROM syscolumns
		WHERE syscolumns.id = (	SELECT sysobjects.id
								FROM sysobjects
								WHERE name = 'R_FIN_DS'
							  )
		 AND syscolumns.name = 'ICDTreatmentNumber'
	)
)
	BEGIN
		--Add the column
		ALTER TABLE R_FIN_DS  ALTER COLUMN  [ICDTreatmentNumber] int NULL
	END
ELSE
	BEGIN
		PRINT 'Column ICDTreatmentNumber does not exist'
	END