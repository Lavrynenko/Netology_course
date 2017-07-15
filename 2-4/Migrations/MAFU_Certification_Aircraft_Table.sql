/**********************************************/
/* Report MAFU Certification - Aircraft Table */
/**********************************************/

if (not exists (SELECT * FROM T_REPORT_GROUP WHERE report_group_label = 'Certification'))
begin
	INSERT INTO T_REPORT_GROUP (report_group_label) SELECT 'Certification'
end

DELETE FROM T_DBActions WHERE label = 'Certification - Aircraft Table'

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
	'Certification - Aircraft Table',
	'SELECT 
	MSN, 
	M_MODEL_AIPL AS Model, 
	C_STD_RNK_M56 AS Standard, 
	C_VERSION_RNK_M102 AS Version, 
	CONVERT(VARCHAR, D_HDOV, 103) AS [Indus. Handover], 
	CONVERT(VARCHAR, FLP_D_Handover, 103) AS [FLP Handover], 
	CONVERT(VARCHAR, FLP_D_CustAccept, 103) AS [FLP Delivery date], 
	CONVERT(VARCHAR, FLP_D_FirstFlight, 103) AS [FLP 1st Flight] 
FROM 
	T_MSN
	',
	null, 
	'Certif_AircraftTable.php', 
	null, 
	null, 
	null, 
	report_group_id 
FROM 
	T_REPORT_GROUP 
WHERE 
	report_group_label = 'Certification'
