/***********************************/
/* Report MAFU Export the Last MoM */
/***********************************/

if (not exists (SELECT * FROM T_REPORT_GROUP WHERE report_group_label = 'MAFU'))
begin
	INSERT INTO T_REPORT_GROUP (report_group_label) SELECT 'MAFU'
end

DELETE FROM T_DBActions WHERE label = 'MAFU Export the Last MoM'

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
	'MAFU Export the Last MoM', 
	'EXECUTE [MAFULastMoM_A350]', 
	'- Export the last Minute of Meeting', 
	'MAFU_meeting_excel_export_A350.php', 
	null, 
	null, 
	null, 
	report_group_id 
FROM 
	T_REPORT_GROUP 
WHERE 
	report_group_label = 'MAFU'


/*************************************************/
/* Stored procedure for MAFU Export the Last MoM */
/*************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MAFULastMoM_A350]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[MAFULastMoM_A350]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[MAFULastMoM_A350] AS 
------------------------------------------------------
-- This stored proc get the date of the next monday --
------------------------------------------------------
BEGIN 
	DECLARE @DayOfMeeting AS int
	--- Day of meetings is : monday  (=2)
	SET @DayOfMeeting = 2
	DECLARE @today AS DATETIME
	SET  @today = GETDATE()
	DECLARE @result as int
	SET @result = (DATEPART (dw,@today) - @DayOfMeeting) % 7
	-- Modulo
	IF @result < 0 
	SET @result = 7 + @result
	DECLARE @lastMeeting AS DATETIME
	SET @lastMeeting = DATEDIFF(day,@result,@today)

	SELECT 
		COALESCE(GIRespSite,'') as [Site Responsible],
		meetName as [Type of Meeting],
		RequestReference as Reference,
		COALESCE(CONVERT(varchar, ScreenDate, 103),'') as [Program Target Date],
		COALESCE(RFCEpacTdu,'') as [ATA EPAC-TDU],
		COALESCE(StudyReq,'') as [Study Request],
		case typeOfRequest 
			when 'RFC'  then RFCStatus
			when 'CR' then eRoomStatus
			else 'Unknown Type'
		END AS [Status],
		ACMTLeaderCR as [Leading PDT],
		case ACMTLeaderCR
			when 'SYS'  then 'Leader'
			else 'Involved'
		END as [Leading],
		GrpLeaderCR as [IPT CM Group Leader],
		ChgLeaderCR as [WP CM Change Leader],
		TechLeader as [Technical Leader],
		CMITLeader as [IPT Leader],
		RequestTitle as [Title],
		GIPoE as [PoE],
		PDImpact as [PD Impacted],
		GIEqImpacted as [Equipement Impacted],
		KickOffMeeting as [Kick Off Meeting],
		MeetComment as [Meeting Comments],
		MeetActions as [Meeting Actions] 
	FROM 
		T_REQUEST INNER JOIN T_MEETING on T_REQUEST.id_request=T_MEETING.idr_request
	WHERE 
		-- Date condition
		meetDateText IS NOT NULL AND meetDateText <> 'Missing' AND meetDateText <> 'N/A' AND
		DATEPART(d,@lastMeeting)=DATEPART(d,CONVERT(datetime,meetDateText,103)) AND
		DATEPART(m,@lastMeeting)=DATEPART(m,CONVERT(datetime,meetDateText,103)) AND
		DATEPART(yyyy,@lastMeeting)=DATEPART(yyyy,CONVERT(datetime,meetDateText,103)) AND (
		-- Name condition
		meetName='SYS CCC0' OR meetName='SYS CCC1' OR meetName='SYS CCC2' 
		)
	ORDER BY 
		meetName
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO
