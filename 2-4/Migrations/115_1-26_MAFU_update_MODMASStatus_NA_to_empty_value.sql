-- ******************************************************************************
-- Set MAS Status from 'N/A' to empty value
-- Name : 120_1-26_MAFU_update_MODMASStatus_NA_to_empty_value.sql
-- Date : 23/06/2008
-- Spec : MAFU_V1.26_synthesis_sheet_EA_RFC_01_MOD_to_be_certified.doc
-- ******************************************************************************

-- Update values of MODMASStatus in table T_MOD
UPDATE 
	T_MOD 
SET 
	MODMASStatus = '' 
WHERE 
	MODMASStatus = 'N/A'

-- Update list of values in Infobase for MODMASStatus
UPDATE 
	Infobase 
SET 
	list_val = 'To be done;Draft;In signature;Approved;New issue needed;sent' 
WHERE 
	table_name = 'T_MOD' 
	AND object_value = 'MODMASStatus'
