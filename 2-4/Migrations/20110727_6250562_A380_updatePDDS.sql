

update 
	t_pdds
set
	pdds_pdFile='CEL27922456-050011.pdf',
	pdds_idr_mp=(select id_mp from t_mp where mpreference='T78488')
from
	t_pdds 
	inner join t_pdci on id_pdci=idr_pdci
where 
	pdci_reference = 'CEL27922456'
	and pdds_reference ='050011'



