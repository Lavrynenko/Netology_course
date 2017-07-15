
delete from
	t_permission_access_attribute
where
	idr_infobase in (select id_infobase 
			 from infobase 
			 where object_name in ('ELMF Flight Priority','ELMF Ground Priority','ELMF System Flight Priority','ELMF System Ground Priority')
			)
	and idr_user_role in (select id_role
			      from t_user_role
			      where name_role like 'EPC%'
				)


delete from
	t_mg
where 
	object_name in ('ELMF Flight Priority','ELMF Ground Priority','ELMF System Flight Priority','ELMF System Ground Priority')

