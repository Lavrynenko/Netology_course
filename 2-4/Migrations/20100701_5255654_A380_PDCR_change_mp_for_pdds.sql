-- incident 5255654 

UPDATE
	T_pdds
SET
	pdds_idr_mp = (select id_mp from t_mp where MPReference = 'T65812')
WHERE 
	pdds_reference='11A00'
	and pdds_idr_mp in (select id_mp from t_mp where MPReference = 'T69812')