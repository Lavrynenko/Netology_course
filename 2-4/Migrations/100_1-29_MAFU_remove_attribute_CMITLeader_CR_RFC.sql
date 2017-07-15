delete from T_PERMISSION_ACCESS_ATTRIBUTE where idr_infobase in
(
	select id_infobase from infobase 
	where object_value = 'cr_CMITLeader' and table_name = 'V_CR'
	or object_value = 'rfc_CMITLeader' and table_name = 'V_RFC'
)

