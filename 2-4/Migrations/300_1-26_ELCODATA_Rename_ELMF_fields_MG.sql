-- ******************************************************************************
-- Rename ELMF fields
-- Name : 300_1-26_ELCODATA_Rename_ELMF_fields_MG.sql
-- Date : 24/06/2008
-- Spec : ELCODATA_V1.26_synthesis_sheet_Rename_ELMF_fields.doc
-- ******************************************************************************

UPDATE 
	T_MG 
SET 
	object_name = 'ELMF Ground Priority' 
WHERE 
	object_name = 'Aircraft Level Ground Priority' 


UPDATE 
	T_MG 
SET 
	object_name = 'ELMF Flight Priority' 
WHERE 
	object_name = 'Aircraft Level Flight Priority' 


UPDATE 
	T_MG 
SET 
	object_name = 'ELMF System Ground Priority' 
WHERE 
	object_name = 'Intra System Ground Priority' 


UPDATE 
	T_MG 
SET 
	object_name = 'ELMF System Flight Priority' 
WHERE 
	object_name = 'Intra System Flight Priority' 
