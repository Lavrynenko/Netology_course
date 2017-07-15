------------------------------------------------------------------------------------
---------------------------------------- MOD ----------------------------------------
------------------------------------------------------------------------------------


-- MOD_ModClosure

IF(EXISTS(SELECT * FROM infobase WHERE object_value = 'MOD_ModClosure' AND table_name = 'T_MOD'))
	BEGIN
		UPDATE infobase 
			SET object_name = 'MOD Closure State from PSV'
			where object_value = 'MOD_ModClosure' AND table_name = 'T_MOD'
			
	END
