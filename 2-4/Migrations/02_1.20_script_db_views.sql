if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ASSOCIATED_FIN_CI]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[ASSOCIATED_FIN_CI]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[HISTORY_ATA]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[HISTORY_ATA]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[HISTORY_DS]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[HISTORY_DS]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[HISTORY_EQPT]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[HISTORY_EQPT]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.ASSOCIATED_FIN_CI
AS
SELECT     R_FIN_CI_1.FIN AS fin_from, dbo.R_FIN_LINK.id_fin_link AS id_from, dbo.R_FIN_LINK.idr_fin_link AS id_to, R_FIN_CI_2.FIN AS fin_to,  dbo.R_FIN_LINK.link_type
FROM         dbo.R_FIN_LINK INNER JOIN
                      dbo.R_FIN_CI R_FIN_CI_1 ON dbo.R_FIN_LINK.id_fin_link = R_FIN_CI_1.id_fin INNER JOIN
                      dbo.R_FIN_CI R_FIN_CI_2 ON dbo.R_FIN_LINK.idr_fin_link = R_FIN_CI_2.id_fin
UNION
SELECT     dbo.R_FIN_CI.FIN AS fin_from, dbo.R_FIN_LINK.idr_fin_link AS id_from, dbo.R_FIN_LINK.id_fin_link AS id_to, R_FIN_CI_1.FIN AS fin_to,  dbo.R_FIN_LINK.link_type
FROM         dbo.R_FIN_LINK INNER JOIN
                      dbo.R_FIN_CI R_FIN_CI_1 ON dbo.R_FIN_LINK.id_fin_link = R_FIN_CI_1.id_fin INNER JOIN
                      dbo.R_FIN_CI ON dbo.R_FIN_LINK.idr_fin_link = dbo.R_FIN_CI.id_fin

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.HISTORY_ATA
AS
SELECT     ActionType AS histoata_ActionType, ActionDate AS histoata_ActionDate, ActionDesc AS histoata_ActionDesc, RefId AS histoata_RefId
FROM         dbo.T_HISTORY
WHERE     (ActionObject = 'ATA')


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.HISTORY_DS
AS
SELECT     dbo.T_HISTORY.*, ActionType AS histods_ActionType, ActionDesc AS histods_ActionDesc, ActionObject AS histods_ActionObject, RefId AS Expr1, 
                      ActionDate AS Expr2, logon AS Expr3, ObjectReference AS Expr4, ActionData AS Expr5
FROM         dbo.T_HISTORY
WHERE     (ActionObject = 'DS')

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.HISTORY_EQPT
AS
SELECT     ActionType AS histomp_ActionTypeEqt, ActionDesc AS histomp_ActionDescEqt, ActionObject AS histomp_ActionObjectEqt, RefId AS RefId, 
                      ActionDate AS histomp_ActionDateEqt, logon AS histomp_logonEqt, ObjectReference AS histomp_ObjectReferencEqt, ActionData AS histomp_ActionDataEqt
