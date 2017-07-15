--
-- T_REPORT_GROUP Update
--
if (not exists (SELECT *
		FROM t_report_group
		WHERE report_group_label='APEDD'))
begin
	INSERT INTO t_report_group (report_group_label)
	SELECT 'APEDD'
end


--
-- T_DBACTIONS Update
--
DELETE FROM T_DBActions WHERE label='Compare Functional Designation'
INSERT INTO t_dbactions 
(label, command, comments,report_group_idr)
SELECT
	'Compare Functional Designation',
	'SELECT
		TMP_APEDD.finci as [FIN CI],
		TMP_APEDD.functionalDesignation as [Funct. Des. From APEDD],
		TMP_PSV.FUNCTIONALDESIGNATION as [Funct. Des. From PSV]
FROM
	(SELECT
		* 
	FROM 
		OPENQUERY(R_APEDD_A350, ''select finci, functionalDesignation from fin_ci'')) as TMP_APEDD,

	(SELECT 	
		*  
	FROM  
		OPENQUERY(R_PSS_A350,''select fin,FUNCTIONALDESIGNATION from tmpsv_fin where bname like ''''%SW%'''''')) as TMP_PSV
WHERE
	TMP_APEDD.finci = TMP_PSV.fin
	and TMP_APEDD.functionalDesignation <> TMP_PSV.FUNCTIONALDESIGNATION',
	'Compare functional designation between APEDD and System View',
	report_group_id
FROM
	t_report_group
WHERE
	report_group_label='APEDD'

