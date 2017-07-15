delete from
	t_permission_access_attribute
where
	idr_infobase in (select id_infobase 
			from infobase 
			where table_name = 'r_fin_ds' 
			and object_value in ('AC_Power_Output_PhC','AC_Power_Output_PhB','AC_Power_Output_PhA','PCDStatCon','PCDStatPin','PCDCont1Con','PCDCont1Pin','DC_Power_Output')
	)

update
	infobase
set
	object_name = object_name + '(A380)'
where table_name = 'r_fin_ds' 
and object_value in ('AC_Power_Output_PhC','AC_Power_Output_PhB','AC_Power_Output_PhA','DC_Power_Output')