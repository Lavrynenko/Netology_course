-- suppression de tous les droits sur la feature export bat file 

DELETE FROM
	 t_link_feature_user_role 
WHERE 
	idr_feature in (	select 
							id_feature 
						from 
							t_feature 
						where 
							linked_url like '%print%all%php%' 
							and label like 'Print All EDD')
							
-- Suppression de la feature export bat file

DELETE FROM
	t_feature 
WHERE 
	linked_url like '%print%all%php%' 
	and label like 'Print All EDD'							