-- P/CD Status Connector
delete from
	t_permission_access_attribute
where
	idr_infobase in (select id_infobase from infobase where object_value='PCDStatCon' and table_name='r_fin_ds')
	and idr_user_role in (select id_role from t_user_role where name_role='epc ataxx')

delete from
	t_permission_access_attribute
where
	idr_infobase in (select id_infobase from infobase where object_value='PCDStatCon' and table_name='r_fin_ds')
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
	and object_value='PCDStatCon'
	and table_name='r_fin_ds'

-- P/CD Status Pin Allocation
delete from
	t_permission_access_attribute
where
	idr_infobase in (select id_infobase from infobase where object_value='PCDStatPin' and table_name='r_fin_ds')
	and idr_user_role in (select id_role from t_user_role where name_role='epc ataxx')

delete from
	t_permission_access_attribute
where
	idr_infobase in (select id_infobase from infobase where object_value='PCDStatPin' and table_name='r_fin_ds')
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
	and object_value='PCDStatPin'
	and table_name='r_fin_ds'


-- P/CD Discret CTL Connector 
delete from
	t_permission_access_attribute
where
	idr_infobase in (select id_infobase from infobase where object_value='PCDContCon' and table_name='r_fin_ds')
	and idr_user_role in (select id_role from t_user_role where name_role='epc ataxx')

delete from
	t_permission_access_attribute
where
	idr_infobase in (select id_infobase from infobase where object_value='PCDContCon' and table_name='r_fin_ds')
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
	and object_value='PCDContCon'
	and table_name='r_fin_ds'


-- P/CD Discret Status Pin Allocation
delete from
	t_permission_access_attribute
where
	idr_infobase in (select id_infobase from infobase where object_value='PCDContPin' and table_name='r_fin_ds')
	and idr_user_role in (select id_role from t_user_role where name_role='epc ataxx')

delete from
	t_permission_access_attribute
where
	idr_infobase in (select id_infobase from infobase where object_value='PCDContPin' and table_name='r_fin_ds')
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
	and object_value='PCDContPin'
	and table_name='r_fin_ds'

	
-- Status VL Name
delete from
	t_permission_access_attribute
where
	idr_infobase in (select id_infobase from infobase where object_value='FINDS_SSPCVLNAME' and table_name='r_fin_ds')
	and idr_user_role in (select id_role from t_user_role where name_role='epc ataxx')

delete from
	t_permission_access_attribute
where
	idr_infobase in (select id_infobase from infobase where object_value='FINDS_SSPCVLNAME' and table_name='r_fin_ds')
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
	and object_value='FINDS_SSPCVLNAME'
	and table_name='r_fin_ds'



