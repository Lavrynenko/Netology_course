/***********************************************************/
/* Report MAFU Forecast Date History for MP in T_DBActions */
/***********************************************************/

if (not exists (SELECT * FROM t_report_group WHERE report_group_label = 'MAFU'))
begin
	INSERT INTO T_REPORT_GROUP (report_group_label) SELECT 'MAFU'
end

DELETE FROM T_DBActions WHERE label = 'MAFU Forecast Date History for MP'

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
	'MAFU Forecast Date History for MP',
	'sp_MAFUhistoMPdateF #''Reference'',''GL'',''CL'',''ATA'',''typeOfDate'',''beginDate'',''endDate''',
	null, 
	'MAFU_ForecastDateCR.php', 
	'MP Reference :#Reference#; Group Leader :#&GL:SELECT user_surname + '' '' + user_first_name FROM T_USER INNER JOIN T_LINK_ROLE_USER ON T_USER.user_id = T_LINK_ROLE_USER.idr_user INNER JOIN T_USER_ROLE ON idr_user_role = id_role WHERE name_role = ''MAFU Group Leader'' ORDER BY user_surname#; Change Leader :#&CL:SELECT user_surname + '' '' + user_first_name FROM T_USER INNER JOIN T_LINK_ROLE_USER ON T_USER.user_id = T_LINK_ROLE_USER.idr_user INNER JOIN T_USER_ROLE ON idr_user_role = id_role WHERE name_role = ''MAFU Change Leader'' ORDER BY user_surname#; MP ATA :#ATA#; Type of Forecast Date(*) :#&typeOfDate:SELECT ''1st TRS issue - Forecast Date'' UNION SELECT ''MP/TRS in MPM - Forecast Date'' UNION SELECT ''CIN Opening - Forecast Date'' UNION SELECT ''Full TRS - Forecast Date'' UNION SELECT ''SYS Involved Sub TRS - Forecast Date'' ORDER BY 1#; Starting Date(*) :#beginDate#;End Date(*) :#endDate#', 
	'- <b><i>Type of Forecast Date</i></b>, <b><i>Starting Date</i></b> and <b><i>End Date</i></b> are mandatory<br> - <b><i>Starting Date</i></b> and <b><i>End Date</i></b> should be under the following pattern : dd/mm/yyyy<br> - Hidden filter automatically applied : <b><i>Leader or Involded ?</i></b> = leader <u>or</u> involved', 
	null, 
	report_group_id 
FROM 
	T_REPORT_GROUP 
WHERE 
	report_group_label = 'MAFU'


