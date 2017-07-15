/******************************************************************************************
		Alter T_Responsibility   
*******************************************************************************************/

-------- RESP_RespTreePosition  
IF(
	NOT EXISTS (
		SELECT *
		FROM syscolumns
		WHERE syscolumns.id = (	SELECT sysobjects.id
								FROM sysobjects
								WHERE name = 'T_Responsibility'
							  )
		 AND syscolumns.name = 'RESP_RespTreePosition'
	)
)
	BEGIN
		--Add the column
		ALTER TABLE T_Responsibility ADD [RESP_RespTreePosition] int NULL
	END
ELSE
	BEGIN
		PRINT 'Column RESP_RespTreePosition is already exist'
	END




-------- RESP_HoVDMURelevant  
IF(
	NOT EXISTS (
		SELECT *
		FROM syscolumns
		WHERE syscolumns.id = (	SELECT sysobjects.id
								FROM sysobjects
								WHERE name = 'T_Responsibility'
							  )
		 AND syscolumns.name = 'RESP_HoVDMURelevant'
	)
)
	BEGIN
		--Add the column
		ALTER TABLE T_Responsibility ADD [RESP_HoVDMURelevant] varchar(5) NULL
	END
ELSE
	BEGIN
		PRINT 'Column RESP_HoVDMURelevant is already exist'
	END




-------- RESP_HoVFINCategory    
IF(
	NOT EXISTS (
		SELECT *
		FROM syscolumns
		WHERE syscolumns.id = (	SELECT sysobjects.id
								FROM sysobjects
								WHERE name = 'T_Responsibility'
							  )
		 AND syscolumns.name = 'RESP_HoVFINCategory'
	)
)
	BEGIN
		--Add the column
		ALTER TABLE T_Responsibility ADD [RESP_HoVFINCategory] varchar(40) NULL
	END
ELSE
	BEGIN
		PRINT 'Column RESP_HoVFINCategory is already exist'
	END











