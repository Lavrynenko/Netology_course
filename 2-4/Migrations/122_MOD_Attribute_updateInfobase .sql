------------------------------------------------------------------------------------
---------------------------------------- MOD ----------------------------------------
------------------------------------------------------------------------------------


-- MOD_ModClosure

IF(EXISTS(SELECT * FROM infobase WHERE object_value = 'MOD_ModClosure' AND table_name = 'T_MOD'))
	BEGIN
		UPDATE infobase SET 
			type_search = 'listv',
			type_edit =  'listv',			
			list_val = 'Open;Stage0;Stage3;Stage3a' 
		WHERE object_value = 'MOD_ModClosure' AND table_name = 'T_MOD'
	END
