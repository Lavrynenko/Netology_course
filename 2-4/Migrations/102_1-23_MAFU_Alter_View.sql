----------- V_CR --------------
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_CR]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_CR]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE VIEW dbo.V_CR
AS
SELECT     
	id_request AS id_cr, 
	ChgLeaderCR AS cr_ChgLeaderCR, 
	CMITLeader AS cr_CMITLeader, 
	CROpDate AS cr_CROpDate, 
	CRRefass AS cr_CRRefass,
	eRoomStatus AS cr_eRoomStatus, 
	GIMSN1 AS cr_GIMSN1, 
	GIMSN2 AS cr_GIMSN2, 
	GIMSN3 AS cr_GIMSN3, 
	GIMSN4 AS cr_GIMSN4,
	GIMSN7 AS cr_GIMSN7, 
	GIPoE AS cr_GIPoE, 
	ImpactOnBrakets AS cr_ImpactOnBrakets, 
	INVModBDateA AS cr_INVModBDateA,
	INVModBDateAv AS cr_INVModBDateAv, 
	INVModBDateT AS cr_INVModBDateT, 
	INVTRSfMOinTDateA AS cr_INVTRSfMOinTDateA, 
	Linvold AS cr_Linvold,
	PDDesign AS cr_PDDesign, 
	PDImpact AS cr_PDImpact, 
	PDReference AS cr_PDReference, 
	RequestComment AS cr_RequestComment,
	RequestReference AS cr_RequestReference, 
	RequestTitle AS cr_RequestTitle, 
	StructureImpact AS cr_StructureImpact, 
	TechLeader AS cr_TechLeader,
	UProcCR AS cr_UProcCR, 
	WFStatus AS cr_WFStatus, 
	WireImpactWMorpho AS cr_WireImpactWMorpho,
	WireImpactWoMorphoImpact AS cr_WireImpactWoMorphoImpact, 
	GIGenComments AS cr_GIGenComments, 
	KickOffMeeting AS cr_KickOffMeeting,
	Request_ATA AS cr_ATA, 
	MODBreakdown AS cr_MODBreakdown, 
	ForecastDate AS cr_ForecastDate, 
	OSTeamComment AS cr_OSTeamComment,
	Cluster AS cr_Cluster, 
	BNDYEReviewDate AS cr_BNDYEReviewDate, 
	Rationale AS cr_Rationale, 
	CircuitImpacted AS cr_CircuitImpacted,
	NbOfPD AS cr_NbOfPD, 
	PDAvailabilityDate AS cr_PDAvailabilityDate, 
	HarenessTr AS cr_HarenessTr, 
	ImplementationInFAL AS cr_ImplementationInFAL,
	EngineeringComment AS cr_EngineeringComment, 
	idr_ata AS cr_idr_ata, 
	PDAchievedDate AS cr_PDAchievedDate, 
	Applicability AS cr_Applicability,
	DistributionDate AS cr_DistributionDate, 
	FullCoverDateT AS cr_FullCoverDateT, 
	Request_TickBox_idr AS cr_Request_TickBox_idr,
	Prerequisite_File AS cr_Prerequisite_File, 
	GrpLeaderCR AS cr_GrpLeaderCR, 
	ACMTLeaderCR AS cr_ACMTLeaderCR, 
	GIRespSite AS cr_GIRespSite,
	EVCRAaDateA AS cr_EVCRAaDateA, 
	EVCRAaDateF AS cr_EVCRAaDateF, 
	EVCRAaDateT AS cr_EVCRAaDateT, 
	EVCRCESDateF AS cr_EVCRCESDateF,
	EVCRCESDateT AS cr_EVCRCESDateT, 
	EVCRCESiTDateA AS cr_EVCRCESiTDate, 
	EVCRESiTDateA AS cr_EVCRESiTDateA,
	EVCRESADateF AS cr_EVCRESADateF, 
	EVCRESADateT AS cr_EVCRESADateT, 
	GIEqImpacted AS cr_GIEqImpacted,
	EVCRCESiTDateA AS cr_EVCRCESiTDateA, 
	ATA24Impact AS cr_ATA24Impact, 
	crStage AS cr_crStage, 
	taskForceFU AS cr_taskForceFU,
	CESResults AS cr_CESResults, 
	typeOrigin AS cr_typeOrigin, 
	OriginatorACMT AS cr_OriginatorACMT,
	crSoftDataLoading AS cr_crSoftDataLoading, 
	crRackEquipment AS cr_crRackEquipment, 
	crNonRackEquipment AS cr_crNonRackEquipment,
	D0001 AS cr_D0001, 
	D0002 AS cr_D0002, 
	D0003 AS cr_D0003, 
	D0004 AS cr_D0004, 
	D0005 AS cr_D0005, 
	D0006 AS cr_D0006,
	CRacmtOrigin AS cr_CRacmtOrigin
FROM         dbo.T_REQUEST
WHERE     (typeOfRequest = 'CR')






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

----------- V_RFC --------------
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_RFC]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_RFC]
GO

SET QUOTED_IDENTIFIER OFF 
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
	IESproposedCDF AS rfc_IESproposedCDF,
	rfcSoftDataLoading AS rfc_rfcSoftDataLoading,
	rfcRackEquipment AS rfc_rfcRackEquipment,
	rfcNonRackEquipment AS rfc_rfcNonRackEquipment,
	RFCacmtOrigin AS rfc_RFCacmtOrigin
FROM		 dbo.T_REQUEST
WHERE	 (typeOfRequest = 'RFC')




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

