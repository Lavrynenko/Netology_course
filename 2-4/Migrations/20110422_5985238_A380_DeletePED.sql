delete from
	t_elco_matrix
where 
	elcomatrixnomodelname='ped'
	and ElcoMatrixNo_id not in (select ElcoMatrixValueModel_idr from t_elcodata_matrix_value)
