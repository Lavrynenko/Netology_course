Update 
	t_permission_access_attribute
set 
	write_mode=1
from 
	t_permission_access_attribute
	inner join infobase on idr_infobase=id_infobase
	inner join t_user_role on idr_user_role=id_role
where 
	object_value='EDD_FIN_CI'
	and table_name ='r_fin_ds'
	and name_role ='EPC ATAXX'

Update 
	t_permission_access_attribute
set 
	write_mode=0
from 
	t_permission_access_attribute
	inner join infobase on idr_infobase=id_infobase
	inner join t_user_role on idr_user_role=id_role
where 
	object_value='EDD_FIN_CI'
	and table_name ='r_fin_ds'
	and name_role ='EPC ATA24'
