/***********************************************************/
/* Report MAFU Forecast Date History for MP in T_DBActions */
/***********************************************************/

if (not exists (SELECT * FROM t_report_group WHERE report_group_label = 'MAFU'))
begin
	INSERT INTO T_REPORT_GROUP (report_group_label) SELECT 'MAFU'
end

DELETE FROM T_DBActions WHERE label = 'MAFU Export Schedule of the Next SYS CCC'

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
	'MAFU Export Schedule of the Next SYS CCC',
	'SELECT 
	COALESCE(GIRespSite, '''') AS SITE,
	meetName AS [CCC TYPE],
	typeOfRequest AS [CR / RFC],
	RequestReference AS REFERENCE,
	COALESCE(CONVERT(VARCHAR, ScreenDate, 103), '''') AS [BNMM TARGET DATE____RFC ONLY],
	CASE typeOfRequest 
		WHEN ''RFC''  THEN RFCEpacTdu
		WHEN ''CR'' THEN Request_ATA
		ELSE ''Unknown Type''
	END AS [ATA - EPAC /__TDU],
	COALESCE(StudyReq, '''') AS [STUDY REQUESTED____RFC ONLY],
	CASE typeOfRequest 
		WHEN ''RFC''  THEN RFCStatus
		WHEN ''CR'' THEN eRoomStatus
		ELSE ''Unknown Type''
	END AS [STATUS],
	ACMTLeaderCR AS [LEADER],
	GrpLeaderCR AS [GROUP LEADER],
	ChgLeaderCR AS [CHANGE LEADER],
	TechLeader AS [TECH. LEADER],
	RequestTitle AS [TITLE],
	GIPoE AS [FIRST POE],
	PDImpact AS [WIRING IMPACT],
	T_REQUEST.cr_acIcdImpact AS [A/C ICD],
	GIEqImpacted AS EQPT,
	KickOffMeeting AS [KICK-OFF MEETING],
--	'''' AS [800F],
	'''' AS [REFURBISHING],
	T_REQUEST.cr_xmlFmdImpact AS [XML and/or FMD],
	T_REQUEST.cr_sb AS [SERVICE BULLETIN],
	/*
	CASE typeOfRequest 
		WHEN ''RFC'' THEN ''''
		WHEN ''CR'' THEN Applicability
		ELSE ''''
	END */ 
	T_REQUEST.cr_cbRccbSspcImpact AS[C/B or RCCB or SSPC],
	T_REQUEST.crSoftDataLoading AS [S/W BY DATA LOADING],
	T_REQUEST.crRackEquipment AS [RACKABLE EQPT],
	T_REQUEST.crNonRackEquipment AS [NON RACKABLE EQPT],
	T_REQUEST.StructureImpact AS [STRUCT. AND SYSTEM INST.],
	T_REQUEST.cr_Ata42Impact AS [ATA 42 IMPACT],
	'''' AS [IMPACT ON CUSTO],
	'''' AS [ICY CODE],
	'''' AS [ENGINEERING DEADLINE],
	'''' AS [IN SEP],
	'''' AS [Earlier Certif. need for IP/SB vs PoE],
	'''' AS [SPARE DELIVERY DATE],
	'''' AS [SPECIFIC DEV. PLAN],
	T_REQUEST.cr_AtqcImpact AS [ATQC IMPACT],
	T_REQUEST.cr_dsaRequired AS [DSA REQUIRED],
	T_REQUEST.cr_dmuIpact AS [DMU IMPACT],
	MeetActions AS [CCC DECISION],
	MeetComment AS [PREVIOUS CCC COMMENTS / CCC XXX INPUT],
	'''' AS [TIMING]
	, '''' AS [SYS CCC number]
	, '''' AS [date]
FROM
	T_REQUEST
	INNER JOIN T_MEETING on T_REQUEST.id_request=T_MEETING.idr_request
WHERE 
	-- Only meetings for the coming week is required
	DATEPART(wk, meetDate) = DATEPART(wk, GETDATE()) + 1
	AND DATEPART(yyyy, meetDate) = DATEPART(yyyy, GETDATE())
	AND
	(
		meetName=''SYS CCC0''
		OR meetName=''SYS CCC1''
		OR meetName=''SYS CCC2'' 
	)
ORDER BY
	
	CASE
		WHEN typeOfRequest = ''CR'' AND ACMTLeaderCR = ''SYS'' AND GrpLeaderCR LIKE ''%TUTE%'' THEN 0
		WHEN typeOfRequest = ''CR'' AND ACMTLeaderCR = ''SYS'' AND GrpLeaderCR LIKE ''%PRIVE%'' AND GIRespSite = ''FLT'' THEN 1
		WHEN typeOfRequest = ''CR'' AND ACMTLeaderCR = ''SYS'' AND GrpLeaderCR LIKE ''%PRIVE%'' AND GIRespSite = ''TLS'' THEN 2
		WHEN typeOfRequest = ''CR'' AND ACMTLeaderCR = ''SYS'' AND GrpLeaderCR LIKE ''%GUIDET%'' THEN 3
		WHEN typeOfRequest = ''RFC'' THEN 4
		WHEN typeOfRequest = ''CR'' AND ACMTLeaderCR <> ''SYS'' THEN 5
	END,
	ChgLeaderCR,
	RequestReference',
	'- Export the schedule of the next meeting', 
	'MAFU_meeting_excel_export.php', 
	null,
	null, 
	null, 
	report_group_id 
FROM 
	T_REPORT_GROUP 
WHERE 
	report_group_label = 'MAFU'