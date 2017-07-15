

update
	infobase
set
	list_val='SELECT choiceValue FROM T_CHOICELIST WHERE choicelist = ''LoadGroup5'''
where
	object_value='LoadGroup5'
	and table_name='r_fin_ds'

update
	T_CHOICELIST
set
	choicelist = 'LoadGroup5'
where 
	choicelist='LPM_LoadGroup'


update
	infobase
set
	list_val='SELECT ChoiceValue FROM T_CHOICELIST WHERE ChoiceList = ''CBTrip1Frame'''
where
	object_value='CBTrip1Frame'
	and table_name='r_fin_ds'

update
	T_CHOICELIST
set
	choicelist = 'CBTrip1Frame'
where 
	choicelist='CBTrip1'

update
	infobase
set
	list_val='SELECT ChoiceValue FROM T_CHOICELIST WHERE ChoiceList = ''CBTrip2Frame'''
where
	object_value='CBTrip2Frame'
	and table_name='r_fin_ds'

update
	T_CHOICELIST
set
	choicelist = 'CBTrip2Frame'
where 
	choicelist='CBTrip2'


update
	infobase
set
	list_val='SELECT ChoiceValue FROM T_CHOICELIST WHERE ChoiceList = ''FINDS_TramePosition'''
where
	object_value='FINDS_TramePosition'
	and table_name='r_fin_ds'

update
	T_CHOICELIST
set
	choicelist = 'FINDS_TramePosition'
where 
	choicelist='TRAME'



update
	infobase
set
	list_val='SELECT choiceValue FROM T_CHOICELIST WHERE choicelist = ''SubBusbar'' order by choiceorder' 
where
	object_value='SubBusBar'
	and table_name='r_fin_ds'


update
	T_CHOICELIST
set
	choicelist = 'SubBusbar'
where 
	choicelist='Sub Busbar'


update
	infobase
set
	list_val='SELECT choiceValue FROM T_CHOICELIST WHERE choicelist = ''Group_'' order by choiceorder' 
where
	object_value='Group_'
	and table_name='r_fin_ds'


update
	T_CHOICELIST
set
	choicelist = 'Group_'
where 
	choicelist='ELMF_GROUP'











select 
	object_value, 
	list_val 
from 
	infobase 
where table_name='r_fin_ds'
and list_val like '%choice%'