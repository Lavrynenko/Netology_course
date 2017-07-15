-- ************************************************************************************
-- Stored procedure for MAFU Certification : List of Services Bulletins to be certified
-- Name : 110_1-26_MAFU_sp_certifListofSB.sql
-- Date 12/06/2008
-- Spec : MAFU_V1.26_synthesis_sheet_EA_RFC_02_SB_Report.doc
-- ************************************************************************************

-- Clean up stored procedure if exists
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_certifListofSB]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_certifListofSB]
GO


CREATE PROCEDURE [dbo].[sp_certifListofSB] @endDate VARCHAR(50) AS

DECLARE @today as varchar(50)
set @today = getdate()

IF @endDate <> 'NoDate'
-- End date specified
BEGIN
	SELECT 	
		T_SB.SBReference [SB__SB Ref], 
		T_SB.SBType [SB__SB Type], 
		T_SB.SBTitle [SB__SB Title], 
		--T_SB.SBEffectivity [SB__SB Effectivity],
		T_MSN.MSN [SB__SB Effectivity],
		CONVERT(varchar,T_SB.SBCertifTargetDate,103) [SB__Draft for Approval target], 
		--CONVERT(varchar,T_SB.SBCertifResultDate, 103) [SB__Certif. Result date], 
		T_MOD.MODReference [ACC__Mod], 
		T_MP.MPReference [ACC__MP], 
		T_MOD.MODATAFromACC2 [ACC__ATA], 
		T_MOD.ValidityFromACC [ACC__Validity], 
		T_MOD.MODClassification [ACC__Classification], 
		T_MOD.MODTitle [ACC__Mod Title], 
		T_MOD.ModACMTLeader [ACC__MOD ACMT Leader],
		T_MOD.MODMASIssue [ACC__MAS Issue], 
		CONVERT(varchar,T_MOD.MODTCDate,103) [ACC__MAS Approval Date], 
		CONVERT(varchar,T_MOD.MODTargetDate,103) [MAFU__MAS Target date], 
		T_MOD.MODComment [MAFU__Comments], 
		T_MOD.MODMASStatus [MAFU__MAS Status], 
		CONVERT(VARCHAR, T_SB.SBMASEASADate , 103) [MAFU__MAS sent date to EASA],
		T_MOD.MODCauseOfDelay [MAFU__Cause of delay], 
		T_MOD.MODMCC [MAFU__MCC], 
		T_MOD.MODMASCoordinator [MAFU__EANT MAS Responsible] 
	FROM         
		T_LINK_CIN_SB INNER JOIN
	        T_MOD INNER JOIN
	        T_LINK_MOD_MP ON T_MOD.id_mod = T_LINK_MOD_MP.idr_mod INNER JOIN
	        T_MP ON T_LINK_MOD_MP.idr_mp = T_MP.id_mp ON T_LINK_CIN_SB.idr_CIN_ACC = T_LINK_MOD_MP.id_CIN_ACC RIGHT OUTER JOIN
	        T_SB ON T_LINK_CIN_SB.idr_SB = T_SB.id_SB left join T_LINK_MSN_SB on T_SB.id_sb=T_LINK_MSN_SB.idr_sb  LEFT JOIN
	        T_MSN on T_LINK_MSN_SB.msn=t_msn.msn
	
	WHERE 
		T_SB.SBSiteLeader like '%AIRBUS FRANCE%'
		AND (
			(CAST (CONVERT(varchar,@today,102) as datetime) <= CAST (CONVERT(varchar,@endDate,102) as datetime) AND T_SB.SBCertifTargetDate <= CAST (CONVERT(varchar,@endDate,102) as datetime))
			OR
			(CAST (CONVERT(varchar,@endDate,102) as datetime) <= CAST (CONVERT(varchar,@today,102) as datetime) AND T_SB.SBCertifTargetDate <= CAST (CONVERT(varchar,@today,102) as datetime))
		)
		AND (T_SB.SBCertifResultDate is null OR T_SB.SBCertifResultDate = '')
		AND (T_MOD.MODStatus not in ('Cancelled','In abeyance') or T_MOD.MODStatus is null)
	ORDER BY CONVERT(varchar,T_SB.SBCertifTargetDate,102)
END

ELSE
-- End date not specified
BEGIN
	SELECT 	
		T_SB.SBReference [SB__SB Ref], 
		T_SB.SBType [SB__SB Type], 
		T_SB.SBTitle [SB__SB Title], 
		--T_SB.SBEffectivity [SB__SB Effectivity],
		T_MSN.MSN [SB__SB Effectivity],
		CONVERT(varchar,T_SB.SBCertifTargetDate,103) [SB__Draft for Approval target], 
		--CONVERT(varchar,T_SB.SBCertifResultDate, 103) [SB__Certif. Result date], 
		T_MOD.MODReference [ACC__Mod], 
		T_MP.MPReference [ACC__MP], 
		T_MOD.MODATAFromACC2 [ACC__ATA], 
		T_MOD.ValidityFromACC [ACC__Validity], 
		T_MOD.MODClassification [ACC__Classification], 
		T_MOD.MODTitle [ACC__Mod Title], 
		T_MOD.ModACMTLeader [ACC__MOD ACMT Leader],
		T_MOD.MODMASIssue [ACC__MAS Issue], 
		CONVERT(varchar,T_MOD.MODTCDate,103) [ACC__MAS Approval Date], 
		CONVERT(varchar,T_MOD.MODTargetDate,103) [MAFU__MAS Target date], 
		T_MOD.MODComment [MAFU__Comments], 
		T_MOD.MODMASStatus [MAFU__MAS Status], 
		CONVERT(VARCHAR, T_SB.SBMASEASADate , 103) [MAFU__MAS sent date to EASA],
		T_MOD.MODCauseOfDelay [MAFU__Cause of delay], 
		T_MOD.MODMCC [MAFU__MCC], 
		T_MOD.MODMASCoordinator [MAFU__EANT MAS Responsible] 
	FROM         
		T_LINK_CIN_SB INNER JOIN
	        T_MOD INNER JOIN
	        T_LINK_MOD_MP ON T_MOD.id_mod = T_LINK_MOD_MP.idr_mod INNER JOIN
	        T_MP ON T_LINK_MOD_MP.idr_mp = T_MP.id_mp ON T_LINK_CIN_SB.idr_CIN_ACC = T_LINK_MOD_MP.id_CIN_ACC RIGHT OUTER JOIN
	        T_SB ON T_LINK_CIN_SB.idr_SB = T_SB.id_SB left join T_LINK_MSN_SB on T_SB.id_sb=T_LINK_MSN_SB.idr_sb  LEFT JOIN
	        T_MSN on T_LINK_MSN_SB.msn=t_msn.msn
	WHERE 
		T_SB.SBSiteLeader like '%AIRBUS FRANCE%'
		--AND ((T_SB.SBCertifTargetDate is null) OR (T_SB.SBCertifTargetDate =''))
		AND (
			-- Overdue Target Date and not yet certified
   			(
				T_SB.SBCertifTargetDate <= CAST (CONVERT(varchar,@today,102) as datetime)
				and (T_SB.SBCertifResultDate is null or T_SB.SBCertifResultDate = '')
			)
			-- Without target date
			or T_SB.SBCertifTargetDate is null 
			or T_SB.SBCertifTargetDate = ''
		)
		AND (T_MOD.MODStatus not in ('Cancelled','In abeyance') or T_MOD.MODStatus is null)
ORDER BY CONVERT(varchar,T_SB.SBCertifTargetDate,102)
END

GO