FROM         dbo.T_HISTORY
WHERE     (ActionObject = 'EQUIPMENT')

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_CR]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_CR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_CR_EXPECTED_APPLICABILITY]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_CR_EXPECTED_APPLICABILITY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_Definition_responsibility]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_Definition_responsibility]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_ELA]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_ELA]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_HISTORY_CR]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_HISTORY_CR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_HISTORY_MP]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_HISTORY_MP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_HISTORY_RFC]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_HISTORY_RFC]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_INVOLVED_TEAM_MP]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_INVOLVED_TEAM_MP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_INVOLVED_TEAM_REQ]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_INVOLVED_TEAM_REQ]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_Installation_Design_responsibility]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_Installation_Design_responsibility]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_Installation_responsibility]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_Installation_responsibility]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_MOD_CLOSURE_STAGE0]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_MOD_CLOSURE_STAGE0]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_MOD_CLOSURE_STAGE3]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_MOD_CLOSURE_STAGE3]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_PRS]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_PRS]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_PSS_MODEL]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_PSS_MODEL]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_Provisioning_responsibility]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_Provisioning_responsibility]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_RFC]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_RFC]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_RFC_EXPECTED_APPLICABILITY]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_RFC_EXPECTED_APPLICABILITY]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.V_CR
AS
SELECT     id_request AS id_cr, ChgLeaderCR AS cr_ChgLeaderCR, CMITLeader AS cr_CMITLeader, CROpDate AS cr_CROpDate, CRRefass AS cr_CRRefass, 
                      eRoomStatus AS cr_eRoomStatus, GIMSN1 AS cr_GIMSN1, GIMSN2 AS cr_GIMSN2, GIMSN3 AS cr_GIMSN3, GIMSN4 AS cr_GIMSN4, 
                      GIMSN7 AS cr_GIMSN7, GIPoE AS cr_GIPoE, ImpactOnBrakets AS cr_ImpactOnBrakets, INVModBDateA AS cr_INVModBDateA, 
                      INVModBDateAv AS cr_INVModBDateAv, INVModBDateT AS cr_INVModBDateT, INVTRSfMOinTDateA AS cr_INVTRSfMOinTDateA, Linvold AS cr_Linvold, 
                      PDDesign AS cr_PDDesign, PDImpact AS cr_PDImpact, PDReference AS cr_PDReference, RequestComment AS cr_RequestComment, 
                      RequestReference AS cr_RequestReference, RequestTitle AS cr_RequestTitle, StructureImpact AS cr_StructureImpact, TechLeader AS cr_TechLeader, 
                      UProcCR AS cr_UProcCR, WFStatus AS cr_WFStatus, WireImpactWMorpho AS cr_WireImpactWMorpho, 
                      WireImpactWoMorphoImpact AS cr_WireImpactWoMorphoImpact, GIGenComments AS cr_GIGenComments, KickOffMeeting AS cr_KickOffMeeting, 
                      Request_ATA AS cr_ATA, MODBreakdown AS cr_MODBreakdown, ForecastDate AS cr_ForecastDate, OSTeamComment AS cr_OSTeamComment, 
                      Cluster AS cr_Cluster, BNDYEReviewDate AS cr_BNDYEReviewDate, Rationale AS cr_Rationale, CircuitImpacted AS cr_CircuitImpacted, 
                      NbOfPD AS cr_NbOfPD, PDAvailabilityDate AS cr_PDAvailabilityDate, HarenessTr AS cr_HarenessTr, ImplementationInFAL AS cr_ImplementationInFAL, 
                      EngineeringComment AS cr_EngineeringComment, idr_ata AS cr_idr_ata, PDAchievedDate AS cr_PDAchievedDate, Applicability AS cr_Applicability, 
                      DistributionDate AS cr_DistributionDate, FullCoverDateT AS cr_FullCoverDateT, Request_TickBox_idr AS cr_Request_TickBox_idr, 
                      Prerequisite_File AS cr_Prerequisite_File, GrpLeaderCR AS cr_GrpLeaderCR, ACMTLeaderCR AS cr_ACMTLeaderCR, GIRespSite AS cr_GIRespSite, 
                      EVCRAaDateA AS cr_EVCRAaDateA, EVCRAaDateF AS cr_EVCRAaDateF, EVCRAaDateT AS cr_EVCRAaDateT, EVCRCESDateF AS cr_EVCRCESDateF, 
                      EVCRCESDateT AS cr_EVCRCESDateT, EVCRCESiTDateA AS cr_EVCRCESiTDate, EVCRESiTDateA AS cr_EVCRESiTDateA, 
                      EVCRESADateF AS cr_EVCRESADateF, EVCRESADateT AS cr_EVCRESADateT, GIEqImpacted AS cr_GIEqImpacted, 
                      EVCRCESiTDateA AS cr_EVCRCESiTDateA, ATA24Impact AS cr_ATA24Impact, crStage AS cr_crStage, taskForceFU AS cr_taskForceFU
FROM         dbo.T_REQUEST
WHERE     (typeOfRequest = 'CR')


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.V_CR_EXPECTED_APPLICABILITY
AS
SELECT     id_expectedApplicability AS crEA_id,
idr_request as crEA_idr_request, MSN AS crEA_MSN, std AS crEA_std, indStd AS crEA_indStd, version AS crEA_version, rank AS crEA_rank, 
                      model AS crEA_model, prodRank AS crEA_prodRank, contractualAC AS crEA_contractualAC, fleet AS crEA_fleet, Condition AS crEA_Condition, exception as crEA_exception,
