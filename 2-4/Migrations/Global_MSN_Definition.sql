-- Create Global MSN Definition Procedure

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'sp_MSN_Definition' AND type = 'P')
   DROP PROCEDURE sp_MSN_Definition
GO

CREATE PROCEDURE dbo.sp_MSN_Definition (
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
	@SerialFINDSCA VARCHAR(8000) = '',
	@SerialFINDSName VARCHAR(8000) = '',
	@SerialFINDSPurchaseQuantity VARCHAR(8000) = '',
	@SerialFINDSState VARCHAR(8000) = '',
	@SerialFINDSEffectivity VARCHAR(8000) = '',
	@SerialFINDSAIRRecorded VARCHAR(8000) = '',
	@SerialFINDSInstallationZone VARCHAR(8000) = '',
	@SerialFINDSInstallationSection VARCHAR(8000) = '',
	@SerialFINDSInstallationPanel VARCHAR(8000) = '',
	@SerialFINDSprovisioningtype VARCHAR(8000) = '',
	@SerialFINDSANSICode VARCHAR(8000) = '',
	@SerialFINDSLoadingtype VARCHAR(8000) = '',
	@SerialDSREQUIREMENTStacking VARCHAR(8000) = '',
	@SerialREQUIREMENTStacking VARCHAR(8000) = '',
	@SerialREQUIREMENTState VARCHAR(8000) = '',
	@SerialNSEDBPN VARCHAR(8000) = '',
	@SerialNSEDBCMS VARCHAR(8000) = '',
	@SerialNSEDBDAL VARCHAR(8000) = '',
	@SerialNSEDBSupplierTechnologicalDesignation VARCHAR(8000) = '',
	@SerialNSEDBPTSDocumentReference VARCHAR(8000) = '',
	@SerialNSEDBPTSReferenceIssue VARCHAR(8000) = '',
	@SerialNSEDBDDPDocumentReference VARCHAR(8000) = '',
	@SerialNSEDBDDPReferenceIssue VARCHAR(8000) = '',
	@SerialNSEDBState VARCHAR(8000) = '',
	@SerialNSEDBCalculatedWeightGrammes VARCHAR(8000) = '',
	@SerialNSEDBEstimatedWeightGrammes VARCHAR(8000) = '',
	@SerialNSEDBRFIRFPPTSGuaranteedWeighGrammes VARCHAR(8000) = '',
	@SerialNSEDBForgrounduseonly VARCHAR(8000) = '',
	@SerialNSEDBSerialisation VARCHAR(8000) = '',
	@SerialNSEDBAcceptancesheetweighedweight VARCHAR(8000) = '',
	@SerialNSEDBACICDFolderVersion VARCHAR(8000) = '',
	@SerialSUPPLIERFSCM VARCHAR(8000) = '',
	@SerialSUPPLIERName VARCHAR(8000) = '',
	@SerialModelReference VARCHAR(8000) = '',
	@SerialModelMaturity VARCHAR(8000) = '',
	@MP VARCHAR(8000) = '',
	@MOD VARCHAR(8000) = '',
	@DevelopmentFINDSCA VARCHAR(8000) = '',
	@DevelopmentFINDSName VARCHAR(8000) = '',
	@DevelopmentFINDSPurchaseQuantity VARCHAR(8000) = '',
	@DevelopmentFINDSState VARCHAR(8000) = '',
	@DevelopmentFINDSEffectivity VARCHAR(8000) = '',
	@DevelopmentFINDSAIRRecorded VARCHAR(8000) = '',
	@DevelopmentFINDSInstallationZone VARCHAR(8000) = '',
	@DevelopmentFINDSInstallationSection VARCHAR(8000) = '',
	@DevelopmentFINDSInstallationPanel VARCHAR(8000) = '',
	@DevelopmentFINDSprovisioningtype VARCHAR(8000) = '',
	@DevelopmentFINDSANSICode VARCHAR(8000) = '',
	@DevelopmentFINDSLoadingtype VARCHAR(8000) = '',
	@DevelopmentNSEDBPN VARCHAR(8000) = '',
	@DevelopmentNSEDBCMS VARCHAR(8000) = '',
	@DevelopmentNSEDBDAL VARCHAR(8000) = '',
	@DevelopmentNSEDBSupplierTechnologicalDesignation VARCHAR(8000) = '',
	@DevelopmentNSEDBPTSDocumentReference VARCHAR(8000) = '',
	@DevelopmentNSEDBPTSReferenceIssue VARCHAR(8000) = '',
	@DevelopmentNSEDBDDPDocumentReference VARCHAR(8000) = '',
	@DevelopmentNSEDBDDPReferenceIssue VARCHAR(8000) = '',
	@DevelopmentNSEDBState VARCHAR(8000) = '',
	@DevelopmentNSEDBCalculatedWeightGrammes VARCHAR(8000) = '',
	@DevelopmentNSEDBEstimatedWeightGrammes VARCHAR(8000) = '',
	@DevelopmentNSEDBRFIRFPPTSGuaranteedWeighGrammes VARCHAR(8000) = '',
	@DevelopmentNSEDBForgrounduseonly VARCHAR(8000) = '',
	@DevelopmentNSEDBSerialisation VARCHAR(8000) = '',
	@DevelopmentNSEDBAcceptancesheetweighedweight VARCHAR(8000) = '',
	@DevelopmentNSEDBACICDFolderVersion VARCHAR(8000) = '',
	@DevelopmentSUPPLIERFSCM VARCHAR(8000) = '',
	@DevelopmentSUPPLIERName VARCHAR(8000) = '',
	@DevelopmentModelReference VARCHAR(8000) = '',
	@DevelopmentModelMaturity VARCHAR(8000) = '',
	@SIReference VARCHAR(8000) = '',
	@SIState VARCHAR(8000) = ''
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
	s.SKETCH [Serial FIN-DS CA],
	s.BWTPARTNUMBER [Serial FIN-DS Name],
	s.PURCHASEQTY [Serial FIN-DS Purchase Quantity],
	s.STATESTATE [Serial FIN-DS State],
	'''''''''''''''' + g.RANGE + '''''''''''''''' [Serial FIN-DS Effectivity],
	s.AIRRECORDED [Serial FIN-DS AIR Recorded],
	z.UNIQUEID [Serial FIN-DS Installation Zone],
	s.INSTRPROCEDURE [Serial FIN-DS Installation Section],
	n.UNIQUEID [Serial FIN-DS Installation Panel],
	s.PROVISIONINGTYPE [Serial FIN-DS provisioning type],
	c.UNIQUEID [Serial FIN-DS ANSI Code],
	s.LOADINGTYPE [Serial FIN-DS Loading type],
	CONVERT(TEXT, k.STACKING) [Serial DS REQUIREMENT Stacking],
	CONVERT(TEXT, ke.STACKING) [Serial REQUIREMENT Stacking],
	re.REQSTATE [Serial REQUIREMENT State],
	e.PARTNUMBER [Serial NSEDB PN],
	e.CMS [Serial NSEDB CMS],
	e.DAL [Serial NSEDB DAL],
	e.EQUIPMENTDESIGNATION [Serial NSEDB Supplier Technological Designation],
	e.PTSREF [Serial NSEDB PTS Document Reference],
	e.PTSISSUE [Serial NSEDB PTS Reference Issue],
	e.DDPREF [Serial NSEDB DDP Document Reference],
	e.DDPISSUE [Serial NSEDB DDP Reference Issue],
	e.STATESTATE [Serial NSEDB State],
	e.CALCULATEDWEIGHT [Serial NSEDB Calculated Weight Grammes],
	e.ESTIMATEDWEIGHTGRAMMES [Serial NSEDB Estimated Weight Grammes],
	e.GUARANTEEDWEIGHTGRAMMES [Serial NSEDB RFI RFP PTS Guaranteed Weigh Grammes],
	e.VALIDFORGROUNDTESTS [Serial NSEDB For ground use only],
	e.SERIALISATION [Serial NSEDB Serialisation],
	e.WEIGHTWEIGHTGRAMMES [Serial NSEDB Acceptance sheet weighed weight],
	e.AC_ICDfolderVersion [Serial NSEDB AC/ICD Folder Version],
	p.LOOKUPKEY [Serial SUPPLIER FSCM],
	p.DESCRIPTION_DOM [Serial SUPPLIER Name],
	q.MODELREF [Serial Model Reference],
	q.MODELMATURITY [Serial Model Maturity],
	a.MPNUMBER [MP],
	a.MODNUMBER [MOD],
	sd.SKETCH [Development FIN-DS CA],
	sd.BWTPARTNUMBER [Development FIN-DS Name],
	sd.PURCHASEQTY [Development FIN-DS Purchase Quantity],
	sd.STATESTATE [Development FIN-DS State],
	sd.LASTDEVEFFECTIVITY [Development FIN-DS Effectivity],
	sd.AIRRECORDED [Development FIN-DS AIR Recorded],
	zd.UNIQUEID [Development FIN-DS Installation Zone],
	sd.INSTRPROCEDURE [Development FIN-DS Installation Section],
	nd.UNIQUEID [Development FIN-DS Installation Panel],
	sd.PROVISIONINGTYPE [Development FIN-DS provisioning type],
	cd.UNIQUEID [Development FIN-DS ANSI Code],
	sd.LOADINGTYPE [Development FIN-DS Loading type],
	ed.PARTNUMBER [Development NSEDB PN],
	ed.CMS [Development NSEDB CMS],
	ed.DAL [Development NSEDB DAL],
	ed.EQUIPMENTDESIGNATION [Development NSEDB Supplier Technological Designation],
	ed.PTSREF [Development NSEDB PTS Document Reference],
	ed.PTSISSUE [Development NSEDB PTS Reference Issue],
	ed.DDPREF [Development NSEDB DDP Document Reference],
	ed.DDPISSUE [Development NSEDB DDP Reference Issue],
	ed.STATESTATE [Development NSEDB State],
	ed.CALCULATEDWEIGHT [Development NSEDB Calculated Weight Grammes],
	ed.ESTIMATEDWEIGHTGRAMMES [Development NSEDB Estimated Weight Grammes],
	ed.GUARANTEEDWEIGHTGRAMMES [Development NSEDB RFI RFP PTS Guaranteed Weigh Grammes],
	ed.VALIDFORGROUNDTESTS [Development NSEDB For ground use only],
	ed.SERIALISATION [Development NSEDB Serialisation],
	ed.WEIGHTWEIGHTGRAMMES [Development NSEDB Acceptance sheet weighed weight],
	ed.AC_ICDfolderVersion [Development NSEDB AC/ICD Folder Version],
	pd.LOOKUPKEY [Development SUPPLIER FSCM],
	pd.DESCRIPTION_DOM [Development SUPPLIER Name],
	qd.MODELREF [Development Model Reference],
	qd.MODELMATURITY [Development Model Maturity],
	i.BNAME + i.VERSIONIDA2VERSIONINFO [SI Reference],
	i.STATESTATE [SI State]
FROM
	tmp_MSNDefinition m
	JOIN tmpsv_FIN f ON f.BIDA2A2 = m.[FIN-CI BIDA2A2]
	LEFT JOIN tmpsv_DS s ON s.BIDA2A2 = m.[Serial FIN-DS BIDA2A2]
	LEFT JOIN tmpsv_PN e ON e.BIDA2A2 = s.IDPN
	LEFT JOIN tmpsv_SUPPLIER p ON p.LOOKUPKEY = e.FSCM
	LEFT JOIN tmpsv_EQUIPMENTMODEL q ON q.IDA2A2 = e.IDMODEL
	LEFT JOIN tmpsv_LOCATION n ON n.IDA2A2 = s.PANEL
	LEFT JOIN tmpsv_LOCATION z ON z.IDA2A2 = s.ZONE
	LEFT JOIN tmpsv_ANSICODE c ON c.IDA2A2 = s.ANSICODE
	LEFT JOIN tmpsv_DSMSNRANGE g ON g.BIDA2A2 = m.[Serial FIN-DS BIDA2A2]
	LEFT JOIN tmpsv_STACKCONC k ON k.IDA2A2 = m.[Serial DS REQUIREMENT IDA2A2]
	LEFT JOIN tmpsv_ACERequirement re ON re.IDA2A2 = m.[Serial REQUIREMENT IDA2A2]
	LEFT JOIN tmpsv_STACKCONC ke ON ke.IDA2A2 = m.[Serial REQUIREMENT IDA2A2]
	LEFT JOIN tmpsv_ACECIN a ON a.IDA2A2 = m.[CIN IDA2A2]
	LEFT JOIN tmpsv_DS sd ON sd.BIDA2A2 = m.[Development Last Effective Last FIN-DS BIDA2A2]
	LEFT JOIN tmpsv_PN ed ON ed.BIDA2A2 = sd.IDPN
	LEFT JOIN tmpsv_SUPPLIER pd ON pd.LOOKUPKEY = ed.FSCM
	LEFT JOIN tmpsv_EQUIPMENTMODEL qd ON qd.IDA2A2 = ed.IDMODEL
	LEFT JOIN tmpsv_LOCATION nd ON nd.IDA2A2 = sd.PANEL
	LEFT JOIN tmpsv_LOCATION zd ON zd.IDA2A2 = sd.ZONE
	LEFT JOIN tmpsv_ANSICODE cd ON cd.IDA2A2 = sd.ANSICODE
	LEFT JOIN tmpsv_SI i ON i.BIDA2A2 = m.[Last Effective SI BIDA2A2]
WHERE
	1 = 1
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
		WHEN @SerialFINDSCA = '' THEN ''
		ELSE 'AND s.SKETCH LIKE ''''' + @SerialFINDSCA + '''''
	'
	END +
	CASE
		WHEN @SerialFINDSName = '' THEN ''
		ELSE 'AND s.BWTPARTNUMBER LIKE ''''' + @SerialFINDSName + '''''
	'
	END +
	CASE
		WHEN @SerialFINDSPurchaseQuantity = '' THEN ''
		ELSE 'AND s.PURCHASEQTY = ' + @SerialFINDSPurchaseQuantity + '
	'
	END +
	CASE
		WHEN @SerialFINDSState = '' THEN ''
		ELSE 'AND s.STATESTATE LIKE ''''' + @SerialFINDSState + '''''
	'
	END +
	CASE
		WHEN @SerialFINDSEffectivity = '' THEN ''
		ELSE 'AND g.RANGE LIKE ''''' + @SerialFINDSEffectivity + '''''
	'
	END +
	CASE
		WHEN @SerialFINDSAIRRecorded = '' THEN ''
		ELSE 'AND s.AIRRECORDED = ' + @SerialFINDSAIRRecorded + '
	'
	END +
	CASE
		WHEN @SerialFINDSInstallationZone = '' THEN ''
		ELSE 'AND z.UNIQUEID LIKE ''''' + @SerialFINDSInstallationZone + '''''
	'
	END +
	CASE
		WHEN @SerialFINDSInstallationSection = '' THEN ''
		ELSE 'AND s.INSTRPROCEDURE LIKE ''''' + @SerialFINDSInstallationSection + '''''
	'
	END +
	CASE
		WHEN @SerialFINDSInstallationPanel = '' THEN ''
		ELSE 'AND n.UNIQUEID LIKE ''''' + @SerialFINDSInstallationPanel + '''''
	'
	END +
	CASE
		WHEN @SerialFINDSprovisioningtype = '' THEN ''
		ELSE 'AND s.PROVISIONINGTYPE LIKE ''''' + @SerialFINDSprovisioningtype + '''''
	'
	END +
	CASE
		WHEN @SerialFINDSANSICode = '' THEN ''
		ELSE 'AND c.UNIQUEID LIKE ''''' + @SerialFINDSANSICode + '''''
	'
	END +
	CASE
		WHEN @SerialFINDSLoadingtype = '' THEN ''
		ELSE 'AND s.LOADINGTYPE LIKE ''''' + @SerialFINDSLoadingtype + '''''
	'
	END +
	CASE
		WHEN @SerialDSREQUIREMENTStacking = '' THEN ''
		ELSE 'AND k.STACKING LIKE ''''' + @SerialDSREQUIREMENTStacking + '''''
	'
	END +
	CASE
		WHEN @SerialREQUIREMENTStacking = '' THEN ''
		ELSE 'AND ke.STACKING LIKE ''''' + @SerialREQUIREMENTStacking + '''''
	'
	END +
	CASE
		WHEN @SerialREQUIREMENTState = '' THEN ''
		ELSE 'AND re.REQSTATE LIKE ''''' + @SerialREQUIREMENTState + '''''
	'
	END +
	CASE
		WHEN @SerialNSEDBPN = '' THEN ''
		ELSE 'AND e.PARTNUMBER LIKE ''''' + @SerialNSEDBPN + '''''
	'
	END +
	CASE
		WHEN @SerialNSEDBCMS = '' THEN ''
		ELSE 'AND e.CMS LIKE ''''' + @SerialNSEDBCMS + '''''
	'
	END +
	CASE
		WHEN @SerialNSEDBDAL = '' THEN ''
		ELSE 'AND e.DAL = ''''' + @SerialNSEDBDAL + '''''
	'
	END +
	CASE
		WHEN @SerialNSEDBSupplierTechnologicalDesignation = '' THEN ''
		ELSE 'AND e.EQUIPMENTDESIGNATION LIKE ''''' + @SerialNSEDBSupplierTechnologicalDesignation + '''''
	'
	END +
	CASE
		WHEN @SerialNSEDBPTSDocumentReference = '' THEN ''
		ELSE 'AND e.PTSREF LIKE ''''' + @SerialNSEDBPTSDocumentReference + '''''
	'
	END +
	CASE
		WHEN @SerialNSEDBPTSReferenceIssue = '' THEN ''
		ELSE 'AND e.PTSISSUE LIKE ''''' + @SerialNSEDBPTSReferenceIssue + '''''
	'
	END +
	CASE
		WHEN @SerialNSEDBDDPDocumentReference = '' THEN ''
		ELSE 'AND e.DDPREF LIKE ''''' + @SerialNSEDBDDPDocumentReference + '''''
	'
	END +
	CASE
		WHEN @SerialNSEDBDDPReferenceIssue = '' THEN ''
		ELSE 'AND e.DDPISSUE LIKE ''''' + @SerialNSEDBDDPReferenceIssue + '''''
	'
	END +
	CASE
		WHEN @SerialNSEDBState = '' THEN ''
		ELSE 'AND e.STATESTATE LIKE ''''' + @SerialNSEDBState + '''''
	'
	END +
	CASE
		WHEN @SerialNSEDBCalculatedWeightGrammes = '' THEN ''
		ELSE 'AND e.CALCULATEDWEIGHT LIKE ''''' + @SerialNSEDBCalculatedWeightGrammes + '''''
	'
	END +
	CASE
		WHEN @SerialNSEDBEstimatedWeightGrammes = '' THEN ''
		ELSE 'AND e.ESTIMATEDWEIGHTGRAMMES LIKE ''''' + @SerialNSEDBEstimatedWeightGrammes + '''''
	'
	END +
	CASE
		WHEN @SerialNSEDBRFIRFPPTSGuaranteedWeighGrammes = '' THEN ''
		ELSE 'AND e.GUARANTEEDWEIGHTGRAMMES LIKE ''''' + @SerialNSEDBRFIRFPPTSGuaranteedWeighGrammes + '''''
	'
	END +
	CASE
		WHEN @SerialNSEDBForgrounduseonly = '' THEN ''
		ELSE 'AND e.VALIDFORGROUNDTESTS LIKE ''''' + @SerialNSEDBForgrounduseonly + '''''
	'
	END +
	CASE
		WHEN @SerialNSEDBSerialisation = '' THEN ''
		ELSE 'AND e.SERIALISATION LIKE ''''' + @SerialNSEDBSerialisation + '''''
	'
	END +
	CASE
		WHEN @SerialNSEDBAcceptancesheetweighedweight = '' THEN ''
		ELSE 'AND e.WEIGHTWEIGHTGRAMMES LIKE ''''' + @SerialNSEDBAcceptancesheetweighedweight + '''''
	'
	END +
	CASE
		WHEN @SerialNSEDBACICDFolderVersion = '' THEN ''
		ELSE 'AND e.AC_ICDfolderVersion LIKE ''''' + @SerialNSEDBACICDFolderVersion + '''''
	'
	END +
	CASE
		WHEN @SerialSUPPLIERFSCM = '' THEN ''
		ELSE 'AND p.LOOKUPKEY LIKE ''''' + @SerialSUPPLIERFSCM + '''''
	'
	END +
	CASE
		WHEN @SerialSUPPLIERName = '' THEN ''
		ELSE 'AND p.DESCRIPTION_DOM LIKE ''''' + @SerialSUPPLIERName + '''''
	'
	END +
	CASE
		WHEN @SerialModelReference = '' THEN ''
		ELSE 'AND q.MODELREF LIKE ''''' + @SerialModelReference + '''''
	'
	END +
	CASE
		WHEN @SerialModelMaturity = '' THEN ''
		ELSE 'AND q.MODELMATURITY LIKE ''''' + @SerialModelMaturity + '''''
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
		WHEN @DevelopmentFINDSCA = '' THEN ''
		ELSE 'AND sd.SKETCH LIKE ''''' + @DevelopmentFINDSCA + '''''
	'
	END +
	CASE
		WHEN @DevelopmentFINDSName = '' THEN ''
		ELSE 'AND sd.BWTPARTNUMBER LIKE ''''' + @DevelopmentFINDSName + '''''
	'
	END +
	CASE
		WHEN @DevelopmentFINDSPurchaseQuantity = '' THEN ''
		ELSE 'AND sd.PURCHASEQTY = ' + @DevelopmentFINDSPurchaseQuantity + '
	'
	END +
	CASE
		WHEN @DevelopmentFINDSState = '' THEN ''
		ELSE 'AND sd.STATESTATE LIKE ''''' + @DevelopmentFINDSState + '''''
	'
	END +
	CASE
		WHEN @DevelopmentFINDSEffectivity = '' THEN ''
		ELSE 'AND sd.LASTDEVEFFECTIVITY LIKE ''''' + @DevelopmentFINDSEffectivity + '''''
	'
	END +
	CASE
		WHEN @DevelopmentFINDSAIRRecorded = '' THEN ''
		ELSE 'AND sd.AIRRECORDED = ' + @DevelopmentFINDSAIRRecorded + '
	'
	END +
	CASE
		WHEN @DevelopmentFINDSInstallationZone = '' THEN ''
		ELSE 'AND zd.UNIQUEID LIKE ''''' + @DevelopmentFINDSInstallationZone + '''''
	'
	END +
	CASE
		WHEN @DevelopmentFINDSInstallationSection = '' THEN ''
		ELSE 'AND sd.INSTRPROCEDURE LIKE ''''' + @DevelopmentFINDSInstallationSection + '''''
	'
	END +
	CASE
		WHEN @DevelopmentFINDSInstallationPanel = '' THEN ''
		ELSE 'AND nd.UNIQUEID LIKE ''''' + @DevelopmentFINDSInstallationPanel + '''''
	'
	END +
	CASE
		WHEN @DevelopmentFINDSprovisioningtype = '' THEN ''
		ELSE 'AND sd.PROVISIONINGTYPE LIKE ''''' + @DevelopmentFINDSprovisioningtype + '''''
	'
	END +
	CASE
		WHEN @DevelopmentFINDSANSICode = '' THEN ''
		ELSE 'AND cd.UNIQUEID LIKE ''''' + @DevelopmentFINDSANSICode + '''''
	'
	END +
	CASE
		WHEN @DevelopmentFINDSLoadingtype = '' THEN ''
		ELSE 'AND sd.LOADINGTYPE LIKE ''''' + @DevelopmentFINDSLoadingtype + '''''
	'
	END +
	CASE
		WHEN @DevelopmentNSEDBPN = '' THEN ''
		ELSE 'AND ed.PARTNUMBER LIKE ''''' + @DevelopmentNSEDBPN + '''''
	'
	END +
	CASE
		WHEN @DevelopmentNSEDBCMS = '' THEN ''
		ELSE 'AND ed.CMS LIKE ''''' + @DevelopmentNSEDBCMS + '''''
	'
	END +
	CASE
		WHEN @DevelopmentNSEDBDAL = '' THEN ''
		ELSE 'AND ed.DAL = ''''' + @DevelopmentNSEDBDAL + '''''
	'
	END +
	CASE
		WHEN @DevelopmentNSEDBSupplierTechnologicalDesignation = '' THEN ''
		ELSE 'AND ed.EQUIPMENTDESIGNATION LIKE ''''' + @DevelopmentNSEDBSupplierTechnologicalDesignation + '''''
	'
	END +
	CASE
		WHEN @DevelopmentNSEDBPTSDocumentReference = '' THEN ''
		ELSE 'AND ed.PTSREF LIKE ''''' + @DevelopmentNSEDBPTSDocumentReference + '''''
	'
	END +
	CASE
		WHEN @DevelopmentNSEDBPTSReferenceIssue = '' THEN ''
		ELSE 'AND ed.PTSISSUE LIKE ''''' + @DevelopmentNSEDBPTSReferenceIssue + '''''
	'
	END +
	CASE
		WHEN @DevelopmentNSEDBDDPDocumentReference = '' THEN ''
		ELSE 'AND ed.DDPREF LIKE ''''' + @DevelopmentNSEDBDDPDocumentReference + '''''
	'
	END +
	CASE
		WHEN @DevelopmentNSEDBDDPReferenceIssue = '' THEN ''
		ELSE 'AND ed.DDPISSUE LIKE ''''' + @DevelopmentNSEDBDDPReferenceIssue + '''''
	'
	END +
	CASE
		WHEN @DevelopmentNSEDBState = '' THEN ''
		ELSE 'AND ed.STATESTATE LIKE ''''' + @DevelopmentNSEDBState + '''''
	'
	END +
	CASE
		WHEN @DevelopmentNSEDBCalculatedWeightGrammes = '' THEN ''
		ELSE 'AND ed.CALCULATEDWEIGHT LIKE ''''' + @DevelopmentNSEDBCalculatedWeightGrammes + '''''
	'
	END +
	CASE
		WHEN @DevelopmentNSEDBEstimatedWeightGrammes = '' THEN ''
		ELSE 'AND ed.ESTIMATEDWEIGHTGRAMMES LIKE ''''' + @DevelopmentNSEDBEstimatedWeightGrammes + '''''
	'
	END +
	CASE
		WHEN @DevelopmentNSEDBRFIRFPPTSGuaranteedWeighGrammes = '' THEN ''
		ELSE 'AND ed.GUARANTEEDWEIGHTGRAMMES LIKE ''''' + @DevelopmentNSEDBRFIRFPPTSGuaranteedWeighGrammes + '''''
	'
	END +
	CASE
		WHEN @DevelopmentNSEDBForgrounduseonly = '' THEN ''
		ELSE 'AND ed.VALIDFORGROUNDTESTS LIKE ''''' + @DevelopmentNSEDBForgrounduseonly + '''''
	'
	END +
	CASE
		WHEN @DevelopmentNSEDBSerialisation = '' THEN ''
		ELSE 'AND ed.SERIALISATION LIKE ''''' + @DevelopmentNSEDBSerialisation + '''''
	'
	END +
	CASE
		WHEN @DevelopmentNSEDBAcceptancesheetweighedweight = '' THEN ''
		ELSE 'AND ed.WEIGHTWEIGHTGRAMMES LIKE ''''' + @DevelopmentNSEDBAcceptancesheetweighedweight + '''''
	'
	END +
	CASE
		WHEN @DevelopmentNSEDBACICDFolderVersion = '' THEN ''
		ELSE 'AND ed.AC_ICDfolderVersion LIKE ''''' + @DevelopmentNSEDBACICDFolderVersion + '''''
	'
	END +
	CASE
		WHEN @DevelopmentSUPPLIERFSCM = '' THEN ''
		ELSE 'AND pd.LOOKUPKEY LIKE ''''' + @DevelopmentSUPPLIERFSCM + '''''
	'
	END +
	CASE
		WHEN @DevelopmentSUPPLIERName = '' THEN ''
		ELSE 'AND pd.DESCRIPTION_DOM LIKE ''''' + @DevelopmentSUPPLIERName + '''''
	'
	END +
	CASE
		WHEN @DevelopmentModelReference = '' THEN ''
		ELSE 'AND qd.MODELREF LIKE ''''' + @DevelopmentModelReference + '''''
	'
	END +
	CASE
		WHEN @DevelopmentModelMaturity = '' THEN ''
		ELSE 'AND qd.MODELMATURITY LIKE ''''' + @DevelopmentModelMaturity + '''''
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
	''')'
	
	EXECUTE(@SQL)
	
END
GO


-- Ini parameters

DECLARE
	@r VARCHAR(8000),
	@g VARCHAR(8000),
	@p VARCHAR(8000),
	@v VARCHAR(8000),
	@Remote_Name VARCHAR(8000),
	@Remote_Database VARCHAR(8000),
	@Remote_UserName VARCHAR(8000),
	@Remote_Password VARCHAR(8000)

SET @g = ''
SET @p = ''
SET @v = ''

CREATE TABLE #@TMP
(
	PARAM VARCHAR(8000)
)

BULK INSERT #@TMP
   FROM 'E:\Inetpub\ftproot\CNFG\PSS_A400M.ini'

CREATE TABLE #@INIPARAM
(
	IniGroup VARCHAR(8000),
	IniParam VARCHAR(8000),
	IniValue VARCHAR(8000),
)

DECLARE db_cursor CURSOR FOR
	SELECT * FROM #@TMP WHERE LEFT(PARAM, 1) <> ';'
BEGIN
	OPEN db_cursor
	FETCH NEXT FROM db_cursor INTO @r
	WHILE (@@FETCH_STATUS <> -1)
	BEGIN
		IF @r LIKE '[[]%]'
			SET @g = @r
		ELSE
		BEGIN
			SET @p = SUBSTRING(@r, 1, CHARINDEX('=', @r) - 1)
			SET @v = SUBSTRING(@r, CHARINDEX('=', @r) + 1, LEN(@r) - CHARINDEX('=', @r))
			INSERT INTO #@INIPARAM VALUES (@g, @p, @v)
		END
		FETCH NEXT FROM db_cursor INTO @r
	END
END
CLOSE db_cursor
DEALLOCATE db_cursor

SELECT @Remote_Name = IniValue FROM #@INIPARAM WHERE IniGroup = '[PSS Server]' AND IniParam = 'Name'
SELECT @Remote_Database = IniValue FROM #@INIPARAM WHERE IniGroup = '[PSS Server]' AND IniParam = 'Database'
SELECT @Remote_UserName = IniValue FROM #@INIPARAM WHERE IniGroup = '[PSS Server]' AND IniParam = 'UserName'
SELECT @Remote_Password = IniValue FROM #@INIPARAM WHERE IniGroup = '[PSS Server]' AND IniParam = 'Password'


-- Linked servers

IF (SELECT COUNT(*) FROM MASTER.DBO.SYSSERVERS WHERE SRVNAME = @Remote_Database) > 0
	EXEC sp_dropserver @Remote_Database, 'droplogins'

EXEC sp_addlinkedserver @Remote_Database, '', 'SQLOLEDB', @Remote_Name, '', '', @Remote_Database
EXEC sp_addlinkedsrvlogin @Remote_Database, 'false', NULL, @Remote_UserName, @Remote_Password


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
DELETE T_DBActions WHERE label = 'Global MSN Definition'

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
	'Global MSN Definition',
	'sp_MSN_Definition ' + @Remote_Database + ',#''1'',''2'',''3'',''4'',''5'',''6'',''7'',''8'',''9'',''10'',''11'',''12'',''13'',''14'',''15'',''16'',''17'',''18'',''19'',''20'',''21'',''22'',''23'',''24'',''25'',''26'',''27'',''80'',''28'',''29'',''30'',''31'',''32'',''33'',''34'',''83'',''84'',''35'',''76'',''77'',''81'',''36'',''37'',''38'',''39'',''40'',''41'',''42'',''43'',''44'',''45'',''46'',''47'',''48'',''49'',''50'',''51'',''52'',''53'',''54'',''55'',''56'',''57'',''58'',''59'',''60'',''61'',''62'',''63'',''85'',''86'',''64'',''78'',''79'',''82'',''65'',''66'',''67'',''68'',''69'',''70'',''71'',''72'',''73'',''74'',''75''#',
	'- CSV format',
	'export_csv.php',
	'MSN :#1#;SUBATA-DS Name :#2#;FIN-CI Name :#3#;FIN-CI Status :#4#;FIN-CI Category :#5#;FIN-CI Functional Designation :#6#;FIN-CI Definition Resp. NatCo :#7#;FIN-CI Design Focal Point :#8#;FIN-CI Installation Site :#9#;FIN-CI Provisioning Site :#10#;FIN-CI Installation Design Resp :#11#;FIN-CI OBS :#12#;FIN-CI WCL Code :#13#;FIN-CI AC/ICD Root File Name :#14#;FIN-CI ICD Folder Name :#15#;Serial FIN-DS CA :#16#;Serial FIN-DS Name :#17#;Serial FIN-DS Purchase Quantity :#18#;Serial FIN-DS State :#19#;Serial FIN-DS Effectivity :#20#;Serial FIN-DS AIR Recorded :#21#;Serial FIN-DS Installation Zone :#22#;Serial FIN-DS Installation Section :#23#;Serial FIN-DS Installation Panel :#24#;Serial FIN-DS provisioning type :#25#;Serial FIN-DS ANSI Code :#26#;Serial FIN-DS Loading type :#27#;Serial DS REQUIREMENT Stacking :#80#;Serial REQUIREMENT Stacking :#28#;Serial REQUIREMENT State :#29#;Serial NSEDB PN :#30#;Serial NSEDB CMS :#31#;Serial NSEDB DAL :#32#;Serial NSEDB Supplier Technological Designation :#33#;Serial NSEDB PTS Document Reference :#34#;Serial NSEDB PTS Reference Issue :#83#;Serial NSEDB DDP Document Reference :#84#;Serial NSEDB DDP Reference Issue :#35#;Serial NSEDB State :#76#;Serial NSEDB Calculated Weight Grammes :#77#;Serial NSEDB Estimated Weight Grammes :#81#;Serial NSEDB RFI RFP PTS Guaranteed Weigh Grammes :#36#;Serial NSEDB For ground use only :#37#;Serial NSEDB Serialisation :#38#;Serial NSEDB Acceptance sheet weighed weight :#39#;Serial NSEDB AC/ICD Folder Version :#40#;Serial SUPPLIER FSCM :#41#;Serial SUPPLIER Name :#42#;Serial Model Reference :#43#;Serial Model Maturity :#44#;MP :#45#;MOD :#46#;Development FIN-DS CA :#47#;Development FIN-DS Name :#48#;Development FIN-DS Purchase Quantity :#49#;Development FIN-DS State :#50#;Development FIN-DS Effectivity :#51#;Development FIN-DS AIR Recorded :#52#;Development FIN-DS Installation Zone :#53#;Development FIN-DS Installation Section :#54#;Development FIN-DS Installation Panel :#55#;Development FIN-DS provisioning type :#56#;Development FIN-DS ANSI Code :#57#;Development FIN-DS Loading type :#58#;Development NSEDB PN :#59#;Development NSEDB CMS :#60#;Development NSEDB DAL :#61#;Development NSEDB Supplier Technological Designation :#62#;Development NSEDB PTS Document Reference :#63#;Development NSEDB PTS Reference Issue :#85#;Development NSEDB DDP Document Reference :#86#;Development NSEDB DDP Reference Issue :#64#;Development NSEDB State :#78#;Development NSEDB Calculated Weight Grammes :#79#;Development NSEDB Estimated Weight Grammes :#82#;Serial NSEDB RFI RFP PTS Guaranteed Weigh Grammes :#65#;Development NSEDB For ground use only :#66#;Development NSEDB Serialisation :#67#;Development NSEDB Acceptance sheet weighed weight :#68#;Development NSEDB AC/ICD Folder Version :#69#;Development SUPPLIER FSCM :#70#;Development SUPPLIER Name :#71#;Development Model Reference :#72#;Development Model Maturity :#73#;SI Reference :#74#;SI State :#75#',
	'V1.0 All FIN, Both Effective FIN-DS (Serial + dev)',
	NULL,
	@AttGroup
)

DROP TABLE #@TMP
DROP TABLE #@INIPARAM