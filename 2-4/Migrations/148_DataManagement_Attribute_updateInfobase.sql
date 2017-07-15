------------------------------------------------------------------------------------
-- FinCiFLSClassification  
------------------------------------------------------------------------------------

UPDATE InfoBase 
	SET 
		type_search = 'listv',
		type_edit = 'listv',
		type_val = 'text',
		list_val = 'ADB;FOS;LSAP_SCS;LSAP_UMS;LSAP_UCS;MOS;TechPub;Uncategorized'	
	WHERE object_value = 'FinCiFLSClassification'

































