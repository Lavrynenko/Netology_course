/***************************************************************
					Procedure
****************************************************************/
/* No stored procedure here */

/***************************************************************
					Group report
****************************************************************/
if not exists(SELECT * FROM T_REPORT_GROUP WHERE report_group_label='Others')
begin
	INSERT INTO
		T_REPORT_GROUP (
			report_group_label
		)
	VALUES (
		'Others'
	)
end

/***************************************************************
					Line in T_DBActions
****************************************************************/

DELETE FROM T_DBActions WHERE label='Generate Mapping Table Standard 2 Error'

INSERT INTO 
	T_dbactions (
		label,
		command,
		comments,
		template_page,
		parameters,
		report_commentary,
		mandatory_fields,
		report_group_idr
	) 
SELECT 
	'Generate Mapping Table Standard 2 Error',
	'SELECT * FROM TMP_MTSTD2_ERROR',
	'- Export Mapping Table data file Standard 2 Error',
	NULL,
	NULL,
	NULL,
	NULL,
	report_group_id 
FROM 
	T_REPORT_GROUP 
WHERE 
	report_group_label='Others'
