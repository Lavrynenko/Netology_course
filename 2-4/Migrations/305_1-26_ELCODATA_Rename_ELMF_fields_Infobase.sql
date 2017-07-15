-- ******************************************************************************
-- Rename ELMF fields
-- Name : 300_1-26_ELCODATA_Rename_ELMF_fields_Infobase.sql
-- Date : 24/06/2008
-- Spec : ELCODATA_V1.26_synthesis_sheet_Rename_ELMF_fields.doc
-- ******************************************************************************

UPDATE 
	Infobase 
SET 
	object_name = 'ELMF Ground Priority' 
WHERE 
	table_name = 'R_FIN_DS' 
	AND object_value = 'Priority'


UPDATE 
	Infobase 
SET 
	object_name = 'ELMF Flight Priority' 
WHERE 
	table_name = 'R_FIN_DS' 
	AND object_value = 'FlightPriority'


UPDATE 
	Infobase 
SET 
	object_name = 'ELMF System Ground Priority' 
WHERE 
	table_name = 'R_FIN_DS' 
	AND object_value = 'SysGPriority'


UPDATE 
	Infobase 
SET 
	object_name = 'ELMF System Flight Priority' 
WHERE 
	table_name = 'R_FIN_DS' 
	AND object_value = 'SysFPriority'
