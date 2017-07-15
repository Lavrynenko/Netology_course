------------------------------------------------------------------------------
-----Business Requirement Dossier - PSE Amendment n°1 (Issue 1-5 Report)------
------------------------------------------------------------------------------

-- Create PSE Report Procedure : System Integration

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'sp_SYSTEMINTEGRATION' AND type = 'P')
   DROP PROCEDURE sp_SYSTEMINTEGRATION
GO

CREATE PROCEDURE sp_SYSTEMINTEGRATION
		@MSN VARCHAR(8000), 
		@FINDSTYPE VARCHAR(8000),
		@SIRD VARCHAR(8000),
		@EIRD VARCHAR (8000),
		@INSTSECTION VARCHAR (8000),
		@INSTZONE VARCHAR (8000),
		@PANEL VARCHAR (8000),
		@OBS VARCHAR(8000),
		@OBSPSSI  VARCHAR(8000),
		@SECTIONPSSI  VARCHAR(8000)
	AS
	

DECLARE @SQLPSS VARCHAR(8000)
DECLARE @SQLPSSSI VARCHAR(8000)
--------------------------
--------- PSS ------------
--------------------------
CREATE TABLE #@PSS (
	[BWTPARTNUMBER] [varchar] (32) ,
	[IDA2A2] [int] NULL ,
	[BNAME] [varchar] (60) NULL,
	[DSMSNList] [varchar] (8000) NULL,
	[STATUS] [varchar] (200) NULL,
	[FINCI_Id] [varchar] (32) NULL,
	[FINCI_Description] [varchar] (54) NULL,
	[FINCI_Category] [varchar] (200) NULL,
	[FINCI_SFE/BFE_catalogue] [varchar] (200) NULL,
	[FINCI_Functional_Designation] [varchar] (54) NULL,
	[FINCI_Def_Resp_OBS] [varchar] (50) NULL,
	[FINCI_Def_Resp_FocPoint] [varchar] (50) NULL,
	[FINCI_Def_RespNatco] [varchar] (50) NULL,
	[FINCI_Install_RespSite] [varchar] (50) NULL,
	[FINCI_Prov_RespSite] [varchar] (50) NULL,
	[FINCI_Delivery_Design_Resp] [varchar] (50) NULL,
	[FINCI_Install_Design_RespOBS] [varchar] (50) NULL,
	[Circuit_Letter_Id] [varchar] (2) NULL,
	[Sub_ATADS_Id] [varchar] (32) NULL,
	[Sub_ATADS_Title] [varchar] (8000) NULL,
	[FINDS_id] [varchar] (32) NULL,
	[FINDS_Purchase_Qty] [nvarchar] (384) NULL,
	[FINDS_Description] [varchar] (54) NULL,
	[FINDS_Category] [varchar] (200) NULL,
	[FINDS_Type_Equipment] [varchar] (200) NULL,
	[FINDS_Label] [varchar] (54) NULL,
	[FINDS_Basic/Optional] [varchar] (200) NULL,
	[FINDS_Provisioning_Type(SFE/BFE)] [varchar] (200) NULL,
	[FINDS_Section] [varchar] (9) NULL,
	[FINDS_Access_Door/Panel] [varchar] (8000) NULL,
	[FINDS_Status] [varchar] (200) NULL,
	[FINDS_Weight_Status] [varchar] (200) NULL,
	[FINDS_Type] [varchar] (200) NULL,
	[CIN_Stacking_Requirement] [varchar] (8000) NULL,
	[FINDS_Effectivity] [varchar] (8000) NULL,
	[FINDS_CA_Code] [varchar] (8000) NULL,
	[Part_number] [varchar] (15) NULL,
	[CMS_calculated_by_system] [varchar] (20) NULL,
	[Supplier_Techno_Designation] [varchar] (54) NULL,
	[FSCM] [varchar] (200) NULL,
	[Equipment_State] [varchar] (200) NULL,
	[PTS_Document_Reference] [varchar] (30) NULL,
	[PTS_Reference_Issue] [varchar] (20) NULL,
	[Aircraft_Zone_Id] [varchar] (200) NULL,
	[Aircraft_Zone_Designation] [varchar] (30) NULL,
	[Aircraft_Zone_Description] [varchar] (60) NULL,
	[Aircraft_Panel_Id] [varchar] (200) NULL,
	[Aircraft_Panel_Designation] [varchar] (30) NULL,
	[Aircraft_Panel_Description] [varchar] (60) NULL,
	[Mixed_Weight] [float] NULL ,
	[PSE_CMIT] [varchar] (3) NULL,
	[PSE_ACMT] [varchar] (2) NULL,
	[PSE_ATA] [varchar] (2) NULL,
	[E3DM_CAD_Storage_at] [datetime] NULL ,
	[E3DM_Invariant_Reference] [varchar] (14) NULL,
	[E3DM_Equipment_Model_Counter_Ref] [varchar] (14) NULL,
	[E3DM_Equipment_Model_State] [varchar] (200) NULL,
	[E3DM_Model_Maturity] [varchar] (200) NULL,
	[E3DM_Model_Description] [varchar] (40) NULL,
	[E3DM_CAD_Validation_On] [datetime] NULL ,
	[E3DM_EIRD_Reference] [varchar] (30) NULL,
	[E3DM_Comments(APEDD_EIRD_Ref)] [varchar] (255) NULL,
	[E3DM_Equip_Model_Manager] [varchar] (200) NULL,
	[ATA] [varchar] (10) NULL 
) ON [PRIMARY]

