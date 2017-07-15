UPDATE 
	T_FEATURE
SET 
	where_clause = 'SELECT 
						id_ds
					FROM 
						R_FIN_DS
					WHERE 
						(id_ds = #id_ds#) 
						AND (ds_type = 4) 
						AND (FINDS_EDD_Type IN (''PCD'')) 
						AND	(MG < 2) 
						AND (SVMAJ_DS IS NULL OR SVMAJ_DS != ''CIRCE'') 
						AND (id_ds NOT IN (SELECT idr_ds_pre FROM T_IMPACTDS))'
WHERE 
	label = 'Delete EDD'
	
