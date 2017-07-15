update
	infobase
set
	object_name='Commanded by Logic'
where
	object_value='DIActive'
	and table_name='r_fin_ds'


update
	t_mg
set
	object_name='Commanded by Logic'
where
	object_name='Command by Logic'

