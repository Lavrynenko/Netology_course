-- 'EDD unlink MP' link is displayed only if there are links FIN CI - T_IMPACTDS 
UPDATE 
	T_FEATURE
SET 
	where_clause='select id_ds 
			FROM R_FIN_DS  
			WHERE id_ds=#id_ds#    
			AND ds_type= ''4''  
			AND R_FIN_DS.id_ds IN (SELECT idr_ds_post FROM T_IMPACTDS)
			AND fin_ds_sv IS NULL'
where
	label ='EDD Unlink MP'
AND display_context LIKE ';DS/CONSULT;'