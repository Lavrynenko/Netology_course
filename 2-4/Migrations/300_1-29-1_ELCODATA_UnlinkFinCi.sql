-- 'Unlink FIN CI' link is displayed only if there are not links FIN CI - T_IMPACTDS 
UPDATE 
	T_FEATURE
SET 
	where_clause='SELECT id_ds   
			FROM R_FIN_DS
			WHERE (id_ds = #id_ds#)   
			AND (ds_type = ''4'')   
			AND R_FIN_DS.idr_fin IS NOT NULL  
			AND R_FIN_DS.fin_ds_sv is null      
			AND R_FIN_DS.id_ds NOT IN (SELECT idr_ds_post FROM T_IMPACTDS)'
where
	label ='EDD Unlink FIN CI'
AND display_context LIKE '%;DS/CONSULT;%'