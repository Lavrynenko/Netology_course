-- ******************************************************************************
-- Name : 300_1-27_ELCODATA_Truth_Table_Alter_Table.sql
-- Date : 14/08/2008
-- Spec : ELCODATA_V1.27_synthesis_sheet_A350_Truth_Tables.doc
-- Drop attribute CommandType in table R_FIN_DS
-- ******************************************************************************

-- CommandType
if (
	exists (
		select * from syscolumns 
		where syscolumns.id = (select sysobjects.id from sysobjects where name = 'R_FIN_DS') 
		and syscolumns.name = 'CommandType'
	)
) 
BEGIN 
	ALTER TABLE R_FIN_DS DROP COLUMN [CommandType]
END 
ELSE 
BEGIN 
	print 'Column CommandType does not exist' 
END