expression as crEA_expression, addOn as crEA_addOn
FROM         dbo.T_EXPECTED_APPLICABILITY
inner join T_REQUEST on T_REQUEST.id_request = T_EXPECTED_APPLICABILITY.idr_request
where T_REQUEST.TypeOfRequest = 'CR'





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE VIEW dbo.V_Definition_responsibility
AS
SELECT  id_responsibility as id_responsibility,
		idr_fin as idr_fin,			
		DefRespNatco as def_DefRespNatco,
 		DesignFocalPoint as def_DesignFocalPoint,
 		OBS as def_OBS,
 		RankFrom as def_RankFrom,
 		RankTo as def_RankTo,
 		StdSiglum as def_StdSiglum,
		Resp_ConfigSet as def_ConfigSet,
 		MsnEffRange as def_Msn
FROM         dbo.T_RESPONSIBILITY
WHERE     (FINRESPONSIBILITY LIKE 'Definition')



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.V_ELA
AS
SELECT     id_ds AS id_ELA, PushBackMax, PushBackOp, StartMax, StartOp, RollMax, RollOp, TakeOffMax, TakeOffOp, ClimbMax, ClimbOp, CruiseMax, CruiseOp,
                       DescentMax, DescentOp, LandingMax, LandingOp, TaxiMax, TaxiOp, SpareMax, SpareOp, EmerConfMax, EmerConfOp, EmerConfOutMax, 
                      EmerConfOutOp, BatConfMax, BatConfOp, GroundServMax, GroundServOp, TurnAround0015Max, TurnAround0015Op, TurnAround1530Max, 
                      TurnAround1530Op, TurnAround3045Max, TurnAround3045Op, TurnAround4560Max, TurnAround4560Op, TurnAround6075Max, TurnAround6075Op, 
                      TurnAround7590Max, TurnAround7590Op, TurnAround90105Max, TurnAround90105Op, TurnAround105120Max, TurnAround105120Op, 
                      TurnAround120135Max, TurnAround120135Op, TurnAround135150Max, TurnAround135150Op
FROM         dbo.R_FIN_DS
WHERE     (ds_type = 4)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.V_HISTORY_CR
AS
SELECT     ActionType AS histocr_ActionType, ActionDesc AS histocr_ActionDesc, ActionObject AS histocr_ActionObject, RefId AS histocr_RefId, 
                      ActionDate AS histocr_ActionDate, logon AS histocr_logon, ObjectReference AS histocr_ObjectReferenc, ActionData AS histocr_ActionData
FROM         dbo.T_HISTORY
WHERE     (ActionObject = 'CR')


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.V_HISTORY_MP
AS
SELECT     ActionType AS histomp_ActionType, ActionDesc AS histomp_ActionDesc, ActionObject AS histomp_ActionObject, RefId AS histomp_RefId, 
                      ActionDate AS histomp_ActionDate, logon AS histomp_logon, ObjectReference AS histomp_ObjectReferenc, ActionData AS histomp_ActionData
FROM         dbo.T_HISTORY
WHERE     (ActionObject = 'MP')



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.V_HISTORY_RFC
AS
SELECT     ActionType AS historfc_ActionType, ActionDesc AS historfc_ActionDesc, ActionObject AS historfc_ActionObject, RefId AS historfc_RefId, 
                      ActionDate AS historfc_ActionDate, logon AS historfc_logon, ObjectReference AS historfc_ObjectReferenc, ActionData AS historfc_ActionData
FROM         dbo.T_HISTORY
WHERE     (ActionObject = 'RFC')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.V_INVOLVED_TEAM_MP
	AS
	SELECT     id_itmp, mp_idr, ACMTImpacted, INVDateT, INVDateF, INVDateA, PRSDateT, PRSDateF, PRSDateA, PRSConfirmationName, PRSComment, 
	                      PRSInvolvementType, Stage3Litige, Stage0SubTrsOfficial, Stage0DrawingOfficial, Status, Issue, trsInvolvementType
	FROM         dbo.T_INVOLVED_TEAM_MP
	WHERE     (NotDisplayed = 0)
	
	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.V_INVOLVED_TEAM_REQ
