										-----------------------------------
										-- 	Update Feature 		 --
										-----------------------------------

-------
-- EDD Unlink MP
-------
UPDATE 
	T_FEATURE
SET
	where_clause='select id_ds 
			FROM R_FIN_DS  
			WHERE id_ds=#id_ds#    
			AND ds_type= ''4''  
			AND R_FIN_DS.id_ds IN (SELECT idr_ds_post FROM T_IMPACTDS)
			AND fin_ds_sv IS NULL
			AND MG< 2'
WHERE
	label ='EDD Unlink MP'
AND display_context LIKE '%;DS/CONSULT;%'



UPDATE 
	T_FEATURE
SET
	where_clause='select      id_ds      
 FROM      R_FIN_DS        
INNER JOIN R_FIN_CI   ON R_FIN_DS.idr_fin = R_FIN_CI.id_fin      
 WHERE      id_ds=#id_ds#       
 AND ds_type= ''4''   
AND (R_FIN_CI.id_fin IS NOT NULL OR R_FIN_CI.id_fin <> '''')
AND fin_ds_sv IS NULL
AND MG< 2'
WHERE
	label ='EDD Link MP'
AND display_context LIKE '%;DS/CONSULT;%'