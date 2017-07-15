-- ElocdataSD-A380-PCD-Migration-010
update
	r_fin_ds
set
	SecuredOpen=null,
	finds_edd_type='Uninstall'
where
	ds_type=4
	and finds_edd_type='PCD'
	and FullProvisionStatus='Not Installed'
	
	
update
	r_fin_ds
set
	SecuredOpen='Calculated'
where
	ds_type=4
	and finds_edd_type='PCD'
	and (FullProvisionStatus<>'Not Installed' or FullProvisionStatus is null)

-- ElocdataSD-A380-PCD-Migration-020
update
	r_fin_ds
set
	DC_Power_Output=REPLACE(PINAllocation,'-','')
where 
	TypeACDC='DC'	
	and ds_type=4	

-- ElocdataSD-A380-PCD-Migration-060
update
	t_sspc_vl
set
	sspc_vl_type='ADFX Signal'
where
	sspc_vl_type='AFDX'
	
-- ElocdataSD-A380-PCD-Migration-040
update
	r_fin_ds
set
	AC_Power_Output_PhA=REPLACE(PINAllocation,'-','')
where
	TypeACDC='AC'	
	and typephase='1ph'
	and allocatedphase='A'
	and ds_type=4	
-- ElocdataSD-A380-PCD-Migration-045
update
	r_fin_ds
set
	AC_Power_Output_PhB=REPLACE(PINAllocation,'-','')
where
	TypeACDC='AC'	
	and typephase='1ph'
	and allocatedphase='B'
	and ds_type=4	
-- ElocdataSD-A380-PCD-Migration-050
update
	r_fin_ds
set
	AC_Power_Output_PhC=REPLACE(PINAllocation,'-','')
where
	TypeACDC='AC'	
	and typephase='1ph'
	and allocatedphase='C'
	and ds_type=4	

--ElocdataSD-A380-PCD-Migration-065
update
	t_sspc_vl
set
	sspc_vl_type='Discrete',
	SSPC_VL_DiscreteNumber ='1'
where
	sspc_vl_type='Discrete 1'


update
	t_sspc_vl
set
	sspc_vl_type='Discrete',
	SSPC_VL_DiscreteNumber ='2'
where
	sspc_vl_type='Discrete 2'


update
	t_sspc_vl
set
	sspc_vl_type='Discrete',
	SSPC_VL_DiscreteNumber ='3'
where
	sspc_vl_type='Discrete 3'

-- ElocdataSD-A380-PCD-Migration-070
delete from 
	T_TRUTH_TABLE
where
	TRUTH_TABLE_R_FIN_DS_idr not in (select id_ds from r_fin_ds)
-- ElocdataSD-A380-PCD-Migration-075
delete from
	t_sspc_vl
where
 	SSPC_VL_TRUTH_TABLE_idr not in (select TRUTH_TABLE_id from T_TRUTH_TABLE)
-- ElocdataSD-A380-PCD-Migration-080
delete from
	t_combinaison_status
where
	COMBINAISON_TRUTH_TABLE_idr not in (select TRUTH_TABLE_id from T_TRUTH_TABLE)






