-- end of the requirement elcodatasd-a380-pcd-migration-010
update
	r_fin_ds
set
	mg=0
where
	finds_edd_type='Uninstall'
	and mg<3