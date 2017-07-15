-- ******************************************************************************
-- Stored procedure for MAFU Certification : List of MOD to be certified by MSN
-- Name : 125_1-26_MAFU_sp_certifListofMOD_V2.sql
-- Date : 24/06/2008
-- Spec : MAFU_V1.26_synthesis_sheet_EA_RFC_01_MOD_to_be_certified.doc
--        MAFU_V1.26_synthesis_sheet_EA_RFC_07_TypeDesign.doc
-- ******************************************************************************

-- Clean up stored procedure if exists
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_certifListofMOD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_certifListofMOD]
GO


CREATE PROCEDURE [dbo].[sp_certifListofMOD] @msn VARCHAR(50) 
AS 

	DECLARE @Model VARCHAR(255)
	SET @Model = ''

	-- Get the model of the given MSN
	SELECT @Model = T_MSN.M_MODEL_AIPL FROM T_MSN WHERE T_MSN.MSN = @msn 

if(@Model is null)
begin
	SELECT DISTINCT 
		T_MOD.MODReference [ACC__Mod], 
		T_MP.MPReference [ACC__MP], 
		T_MOD.MODATAFromACC2 [ACC__ATA], 
		T_MOD.ValidityFromACC [ACC__Validity], 
		T_MSN.M_MODEL_AIPL [ACC__Models], 
		T_MOD.MODClassification [ACC__Classification], 
		T_MOD.MODTitle [ACC__Mod Title], 
		T_MOD.ModACMTLeader [ACC__MOD ACMT Leader], 
		T_MOD.MODMASIssue [ACC__MAS Issue], 
	    CONVERT(VARCHAR, T_MOD.MODTCDate , 103) [ACC__MAS Approval Date], 
		CONVERT(VARCHAR, T_MOD.MODTargetDate, 103) [MAFU__MAS Target Date], 
		T_MOD.MODComment [MAFU__Comments], 
		T_MOD.MODMASStatus [MAFU__MAS Status], 
		CONVERT(VARCHAR, T_MOD.MODMASEASADate , 103) [MAFU__MAS sent date to EASA], 
		T_MOD.MODCauseOfDelay [MAFU__Cause of Delay], 
		T_MOD.MODMCC [MAFU__MCC], 
		T_MOD.MODMASCoordinator [MAFU__EANT MAS Responsible], 
		T_MOD.MODTDStatus [ICC__TD Status] 
	FROM 
		T_LINK_MOD_MP 
		INNER JOIN T_MP ON T_LINK_MOD_MP.idr_mp = T_MP.id_mp 
		INNER JOIN T_MOD ON T_LINK_MOD_MP.idr_mod = T_MOD.id_mod 
		INNER JOIN T_MSN 
		INNER JOIN T_LINK_MOD_MSN ON T_MSN.MSN = T_LINK_MOD_MSN.MSN ON T_MOD.id_mod = T_LINK_MOD_MSN.idr_mod 
	WHERE 
		T_MSN.MSN = @msn 
		AND T_MSN.M_MODEL_AIPL is null 
		AND T_MOD.MODSiteLeader like '%AIRBUS FRANCE%' 
		AND (T_MOD.MODValidityCat <>'T') 
		AND (T_MOD.MODValidityCat <>'G') 
		AND (T_MOD.MODStatus not in ('Cancelled','In abeyance') or T_MOD.MODStatus is null) 
		AND 
		(
			-- MOD not certified in MAFU except those which have been certified on another MSN for this Model
			(
				(T_MOD.MODTypeDesign is null OR T_MOD.MODTypeDesign = '') 
				AND T_MOD.MODReference NOT IN (
					SELECT DISTINCT 
						T_MOD.MODReference 
					FROM 
						T_LINK_MOD_MP 
						INNER JOIN T_MP ON T_LINK_MOD_MP.idr_mp = T_MP.id_mp 
						INNER JOIN T_MOD ON T_LINK_MOD_MP.idr_mod = T_MOD.id_mod 
						INNER JOIN T_MSN 
						INNER JOIN T_LINK_MOD_MSN ON T_MSN.MSN = T_LINK_MOD_MSN.MSN ON T_MOD.id_mod = T_LINK_MOD_MSN.idr_mod 
					WHERE 
						T_MSN.M_MODEL_AIPL is null 
						AND T_MOD.MODTypeDesign is not null AND T_MOD.MODTypeDesign <> '' 
						AND T_MOD.MODSiteLeader like '%AIRBUS FRANCE%' 
						AND (T_MOD.MODValidityCat <>'T') 
						AND (T_MOD.MODValidityCat <>'G') 
						AND (T_MOD.MODStatus not in ('Cancelled','In abeyance') or T_MOD.MODStatus is null)
						and T_MOD.MODMASStatus = 'Approved' 
				)
				and T_MOD.MODMASStatus <> 'Approved'
			)
			OR 
			-- MOD certified in MAFU but not certified in ACC2 for this model
			(
				T_MOD.MODTypeDesign is not null 
				AND T_MOD.MODTypeDesign <> '' 
				AND T_MOD.MODReference IN (
					SELECT 
						DISTINCT MOD.C_MOD 
					FROM 
						OPENQUERY(SS10_A380, '
							SELECT 
								SS10_VIEW_MAS.C_MOD, 
								SS10_VIEW_MAS_MODEL.C_MODEL 
							FROM 
								SS10_VIEW_MAS, 
								SS10_VIEW_MAS_MODEL 
							WHERE 
								SS10_VIEW_MAS_MODEL.C_MOD = SS10_VIEW_MAS.C_MOD 
								AND C_MAS_AGR_STS <> ''TC'' 
						') AS MOD 
					WHERE 
						MOD.C_MODEL is null
				)
				and T_MOD.MODMASStatus = 'Approved'
			)
		)

	ORDER BY 
		T_MOD.MODReference, T_MP.MPReference

end
else
begin
	SELECT DISTINCT 
		T_MOD.MODReference [ACC__Mod], 
		T_MP.MPReference [ACC__MP], 
		T_MOD.MODATAFromACC2 [ACC__ATA], 
		T_MOD.ValidityFromACC [ACC__Validity], 
		T_MSN.M_MODEL_AIPL [ACC__Models], 
		T_MOD.MODClassification [ACC__Classification], 
		T_MOD.MODTitle [ACC__Mod Title], 
		T_MOD.ModACMTLeader [ACC__MOD ACMT Leader], 
		T_MOD.MODMASIssue [ACC__MAS Issue], 
	    CONVERT(VARCHAR, T_MOD.MODTCDate , 103) [ACC__MAS Approval Date], 
		CONVERT(VARCHAR, T_MOD.MODTargetDate, 103) [MAFU__MAS Target Date], 
		T_MOD.MODComment [MAFU__Comments], 
		T_MOD.MODMASStatus [MAFU__MAS Status], 
		CONVERT(VARCHAR, T_MOD.MODMASEASADate , 103) [MAFU__MAS sent date to EASA], 
		T_MOD.MODCauseOfDelay [MAFU__Cause of Delay], 
		T_MOD.MODMCC [MAFU__MCC], 
		T_MOD.MODMASCoordinator [MAFU__EANT MAS Responsible], 
		T_MOD.MODTDStatus [ICC__TD Status] 
	FROM 
		T_LINK_MOD_MP 
		INNER JOIN T_MP ON T_LINK_MOD_MP.idr_mp = T_MP.id_mp 
		INNER JOIN T_MOD ON T_LINK_MOD_MP.idr_mod = T_MOD.id_mod 
		INNER JOIN T_MSN 
		INNER JOIN T_LINK_MOD_MSN ON T_MSN.MSN = T_LINK_MOD_MSN.MSN ON T_MOD.id_mod = T_LINK_MOD_MSN.idr_mod 
	WHERE 
		T_MSN.MSN = @msn 
		AND T_MSN.M_MODEL_AIPL = @Model 
		AND T_MOD.MODSiteLeader like '%AIRBUS FRANCE%' 
		AND (T_MOD.MODValidityCat <>'T') 
		AND (T_MOD.MODValidityCat <>'G') 
		AND (T_MOD.MODStatus not in ('Cancelled','In abeyance') or T_MOD.MODStatus is null) 
		AND 
		(
			-- MOD not certified in MAFU except those which have been certified on another MSN for this Model
			(
				(T_MOD.MODTypeDesign is null OR T_MOD.MODTypeDesign = '') 
				AND T_MOD.MODReference NOT IN (
					SELECT DISTINCT 
						T_MOD.MODReference 
					FROM 
						T_LINK_MOD_MP 
						INNER JOIN T_MP ON T_LINK_MOD_MP.idr_mp = T_MP.id_mp 
						INNER JOIN T_MOD ON T_LINK_MOD_MP.idr_mod = T_MOD.id_mod 
						INNER JOIN T_MSN 
						INNER JOIN T_LINK_MOD_MSN ON T_MSN.MSN = T_LINK_MOD_MSN.MSN ON T_MOD.id_mod = T_LINK_MOD_MSN.idr_mod 
					WHERE 
						T_MSN.M_MODEL_AIPL = @Model 
						AND T_MOD.MODTypeDesign is not null AND T_MOD.MODTypeDesign <> '' 
						AND T_MOD.MODSiteLeader like '%AIRBUS FRANCE%' 
						AND (T_MOD.MODValidityCat <>'T') 
						AND (T_MOD.MODValidityCat <>'G') 
						AND (T_MOD.MODStatus not in ('Cancelled','In abeyance') or T_MOD.MODStatus is null)
						and T_MOD.MODMASStatus = 'Approved' 
				)
				and T_MOD.MODMASStatus <> 'Approved'
			)
			OR 
			-- MOD certified in MAFU but not certified in ACC2 for this model
			(
				T_MOD.MODTypeDesign is not null 
				AND T_MOD.MODTypeDesign <> '' 
				AND T_MOD.MODReference IN (
					SELECT 
						DISTINCT MOD.C_MOD 
					FROM 
						OPENQUERY(SS10_A380, '
							SELECT 
								SS10_VIEW_MAS.C_MOD, 
								SS10_VIEW_MAS_MODEL.C_MODEL 
							FROM 
								SS10_VIEW_MAS, 
								SS10_VIEW_MAS_MODEL 
							WHERE 
								SS10_VIEW_MAS_MODEL.C_MOD = SS10_VIEW_MAS.C_MOD 
								AND C_MAS_AGR_STS <> ''TC'' 
						') AS MOD 
					WHERE 
						MOD.C_MODEL = @Model
				)
				and T_MOD.MODMASStatus = 'Approved'
			)
		)

	ORDER BY 
		T_MOD.MODReference, T_MP.MPReference
end
GO