AS
	SELECT     
		id_itreq, request_idr, 
		ACMTImpactedReq, 
		INVESDateT, 
		INVESDateF, 
		INVESDateA, 
		TRSofCRDateT, 
		TRSofCRDateF, 
		TRSofCRDateA, 
		LTFirstApplication, 
	             LTRecurring, 
		LTWorkVolume, 
		LTConfirmationName
	FROM         
		dbo.T_INVOLVED_TEAM_REQ
	WHERE     
		(ReqUnimpacted = 0)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE VIEW dbo.V_Installation_Design_responsibility
AS
SELECT  id_responsibility as id_responsibility,
		idr_fin as idr_fin,					
 		DeliverySite as des_DeliverySite,
 		OBS as des_OBS,
 		RankFrom as des_RankFrom,
 		RankTo as des_RankTo,
 		StdSiglum as des_StdSiglum,
		Resp_ConfigSet as des_ConfigSet,
 		MsnEffRange as des_Msn
FROM         dbo.T_RESPONSIBILITY
WHERE     (FINRESPONSIBILITY LIKE 'Delivery')



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE VIEW dbo.V_Installation_responsibility
AS
SELECT  id_responsibility as id_responsibility,
		idr_fin as idr_fin,					
 		InstallationSite as ins_InstallationSite,
 		FinResponsibility as ins_FinResponsibility,
 		RankFrom as ins_RankFrom,
 		RankTo as ins_RankTo,
 		StdSiglum as ins_StdSiglum,
		Resp_ConfigSet as ins_ConfigSet,
 		MsnEffRange as ins_Msn
FROM         dbo.T_RESPONSIBILITY
WHERE     (FINRESPONSIBILITY LIKE 'Installation')



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.V_MOD_CLOSURE_STAGE0
	AS
	SELECT     id_mod_closure AS id_stage, idr_mp, typeOfStage AS stage0_typeOfStage, modClosureDateT AS stage0_modClosureDateT, 
	                      modClosureDateF AS stage0_modClosureDateF, modClosureDateA AS stage0_modClosureDateA, sysPartStatus AS stage0_sysPartStatus, 
	                      Stage0Delta1 AS stage0_Stage0Delta1, Stage0grtReference AS stage0_Stage0grtReference, Stage0EDES AS stage0_Stage0EDES, 
	                      Stage0EDDnTRS AS stage0_Stage0EDDnTRS, Stage0ISCDinTRS AS stage0_Stage0ISCDinTRS, Stage0SDGPinTRS AS stage0_Stage0SDGPinTRS, 
	                      modClosureComment AS stage0_modClosureComment, ITStatus AS stage0_ITStatus, ITComment AS stage0_ITComment, 
	                      Stage0PDinPDCR AS stage0_Stage0PDinPDCR
	FROM         dbo.T_MOD_CLOSURE_FOLLOWUP
	WHERE     (typeOfStage = 'Stage 0')

	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.V_MOD_CLOSURE_STAGE3
	AS
		SELECT     
			id_mod_closure AS id_stage, 
			idr_mp, typeOfStage AS stage3_typeOfStage, 
			modClosureDateT AS stage3_modClosureDateT, 
			modClosureDateF AS stage3_modClosureDateF, 
			modClosureDateA AS stage3_modClosureDateA, 
			sysPartStatus AS stage3_sysPartStatus, 
			modClosureComment AS stage3_modClosureComment, 
			Stage3ModClosed AS stage3_Stage3ModClosed, 
			Stage3MaturityMS4 AS stage3_Stage3MaturityMS4, 
			Stage3DsReleased AS stage3_Stage3DsReleased, 
			Stage3GtrPerformed AS stage3_Stage3GtrPerformed, 
			Stage3Interchange AS stage3_Stage3Interchange, 
			Stage3TdOfficial AS stage3_Stage3TdOfficial, 
			ITStatus AS stage3_ITStatus, 
			ITComment AS stage3_ITComment, 
			Stage3EquipLitige AS stage3_Stage3EquipLitige, 
			Stage3MeansofComp AS stage3_Stage3MeansofComp
		FROM         
			dbo.T_MOD_CLOSURE_FOLLOWUP
		WHERE     
			(typeOfStage = 'Stage 3')

	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

