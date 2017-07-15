/*********************************/
/* Report MSN Definition for FNZ */
/*********************************/

if (not exists (SELECT * FROM T_REPORT_GROUP WHERE report_group_label = 'MSN Definition'))
begin
	INSERT INTO T_REPORT_GROUP (report_group_label) SELECT 'MSN Definition'
end

DELETE FROM T_DBActions WHERE label = 'MSN Definition for FNZ'

INSERT INTO T_DBActions (
	label, 
	command, 
	comments, 
	template_page, 
	parameters, 
	report_commentary, 
	mandatory_fields, 
	report_group_idr) 
SELECT 
	'MSN Definition for FNZ',
	'SELECT 
	* 
FROM 
	OPENQUERY(R_PSS_A380, ''
		SELECT
			tmpsv_DS.SKETCH AS EC,
			tmp_MSNDefinition.[FIN-CI OBS] AS ACMT,
			tmp_MSNDefinition.[FIN-CI Provisioning Site] AS PROCUREMENT,
			tmp_MSNDefinition.MSN AS MSN,
			RTRIM(tmp_MSNDefinition.ATA) AS ATA,
			tmpsv_FIN.FIN AS FIN,
			tmpsv_PN.CMS AS CMS,
			tmpsv_PN.PARTNUMBER AS PN,
			tmpsv_ACECIN.MODNUMBER AS MOD,
			tmpsv_PN.EQUIPMENTDESIGNATION AS DESIGNATION,
			tmpsv_PN.DESCRIPTION_DOM AS SUPPLIER
		FROM 
			tmp_MSNDefinition
			JOIN tmpsv_FIN ON tmpsv_FIN.BIDA2A2 = tmp_MSNDefinition.[FIN-CI BIDA2A2]
			JOIN tmpsv_DS ON tmpsv_DS.BIDA2A2 = tmp_MSNDefinition.[Serial FIN-DS BIDA2A2]
			JOIN tmpsv_PN ON tmpsv_PN.BIDA2A2 = tmpsv_DS.IDPN
			JOIN tmpsv_ACECIN ON tmpsv_ACECIN.IDA2A2 = tmp_MSNDefinition.[CIN IDA2A2]
		WHERE
			tmp_MSNDefinition.[FIN-CI Installation Site] = ''''FNZ''''
			AND tmpsv_DS.PURCHASEQTY<>0 
		ORDER BY
			tmp_MSNDefinition.[FIN-CI OBS],
			tmp_MSNDefinition.[FIN-CI Provisioning Site],
			tmp_MSNDefinition.MSN,
			tmp_MSNDefinition.ATA,
			tmpsv_FIN.FIN
'')',
	'- CSV format', 
	'export_csv.php', 
	null, 
	null, 
	null, 
	report_group_id 
FROM 
	T_REPORT_GROUP 
WHERE 
	report_group_label = 'MSN Definition'