SET @SQLPSS = '
	INSERT INTO #@PSS
	SELECT
		*
	FROM
		OPENQUERY(R_PSS_A400M, ''
			SELECT
				tmpsv_FIN.BWTPARTNUMBER,
				tmpsv_ACERequirement.IDA2A2,
				tmpsv_DS.BNAME,
				tmpsv_DSMSNRANGE.DSMSNList,
				tmpsv_FIN.STATUS,
				SUBSTRING(tmpsv_FIN.BWTPARTNUMBER, 2, LEN(tmpsv_FIN.BWTPARTNUMBER) - 1) AS [FINCI_Id],
				tmpsv_FIN.DESCRIPTION AS [FINCI_Description],
				tmpsv_FIN.FINCATEGORY AS [FINCI_Category],
				tmpsv_FIN.SFEBFECATALOG AS [FINCI_SFE/BFE_catalogue],
				tmpsv_FIN.FUNCTIONALDESIGNATION AS [FINCI_Functional_Designation],
				tmp_MSNDefinition.[FIN-CI OBS] AS [FINCI_Def_Resp_OBS],
				tmp_MSNDefinition.[FIN-CI Design Focal Point] AS [FINCI_Def_Resp_FocPoint],
				tmp_MSNDefinition.[FIN-CI Definition Resp. NatCo] AS [FINCI_Def_RespNatco],
				tmp_MSNDefinition.[FIN-CI Installation Site] AS [FINCI_Install_RespSite],
				tmp_MSNDefinition.[FIN-CI Provisioning Site] AS [FINCI_Prov_RespSite],
				tmp_MSNDefinition.[FIN-CI Installation Design Resp] AS [FINCI_Delivery_Design_Resp],
				tmp_MSNDefinition.[FIN-CI OBS Installation] AS [FINCI_Install_Design_RespOBS],
				SUBSTRING(tmpsv_FIN.BWTPARTNUMBER, 6, 2) AS [Circuit_Letter_Id],
				SUBSTRING(tmpsv_ATA.BWTPARTNUMBER, 2, LEN(tmpsv_ATA.BWTPARTNUMBER) - 1) AS [Sub_ATADS_Id],
				REPLACE(REPLACE(tmpsv_ATA.Title, CHAR(13), ''''''''), CHAR(10) , '''''''') AS [Sub_ATADS_Title],
				SUBSTRING(tmpsv_DS.BWTPARTNUMBER, 2, LEN(tmpsv_DS.BWTPARTNUMBER) - 1) AS [FINDS_id],
				tmpsv_DS.PURCHASEQTY AS [FINDS_Purchase_Qty],
				tmpsv_DS.[DESCRIPTION] AS [FINDS_Description],
				tmpsv_DS.BCATEGORY AS [FINDS_Category],
				tmpsv_DS.TYPEEQ AS [FINDS_Type_Equipment],
				tmpsv_DS.LABEL AS [FINDS_Label],
				tmpsv_DS.BASICOPTIONAL AS [FINDS_Basic/Optional],
				tmpsv_DS.PROVISIONINGTYPE AS [FINDS_Provisioning_Type(SFE/BFE)],
				tmpsv_DS.INSTRPROCEDURE AS [FINDS_Section],
				REPLACE(REPLACE(tmpsv_DS.ACCESSDOOR, CHAR(13), ''''''''), CHAR(10) , '''''''') AS [FINDS_Access_Door/Panel],
				tmpsv_DS.STATESTATE AS [FINDS_Status],
				tmpsv_DS.weightStatus AS [FINDS_Weight_Status],
				tmpsv_DS.DSTYPE AS [FINDS_Type],
				tmpsv_STACKCONC.STACKING AS [CIN_Stacking_Requirement],
				tmpsv_DSMSNRANGE.RANGE AS [FINDS_Effectivity],
				tmpsv_DS.SKETCH AS [FINDS_CA_Code],
				tmpsv_PN.PARTNUMBER AS [Part_number],
				tmpsv_PN.CMS AS [CMS_calculated_by_system],
				tmpsv_PN.EQUIPMENTDESIGNATION AS [Supplier_Techno_Designation],
				tmpsv_PN.FSCM AS [FSCM],
				tmpsv_PN.STATESTATE AS [Equipment_State],
				tmpsv_PN.PTSREF AS [PTS_Document_Reference],
				tmpsv_PN.PTSISSUE AS [PTS_Reference_Issue],
				ZONE.UNIQUEID AS [Aircraft_Zone_Id],
				ZONE.DESIGNATION AS [Aircraft_Zone_Designation],
				ZONE.DESCRIPTION AS [Aircraft_Zone_Description],
				PANEL.UNIQUEID AS [Aircraft_Panel_Id],
				PANEL.DESIGNATION AS [Aircraft_Panel_Designation],
				PANEL.DESCRIPTION AS [Aircraft_Panel_Description],
				CASE
					WHEN ISNULL(tmpsv_PN.WEIGHTWEIGHTGRAMMES, '''''''') <> '''''''' AND ISNULL(tmpsv_PN.WEIGHTWEIGHTGRAMMES, '''''''') <> ''''0'''' THEN ((CAST (tmpsv_PN.WEIGHTWEIGHTGRAMMES as FLOAT))*(CAST (tmpsv_DS.PURCHASEQTY as FLOAT)))
					WHEN ISNULL(tmpsv_PN.CALCULATEDWEIGHT, '''''''') <> '''''''' AND ISNULL(tmpsv_PN.CALCULATEDWEIGHT, '''''''') <> ''''0''''  THEN (CAST (tmpsv_PN.CALCULATEDWEIGHT as FLOAT) * CAST (tmpsv_DS.PURCHASEQTY as FLOAT))
					WHEN ISNULL(tmpsv_PN.GUARANTEEDWEIGHTGRAMMES, '''''''') <> '''''''' AND ISNULL(tmpsv_PN.GUARANTEEDWEIGHTGRAMMES, '''''''') <> ''''0''''  THEN (CAST (tmpsv_PN.GUARANTEEDWEIGHTGRAMMES as FLOAT) * CAST (tmpsv_DS.PURCHASEQTY as FLOAT))
					WHEN ISNULL(tmpsv_PN.ACCEPTABLETARGETWEIGHT, '''''''') <> '''''''' AND ISNULL(tmpsv_PN.ACCEPTABLETARGETWEIGHT, '''''''') <> ''''0''''  THEN (CAST (tmpsv_PN.ACCEPTABLETARGETWEIGHT as FLOAT) * CAST (tmpsv_DS.PURCHASEQTY as FLOAT))
					ELSE (CAST (tmpsv_PN.ESTIMATEDWEIGHTGRAMMES as FLOAT) * CAST (tmpsv_DS.PURCHASEQTY as FLOAT))
				END [Mixed_Weight],
				LEFT(tmp_MSNDefinition.[FIN-CI OBS],3) AS [PSE_CMIT],
				LEFT(tmp_MSNDefinition.[FIN-CI OBS],2) AS [PSE_ACMT],
				LEFT(SUBSTRING(tmpsv_ATA.BWTPARTNUMBER, 2, LEN(tmpsv_ATA.BWTPARTNUMBER) - 1) ,2) AS [PSE_ATA],
				tmpsv_equipmentmodel.cadstorageon AS [E3DM_CAD_Storage_at],
				tmpsv_equipmentmodel.invariantref AS [E3DM_Invariant_Reference],
				tmpsv_EQUIPMENTMODEL.CounterRef AS [E3DM_Equipment_Model_Counter_Ref],
				CASE 
					when tmpsv_equipmentmodel.STATESTATE=''''LEVEL1'''' THEN ''''Accepted By Equipment Model Manager''''
					when tmpsv_equipmentmodel.STATESTATE=''''LEVEL2'''' then ''''Accepted By System Specialist''''
					when tmpsv_equipmentmodel.STATESTATE=''''WIP'''' then ''''Work In Progress''''
					when tmpsv_equipmentmodel.STATESTATE=''''INVALID'''' then ''''Invalid''''
					else tmpsv_equipmentmodel.STATESTATE 
				END AS [E3DM_Equipment_Model_State],
				tmpsv_equipmentmodel.MODELMATURITY AS [E3DM_Model_Maturity],
				tmpsv_equipmentmodel.equipmentmoddesc AS [E3DM_Model_Description],
				tmpsv_equipmentmodel.cadvalidationon AS [E3DM_CAD_Validation_On],
				tmpsv_equipmentmodel.EIRDRef AS [E3DM_EIRD_Reference],
				tmpsv_equipmentmodel.Comments AS [E3DM_Comments(APEDD_EIRD_Ref)],
				tmpsv_equipmentmodel.modelmanager AS [E3DM_Equip_Model_Manager],
				tmp_MSNDefinition.ATA AS [ATA]
			FROM
				tmp_MSNDefinition 
				JOIN tmpsv_ATA ON tmpsv_ATA.ATA = tmp_MSNDefinition.ATA
				JOIN tmpsv_FIN ON tmpsv_FIN.BIDA2A2 = tmp_MSNDefinition.[FIN-CI BIDA2A2]
				JOIN tmpsv_DS ON tmpsv_DS.BIDA2A2 = tmp_MSNDefinition.[Serial FIN-DS BIDA2A2]
				JOIN tmpsv_PN ON tmpsv_PN.BIDA2A2 = tmpsv_DS.IDPN
				LEFT JOIN tmpsv_ACERequirement ON tmpsv_ACERequirement.IDA3D4 = tmpsv_DS.IDLO
				LEFT JOIN tmpsv_STACKCONC ON tmpsv_STACKCONC.IDA2A2 = tmpsv_ACERequirement.IDA2A2
				LEFT JOIN tmpsv_DSMSNRANGE ON tmpsv_DSMSNRANGE.BIDA2A2 = tmpsv_DS.BIDA2A2
				LEFT JOIN tmpsv_LOCATION AS PANEL ON tmpsv_DS.PANEL = PANEL.IDA2A2
				LEFT JOIN tmpsv_LOCATION AS ZONE ON tmpsv_DS.ZONE = ZONE.IDA2A2
				LEFT JOIN tmpsv_ANSICODE ON tmpsv_DS.ANSICODE = tmpsv_ANSICODE.IDA2A2
				LEFT JOIN tmpsv_EQUIPMENTMODEL ON tmpsv_EQUIPMENTMODEL.IDA2A2 = tmpsv_PN.IDMODEL
			WHERE tmp_MSNDefinition.MSN = ''''' + @MSN + '''''
		'')
