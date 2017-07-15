-- Change GIPoE type to varchar.
if (NOT exists (select * from syscolumns where syscolumns.id = (select sysobjects.id from sysobjects  where name = 'T_REQUEST')
   and syscolumns.name = 'GIPoE'))
begin
    --Add the column
    ALTER TABLE T_REQUEST ADD [GIPoE] varchar(8000) NULL
    --update infobase
    if( NOT exists ( select * from infobase where table_name='V_CR' and object_value='cr_GIPoE'))
    begin
        INSERT INTO infobase (fast_search,table_name, object_value, type_val)
        VALUES (0,'V_CR','cr_GIPoE','text')
    end
    else
    begin
        UPDATE infobase
        set type_val='text'
        where table_name='V_CR' and object_value='cr_GIPoE'
    end
end	
else
begin
    ALTER TABLE  T_REQUEST ALTER COLUMN GIPoE varchar(8000) NULL
    --update infobase
    if( NOT exists ( select * from infobase where table_name='V_CR' and object_value='cr_GIPoE'))
    begin
        INSERT INTO infobase (fast_search,table_name, object_value, type_val)
        VALUES (0,'V_CR','cr_GIPoE','text')
    end
    else
    begin
        UPDATE infobase
        set type_val='text'
        where table_name='V_CR' and object_value='cr_GIPoE'
    end
end

-- Data migration
UPDATE T_REQUEST SET GIPoE = RIGHT('0000' + GIPoE, 4)

-- Drop and recreate view.
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
	D0006 AS cr_D0006
FROM         dbo.T_REQUEST
WHERE     (typeOfRequest = 'CR')




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



