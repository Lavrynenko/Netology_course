-------------------------------------------------------------
-- Report PRS Dashboard by installer and procurement for RFC
-- Modification of OBS labels :
--   DD FAFMV => DD MV
--   DD CFRPR => DD CPRPR
-------------------------------------------------------------
if (not exists (SELECT * FROM t_report_group WHERE report_group_label = 'MAFU'))
begin
	INSERT INTO T_REPORT_GROUP (report_group_label) SELECT 'MAFU'
end

DELETE FROM T_DBActions WHERE label = 'PRS Dashboard by installer and procurement for RFC' AND comments like '%- Report. Only for RFC.%'

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
	'PRS Dashboard by installer and procurement for RFC',
	'EXECUTE[Dashboard_Procurement_MP_RFC]',
	'- Report. Only for RFC.', 
	'Industrial_Dashboard_Procurement_RFC.php', 
	null,
	null, 
	null, 
	report_group_id 
FROM 
	T_REPORT_GROUP 
WHERE 
	report_group_label = 'MAFU'

-- Create Procedure

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'Dashboard_Procurement_MP_RFC' AND type = 'P')
	DROP PROCEDURE Dashboard_Procurement_MP_RFC
GO


CREATE PROCEDURE Dashboard_Procurement_MP_RFC AS
	Set concat_null_yields_null off
	
	SELECT  distinct 
		MPReference AS MP, 
		dbo.PRSConcatRequest_CR(id_mp) AS RFC, 
		MPTitle AS [MP Title], 
		dbo.OSW_Synthesis(id_mp) AS [OSW synthesis], 
		PRSSatus AS [PRS status], 
		PRSEquipment as [PRS Equipments],
		PRSLogisticEntity AS [logistic entity], 
		PRSProcAcceptance AS [Procurement acceptance], 
		CASE
			WHEN [DD NCF] is null THEN 
				CASE
					WHEN [Impact DD NCF] is null THEN 'N/I'
				END 
			ELSE [DD NCF]
		END AS [DD NCF],
		CASE
			WHEN [DD BF-D] is null THEN 
				CASE
					WHEN [Impact DD BF-D] is null THEN 'N/I'
				END 
			ELSE [DD BF-D]
		END AS [DD BF-D],
		CASE
			WHEN [DD FAF] is null THEN 
				CASE
					WHEN [Impact DD FAF] is null THEN 'N/I'
				END 
			ELSE [DD FAF]
		END AS [DD FAF],
		CASE
			WHEN [DD WNG] is null THEN 
				CASE
					WHEN [Impact DD WNG] is null THEN 'N/I'
				END 
			ELSE [DD WNG]
		END AS [DD WNG],
		CASE
			WHEN [LGS] is null THEN 
				CASE
					WHEN [Impact LGS] is null THEN 'N/I'
				END 
			ELSE [LGS]
		END AS [LGS],
		CASE
			WHEN [DD CCC] is null THEN 
				CASE
					WHEN [Impact DD CCC] is null THEN 'N/I'
				END 
			ELSE [DD CCC]
		END AS [DD CCC],
		CASE
			WHEN [DD HTP] is null THEN 
				CASE
					WHEN [Impact DD HTP] is null THEN 'N/I'
				END 
			ELSE [DD HTP]
		END AS [DD HTP],
		CASE
			WHEN [DD VTP] is null THEN 
				CASE
					WHEN [Impact DD VTP] is null THEN 'N/I'
				END 
			ELSE [DD VTP]
		END AS [DD HTP],
		CASE
			WHEN [PRO] is null THEN 
				CASE
					WHEN [Impact PRO] is null THEN 'N/I'
				END 
			ELSE [PRO]
		END AS [PRO],	
		CASE
			WHEN [DD S19] is null THEN 
				CASE
					WHEN [Impact DD S19] is null THEN 'N/I'
				END 
			ELSE [DD S19]
		END AS [DD S19],	
		CASE
			WHEN [DD RTC] is null THEN 
				CASE
					WHEN [Impact DD RTC] is null THEN 'N/I'
				END 
			ELSE [DD RTC]
		END AS [DD RTC],	
		-- Modify label
		CASE
			WHEN [DD MV] is null THEN 
				CASE
					WHEN [Impact DD MV] is null THEN 'N/I'
				END 
			ELSE [DD MV]
		END AS [DD MV],	
		-- Modify label
		CASE
			WHEN [DD CPRPR] is null THEN 
				CASE
					WHEN [Impact DD CPRPR] is null THEN 'N/I'
				END 
			ELSE [DD CPRPR]
		END AS [DD CPRPR],	
		CASE
			WHEN [DD ELEC] is null THEN 
				CASE
					WHEN [Impact DD ELEC] is null THEN 'N/I'
				END 
			ELSE [DD ELEC]
		END AS [DD ELEC],	
		id_mp as id_mp
		
	FROM    T_MP 
		INNER JOIN T_LINK_REQUEST_MP ON T_MP.id_mp = T_LINK_REQUEST_MP.idr_mp 
		INNER JOIN T_REQUEST ON T_LINK_REQUEST_MP.idr_request = T_REQUEST.id_request
			LEFT JOIN (
			SELECT DISTINCT
				T_INVOLVED_TEAM_MP.mp_idr AS idr_mp_acmtMP,
				
				CASE
					WHEN DDCCC.ACMTImpacted is null THEN 'N/I'
					ELSE ''
				END AS [Impact DD CCC],
	
				--DDCCC.ACMTImpacted as [Impact DD CCC], 
				DDCCC.PRSConfirmationName AS [DD CCC],
				DDHTP.ACMTImpacted as [Impact DD HTP], DDHTP.PRSConfirmationName AS [DD HTP],
				DDVTP.ACMTImpacted as [Impact DD VTP], DDVTP.PRSConfirmationName AS [DD VTP],
				DDFAF.ACMTImpacted as [Impact DD FAF], DDFAF.PRSConfirmationName AS [DD FAF],
				DDS19.ACMTImpacted as [Impact DD S19], DDS19.PRSConfirmationName AS [DD S19],
				DDRTC.ACMTImpacted as [Impact DD RTC], DDRTC.PRSConfirmationName AS [DD RTC],
				LGS.ACMTImpacted as [Impact LGS], LGS.PRSConfirmationName AS [LGS],
				DDNCF.ACMTImpacted as [Impact DD NCF], DDNCF.PRSConfirmationName AS [DD NCF],
				DDBFD.ACMTImpacted as [Impact DD BF-D], DDBFD.PRSConfirmationName AS [DD BF-D],
				PRO.ACMTImpacted as [Impact PRO], PRO.PRSConfirmationName AS [PRO],
				DDWNG.ACMTImpacted as [Impact DD WNG], DDWNG.PRSConfirmationName AS [DD WNG],
				-- Modify label
				DDMV.ACMTImpacted as [Impact DD MV], DDMV.PRSConfirmationName AS [DD MV],
				-- Modify label
				DDCPRPR.ACMTImpacted as [Impact DD CPRPR], DDCPRPR.PRSConfirmationName AS [DD CPRPR],
				DDELEC.ACMTImpacted as [Impact DD ELEC], DDELEC.PRSConfirmationName AS [DD ELEC]
			FROM
				T_INVOLVED_TEAM_MP
				LEFT JOIN
					(SELECT     mp_idr, PRSConfirmationName, ACMTImpacted
					FROM         T_INVOLVED_TEAM_MP
					WHERE     (ACMTImpacted = 'DD CCC')AND (NotDisplayed = 0)) DDCCC ON DDCCC.mp_idr=T_INVOLVED_TEAM_MP.mp_idr
				LEFT JOIN
					(SELECT     mp_idr, PRSConfirmationName, ACMTImpacted
					FROM         T_INVOLVED_TEAM_MP
					WHERE     (ACMTImpacted = 'DD HTP')AND (NotDisplayed = 0)) DDHTP ON DDHTP.mp_idr=T_INVOLVED_TEAM_MP.mp_idr
				LEFT JOIN
					(SELECT     mp_idr, PRSConfirmationName, ACMTImpacted
					FROM         T_INVOLVED_TEAM_MP
					WHERE     (ACMTImpacted = 'DD VTP')AND (NotDisplayed = 0)) DDVTP ON DDVTP.mp_idr=T_INVOLVED_TEAM_MP.mp_idr
				LEFT JOIN
					(SELECT     mp_idr, PRSConfirmationName, ACMTImpacted
					FROM         T_INVOLVED_TEAM_MP
					WHERE     (ACMTImpacted = 'DD FAF')AND (NotDisplayed = 0)) DDFAF ON DDFAF.mp_idr=T_INVOLVED_TEAM_MP.mp_idr
				LEFT JOIN
					(SELECT     mp_idr, PRSConfirmationName, ACMTImpacted
					FROM         T_INVOLVED_TEAM_MP
					WHERE     (ACMTImpacted = 'DD S19')AND (NotDisplayed = 0)) DDS19 ON DDS19.mp_idr=T_INVOLVED_TEAM_MP.mp_idr
				LEFT JOIN
					(SELECT     mp_idr, PRSConfirmationName, ACMTImpacted
					FROM         T_INVOLVED_TEAM_MP
					WHERE     (ACMTImpacted = 'DD RTC')AND (NotDisplayed = 0)) DDRTC ON DDRTC.mp_idr=T_INVOLVED_TEAM_MP.mp_idr
				LEFT JOIN
					(SELECT     mp_idr, PRSConfirmationName, ACMTImpacted
					FROM         T_INVOLVED_TEAM_MP
					WHERE     (ACMTImpacted = 'DD FAL')AND (NotDisplayed = 0)) DDFAL ON DDFAL.mp_idr=T_INVOLVED_TEAM_MP.mp_idr
				LEFT JOIN
					(SELECT     mp_idr, PRSConfirmationName, ACMTImpacted
					FROM         T_INVOLVED_TEAM_MP
					WHERE     (ACMTImpacted = 'LGS')AND (NotDisplayed = 0)) LGS ON LGS.mp_idr=T_INVOLVED_TEAM_MP.mp_idr
				LEFT JOIN
					(SELECT     mp_idr, PRSConfirmationName, ACMTImpacted
					FROM         T_INVOLVED_TEAM_MP
					WHERE     (ACMTImpacted = 'DD NCF')AND (NotDisplayed = 0)) DDNCF ON DDNCF.mp_idr=T_INVOLVED_TEAM_MP.mp_idr
				LEFT JOIN
					(SELECT     mp_idr, PRSConfirmationName, ACMTImpacted
					FROM         T_INVOLVED_TEAM_MP
					WHERE     (ACMTImpacted = 'DD BF-D')AND (NotDisplayed = 0)) DDBFD ON DDBFD.mp_idr=T_INVOLVED_TEAM_MP.mp_idr
				LEFT JOIN
					(SELECT     mp_idr, PRSConfirmationName, ACMTImpacted
					FROM         T_INVOLVED_TEAM_MP
					WHERE     (ACMTImpacted = 'PRO')AND (NotDisplayed = 0)) PRO ON PRO.mp_idr=T_INVOLVED_TEAM_MP.mp_idr
				LEFT JOIN
					(SELECT     mp_idr, PRSConfirmationName, ACMTImpacted
					FROM         T_INVOLVED_TEAM_MP
					WHERE     (ACMTImpacted = 'DD WNG')AND (NotDisplayed = 0)) DDWNG ON DDWNG.mp_idr=T_INVOLVED_TEAM_MP.mp_idr
				-- Modify label
				LEFT JOIN
					(SELECT     mp_idr, PRSConfirmationName, ACMTImpacted
					FROM         T_INVOLVED_TEAM_MP
					WHERE     (ACMTImpacted = 'DD MV')AND (NotDisplayed = 0)) DDMV ON DDMV.mp_idr=T_INVOLVED_TEAM_MP.mp_idr
				-- Modify label
				LEFT JOIN
					(SELECT     mp_idr, PRSConfirmationName, ACMTImpacted
					FROM         T_INVOLVED_TEAM_MP
					WHERE     (ACMTImpacted = 'DD CPRPR')AND (NotDisplayed = 0)) DDCPRPR ON DDCPRPR.mp_idr=T_INVOLVED_TEAM_MP.mp_idr
				LEFT JOIN
					(SELECT     mp_idr, PRSConfirmationName, ACMTImpacted
					FROM         T_INVOLVED_TEAM_MP
					WHERE     (ACMTImpacted = 'DD ELEC')AND (NotDisplayed = 0)) DDELEC ON DDELEC.mp_idr=T_INVOLVED_TEAM_MP.mp_idr
				
	
		) ACMT_MP ON T_MP.id_mp=ACMT_MP.idr_mp_acmtMP
	
	WHERE     (ACMTLeaderMP = 'SYS') and (typeOfRequest='RFC') 
	ORDER BY MPReference
	
GO