'

EXECUTE (@SQLPSS)

---------------------------
--------- PSSI ------------
---------------------------
CREATE TABLE #@R_PSSI (
	[FINCI] [varchar] (32) ,
	[ADAPDS] [varchar] (32) NULL ,
	[ADAPATA] [varchar] (60) NULL,
	[ADAPSECTION] [varchar] (8000) NULL,
	[ADAPOBS] [varchar] (200) NULL,
	[CACC_CI] [varchar] (200) NULL,
	[CACC_CODE] [varchar] (32) NULL,
	[CACC_DESIGNATION] [varchar] (54) NULL,
	[CADNODE] [varchar] (200) NULL,
	[XG] [varchar] (200) NULL,
	[YG] [varchar] (54) NULL,
	[ZG] [varchar] (50) NULL
) ON [PRIMARY]

SET @SQLPSSSI = '
	INSERT INTO #@R_PSSI
	SELECT 
		*
	FROM
	
		OPENQUERY(R_PSSSI_A400M,''
			SELECT 
	 			PSSSIFINCI.FINCI,
	 			O_ADAPDS.ADAPDSNUMBER ADAPDS,
	    			SUBSTR(O_ADAPDS.ADAPDSNUMBER, 2, 3) ADAPATA,
	   			O_DRWST.LOCATION ADAPSECTION,
	    			O_ADAPDS.TEAM ADAPOBS,
				L_CACCCI_CACCLO.A_CACCCINUMBER,
	 			DN_CA_CI_COMPOSITION_LAST.CANUMBER CACC_CODE,
	 			O_CACCCODE.DESIGNATION CACC_DESIGNATION,
	 			PSSSICADNODE.CADNODE,
	  			PSSSICADNODE.XG,
	  			PSSSICADNODE.YG,
	  			PSSSICADNODE.ZG
			FROM
				(
					SELECT
						''''MQ'''' 
						||REPLACE(
							SUBSTR(CHILDNUMBER, 2, 6) ||
							CASE WHEN RTRIM(SUBSTR(CHILDNUMBER, 8, 3)) IS NULL THEN ''''   '''' ELSE LPAD(RTRIM(SUBSTR(CHILDNUMBER, 8, 3)), 3, ''''0'''') END ||
							CASE WHEN RTRIM(SUBSTR(CHILDNUMBER, 11, 3)) IS NULL THEN ''''   '''' ELSE RPAD(RTRIM(SUBSTR(CHILDNUMBER, 11, 3)), 3, ''''0'''') END ||    
							CASE WHEN SUBSTR(CHILDNUMBER, 14, 1) IS NULL THEN '''' '''' ELSE SUBSTR(CHILDNUMBER, 14, 1) END
						, '''' '''', ''''0'''') AS FINCI,
						ADAPLONUMBER,
						ADAPCINUMBER				
					FROM
						DN_ADAPCI_COMPOSITION_LAST
					WHERE 
						  CHILDTYPE = ''''FINCI''''
				) PSSSIFINCI,
				O_IXOFFEFF,
				DN_CA_CI_COMPOSITION_LAST,
				L_CACCCI_CACCLO,
				O_CACCCODE,
				L_ADAPLO_ADAPDS,
				DN_LAST_ISSUE_ADAPDS,
				O_ADAPDS,
	 			L_ADAPDS_DRWST,
	 			O_DRWST,
				DN_LAST_ISSUE_DRWST,	
				(
					SELECT DISTINCT
						SUBSTR(L_ADAPDS_CADNODE_POSITION.B_CADNODENUMBER, 1, 15) AS CADNODE,
						TRANSLATION_0 * 1000 XG,
	 					TRANSLATION_1 * 1000 YG,
	 					TRANSLATION_2 * 1000 ZG
					FROM
						L_ADAPDS_CADNODE_POSITION
				) PSSSICADNODE
			WHERE
				PSSSIFINCI.FINCI = PSSSICADNODE.CADNODE(+)
				AND PSSSIFINCI.ADAPLONUMBER = O_IXOFFEFF.LONUMBER
				AND O_IXOFFEFF.EFFTYPE = ''''MSN''''
				AND O_IXOFFEFF.RANGEFROM <= ''''' + @MSN + '''''
				AND O_IXOFFEFF.RANGETO >= ''''' + @MSN + '''''
				AND DN_CA_CI_COMPOSITION_LAST.CINUMBER = PSSSIFINCI.ADAPCINUMBER
				AND DN_CA_CI_COMPOSITION_LAST.LONUMBER = L_CACCCI_CACCLO.B_CACCLONUMBER (+)
				AND O_CACCCODE.CACCCODE = DN_CA_CI_COMPOSITION_LAST.CANUMBER
				AND PSSSIFINCI.ADAPLONUMBER = L_ADAPLO_ADAPDS.A_ADAPLONUMBER
				AND L_ADAPLO_ADAPDS.B_ADAPDSNUMBER = DN_LAST_ISSUE_ADAPDS.ADAPDSNUMBER
				AND DN_LAST_ISSUE_ADAPDS.ADAPDSNUMBER = O_ADAPDS.ADAPDSNUMBER
				AND DN_LAST_ISSUE_ADAPDS.RELEASEDVERSIONITERATION = O_ADAPDS.VERSIONITERATION
	 			AND O_ADAPDS.ADAPDSNUMBER = L_ADAPDS_DRWST.A_ADAPDSNUMBER
	 			AND O_ADAPDS.ADAPDSISSUEINDEX = L_ADAPDS_DRWST.A_ADAPDSISSUEINDEX
	 			AND O_DRWST.DRAWINGSETNUMBER = L_ADAPDS_DRWST.B_DRAWINGSETNUMBER
	 			AND O_DRWST.DRWSTISSUEINDEX = L_ADAPDS_DRWST.B_DRWSTISSUEINDEX
				AND DN_LAST_ISSUE_DRWST.DRAWINGSETNUMBER = O_DRWST.DRAWINGSETNUMBER
				AND DN_LAST_ISSUE_DRWST.RELEASEDVERSIONITERATION = O_DRWST.VERSIONITERATION
	'')
'

EXECUTE(@SQLPSSSI)

---------------------------------
------ First Basic MP -----------
---------------------------------

SELECT DISTINCT
	CIN_APPLIED.CIN,
	CIN_APPLIED.IDA3B5,
	T_OPTION.option_name AS OPTIONNAME,
	T_OPTION.option_reference AS OPTIONREF	
INTO 
	#@FIRSTBASICMP
FROM
	T_MOD
	JOIN OPENQUERY(R_PSS_A400M, '
		SELECT
			tmpsv_ACECIN.MODNUMBER + ''-'' + tmpsv_ACECIN.MPNUMBER CIN,
			tmpsv_CINSTACKREQLINK.IDA3B5,
			tmpsv_ACECIN.MODNUMBER
		FROM
			tmpsv_ACECIN
			JOIN tmpsv_CINSTACKREQLINK ON tmpsv_CINSTACKREQLINK.IDA3A5 = tmpsv_ACECIN.IDA2A2
	') AS CIN_APPLIED ON CIN_APPLIED.MODNUMBER = T_MOD.modreference
	LEFT JOIN T_LINK_MOD_OPTION ON T_LINK_MOD_OPTION.mod_option_mod_idr = T_MOD.id_mod
	LEFT JOIN T_OPTION ON T_OPTION.id_option = T_LINK_MOD_OPTION.mod_option_option_idr


----------------------------------------
----- Building Excel Fields Zone -------
----------------------------------------

SELECT
	#@PSS.[FINCI_Id],
	#@PSS.[FINCI_Description],
	#@PSS.[FINCI_Category],
	#@PSS.[FINCI_SFE/BFE_catalogue],
	#@PSS.[FINCI_Functional_Designation],
	#@PSS.[FINCI_Def_Resp_OBS],
	#@PSS.[FINCI_Def_Resp_FocPoint],
	#@PSS.[FINCI_Def_RespNatco],
	#@PSS.[FINCI_Prov_RespSite],
	#@PSS.[FINCI_Delivery_Design_Resp],
	#@PSS.[FINCI_Install_RespSite],
	#@PSS.[FINCI_Install_Design_RespOBS],
	#@PSS.[Circuit_Letter_Id],
	#@PSS.[Sub_ATADS_Id],
	#@PSS.[Sub_ATADS_Title],
	#@PSS.[FINDS_id],
	#@PSS.[FINDS_Purchase_Qty],
	#@PSS.[FINDS_Description],
	#@PSS.[FINDS_Category],
	#@PSS.[FINDS_Type_Equipment],
	#@PSS.[FINDS_Label],
	#@PSS.[FINDS_Basic/Optional],
	#@PSS.[FINDS_Provisioning_Type(SFE/BFE)],
	#@PSS.[FINDS_Section],
	#@PSS.[FINDS_Access_Door/Panel],
	#@PSS.[FINDS_Status],
	#@PSS.[FINDS_Weight_Status],
	#@PSS.[FINDS_Type],
	#@FIRSTBASICMP.CIN AS [First_Basic_CIN],
    	#@FIRSTBASICMP.OPTIONREF AS [Option_Reference],
    	#@FIRSTBASICMP.OPTIONNAME AS [Option_Name],
	#@PSS.[CIN_Stacking_Requirement],
	#@PSS.[FINDS_Effectivity],
	#@PSS.[Part_number],
	#@PSS.[CMS_calculated_by_system],
	#@PSS.[Supplier_Techno_Designation],
	#@PSS.[FSCM],
	#@PSS.[Equipment_State],
	#@PSS.[PTS_Document_Reference],
	#@PSS.[PTS_Reference_Issue],
	#@PSS.[Aircraft_Zone_Id],
	#@PSS.[Aircraft_Zone_Designation],
	#@PSS.[Aircraft_Zone_Description],
	#@PSS.[Aircraft_Panel_Id],
	#@PSS.[Aircraft_Panel_Designation],
	#@PSS.[Aircraft_Panel_Description],
	#@PSS.[Mixed_Weight],
	-- Cette colonne ne doit plus apparaitre pour le moment sur le report
	--'In process' AS [DBT_Code],  
	-- En attente d'avoir les positions réelles et non pas les positions liées au père 
	'In process' AS [PSSI_Aircraft_Position(mm)_X],	
	-- #@R_PSSI.XG AS [PSSI_Aircraft_Position(mm)_X],
	'In process' AS [PSSI_Aircraft_Position(mm)_Y],
	-- #@R_PSSI.YG AS [PSSI_Aircraft_Position(mm)_Y],
	'In process' AS [PSSI_Aircraft_Position(mm)_Z],
	-- #@R_PSSI.ZG AS [PSSI_Aircraft_Position(mm)_Z],
	#@PSS.[PSE_ACMT],
	#@PSS.[PSE_CMIT],
	#@PSS.[PSE_ATA],
	#@R_PSSI.ADAPSECTION AS [PSSI_ADAPDS_ATA_Section],
	#@R_PSSI.ADAPATA AS [PSSI_ADAPDS_ATA_Zone],
	#@R_PSSI.CACC_DESIGNATION AS [PSSI_CACC_Designation],
	#@R_PSSI.CACC_CODE AS [PSSI_CACC_Code],
	#@PSS.[FINDS_CA_Code] AS [PSV_CACC_Code],
	#@R_PSSI.CACC_CI AS [PSSI_CA/CCCI],
	#@R_PSSI.ADAPDS AS [PSSI_ADAPDS],
	#@R_PSSI.ADAPOBS AS [PSSI_ADAPDS_Install_Design_OBS],
	#@R_PSSI.CADNODE AS [PSSI_CadNode],
	#@PSS.[E3DM_CAD_Storage_at],
	#@PSS.[E3DM_Invariant_Reference],
	#@PSS.[E3DM_Equipment_Model_Counter_Ref],
	#@PSS.[E3DM_Equipment_Model_State],
	#@PSS.[E3DM_Model_Maturity],
	#@PSS.[E3DM_Model_Description],
	#@PSS.[E3DM_CAD_Validation_On],
	#@PSS.[E3DM_EIRD_Reference],
	#@PSS.[E3DM_Comments(APEDD_EIRD_Ref)],
	#@PSS.[E3DM_Equip_Model_Manager],
	-- De la forme SIRD Ref / SIRD Designation, ce champs est tronqué a 50 caracteres du la taille de la colonne
	-- Probleme a resoudre pour la prochaine version
	R_ATA.SIRD AS [SIRD],
	R_FIN_CI.weight_location AS [PSE External/Internal Location]
INTO
	#@WeightReport
FROM
	#@PSS 
	JOIN R_FIN_CI ON R_FIN_CI.fin_ci_sv = #@PSS.BWTPARTNUMBER 
	LEFT JOIN R_ATA ON R_ATA.ATACode = #@PSS.ATA
	LEFT JOIN #@FIRSTBASICMP ON #@FIRSTBASICMP.IDA3B5 = #@PSS.IDA2A2
	LEFT JOIN #@R_PSSI ON #@R_PSSI.FINCI = 'MQ' +  
		REPLACE(
			LEFT(#@PSS.BNAME, 6) + 
			REPLICATE('0', 3 - LEN(RTRIM(SUBSTRING(#@PSS.BNAME, 7, 3)))) + RTRIM(SUBSTRING(#@PSS.BNAME, 7, 3)) + 
			RTRIM(SUBSTRING(#@PSS.BNAME, 10, 3))+ REPLICATE('0', 3 - LEN(RTRIM(SUBSTRING(#@PSS.BNAME, 10, 3)))) + 
			CASE WHEN SUBSTRING(#@PSS.BNAME, 13, 1) = '' THEN ' ' ELSE SUBSTRING(#@PSS.BNAME, 13, 1) END
		, ' ', '0')
WHERE
	ISNULL(#@PSS.[FINDS_Type_Equipment], '') <> 'software'
	AND #@PSS.[FINDS_Type] = 'serial'
	AND #@PSS.STATUS <> 'DELETED'
	AND #@PSS.STATUS <> 'INVALID'
	AND #@PSS.[FINDS_Status] <> 'DELETED'
	AND #@PSS.[FINDS_Status] <> 'INVALID'
	AND #@PSS.[Equipment_State] <> 'DELETED'
	AND #@PSS.[Equipment_State] <> 'INVALID'
	-- Exclusion des objets software
	AND #@PSS.[FINCI_Category] <> 'LRU SOFTWARE'
	AND
	(
		@OBS = ''
		OR #@PSS.[FINCI_Def_Resp_OBS] LIKE '%' + @OBS + '%'
	)	
	AND
	(
		@FINDSTYPE = ''
		OR #@PSS.[FINDS_Type] LIKE '%' + @FINDSTYPE + '%'
	)	
	AND
	(
		@SIRD = ''
		OR R_ATA.SIRD LIKE '%' +   @SIRD  + '%'
	)
	AND
	(
		@EIRD = ''
		OR #@PSS.[E3DM_EIRD_Reference]  LIKE '%' +   @EIRD  + '%'
	)
	AND
	(
		@INSTSECTION = ''
		OR #@PSS.[FINDS_Section]  LIKE '%' +   @INSTSECTION  + '%'
	)	
	AND
	(
		@INSTZONE = ''
		OR #@PSS.[Aircraft_Zone_Id]   LIKE '%' +   @INSTZONE  + '%'
	)	
	AND
	(
		@PANEL = ''
		OR #@PSS.[Aircraft_Panel_Id]   LIKE '%' +   @PANEL  + '%'
	)	
	AND 
	(
		@OBSPSSI = '' 
		OR (#@R_PSSI.ADAPOBS LIKE '%' + @OBSPSSI + '%')
	)
   	AND 
	(
		@SECTIONPSSI = ''
		 OR (#@R_PSSI.ADAPSECTION LIKE '%'  + @SECTIONPSSI + '%')
	)


--------------------------
----- Get all data -------
--------------------------
SELECT 
	*
FROM
	#@WeightReport
ORDER BY
	FINCI_Id
GO


-- Delete temporary tables from procedure
/*	DROP TABLE #@MSN
	DROP TABLE #@FINDSTYPE
	DROP TABLE #@ATA
	DROP TABLE #@EIRD
	DROP TABLE #@INSTSECTION
	DROP TABLE #@INSTZONE
	DROP TABLE #@PANEL
	DROP TABLE #@OBS
	DROP TABLE #@OBSPSSI
	DROP TABLE #@OBSPSE
	DROP TABLE #@SECTIONPSSI*/


---------------------------------------
------------ T_DBActions---------------
---------------------------------------	

-- Delete the appropriate row from T_DBActions
DELETE 
	T_DBActions 
WHERE 
	label = 'System & Installation Designers report for System Integration <em>(SyFAR, SyDDR & Installation Section, Zone, Panel & CDBT Report)</em>'

-- Get the Report Group id
DECLARE
	@AttGroup INT

SELECT 
	@AttGroup = REPORT_GROUP_id 
FROM 
	T_REPORT_GROUP 
WHERE 
	REPORT_GROUP_LABEL = 'System Integration'

-- Add report in PSE (delete, next insert into)
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
	'System & Installation Designers report for System Integration <em>(SyFAR, SyDDR & Installation Section, Zone, Panel & CDBT Report)</em>',
	'',
	'Provide installation location and reference data for <strong>System Hardware Mechanical Integration</strong>.',
	'System_integration.php',
	'Enter MSN :#MSN;   
	Enter FINCI Definition Responsability OBS (From Primes System): #&OBS:select BNAME from tmpsv_OBS order by BNAME;
	Enter Installation Section (From Primes System): #&SECTION:select choicevalue from t_choicelist where choicelist=''Sections'' order by 1; 
	Enter Installation Zone (From Primes System): #&Zone:select Uniqueid+''/''+designation from tmpsv_location where loctype=''Zone'';
	Enter Installation Panel (From Primes System): #&PANEL:select Uniqueid from tmpsv_location where loctype=''Panel'';   
	Enter SIRDocument reference : #SIRD;   
	Enter EIRDocument reference : #EIRD; 
	Enter FINCI Installation Design Responsibility OBS (From Primes System):#&OBSPSE:select BNAME from tmpsv_OBS order by BNAME;
	Enter FINCI Installation Responsibility OBS (From Primes SSI)(in progress, no filter): #OBSPSSI;  
	Enter Installation Section (From Primes SSI): #SECTIONPSSI',
	'The SyDDR & Installation Section, Zone, Panel Report is associated to an aircraft effectivity to minimise the report size. 
	It is based on databank attribute requested for SyDDR using APEDD extract with additional attributes introduced by the 
	management into configuration.<br>This report will be used also for SyFAR.<br>
	<p>The Basic aircraft (CSA) is the same for each aircraft. It is recommended to choose an effectivity after the first EIS to avoid instrumented A/Cs.<br>For Option 
	extraction, it is necessary to prior refer to your TLAR Option/Aircraft customisation table to find the right effectivity.<br>
	If one effectivity is mandatory for the extraction, all the other fields  can be empty and your generated report will provide 
	you with all installation  data information for one effectivity.<br>This database is live, and does not represent any specific 
	baseline. Installation Baseline data is managed by exporting and <strong>capturing into an independent report as defined in the 
	respective System Development Plans.<br>Just the SERIAL are listed (based on FINDS type selection). For development solution see consolidated and global reports.<br></p>
	<p>By entering only the MSN, you will have the complete report. Take care that some fields like EIRD and SIRD that are not mandatory in Primes System View , could be empty and some line will miss in your report. Please report any found inconsistencies.</p>',
	'MSN',
	@AttGroup
)
