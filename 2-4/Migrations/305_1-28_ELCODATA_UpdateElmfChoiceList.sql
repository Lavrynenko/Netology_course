update
	t_choicelist
set
	choicevalue=replace(choicevalue,'0','')
where
	choicevalue like '0%'
	and choicelist='ct_group'


update
	t_choicelist
set
	choiceorder=cast (choicevalue as integer)
where
	choicevalue <>'N/A'
	and choicelist='ct_group'
	

update
	infobase
set
	list_val='SELECT ChoiceValue FROM T_CHOICELIST WHERE ChoiceList = ''CT_Group'' ORDER BY choiceorder'
where
	object_value = 'group_'
	and table_name='r_fin_ds'

