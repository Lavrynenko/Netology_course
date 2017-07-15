-- Update features --

---------------------
-- Save as new EDD --
---------------------

UPDATE 
	T_FEATURE 
SET 
	where_clause = '
		SELECT id_ds 
		FROM R_FIN_DS 
		WHERE (ds_type=4)' 
WHERE 
	label = 'Save as new EDD'
	
	
	
