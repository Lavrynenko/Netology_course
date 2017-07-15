/*********************************/
/* Report MAFU Delta 1 Follow-up */
/*********************************/

if (not exists (SELECT * FROM T_REPORT_GROUP WHERE report_group_label = 'MAFU'))
begin
	INSERT INTO T_REPORT_GROUP (report_group_label) SELECT 'MAFU'
end

DELETE FROM T_DBActions WHERE label = 'MAFU Delta 1 Follow-up'

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
	'MAFU Delta 1 Follow-up', 
	null, 
	'- Weekly status', 
	'MAFU-Delta1FollowUp_A350.php', 
	'Weekly Status (ex : W44/2006):#delta1Reference#; Group Leader :#GrpLeaderMP#;Change Leader :#ChgLeaderMP#;MSN (ex : -3-) :#MSN#', 
	'<b><u> CAUTION </u> : <i>[Weekly Status]</i> is mandatory</b><br/>Hidden filters automatically applied: <i><b>MP ACMT Leader</b></i> = SYS and All MP with an <i><b>Achieved Date for Delta 1 removal</i></b> equals to “missing”, or with an empty value. All MP Wxx-1< <i><b>Achieved Date for Delta 1 removal</i></b> < Wxx.', 
	null, 
	report_group_id 
FROM 
	T_REPORT_GROUP 
WHERE 
	report_group_label = 'MAFU'


/************************************************/
/* Stored procedures for MAFU Delta 1 Follow-up */
/************************************************/

