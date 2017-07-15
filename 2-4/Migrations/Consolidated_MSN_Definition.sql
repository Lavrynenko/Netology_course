-----------------------------------------------------------
-- Report Consolidated MSN Definition V1.0
-----------------------------------------------------------

-- Create Consolidated MSN Definition Procedure

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'sp_Consolidated_MSN_Definition' AND type = 'P')
   DROP PROCEDURE sp_Consolidated_MSN_Definition
GO

CREATE PROCEDURE dbo.sp_Consolidated_MSN_Definition (
	@Linked_Server VARCHAR(8000) = 'None',
	@MSN VARCHAR(8000) = '',
	@SUBATADSName VARCHAR(8000) = '',
	@FINCIName VARCHAR(8000) = '',
	@FINCIStatus VARCHAR(8000) = '',
	@FINCICategory VARCHAR(8000) = '',
	@FINCIFunctionalDesignation VARCHAR(8000) = '',
	@FINCIDefinitionRespNatCo VARCHAR(8000) = '',
	@FINCIDesignFocalPoint VARCHAR(8000) = '',
	@FINCIInstallationSite VARCHAR(8000) = '',
	@FINCIProvisioningSite VARCHAR(8000) = '',
	@FINCIInstallationDesignResp VARCHAR(8000) = '',
	@FINCIOBS VARCHAR(8000) = '',
	@FINCIWCLCode VARCHAR(8000) = '',
	@FINCIACICDRootFileName VARCHAR(8000) = '',
	@FINCIICDFolderName VARCHAR(8000) = '',
	@FINDSCA VARCHAR(8000) = '',
	@FINDSName VARCHAR(8000) = '',
	@FINDSPurchaseQuantity VARCHAR(8000) = '',
	@FINDSState VARCHAR(8000) = '',
	@FINDSEffectivity VARCHAR(8000) = '',
	@FINDSAIRRecorded VARCHAR(8000) = '',
	@FINDSInstallationZone VARCHAR(8000) = '',
	@FINDSInstallationSection VARCHAR(8000) = '',
	@FINDSInstallationPanel VARCHAR(8000) = '',
	@FINDSprovisioningtype VARCHAR(8000) = '',
	@FINDSANSICode VARCHAR(8000) = '',
	@FINDSLoadingtype VARCHAR(8000) = '',
	@DSREQUIREMENTStacking VARCHAR(8000) = '',
	@NSEDBPN VARCHAR(8000) = '',
	@NSEDBCMS VARCHAR(8000) = '',
	@NSEDBDAL VARCHAR(8000) = '',
	@NSEDBSupplierTechnologicalDesignation VARCHAR(8000) = '',
	@NSEDBPTSDocumentReference VARCHAR(8000) = '',
	@NSEDBPTSReferenceIssue VARCHAR(8000) = '',
	@NSEDBDDPDocumentReference VARCHAR(8000) = '',
	@NSEDBDDPReferenceIssue VARCHAR(8000) = '',
	@NSEDBState VARCHAR(8000) = '',
	@NSEDBCalculatedWeightGrammes VARCHAR(8000) = '',
	@NSEDBEstimatedWeightGrammes VARCHAR(8000) = '',
	@NSEDBRFIRFPPTSGuaranteedWeighGrammes VARCHAR(8000) = '',
	@NSEDBForgrounduseonly VARCHAR(8000) = '',
	@NSEDBSerialisation VARCHAR(8000) = '',
	@NSEDBAcceptancesheetweighedweight VARCHAR(8000) = '',
	@NSEDBACICDFolderVersion VARCHAR(8000) = '',
	@SUPPLIERFSCM VARCHAR(8000) = '',
	@SUPPLIERName VARCHAR(8000) = '',
	@ModelReference VARCHAR(8000) = '',
	@ModelMaturity VARCHAR(8000) = '',
	@MP VARCHAR(8000) = '',
	@MOD VARCHAR(8000) = '',
	@SIReference VARCHAR(8000) = '',
	@SIState VARCHAR(8000) = '',
	@CounterRef VARCHAR(8000) = ''	
) AS

BEGIN
	
	DECLARE
		@SQL VARCHAR(8000)
	
	SET @SQL = '
SELECT
	*
