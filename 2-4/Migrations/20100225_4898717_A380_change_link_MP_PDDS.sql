

update
	t_pdds
set
	pdds_idr_mp=t_mp.id_mp
from
	t_mp,t_pdci
	inner join t_pdds on id_pdci=idr_pdci
where 
	pdci_reference like '%KSL73225629%'
	and pdds_reference like '%50A00%'
	and mpreference='T78318'




update
	t_pdds
set
	pdds_idr_mp=t_mp.id_mp
from
	t_mp,t_pdci
	inner join t_pdds on id_pdci=idr_pdci
where 
	pdci_reference like '%EGL78326602%'
	and pdds_reference like '%50D00%'
	and mpreference='T78318'