/*****************************************************************/
/* Stored procedure for report MAFU Forecast Date History for MP */
/*****************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_MAFUhistoMPdateF]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[sp_MAFUhistoMPdateF]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[sp_MAFUhistoMPdateF](@REF VARCHAR(50), @GL VARCHAR(150), @CL VARCHAR(150), @Ata VARCHAR(50), 
		@type VARCHAR(50), @beginDate VARCHAR(50), @endDate VARCHAR(50)) AS 

		DECLARE @FD varchar(255)

		SET DATEFORMAT dmy
		SET @beginDate = CAST(@beginDate AS DATETIME)
		SET @endDate = CAST(@endDate AS DATETIME)

		IF @type = 'MP/TRS in MPM - Forecast Date'  SET @FD = 'INVMPiMPMDateF'
		IF @type = 'CIN Opening - Forecast Date' SET @FD = 'INVMOpDateF'
		IF @type = '1st TRS issue - Forecast Date' SET @FD = 'INV1TrsIDateF'
		IF @type = 'SYS Involved Sub TRS - Forecast Date' SET @FD = 'SYSInvSTRSDateF'
		IF @type = 'Full TRS - Forecast Date' SET @FD = 'TRSUpdateDateF'

		SELECT 
			T_MP.MPReference AS [MP Ref], 
			R_ATA.ATACode, 
			T_MP.ACMTLeaderMP AS [ACMT Leader], 
			T_MP.LinvoldMP AS [Leader or Involved], 
			T_MP.GrpLeaderMP AS [Group Leader], 
			T_MP.ChgLeaderMP AS [Change Leader], 
			@type AS [Field], 
			CASE WHEN (CHARINDEX('# old  = ', T_HISTORY.ActionData, CHARINDEX(@FD + ' : # old  = ', T_HISTORY.ActionData))>0)
				THEN SUBSTRING(T_HISTORY.ActionData, CHARINDEX('# old  = ', T_HISTORY.ActionData, CHARINDEX(@FD + ' : # old  = ', T_HISTORY.ActionData)) + 9, CHARINDEX('# new = ', T_HISTORY.ActionData, CHARINDEX(@FD + ' : # old  = ', T_HISTORY.ActionData)) - CHARINDEX('# old  = ', T_HISTORY.ActionData, CHARINDEX(@FD + ' : # old  = ', T_HISTORY.ActionData)) - 9)
				ELSE ''
			END AS [Old Value],	
			CASE WHEN (CHARINDEX('# new = ', T_HISTORY.ActionData, CHARINDEX(@FD + ' : # old  = ', T_HISTORY.ActionData))>0)
				THEN SUBSTRING(T_HISTORY.ActionData, CHARINDEX('# new = ', T_HISTORY.ActionData, CHARINDEX(@FD + ' : # old  = ', T_HISTORY.ActionData)) + 8, CHARINDEX('#; ', T_HISTORY.ActionData, CHARINDEX(@FD + ' : # old  = ', T_HISTORY.ActionData)) - CHARINDEX('# new = ', T_HISTORY.ActionData, CHARINDEX(@FD + ' : # old  = ', T_HISTORY.ActionData)) - 8)
				ELSE ''
			END AS [New Value],	
			[Associated Target Date] = CASE @type 
				WHEN 'MP/TRS in MPM - Forecast Date' THEN INVMPiMPMDateT 
				WHEN 'CIN Opening - Forecast Date' THEN INVMOpDateT 
				WHEN '1st TRS issue - Forecast Date' THEN INV1TrsIDateT 
				WHEN 'SYS Involved Sub TRS - Forecast Date' THEN SYSInvSTRSDateT 
				WHEN 'Full TRS - Forecast Date' THEN TRSUpdateDateF 
				ELSE ''
			END, 
			[Associated Achieved Date] = CASE @type 
				WHEN 'MP/TRS in MPM - Forecast Date' THEN INVMPiMPMDateA 
				WHEN 'CIN Opening - Forecast Date' THEN INVMOpDateA 
				WHEN '1st TRS issue - Forecast Date' THEN INV1TrsIDateA 
				WHEN 'SYS Involved Sub TRS - Forecast Date' THEN SYSInvSTRSDateA 
				WHEN 'Full TRS - Forecast Date' THEN TRSUpdateDateA 
				ELSE '' 
			END, 
			T_HISTORY.logon AS [Updated by], 
			CONVERT(VARCHAR, T_HISTORY.ActionDate , 103) AS [Date of the Modification] 
		FROM 
			T_MP 
			INNER JOIN T_HISTORY ON T_MP.id_mp = T_HISTORY.RefId AND T_MP.MPReference = T_HISTORY.ObjectReference 
			LEFT OUTER JOIN R_ATA ON T_MP.idr_ata = R_ATA.id_ata 
		WHERE 
			((T_MP.LinvoldMP = 'leader') OR (T_MP.LinvoldMP = 'involved')) 
			AND ((T_MP.MPReference like '%'+@REF+'%')  OR ('1' + @REF ='1')) 
			AND CHARINDEX(@FD, T_HISTORY.ActionData)>0 
			AND CHARINDEX(@FD + ' : # old  = ', T_HISTORY.ActionData)>0 
			AND ((R_ATA.ATACode LIKE  + @Ata +'%') OR ('1' + @Ata ='1')) 
			AND T_HISTORY.ActionDate>=CAST (CONVERT(varchar,@beginDate,103) as datetime) 
			AND T_HISTORY.ActionDate<=CAST (CONVERT(varchar,@endDate,103) as datetime) 
			AND ((GrpLeaderMP = @GL) OR ('1' + @GL ='1')) 
			AND ((ChgLeaderMP = @CL) OR ('1' + @CL ='1')) 
		ORDER BY MPReference, T_HISTORY.ActionDate

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO
