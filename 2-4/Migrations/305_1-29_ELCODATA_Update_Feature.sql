-- Update feature EDD Unlink FIN CI

update 
	t_feature
set 
	where_clause='SELECT      R_FIN_DS.id_ds       
FROM      R_FIN_DS       
WHERE      R_fin_ds.idr_fin is not null       
AND R_FIN_DS.fin_ds_sv is null       
AND R_FIN_DS.id_ds = #id_ds#       
AND ds_type=4       
AND idr_mp IS NULL OR idr_mp = '''''
where
	label ='EDD Unlink FIN CI'
AND display_context LIKE '%;DS/CONSULT;%'