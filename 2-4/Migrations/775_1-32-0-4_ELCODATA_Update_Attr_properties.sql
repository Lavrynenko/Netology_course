-- the field Nominal Power max must be be mandatory (new rules for the feeding are implemented)
update
	infobase
set
	mandatory=null
where
	object_value='FINDS_Global_Nominal_Power'
	and table_name='R_FIN_DS'
	
-- the field ENMF priority has been deleted, deletion in t_mg is needed too
delete from
	t_mg
where
	object_name ='ENMF priority'