--Update view V_PRS
-- Create V_PRS
CREATE VIEW dbo.V_PRS
AS
SELECT     id_mp AS id_prs, PRSIssueNumber AS prs_PRSIssueNumber, PRSSatus AS prs_PRSSatus, PRSComment AS prs_PRSComment, 
                      PRSFeasibility AS prs_PRSFeasibility, PRSBasedOnTrs AS prs_PRSBasedOnTrs, PRSPcxqResponsible AS prs_PRSPcxqResponsible, 
                      PRSFirstMsnServed AS prs_PRSFirstMsnServed, PRSSupplierDeliveryCapacity AS prs_PRSSupplierCapacity, 
                      PRSLastMsnServed AS prs_PRSLastMsnServed, PrsDateOfFirstEquipment AS prs_PrsDateOfFirstEquipment, PRSEquipment AS prs_PRSEquipment, 
                      PRSRemark AS prs_PRSRemark, PRSDecisionBefore AS prs_PRSDecisionBefore, PRSAccordinTo AS prs_PRSAccordinTo, 
                      PRSApplicability AS prs_PRSApplicability, PRSIndustrialLeader AS prs_PRSIndustrialLeader, EquipmentDeliveries AS prs_EquipmentDeliveries, 
                      FMAE AS prs_FMAE, FinCountSW AS prs_FinCountSW, FinCountRackableHW AS prs_FinCountRackableHW, 
                      FinCountOtherHW AS prs_FinCountOtherHW, PRSProcAcceptance AS prs_PRSProcAcceptance, PRSProcComment AS prs_PRSProcComment, 
                      PRSSupplierName AS prs_PRSSupplierName, PRSLogisticEntity AS prs_PRSLogisticEntity, PRSSubPrsTln AS prs_PRSSubPrsTln, 
                      PRSAdditionalDoc AS prs_PRSAdditionalDoc, MP_TickBox_idr AS prs_MP_TickBox_idr, prsMPDescription AS prs_prsMPDescription, 
                      prsEquipments AS prs_prsEquipments, prsInterdependencies AS prs_prsInterdependencies, prsInstallationzone AS prs_prsInstallationzone, 
                      prsWorkloadOSW AS prs_prsWorkloadOSW, prsLogisticsSituation AS prs_prsLogisticsSituation, prsPOEValidity AS prs_prsPOEValidity, 
                      prsDevelopmentAC AS prs_prsDevelopmentAC, prsAddComment AS prs_prsAddComment, prsRetrofitNoria AS prs_prsRetrofitNoria, 
                      prsEmbodimentRequired AS prs_prsEmbodimentRequired, prsFALTest AS prs_prsFALTest, prsInstallerCycle AS prs_prsInstallerCycle, 
                      prsLogisticsCycle AS prs_prsLogisticsCycle, prsSupplierCycle AS prs_prsSupplierCycle, prsRotableShipset AS prs_prsRotableShipset, 
                      prsSequence AS prs_prsSequence, prsFINExample AS prs_prsFINExample, prsStandardName AS prs_prsStandardName, 
                      prsExpectedPN AS prs_prsExpectedPN, prsSubPRS3 AS prs_prsSubPRS3, prsImplementDate AS prs_prsImplementDate, 
                      prsImplementComment AS prs_prsImplementComment, prsImplementMSN AS prs_prsImplementMSN,
					  prsEPCConfFile AS prs_prsEPCConfFile, prsSepdcPepdcChange AS prs_prsSepdcPepdcChange
