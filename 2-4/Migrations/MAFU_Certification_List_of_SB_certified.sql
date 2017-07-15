/************************************************************/
/* Report MAFU Certification - List of SB already certified */
/************************************************************/

if (not exists (SELECT * FROM T_REPORT_GROUP WHERE report_group_label = 'Certification'))
begin
	INSERT INTO T_REPORT_GROUP (report_group_label) SELECT 'Certification'
end

DELETE FROM T_DBActions WHERE label = 'Certification - List of Services Bulletins already certified'

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
	'Certification - List of Services Bulletins already certified',
	'sp_certifListofSBcertified',
	null, 
	'Certif_SBCertifiedByDate.php', 
	null, 
	null, 
	null, 
	report_group_id 
FROM 
	T_REPORT_GROUP 
WHERE 
	report_group_label = 'Certification'


-- ************************************************************************************
-- Stored procedure for MAFU Certification : List of Service Bulletin already certified
-- Name : sp_certifListofSBcertified.sql
-- Date : 12/06/2008
-- Specification : MAFU_V1.26_synthesis_sheet_EA_RFC_02_SB_Report.doc
-- ************************************************************************************

-- Clean up stored procedure if exists
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_certifListofSBcertified]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_certifListofSBcertified]
GO

CREATE PROCEDURE [dbo].[sp_certifListofSBcertified] AS
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
		AND T_SB.SBCertifResultDate is not null
		AND T_SB.SBCertifResultDate <> ''
		AND (T_MOD.MODStatus not in ('Cancelled','In abeyance') or T_MOD.MODStatus is null)
	ORDER BY CONVERT(varchar,T_SB.SBCertifTargetDate,102)
END

GO