---- sp_Delta1FollowUp_A350 ----

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Delta1FollowUp_A350]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_Delta1FollowUp_A350]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE sp_Delta1FollowUp_A350  @delta1Parsed VARCHAR(50),@GL VARCHAR(255), @CL VARCHAR (255),@MSN VARCHAR (255)
AS 

	DECLARE @delta1Prev AS VARCHAR(50),@CLComment as VARCHAR (255), @GLComment as VARCHAR(255), @MSNComment as VARCHAR(255)
	DECLARE @QUERY as varchar(8000)
	declare @weekNumber VARCHAR(50), @prevWeekNumber VARCHAR(50)
	
	SET @GLComment=''
	SET @CLComment=''
	SET @MSNComment=''	
	IF LTRIM(RTRIM(@GL))='' set @GLComment=' OR GrpLeaderMP is null'
	IF LTRIM(RTRIM(@CL))='' set @CLComment=' OR ChgLeaderMP is null'
	IF LTRIM(RTRIM(@CL))='' set @MSNComment=' OR delta1MSN is null'
	SET @delta1Prev = REPLACE ( @delta1Parsed, 'W' , '' )
	set @weekNumber = CONVERT (VARCHAR,SUBSTRING ( @delta1Prev , 1, CHARINDEX('/', @delta1Prev)-1))
	set @prevWeekNumber = CONVERT (VARCHAR,SUBSTRING ( @delta1Prev , 1, CHARINDEX('/', @delta1Prev)-1)-1)

	---- Calculate previous week
	SET @delta1Prev = 'W'+CONVERT (VARCHAR,SUBSTRING ( @delta1Prev , 1, CHARINDEX('/', @delta1Prev)-1)-1)+'/'+CONVERT (VARCHAR,SUBSTRING( @delta1Parsed , CHARINDEX('/', @delta1Parsed)+1 , 5 ))
	SET @QUERY = '
		SELECT     
			T_DELTA1_FOLLOWUP.delta1Reference AS [weekly Satus], 
			T_DELTA1_FOLLOWUP.delta1MSN AS MSN, 
			T_DELTA1_FOLLOWUP.delta1FirstApp as [First Application],
			T_MOD.MODReference AS MOD, 
			T_MP.MPReference AS MP, 
			requestReference as [CR/RFC],
			T_DELTA1_FOLLOWUP.correctiveAction AS [Corrective action], 
			T_MP.ChgLeaderMP AS [WP CM Change Leader], 
			R_ATA.ATACode as [ATA],
			T_MP.MPTitle AS Title, 
			T_DELTA1_FOLLOWUP.delta1ModStacking AS [MOD Stacking], 
			T_DELTA1_FOLLOWUP.delta1NewMod AS [New mod (No DS)], 
			T_DELTA1_FOLLOWUP.delta1DsWip AS [DS WIP], 
			T_DELTA1_FOLLOWUP.EngineeringFeedback AS [Eng Feedback], 
			T_DELTA1_FOLLOWUP.deletionOrder AS [Deletion order], 
			T_DELTA1_FOLLOWUP.analysisCode AS [Analysis code], 
			T_DELTA1_FOLLOWUP.catClassification AS [Category Classification], 
			T_MP.GrpLeaderMP AS [IPT CM Group Leader], 
			T_DELTA1_FOLLOWUP.defaultType AS [Default Type], 
			CONVERT(VARCHAR, T_DELTA1_FOLLOWUP.removalDateFText, 103)  AS [Forecast Date], 
			T_DELTA1_FOLLOWUP.delta1Comment AS [ Comment], 
			CONVERT(VARCHAR, T_DELTA1_FOLLOWUP.removalDateAText, 103)   AS [Achieved Date], 
			T_MP.INVMOpDateA AS [Opening Date MP]
		FROM         
			R_ATA RIGHT 
			OUTER JOIN T_DELTA1_FOLLOWUP 
			INNER JOIN T_MP ON T_DELTA1_FOLLOWUP.idr_mp = T_MP.id_mp ON R_ATA.id_ata = T_MP.idr_ata 
			LEFT OUTER JOIN T_LINK_REQUEST_MP 
			INNER JOIN T_REQUEST ON T_LINK_REQUEST_MP.idr_request = T_REQUEST.id_request ON T_MP.id_mp = T_LINK_REQUEST_MP.idr_mp 
			LEFT OUTER JOIN T_MOD 
			INNER JOIN T_LINK_MOD_MP ON T_MOD.id_mod = T_LINK_MOD_MP.idr_mod ON T_MP.id_mp = T_LINK_MOD_MP.idr_mp
		WHERE
			removalDateAText IS NOT NULL AND removalDateAText <> ''Missing'' AND removalDateAText <> ''N/A'' and
			(DATEPART(week, CONVERT(datetime,removalDateAText,103)) = '+@weekNumber+'
			 or DATEPART(week, CONVERT(datetime,removalDateAText,103)) = '+@prevWeekNumber+')
			and (ChgLeaderMP like ''%'+@CL+'%''' + @CLComment+')
			and (GrpLeaderMP like ''%'+@GL+'%''' + @GLComment+')
			and (delta1MSN like ''%'+@MSN+'%''' + @MSNComment+')
			and T_MP.ACMTLeaderMP = ''SYS''
		ORDER BY T_DELTA1_FOLLOWUP.delta1Reference DESC, T_MP.MPReference'
	
	EXEC(@QUERY)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


---- sp_Delta1FollowUpMissing_A350 ----

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Delta1FollowUpMissing_A350]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_Delta1FollowUpMissing_A350]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE sp_Delta1FollowUpMissing_A350  @delta1Parsed VARCHAR(50),@GL VARCHAR(255), @CL VARCHAR (255),@MSN VARCHAR (255)
AS 

	DECLARE @delta1Prev AS VARCHAR(50), @CLComment as VARCHAR (255), @GLComment as VARCHAR(255), @MSNComment as VARCHAR(255)
	DECLARE @QUERY1 as varchar(8000)
	DECLARE @QUERY2 as varchar(8000)

	SET @GLComment=''
	SET @CLComment=''
	SET @MSNComment=''	

	IF LTRIM(RTRIM(@GL))='' set @GLComment=' OR GrpLeaderMP is null'
	IF LTRIM(RTRIM(@CL))='' set @CLComment=' OR ChgLeaderMP is null'
	IF LTRIM(RTRIM(@CL))='' set @MSNComment=' OR delta1MSN is null'
	SET @delta1Prev = REPLACE ( @delta1Parsed, 'W' , '' )

	---- Calculate previous week
	SET @delta1Prev = 'W'+CONVERT (VARCHAR,SUBSTRING ( @delta1Prev , 1, CHARINDEX('/', @delta1Prev)-1)-1)+'/'+CONVERT (VARCHAR,SUBSTRING( @delta1Parsed , CHARINDEX('/', @delta1Parsed)+1 , 5 ))

	SET @QUERY1 = 'SELECT     
			T_DELTA1_FOLLOWUP.delta1Reference AS [weekly Satus], 
			T_DELTA1_FOLLOWUP.delta1MSN AS MSN, 
			T_DELTA1_FOLLOWUP.delta1FirstApp as [First Application],
			T_MOD.MODReference AS MOD, 
			T_MP.MPReference AS MP, 
			requestReference as [CR/RFC],
			T_DELTA1_FOLLOWUP.correctiveAction AS [Corrective action], 
			T_MP.ChgLeaderMP AS [WP CM Change Leader], 
			R_ATA.ATACode as [ATA],
			T_MP.MPTitle AS Title, 
			T_DELTA1_FOLLOWUP.delta1ModStacking AS [MOD Stacking], 
			T_DELTA1_FOLLOWUP.delta1NewMod AS [New mod (No DS)], 
			T_DELTA1_FOLLOWUP.delta1DsWip AS [DS WIP], 
			T_DELTA1_FOLLOWUP.EngineeringFeedback AS [Eng Feedback], 
			T_DELTA1_FOLLOWUP.deletionOrder AS [Deletion order], 
			T_DELTA1_FOLLOWUP.analysisCode AS [Analysis code], 
			T_DELTA1_FOLLOWUP.catClassification AS [Category Classification], 
			T_MP.GrpLeaderMP AS [IPT CM Group Leader], 
			T_DELTA1_FOLLOWUP.defaultType AS [Default Type], 
			CONVERT(VARCHAR, T_DELTA1_FOLLOWUP.removalDateFText, 103)  AS [Forecast Date], 
			T_DELTA1_FOLLOWUP.delta1Comment AS [ Comment], 
			CONVERT(VARCHAR, T_DELTA1_FOLLOWUP.removalDateAText, 103)   AS [Achieved Date], 
			T_MP.INVMOpDateA AS [Opening Date MP]
		FROM  R_ATA RIGHT 
			OUTER JOIN T_DELTA1_FOLLOWUP 
			INNER JOIN T_MP ON T_DELTA1_FOLLOWUP.idr_mp = T_MP.id_mp ON R_ATA.id_ata = T_MP.idr_ata 
			LEFT OUTER JOIN T_LINK_REQUEST_MP 
			INNER JOIN T_REQUEST ON T_LINK_REQUEST_MP.idr_request = T_REQUEST.id_request ON T_MP.id_mp = T_LINK_REQUEST_MP.idr_mp 
			LEFT OUTER JOIN T_MOD 
			INNER JOIN T_LINK_MOD_MP ON T_MOD.id_mod = T_LINK_MOD_MP.idr_mod ON T_MP.id_mp = T_LINK_MOD_MP.idr_mp '

	set @QUERY2 = '	WHERE (removalDateAText is null OR removalDateAText like ''missing'')
	and (ChgLeaderMP like ''%' + @CL + '%''' + @CLComment + ')
	and (GrpLeaderMP like ''%' + @GL + '%''' + @GLComment + ')
	and (delta1MSN like ''%' + @MSN + '%''' + @MSNComment + ')
	and T_MP.ACMTLeaderMP = ''SYS''
	ORDER BY T_DELTA1_FOLLOWUP.delta1Reference DESC, T_MP.MPReference'

	EXEC(@QUERY1 + @QUERY2)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


