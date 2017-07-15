delete from 
	t_dbactions
where
	label='Extract PCD for EDD Tool'

insert into 
	t_dbactions (
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
	'Extract PCD for EDD Tool',
	null,
	'Report for EDD tool',
	'Report_EDD_Tool.php',
	null,
	null,
	null,
	report_group_id
FROM
	T_REPORT_GROUP
WHERE
	report_group_label='ELCODATA'
