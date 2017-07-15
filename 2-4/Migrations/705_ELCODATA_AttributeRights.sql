-- ICD treatment number

delete from
	t_permission_access_attribute
where
	idr_infobase in (select id_infobase from infobase where object_value='ICDTreatmentNumber' and table_name='r_fin_ds')
	and idr_user_role in (select id_role from t_user_role where name_role='epc ataxx')

delete from
	t_permission_access_attribute
where
	idr_infobase in (select id_infobase from infobase where object_value='ICDTreatmentNumber' and table_name='r_fin_ds')
	and idr_user_role in (select id_role from t_user_role where name_role='epc ata24')


insert into
	t_permission_access_attribute (
					idr_infobase,
					idr_user_role,
					read_mode,
					write_mode)
select 
	id_infobase,
	id_role,
	'1',
	'1'
from
	infobase,
	t_user_role
where
	name_role='epc ata24'
	and object_value='ICDTreatmentNumber'
	and table_name='r_fin_ds'