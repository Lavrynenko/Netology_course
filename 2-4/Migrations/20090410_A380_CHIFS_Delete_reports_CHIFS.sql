-----------------------------------------------------------------
-- DELETE REPORT CHIFS for incident 4114029
-----------------------------------------------------------------

select 'There are '+cast(count(*) as varchar(100))+' reports in PSE A380' from t_dbactions

DELETE
FROM
	t_dbactions
WHERE
	label = 'CHIFS_ATA'

DELETE
FROM
	t_dbactions
WHERE
	label = 'CHIFS_DL'

DELETE
FROM
	t_dbactions
WHERE
	label = 'CHIFS_FIN'

select 'There are '+cast(count(*) as varchar(100))+' reports in PSE A380' from t_dbactions