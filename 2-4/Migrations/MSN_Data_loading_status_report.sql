---------------------------------------------
-- MSN Data loading status report V1.1
---------------------------------------------

-- DROP old stored procedure
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'sp_MSNDataLoadingStatus' AND type = 'P')
   DROP PROCEDURE sp_MSNDataLoadingStatus
GO


-- MSN Data loading status report Report creation in PSE
IF (SELECT REPORT_GROUP_id FROM T_REPORT_GROUP WHERE REPORT_GROUP_LABEL = 'Others') IS NULL
	INSERT INTO [T_REPORT_GROUP]
	(
		[REPORT_GROUP_LABEL]
	)
	VALUES
	(
		'Others'
	)

DECLARE
	@AttGroup INT

SELECT @AttGroup = REPORT_GROUP_id FROM T_REPORT_GROUP WHERE REPORT_GROUP_LABEL = 'Others'


-- Add report
DELETE T_DBActions WHERE label = 'MSN 1 Data loading status report'
DELETE T_DBActions WHERE label = 'MSN 2 Data loading status report'
DELETE T_DBActions WHERE label = 'MSN 4 Data loading status report'
DELETE T_DBActions WHERE label = 'MSN 7 Data loading status report'
DELETE T_DBActions WHERE label = 'MSN 3 Data loading status report'
DELETE T_DBActions WHERE label = 'MSN 5 Data loading status report'
DELETE T_DBActions WHERE label = 'MSN 6 Data loading status report'
DELETE T_DBActions WHERE label = 'MSN 8 Data loading status report'
DELETE T_DBActions WHERE label = 'MSN 9 Data loading status report'
DELETE T_DBActions WHERE label = 'MSN 11 Data loading status report'
DELETE T_DBActions WHERE label = 'MSN Data loading status report'

INSERT INTO [T_DBActions]
(
	[label],
	[command],
	[comments],
	[template_page],
	[parameters],
	[report_commentary],
	[mandatory_fields],
	[report_group_idr]
)
VALUES
(
	'MSN Data loading status report',
	'SELECT
	*
INTO
	#@DS
FROM
	OPENQUERY(R_PSS_A380, ''
		SELECT
			f.FUNCTIONALDESIGNATION [Equipment],
			e.SERIESNUMBER [SERIESNUMBER],
			m.ATA [ATA],
			f.BNAME [FIN],
			CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.PARTNUMBER ELSE e.PARTNUMBER END [PN],
			CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.CMS ELSE e.CMS END [CMS],
			CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN i.BNAME + i.VERSIONIDA2VERSIONINFO ELSE RIGHT(s.BWTPARTNUMBER, 3) END [DS_SI_Reference],
			CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN sd.BWTPARTNUMBER ELSE s.BWTPARTNUMBER END [fin_ds_sv],
			f.AC_ICDfolderName [AC_ICD_folderName],
			CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.AC_ICDfolderVersion ELSE e.AC_ICDfolderVersion END [AC_ICD_folderVersion],
			CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.STANDARD ELSE e.STANDARD END [EqptStdVendorDesign]
		FROM
			tmp_MSNDefinition m
			JOIN tmpsv_FIN f ON f.BIDA2A2 = m.[FIN-CI BIDA2A2]
			LEFT JOIN tmpsv_DS s ON
				s.BIDA2A2 = m.[Serial FIN-DS BIDA2A2]
				AND s.STATESTATE <> ''''WIP''''
			LEFT JOIN tmpsv_PN e ON e.BIDA2A2 = s.IDPN
			LEFT JOIN tmpsv_DS sd ON sd.BIDA2A2 = m.[Development FIN-DS BIDA2A2]
			LEFT JOIN tmpsv_PN ed ON ed.BIDA2A2 = sd.IDPN
			LEFT JOIN tmpsv_SI i ON i.BIDA2A2 = m.[SI BIDA2A2]
		WHERE
			m.MSN = ''''#MSN#''''
	'')

SELECT
	Equipment,
	ATA,
	HARD,
	SOFT,
	PN,
	SERIESNUMBER AS [Series Number],
	CMS,
	DS_SI_Reference,
	EqptStdVendorDesign,
	AC_ICD_folderName,
	AC_ICD_folderVersion,
	CommentsActionsMitigationPlan,
	[TLB number],
	CONVERT(VARCHAR(8000), [TLB date], 103) AS [TLB date],
	[TLB status]
FROM
	(
		SELECT DISTINCT
			SOFTDS.idr_fin,
			#@DS.Equipment AS Equipment,
			#@DS.SERIESNUMBER,
			#@DS.ATA AS ATA,
			HARD.FIN AS HARD,
			SOFT.FIN AS SOFT,
			#@DS.PN,
			#@DS.CMS,
			#@DS.DS_SI_Reference,
			#@DS.EqptStdVendorDesign,
			#@DS.AC_ICD_folderName,
			#@DS.AC_ICD_folderVersion,
			SOFTDS.CommentsActionsMitigationPlan,
			SOFTDS.ProcurementLogisticsGroup AS [TLB number],
			SOFTDS.ProcurementPlanDate AS [TLB date],
			SOFTDS.StandardForPowerOn AS [TLB status]
		FROM
			R_FIN_LINK
			JOIN R_FIN_CI AS HARD ON id_fin_link = HARD.id_fin
			JOIN R_FIN_CI AS SOFT ON idr_fin_link = SOFT.id_fin
			JOIN R_FIN_DS AS SOFTDS ON SOFTDS.idr_fin = SOFT.id_fin
			JOIN #@DS ON #@DS.fin_ds_sv = SOFTDS.fin_ds_sv
		WHERE
			link_type = ''HOST''
		
		UNION
		
		SELECT DISTINCT
			HARDDS.idr_fin,
			#@DS.Equipment AS Equipment,
			#@DS.SERIESNUMBER,
			#@DS.ATA AS ATA,
			HARD.FIN AS HARD,
			NULL AS SOFT,
			#@DS.PN,
			#@DS.CMS,
			#@DS.DS_SI_Reference,
			#@DS.EqptStdVendorDesign,
			HARD.AC_ICD_folderName,
			HARD.AC_ICD_rootFileName,
			HARDDS.CommentsActionsMitigationPlan,
			HARDDS.ProcurementLogisticsGroup AS [TLB number],
			HARDDS.ProcurementPlanDate AS [TLB date],
			HARDDS.StandardForPowerOn AS [TLB status]
		FROM
			R_FIN_LINK
			JOIN R_FIN_CI AS HARD ON id_fin_link = HARD.id_fin
			JOIN R_FIN_DS AS HARDDS ON HARDDS.idr_fin = HARD.id_fin
			JOIN #@DS ON #@DS.fin_ds_sv = HARDDS.fin_ds_sv
		WHERE
			link_type = ''HOST''
	) AS HardSoftDef
ORDER BY
	HARD,
	ATA,
	SOFT
',
	'- Current definition of Hardware / Software design solution',
	NULL,
	'MSN :#&MSN:SELECT MSN FROM OPENQUERY(R_PSS_A380, ''SELECT DISTINCT
			MSN
		FROM
			tmpsv_ACEAAT
'')',
	NULL,
	'MSN',
	@AttGroup
)
