update
	r_fin_ds
set
	edd_load_state='Validated'
where 
	finds_edd_type='LOAD'
	and FINDS_Global_Nominal_Power is not null

