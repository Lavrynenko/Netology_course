------------------------------------------------------------------------------------
---------------------------------------- MOD ----------------------------------------
------------------------------------------------------------------------------------


-- MOD_ModClosure


UPDATE infobase 
	SET 
		type_search = 'listv',
		type_edit = 'listv',
		type_val = 'text',
		list_val = 'Open;Stage 0;Stage 3;Stage 3a'
			where object_value = 'MOD_ModClosure' AND table_name = 'T_MOD'
			

