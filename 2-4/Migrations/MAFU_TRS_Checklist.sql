/*****************************/
/* Report MAFU TRS Checklist */
/*****************************/

if (not exists (SELECT * FROM T_REPORT_GROUP WHERE report_group_label = 'MAFU'))
begin
	INSERT INTO T_REPORT_GROUP (report_group_label) SELECT 'MAFU'
end

DELETE FROM T_DBActions WHERE label = 'MAFU TRS Checklist'

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
	'MAFU TRS Checklist', 
	null, 
	'- Analyse data coming from TRS Checklist', 
	'MAFU_TRS_Checklist_Follow_Up.php', 
	'MP Reference:#MPReference;Starting Date (dd/mm/yyyy):#StartDate;Ending Date (dd/mm/yyyy):#EndDate;MP IPT CM Group Leader:#&MPGrpLeader:SELECT [user_surname] + '' '' + [user_first_name] FROM T_USER INNER JOIN T_LINK_ROLE_USER ON T_USER.user_id = T_LINK_ROLE_USER.idr_user INNER JOIN T_USER_ROLE ON id_role = idr_user_role WHERE T_USER_ROLE.name_role like ''MAFU IPT CM Group Leader'' ORDER BY [user_surname], [user_first_name];MP CM Change Leader:#&MPChgLeader:SELECT [user_surname] + '' '' + [user_first_name] FROM T_USER INNER JOIN T_LINK_ROLE_USER ON T_USER.user_id = T_LINK_ROLE_USER.idr_user INNER JOIN T_USER_ROLE ON id_role = idr_user_role WHERE T_USER_ROLE.name_role like ''MAFU CM Change Leader'' ORDER BY [user_surname], [user_first_name];Linked ATA:#LinkedATA', 
	'- <b><i>Starting Date</i></b> and <b><i>Ending Date</i></b> are mandatory<br/>- Hidden filters automatically applied: <i><b>MP ACMT Leader</b></i> = SYS and <i><b>MP Leader or Involved</b></i> = Leader', 
	null, 
	report_group_id 
FROM 
	T_REPORT_GROUP 
WHERE 
	report_group_label = 'MAFU'


/*******************************************/
/* Stored procedure for MAFU TRS Checklist */
/*******************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MAFU_TRS_Checklist]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[MAFU_TRS_Checklist]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [MAFU_TRS_Checklist] 
	@fieldName nvarchar(50), @whereClause varchar(8000) 
AS 
	SET DATEFORMAT dmy

	DECLARE @QUERY as varchar(2000)

	SET @QUERY = '
SELECT CAST ( COUNT(T_MP.id_mp)  as varchar) + ''_OK'' as countOk
FROM T_MP INNER JOIN  T_CHECKLIST ON T_MP.id_mp = T_CHECKLIST.idr_mp LEFT OUTER JOIN R_ATA ON T_MP.idr_ata = R_ATA.id_ata
WHERE (T_MP.ACMTLeaderMP = ''SYS'') AND (T_MP.LinvoldMP = ''LEADER'') AND (T_CHECKLIST.' +@fieldName +' = ''OK'') '+@whereClause+'
UNION
SELECT CAST ( COUNT(T_MP.id_mp)  as varchar) + ''_NOK'' as countOk
FROM T_MP INNER JOIN  T_CHECKLIST ON T_MP.id_mp = T_CHECKLIST.idr_mp LEFT OUTER JOIN R_ATA ON T_MP.idr_ata = R_ATA.id_ata
WHERE (T_MP.ACMTLeaderMP = ''SYS'') AND (T_MP.LinvoldMP = ''LEADER'') AND (T_CHECKLIST.' +@fieldName +' = ''KO'') '+@whereClause+'
UNION
SELECT CAST ( COUNT(T_MP.id_mp)  as varchar) + ''_N/A'' as countOk
FROM T_MP INNER JOIN  T_CHECKLIST ON T_MP.id_mp = T_CHECKLIST.idr_mp LEFT OUTER JOIN R_ATA ON T_MP.idr_ata = R_ATA.id_ata
WHERE (T_MP.ACMTLeaderMP = ''SYS'') AND (T_MP.LinvoldMP = ''LEADER'') AND (T_CHECKLIST.' +@fieldName +' = ''N/A'') '+@whereClause+'
'

	EXEC(@QUERY)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO
