-- suppression de tous les droits sur la feature export bat file 

DELETE FROM
	 t_link_feature_user_role 
WHERE 
	idr_feature in (	select 
							id_feature 
						from 
							t_feature 
						where 
							linked_url like '%Bat_export.php%'
							and label like 'Export files')
							
-- Suppression de la feature export bat file

DELETE FROM
	t_feature 
WHERE 
	linked_url like '%Bat_export.php%'
	AND label like 'Export files'							