FROM
	OPENQUERY(' + @Linked_Server + ', ''
SELECT
	m.MSN [MSN],
	m.ATA [SUBATA-DS Name],
	f.FIN [FIN-CI Name],
	f.Status [FIN-CI Status],
	f.FINCategory [FIN-CI Category],
	f.FUNCTIONALDESIGNATION [FIN-CI Functional Designation],
	m.[FIN-CI Definition Resp. NatCo] [FIN-CI Definition Resp. NatCo],
	m.[FIN-CI Design Focal Point] [FIN-CI Design Focal Point],
	m.[FIN-CI Installation Site] [FIN-CI Installation Site],
	m.[FIN-CI Provisioning Site] [FIN-CI Provisioning Site],
	m.[FIN-CI Installation Design Resp] [FIN-CI Installation Design Resp],
	m.[FIN-CI OBS] [FIN-CI OBS],
	f.WCLCODE [FIN-CI WCL Code],
	f.AC_ICDrootFileName [FIN-CI AC/ICD Root File Name],
	f.AC_ICDfolderName [FIN-CI ICD Folder Name],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN sd.SKETCH ELSE s.SKETCH END [FIN-DS CA],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN sd.BWTPARTNUMBER ELSE s.BWTPARTNUMBER END [FIN-DS Name],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN sd.PURCHASEQTY ELSE s.PURCHASEQTY END [FIN-DS Purchase Quantity],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN sd.STATESTATE ELSE s.STATESTATE END [FIN-DS State],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN '''''''''''''''' + sd.LASTDEVEFFECTIVITY + '''''''''''''''' ELSE '''''''''''''''' + g.RANGE + '''''''''''''''' END [FIN-DS Effectivity],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN sd.AIRRECORDED ELSE s.AIRRECORDED END [FIN-DS AIR Recorded],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN zd.UNIQUEID ELSE z.UNIQUEID END [FIN-DS Installation Zone],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN sd.INSTRPROCEDURE ELSE s.INSTRPROCEDURE END [FIN-DS Installation Section],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN nd.UNIQUEID ELSE n.UNIQUEID END [FIN-DS Installation Panel],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN sd.PROVISIONINGTYPE ELSE s.PROVISIONINGTYPE END [FIN-DS provisioning type],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN RIGHT(cd.UNIQUEID, LEN(cd.UNIQUEID) - 1) ELSE RIGHT(c.UNIQUEID, LEN(c.UNIQUEID) - 1) END [FIN-DS ANSI Code],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN sd.LOADINGTYPE ELSE s.LOADINGTYPE END [FIN-DS Loading type],
	CONVERT(TEXT, k.STACKING) [REQUIREMENT Stacking],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.PARTNUMBER ELSE e.PARTNUMBER END [NSEDB PN],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.CMS ELSE e.CMS END [NSEDB CMS],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.DAL ELSE e.DAL END [NSEDB DAL],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.EQUIPMENTDESIGNATION ELSE e.EQUIPMENTDESIGNATION END [NSEDB Supplier Technological Designation],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.PTSREF ELSE e.PTSREF END [NSEDB PTS Document Reference],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.PTSISSUE ELSE e.PTSISSUE END [NSEDB PTS Reference Issue],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.DDPREF ELSE e.DDPREF END [NSEDB DDP Document Reference],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.DDPISSUE ELSE e.DDPISSUE END [NSEDB DDP Reference Issue],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.STATESTATE ELSE e.STATESTATE END [NSEDB State],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.CALCULATEDWEIGHT ELSE e.CALCULATEDWEIGHT END [NSEDB Calculated Weight Grammes],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.ESTIMATEDWEIGHTGRAMMES ELSE e.ESTIMATEDWEIGHTGRAMMES END [NSEDB Estimated Weight Grammes],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.GUARANTEEDWEIGHTGRAMMES ELSE e.GUARANTEEDWEIGHTGRAMMES END [NSEDB RFI RFP PTS Guaranteed Weigh Grammes],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.VALIDFORGROUNDTESTS ELSE e.VALIDFORGROUNDTESTS END [NSEDB For ground use only],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.SERIALISATION ELSE e.SERIALISATION END [NSEDB Serialisation],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.WEIGHTWEIGHTGRAMMES ELSE e.WEIGHTWEIGHTGRAMMES END [NSEDB Acceptance sheet weighed weight],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.AC_ICDfolderVersion ELSE e.AC_ICDfolderVersion END [NSEDB AC/ICD Folder Version],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN pd.LOOKUPKEY ELSE p.LOOKUPKEY END [SUPPLIER FSCM],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN pd.DESCRIPTION_DOM ELSE p.DESCRIPTION_DOM END [SUPPLIER Name],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN qd.MODELREF ELSE q.MODELREF END [Model Reference],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN qd.MODELMATURITY ELSE q.MODELMATURITY END [Model Maturity],
	a.MPNUMBER [MP],
	a.MODNUMBER [MOD],
	i.BNAME + i.VERSIONIDA2VERSIONINFO [SI Reference],
	i.STATESTATE [SI State],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN qd.COUNTERREF ELSE q.COUNTERREF END [CounterRef]
FROM
	tmp_MSNDefinition m
	JOIN tmpsv_FIN f ON f.BIDA2A2 = m.[FIN-CI BIDA2A2]
	LEFT JOIN tmpsv_DS s ON
		s.BIDA2A2 = m.[Serial FIN-DS BIDA2A2]
		AND s.STATESTATE <> ''''WIP''''
	LEFT JOIN tmpsv_PN e ON e.BIDA2A2 = s.IDPN
	LEFT JOIN tmpsv_SUPPLIER p ON p.LOOKUPKEY = e.FSCM
	LEFT JOIN tmpsv_EQUIPMENTMODEL q ON q.IDA2A2 = e.IDMODEL
	LEFT JOIN tmpsv_LOCATION n ON n.IDA2A2 = s.PANEL
	LEFT JOIN tmpsv_LOCATION z ON z.IDA2A2 = s.ZONE
	LEFT JOIN tmpsv_ANSICODE c ON c.IDA2A2 = s.ANSICODE
	LEFT JOIN tmpsv_DSMSNRANGE g ON g.BIDA2A2 = m.[Serial FIN-DS BIDA2A2]
	LEFT JOIN tmpsv_STACKCONC k ON k.IDA2A2 = m.[Serial DS REQUIREMENT IDA2A2]
	LEFT JOIN tmpsv_ACECIN a ON a.IDA2A2 = m.[CIN IDA2A2]
	LEFT JOIN tmpsv_DS sd ON sd.BIDA2A2 = m.[Development FIN-DS BIDA2A2]
	LEFT JOIN tmpsv_PN ed ON ed.BIDA2A2 = sd.IDPN
	LEFT JOIN tmpsv_SUPPLIER pd ON pd.LOOKUPKEY = ed.FSCM
	LEFT JOIN tmpsv_EQUIPMENTMODEL qd ON qd.IDA2A2 = ed.IDMODEL
	LEFT JOIN tmpsv_LOCATION nd ON nd.IDA2A2 = sd.PANEL
	LEFT JOIN tmpsv_LOCATION zd ON zd.IDA2A2 = sd.ZONE
	LEFT JOIN tmpsv_ANSICODE cd ON cd.IDA2A2 = sd.ANSICODE
	LEFT JOIN tmpsv_SI i ON i.BIDA2A2 = m.[SI BIDA2A2]
WHERE
	(
		s.BWTPARTNUMBER IS NOT NULL
		OR sd.BWTPARTNUMBER IS NOT NULL
	)
	' +
	CASE
		WHEN @MSN = '' THEN ''
		ELSE 'AND m.MSN = ' + @MSN + '
	'
	END +
	CASE
		WHEN @SUBATADSName = '' THEN ''
		ELSE 'AND m.ATA LIKE ''''' + @SUBATADSName + '''''
	'
	END +
	CASE
		WHEN @FINCIName = '' THEN ''
		ELSE 'AND f.FIN LIKE ''''' + @FINCIName + '''''
	'
	END +
	CASE
		WHEN @FINCIStatus = '' THEN ''
		ELSE 'AND f.Status LIKE ''''' + @FINCIStatus + '''''
	'
	END +
	CASE
		WHEN @FINCICategory = '' THEN ''
		ELSE 'AND f.FINCategory LIKE ''''' + @FINCICategory + '''''
	'
	END +
	CASE
		WHEN @FINCIFunctionalDesignation = '' THEN ''
		ELSE 'AND f.FUNCTIONALDESIGNATION LIKE ''''' + @FINCIFunctionalDesignation + '''''
	'
	END +
	CASE
		WHEN @FINCIDefinitionRespNatCo = '' THEN ''
		ELSE 'AND m.[FIN-CI Definition Resp. NatCo] LIKE ''''' + @FINCIDefinitionRespNatCo + '''''
	'
	END +
	CASE
		WHEN @FINCIDesignFocalPoint = '' THEN ''
		ELSE 'AND m.[FIN-CI Design Focal Point] LIKE ''''' + @FINCIDesignFocalPoint + '''''
	'
	END +
	CASE
		WHEN @FINCIInstallationSite = '' THEN ''
		ELSE 'AND m.[FIN-CI Installation Site] LIKE ''''' + @FINCIInstallationSite + '''''
	'
	END +
	CASE
		WHEN @FINCIProvisioningSite = '' THEN ''
		ELSE 'AND m.[FIN-CI Provisioning Site] LIKE ''''' + @FINCIProvisioningSite + '''''
	'
	END +
	CASE
		WHEN @FINCIInstallationDesignResp = '' THEN ''
		ELSE 'AND m.[FIN-CI Installation Design Resp] LIKE ''''' + @FINCIInstallationDesignResp + '''''
	'
	END +
	CASE
		WHEN @FINCIOBS = '' THEN ''
		ELSE 'AND m.[FIN-CI OBS] LIKE ''''' + @FINCIOBS + '''''
	'
	END +
	CASE
		WHEN @FINCIWCLCode = '' THEN ''
		ELSE 'AND f.WCLCODE LIKE ''''' + @FINCIWCLCode + '''''
	'
	END +
	CASE
		WHEN @FINCIACICDRootFileName = '' THEN ''
		ELSE 'AND f.AC_ICDrootFileName LIKE ''''' + @FINCIACICDRootFileName + '''''
	'
	END +
	CASE
		WHEN @FINCIICDFolderName = '' THEN ''
		ELSE 'AND f.AC_ICDfolderName LIKE ''''' + @FINCIICDFolderName + '''''
	'
	END +
	CASE
		WHEN @FINDSCA = '' THEN ''
		ELSE 'AND s.SKETCH LIKE ''''' + @FINDSCA + '''''
	'
	END +
	CASE
		WHEN @FINDSName = '' THEN ''
		ELSE 'AND s.BWTPARTNUMBER LIKE ''''' + @FINDSName + '''''
	'
	END +
	CASE
		WHEN @FINDSPurchaseQuantity = '' THEN ''
		ELSE 'AND s.PURCHASEQTY = ' + @FINDSPurchaseQuantity + '
	'
	END +
	CASE
		WHEN @FINDSState = '' THEN ''
		ELSE 'AND s.STATESTATE LIKE ''''' + @FINDSState + '''''
	'
	END +
	CASE
		WHEN @FINDSEffectivity = '' THEN ''
		ELSE 'AND g.RANGE LIKE ''''' + @FINDSEffectivity + '''''
	'
	END +
	CASE
		WHEN @FINDSAIRRecorded = '' THEN ''
		ELSE 'AND s.AIRRECORDED = ' + @FINDSAIRRecorded + '
	'
	END +
	CASE
		WHEN @FINDSInstallationZone = '' THEN ''
		ELSE 'AND z.UNIQUEID LIKE ''''' + @FINDSInstallationZone + '''''
	'
	END +
	CASE
		WHEN @FINDSInstallationSection = '' THEN ''
		ELSE 'AND s.INSTRPROCEDURE LIKE ''''' + @FINDSInstallationSection + '''''
	'
	END +
	CASE
		WHEN @FINDSInstallationPanel = '' THEN ''
		ELSE 'AND n.UNIQUEID LIKE ''''' + @FINDSInstallationPanel + '''''
	'
	END +
	CASE
		WHEN @FINDSprovisioningtype = '' THEN ''
		ELSE 'AND s.PROVISIONINGTYPE LIKE ''''' + @FINDSprovisioningtype + '''''
	'
	END +
	CASE
		WHEN @FINDSANSICode = '' THEN ''
		ELSE 'AND c.UNIQUEID LIKE ''''' + @FINDSANSICode + '''''
	'
	END +
	CASE
		WHEN @FINDSLoadingtype = '' THEN ''
		ELSE 'AND s.LOADINGTYPE LIKE ''''' + @FINDSLoadingtype + '''''
	'
	END +
	CASE
		WHEN @DSREQUIREMENTStacking = '' THEN ''
		ELSE 'AND k.STACKING LIKE ''''' + @DSREQUIREMENTStacking + '''''
	'
	END +
	CASE
		WHEN @NSEDBPN = '' THEN ''
		ELSE 'AND e.PARTNUMBER LIKE ''''' + @NSEDBPN + '''''
	'
	END +
	CASE
		WHEN @NSEDBCMS = '' THEN ''
		ELSE 'AND e.CMS LIKE ''''' + @NSEDBCMS + '''''
	'
	END +
	CASE
		WHEN @NSEDBDAL = '' THEN ''
		ELSE 'AND e.DAL = ''''' + @NSEDBDAL + '''''
	'
	END +
	CASE
		WHEN @NSEDBSupplierTechnologicalDesignation = '' THEN ''
		ELSE 'AND e.EQUIPMENTDESIGNATION LIKE ''''' + @NSEDBSupplierTechnologicalDesignation + '''''
	'
	END +
	CASE
		WHEN @NSEDBPTSDocumentReference = '' THEN ''
		ELSE 'AND e.PTSREF LIKE ''''' + @NSEDBPTSDocumentReference + '''''
	'
	END +
	CASE
		WHEN @NSEDBPTSReferenceIssue = '' THEN ''
		ELSE 'AND e.PTSISSUE LIKE ''''' + @NSEDBPTSReferenceIssue + '''''
	'
	END +
	CASE
		WHEN @NSEDBDDPDocumentReference = '' THEN ''
		ELSE 'AND e.DDPREF LIKE ''''' + @NSEDBDDPDocumentReference + '''''
	'
	END +
	CASE
		WHEN @NSEDBDDPReferenceIssue = '' THEN ''
		ELSE 'AND e.DDPISSUE LIKE ''''' + @NSEDBDDPReferenceIssue + '''''
	'
	END +
	CASE
		WHEN @NSEDBState = '' THEN ''
		ELSE 'AND e.STATESTATE LIKE ''''' + @NSEDBState + '''''
	'
	END +
	CASE
		WHEN @NSEDBCalculatedWeightGrammes = '' THEN ''
		ELSE 'AND e.CALCULATEDWEIGHT LIKE ''''' + @NSEDBCalculatedWeightGrammes + '''''
	'
	END +
	CASE
		WHEN @NSEDBEstimatedWeightGrammes = '' THEN ''
		ELSE 'AND e.ESTIMATEDWEIGHTGRAMMES LIKE ''''' + @NSEDBEstimatedWeightGrammes + '''''
	'
	END +
	CASE
		WHEN @NSEDBRFIRFPPTSGuaranteedWeighGrammes = '' THEN ''
		ELSE 'AND e.GUARANTEEDWEIGHTGRAMMES LIKE ''''' + @NSEDBRFIRFPPTSGuaranteedWeighGrammes + '''''
	'
	END +
	CASE
		WHEN @NSEDBForgrounduseonly = '' THEN ''
		ELSE 'AND e.VALIDFORGROUNDTESTS LIKE ''''' + @NSEDBForgrounduseonly + '''''
	'
	END +
	CASE
		WHEN @NSEDBSerialisation = '' THEN ''
		ELSE 'AND e.SERIALISATION LIKE ''''' + @NSEDBSerialisation + '''''
	'
	END +
	CASE
		WHEN @NSEDBAcceptancesheetweighedweight = '' THEN ''
		ELSE 'AND e.WEIGHTWEIGHTGRAMMES LIKE ''''' + @NSEDBAcceptancesheetweighedweight + '''''
	'
	END +
	CASE
		WHEN @NSEDBACICDFolderVersion = '' THEN ''
		ELSE 'AND e.AC_ICDfolderVersion LIKE ''''' + @NSEDBACICDFolderVersion + '''''
	'
	END +
	CASE
		WHEN @SUPPLIERFSCM = '' THEN ''
		ELSE 'AND p.LOOKUPKEY LIKE ''''' + @SUPPLIERFSCM + '''''
	'
	END +
	CASE
		WHEN @SUPPLIERName = '' THEN ''
		ELSE 'AND p.DESCRIPTION_DOM LIKE ''''' + @SUPPLIERName + '''''
	'
	END +
	CASE
		WHEN @ModelReference = '' THEN ''
		ELSE 'AND q.MODELREF LIKE ''''' + @ModelReference + '''''
	'
	END +
	CASE
		WHEN @ModelMaturity = '' THEN ''
		ELSE 'AND q.MODELMATURITY LIKE ''''' + @ModelMaturity + '''''
	'
	END +
	CASE
		WHEN @MP = '' THEN ''
		ELSE 'AND a.MPNUMBER LIKE ''''' + @MP + '''''
	'
	END +
	CASE
		WHEN @MOD = '' THEN ''
		ELSE 'AND a.MODNUMBER LIKE ''''' + @MOD + '''''
	'
	END +
	CASE
		WHEN @SIReference = '' THEN ''
		ELSE 'AND i.BNAME + i.VERSIONIDA2VERSIONINFO LIKE ''''' + @SIReference + '''''
	'
	END +
	CASE
		WHEN @SIState = '' THEN ''
		ELSE 'AND i.STATESTATE LIKE ''''' + @SIState + '''''
	'
	END +
	
	CASE
		WHEN @CounterRef = '' THEN ''
		ELSE 'AND q.COUNTERREF LIKE ''''' + @CounterRef + '''''
	'
	END + 
	
	''')'
	
	EXECUTE(@SQL)
	
END
GO


-- Global MSN definition Report creation in PSE

IF (SELECT REPORT_GROUP_id FROM T_REPORT_GROUP WHERE REPORT_GROUP_LABEL = 'MSN Definition') IS NULL
	INSERT INTO [T_REPORT_GROUP]
	(
		[REPORT_GROUP_LABEL]
	)
	VALUES
	(
		'MSN Definition'
	)

DECLARE
	@AttGroup INT

SELECT @AttGroup = REPORT_GROUP_id FROM T_REPORT_GROUP WHERE REPORT_GROUP_LABEL = 'MSN Definition'

-- Add report in PSE
DELETE T_DBActions WHERE label = 'Consolidated MSN Definition'

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
	'Consolidated MSN Definition',
	'sp_Consolidated_MSN_Definition R_PSS_A400M,#''1'',''2'',''3'',''4'',''5'',''6'',''7'',''8'',''9'',''10'',''11'',''12'',''13'',''14'',''15'',''16'',''17'',''18'',''19'',''20'',''21'',''22'',''23'',''24'',''25'',''26'',''27'',''28'',''30'',''31'',''32'',''33'',''34'',''83'',''84'',''35'',''76'',''77'',''81'',''36'',''37'',''38'',''39'',''40'',''41'',''42'',''43'',''44'',''45'',''46'',''74'',''75''#',
	'- CSV format',
	'export_csv.php',
	'MSN :#1#;SUBATA-DS Name :#2#;FIN-CI Name :#3#;FIN-CI Status :#4#;FIN-CI Category :#5#;FIN-CI Functional Designation :#6#;FIN-CI Definition Resp. NatCo :#7#;FIN-CI Design Focal Point :#8#;FIN-CI Installation Site :#9#;FIN-CI Provisioning Site :#10#;FIN-CI Installation Design Resp :#11#;FIN-CI OBS :#12#;FIN-CI WCL Code :#13#;FIN-CI AC/ICD Root File Name :#14#;FIN-CI ICD Folder Name :#15#;Serial FIN-DS CA :#16#;FIN-DS Name :#17#;FIN-DS Purchase Quantity :#18#;FIN-DS State :#19#;FIN-DS Effectivity :#20#;FIN-DS AIR Recorded :#21#;FIN-DS Installation Zone :#22#;FIN-DS Installation Section :#23#;FIN-DS Installation Panel :#24#;FIN-DS provisioning type :#25#;FIN-DS ANSI Code :#26#;FIN-DS Loading type :#27#;REQUIREMENT Stacking :#28#;NSEDB PN :#30#;NSEDB CMS :#31#;NSEDB DAL :#32#;NSEDB Supplier Technological Designation :#33#;NSEDB PTS Document Reference :#34#;NSEDB PTS Reference Issue :#83#;NSEDB DDP Document Reference :#84#;NSEDB DDP Reference Issue :#35#;NSEDB State :#76#;NSEDB Calculated Weight Grammes :#77#;NSEDB Estimated Weight Grammes :#81#;NSEDB RFI RFP PTS Guaranteed Weigh Grammes :#36#;NSEDB For ground use only :#37#;NSEDB Serialisation :#38#;NSEDB Acceptance sheet weighed weight :#39#;NSEDB AC/ICD Folder Version :#40#;SUPPLIER FSCM :#41#;SUPPLIER Name :#42#;Model Reference :#43#;Model Maturity :#44#;MP :#45#;MOD :#46#;SI Reference :#74#;SI State :#75#',
	'Only FIN having 1 FIN-DS effective (Serial or Dev), Only 1 DS FIN-DS (Dev else Serial)',
	NULL,
	@AttGroup
)
