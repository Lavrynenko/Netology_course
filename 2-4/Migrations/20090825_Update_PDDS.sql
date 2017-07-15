-- update the link mp/pdds
update
	t_pdds
set
	pdds_idr_mp=13483
where 
	id_pdds=24434 

-- delete a pdds
delete from
	t_quality_check
where
	pdds_idr = 24453

delete from
	TMP_ESDCR_WDDS
where
	WDDS_PDDS_idr = 24453

delete from
	T_PDREQUIREMENT
where 
	idr_pdds=24453

delete from
	T_PDDS
where 
	id_pdds=24453

-- clear the database regarding the pdds
delete from 
	t_quality_check
where 
	pdds_idr not in (select id_pdds from t_pdds)

delete from
	T_PDREQUIREMENT
where 
	idr_pdds not in (select id_pdds from t_pdds)
delete from
	TMP_ESDCR_WDDS
where
	WDDS_PDDS_idr not in (select id_pdds from t_pdds)
	



