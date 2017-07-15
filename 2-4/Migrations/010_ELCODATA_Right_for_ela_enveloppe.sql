-- ELA enveloppe : delete right for ATAXX role

delete from
	t_permission_access_attribute
where
	idr_infobase in (select id_infobase from infobase where object_value='ELA_Enveloppe' and table_name='r_fin_ds')
	and idr_user_role in (select id_role from t_user_role where name_role='epc ataxx')

