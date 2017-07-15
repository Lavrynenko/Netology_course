update 
	t_feature
set 
	where_clause='SELECT     id_ds 
 FROM         R_FIN_DS  
WHERE     (id_ds = #id_ds#) 
AND (ds_type = 4) 
AND (MG < 2 OR MG IS NULL)
and fin_ds_sv is null
and idr_fin is null
 AND (id_ds NOT IN (SELECT     T_IMPACTDS.idr_ds_pre FROM T_IMPACTDS WHERE T_IMPACTDS.idr_ds_pre = #id_ds#))'
where
	label ='EDD Link FIN CI'


update 
	t_feature
set 
	where_clause='SELECT      R_FIN_DS.id_ds     
FROM      R_FIN_DS     
WHERE      R_fin_ds.idr_fin is not null     
AND R_FIN_DS.fin_ds_sv is null     
AND R_FIN_DS.id_ds = #id_ds#     
AND ds_type=4     
AND (R_FIN_DS.MG < 2 OR MG IS NULL)     
AND R_FIN_DS.id_ds NOT IN ( SELECT       T_IMPACTDS.idr_ds_pre      FROM       T_IMPACTDS      WHERE       T_IMPACTDS.idr_ds_pre = #id_ds#    ) 
AND (SVMAJ_DS IS NULL OR SVMAJ_DS <> ''CIRCE'')'
where
	label ='EDD Unlink FIN CI'


--	where_clause='SELECT id_ds     FROM R_FIN_DS     WHERE (ds_type=4) AND R_FIN_DS.id_ds = #id_ds#  AND SVMAJ_DS = ''PSEQ'''
update 
	t_feature
set 
	where_clause = 'SELECT id_ds FROM R_FIN_DS WHERE (ds_type=4) AND R_FIN_DS.id_ds = #id_ds# AND (SVMAJ_DS IS NULL OR SVMAJ_DS <> ''CIRCE'')' 
where
	label = 'Save as new EDD'