FROM         dbo.T_MP

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.V_PSS_MODEL
AS
SELECT     
	tmpsv_EQUIPMENTMODEL.IDA2A2 AS EQUIPMODEL_id,
	BIDA2A2, 
	IDA3TEAMID,
	BWTPARTNUMBER, 
	COUNTERREF, 
	INVARIANTREF, 
	EQUIPMENTMODDESC, 
	case when MODELTYPE='supplierModel' then 'Supplier Model'
	when modeltype='airbusSpec' then 'Airbus Spec'   else modeltype end [MODELTYPE],
	EIRDREF,
	MODELMANAGER,
	MODELREF, 
	SUPPLIERNATIVEFORMAT, 
	MASTERCADFORMAT, 
	case 
		when STATESTATE='LEVEL1' THEN 'Accepted By Equipment Model Manager'
		when STATESTATE='LEVEL2' then 'Accepted By System Specialist'
		when STATESTATE='WIP' then 'Work In Progress'
		when STATESTATE='INVALID' then 'Invalid'
		else STATESTATE 
	end as [STATESTATE], 
	COMMENTS, 
	CADREQUESTEDTO, 
	CADREQUESTEDON, 
	CADAWAITEDFROM, 
	CADAWAITEDON, 
	CADRECEIVEDFROM, 
	CADRECEIVEDON, 
	STORAGEAT, 
	CADSTORAGEON, 
	CADVALIDATIONBY, 
	CADVALIDATIONON, 
	case 
		when CADREJECT=0 then 'False'
		else cast (CADREJECT as varchar(50))
	end [CADREJECT],
	REQUESTEDBY, 
	REQUESTEDON, 
	TECHNICALVALIDATIONBY, 
	TECHNICALVALIDATIONON, 
	ACCEPTANCESHEETREF, 
	MODELMATURITY, 
	TECHNICALREJECT, 
	tmpsv_team.name as TEAM
FROM         
	dbo.tmpsv_EQUIPMENTMODEL 
	inner join tmpsv_team on tmpsv_equipmentmodel.ida3teamid=tmpsv_team.ida2a2

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE VIEW dbo.V_Provisioning_responsibility
AS
SELECT  id_responsibility as id_responsibility,
		idr_fin as idr_fin,					
 		ProvisioningSite as prov_ProvisioningSite,
 		FinResponsibility as prov_FinResponsibility,
 		RankFrom as prov_RankFrom,
 		RankTo as prov_RankTo,
 		StdSiglum as prov_StdSiglum,
		Resp_ConfigSet as prov_ConfigSet,
 		MsnEffRange as prov_Msn
