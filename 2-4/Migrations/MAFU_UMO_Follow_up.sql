/********************************************/
/* Report MAFU UMO Follow up in T_DBActions */
/********************************************/

if (not exists (SELECT * FROM t_report_group WHERE report_group_label = 'MAFU'))
begin
	INSERT INTO T_REPORT_GROUP (report_group_label) SELECT 'MAFU'
end

DELETE FROM T_DBActions WHERE label = 'MAFU UMO Follow up'

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
	'MAFU UMO Follow up', 
	'SELECT 
		RequestReference AS [CR ref], 
		RequestTitle AS [Title], 
		Applicability AS [Applicability], 
		Rationale AS [Rationale], 
		CONVERT(VARCHAR(8000), DistributionDate, 103) AS [Distribution Date], 
		ERoomStatus AS [ERoom Status], 
		GIPoE AS [1st MSN], 
		GIMSN1 AS [MSN 1], 
		GIMSN2 AS [MSN 2], 
		GIMSN4 AS [MSN 4], 
		GIMSN7 AS [MSN 7], 
		GIMSN3 AS [MSN 3], 
		GrpLeaderCR AS [Group Leader], 
		ChgLeaderCR AS [Change Leader], 
		WFStatus AS [Workflow status], 
		MPReference AS [MP ref], 
		MPEffectivity AS [Effectivity], 
		UMOCompletionDateT AS [UMO Completion Target Date], 
		UMOCompletionDateF AS [UMO Completion Forecast Date], 
		UMOCompletionDateA AS [UMO Completion Achieved Date], 
		INV1TrsIDateT AS [1st TRS Issue Target Date], 
		INV1TrsIDateA AS [1st TRS Issue Forecast Date], 
		INV1TrsIDateF AS [1st TRS Issue Achieved Date], 
		T_MP.INVCRCRSaDateT AS [CRS Target date], 
		T_MP.INVCRCRSaDateF AS [CRS Forecast date], 
		T_MP.INVCRCRSaDateA AS [CRS Achieved date], 
		T_MP.INVCRPRSaDateT AS [PRS Target date], 
		T_MP.INVCRPRSaDateF AS [PRS Forecast date], 
		T_MP.INVCRPRSaDateA AS [PRS Achieved date], 
		INVMPiMPMDateT AS [MP/TRS in MPM Target Date], 
		INVMPiMPMDateF AS [MP/TRS in MPM Forecast Date], 
		INVMPiMPMDateA AS [MP/TRS in MPM Achieved Date], 
		INVMOpDateT AS [Mod Opening Target Date], 
		INVMOpDateF AS [Mod Opening Forecast Date], 
		INVMOpDateA AS [Mod Opening Achieved Date], 
		TRSUpdateDateT AS [Full TRS Target Date], 
		TRSUpdateDateF AS [Full TRS Forecast Date], 
		TRSUpdateDateA AS [Full TRS Achieved Date], 
		CASE WHEN (ISDATE(INVMPiMPMDateA) = 1) AND (ISDATE(INVMPiMPMDateT) = 1) THEN DATEDIFF(day, CONVERT(DATETIME, INVMPiMPMDateT), CONVERT(DATETIME, INVMPiMPMDateA)) ELSE ''9999'' END [Deliverables in tools (2 days)], 
		CASE WHEN (ISDATE(INVMOpDateA) = 1) AND (ISDATE(INVMOpDateT) = 1) THEN DATEDIFF(day, CONVERT(DATETIME, INVMOpDateT), CONVERT(DATETIME, INVMOpDateA)) ELSE ''9999'' END [Mod opening (2 days)], 
		CASE WHEN (ISDATE(UMOCompletionDateA) = 1) AND (ISDATE(UMOCompletionDateT) = 1) THEN DATEDIFF(day, CONVERT(DATETIME, UMOCompletionDateT), CONVERT(DATETIME, UMOCompletionDateA)) ELSE ''9999'' END [UMO Completion (6 weeks)] 
	FROM 
		T_Request 
		LEFT JOIN T_LINK_REQUEST_MP ON id_request = idr_request 
		LEFT JOIN T_MP ON id_mp = idr_mp 
	WHERE 
		UProcCR = ''UMO'' 
	AND ACMTLeaderCR = ''SYS'' 
	AND ERoomStatus <> ''REJECTED'' 
	AND ERoomStatus <> ''ABANDONED'' 
	AND ERoomStatus <> ''SUPERSEDED''', 
	'- Follow up of UMO subject', 
	null, 
	null, 
	null, 
	null, 
	report_group_id 
FROM 
	T_REPORT_GROUP 
WHERE 
	report_group_label = 'MAFU'