FROM         dbo.T_RESPONSIBILITY
WHERE     (FINRESPONSIBILITY LIKE 'Provisioning')




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.V_RFC
AS
SELECT     
   	 id_request AS id_rfc, ACMTLeaderCR AS rfc_ACMTLeaderCR,
	ChgLeaderCR AS rfc_ChgLeaderCR,
	CMITLeader AS rfc_CMITLeader,
  	  EVCRLTaDateF AS rfc_EVCRLTaDateF,
	EVCRLTaDateT AS rfc_EVCRLTaDateT,
	EVCRLTiTDateA AS rfc_EVCRLTiTDateA,
   	 EVCRTRSaDateF AS rfc_EVCRTRSaDateF,
	EVCRTRSaDateT AS rfc_EVCRTRSaDateT,
	EVCRTRSiTDateA AS rfc_EVCRTRSiTDateA,
    	GIEqImpacted AS rfc_GIEqImpacted,
	GIRespSite AS rfc_GIRespSite,
	GrpLeaderCR AS rfc_GrpLeaderCR,
	ImpactOnBrakets AS rfc_ImpactOnBrakets,
   	 INVModBDateA AS rfc_INVModBDateA,
	INVModBDateAv AS rfc_INVModBDateAv,
	INVModBDateT AS rfc_INVModBDateT,
	Linvold AS rfc_Linvold,
   	 PDDesign AS rfc_PDDesign,
	PDImpact AS rfc_PDImpact,
	PDReference AS rfc_PDReference,
	RequestComment AS rfc_RequestComment,
	RequestReference AS rfc_RequestReference,
	RequestTitle AS rfc_RequestTitle,
	RFCCovered AS rfc_RFCCovered,
	RFCEpacTdu AS rfc_RFCEpacTdu,
	RFCStatus AS rfc_RFCStatus,
	RFCType AS rfc_RFCType,
	ScreenDate AS rfc_ScreenDate,
	StructureImpact AS rfc_StructureImpact,
	StudyReq AS rfc_StudyReq,
	TechLeader AS rfc_TechLeader,
	WFStatus AS rfc_WFStatus,
	WireImpactWMorpho AS rfc_WireImpactWMorpho,
	WireImpactWoMorphoImpact AS rfc_WireImpactWoMorphoImpact,
	GIGenComments AS rfc_GIGenComments,
	KickOffMeeting AS rfc_KickOffMeeting,
	UProcCR AS rfc_UProc,
	Request_ATA AS rfc_ATA,
	MODBreakdown AS rfc_MODBreakdown,
	ForecastDate AS rfc_ForecastDate,
	EngineeringComment AS rfc_EngineeringComment,
	ImplementationInFAL AS rfc_ImplementationInFAL,
	HarenessTr AS rfc_HarenessTr,
	PDAvailabilityDate AS rfc_PDAvailabilityDate,
	CircuitImpacted AS rfc_CircuitImpacted,
	NbOfPD AS rfc_NbOfPD,
	Rationale AS rfc_Rationale,
	BNDYEReviewDate AS rfc_BNDYEReviewDate,
	Cluster AS rfc_Cluster,
	OSTeamComment AS rfc_OSTeamComment,
	idr_ata AS rfc_idr_ata,
	PDAchievedDate AS rfc_PDAchievedDate,
	FullCoverDateT AS rfc_FullCoverDateT,
	XRefConfirmed,
	LaunchingDate,
	SYSCCC0ReleasedDate,
	IndustrialLeaderPosition AS rfc_IndustrialLeaderPosition,
	typeOfRequest AS rfc_typeOfRequest,
	Request_TickBox_idr AS rfc_Request_TickBox_idr,
	IESAttachment2 AS rfc_IESAttachment2 ,
	IESAttachment1 AS rfc_IESAttachment1 ,
	IESstatus AS rfc_IESstatus ,
	IESissue AS rfc_IESissue ,
	IESdate AS rfc_IESdate ,
	IESaccordingTo AS rfc_IESaccordingTo ,
	IESindusLeader AS rfc_IESindusLeader ,
	IESriskConfidence AS rfc_IESriskConfidence ,
	IESindusPosition AS rfc_IESindusPosition ,
	IEScustoDecisionDate AS rfc_IEScustoDecisionDate ,
	IESosw AS rfc_IESosw ,
	IESprsNeeded AS rfc_IESprsNeeded ,
	IESconditions AS rfc_IESconditions ,
	IESfleetWithOSW AS rfc_IESfleetWithOSW ,
	IESmsnWithOSW AS rfc_IESmsnWithOSW ,
	IESfleetWithoutOSW AS rfc_IESfleetWithoutOSW ,
	IESmsnWithoutOSW AS rfc_IESmsnWithoutOSW ,
	IESembodyOnAC AS rfc_IESembodyOnAC ,
	IESCDFpassed AS rfc_IESCDFpassed ,
	IESxRefComment AS rfc_IESxRefComment ,
	IES1stBuild AS rfc_IES1stBuild ,
	IESproposedCDF AS rfc_IESproposedCDF
FROM		 dbo.T_REQUEST
WHERE	 (typeOfRequest = 'RFC')


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.V_RFC_EXPECTED_APPLICABILITY
AS
SELECT     id_expectedApplicability as rfcEA_id,
	idr_request as rfcEA_idr_request,
	MSN as rfcEA_MSN, 
	std as rfcEA_std, 
	indStd as rfcEA_indStd, 
	version as rfcEA_version, 
	rank as rfcEA_rank, 
	model as rfcEA_model, 
	prodRank as rfcEA_prodRank, 
	contractualAC as rfcEA_contractualAC, 
	fleet as rfcEA_fleet, 
	Condition as rfcEA_Condition,
	exception as rfcEA_exception,
	expression as rfcEA_expression,
	addOn as rfcEA_addOn
FROM         dbo.T_EXPECTED_APPLICABILITY
inner join T_REQUEST on T_REQUEST.id_request = T_EXPECTED_APPLICABILITY.idr_request
where T_REQUEST.TypeOfRequest = 'RFC'






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

