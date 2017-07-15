/**
 * RD 2062 		: Fix a bug on stored procedure "sp_INSERT_ALERTS_FOR_RELEASED"
 *
 * Description 	: The condition to generate an alert on data in T_WDDS must be
 *    following the WDDSType instead of the WDDS_Reference
 * Date 		: 2010-10-11
 * Program		: All
 */

/****** Object:  StoredProcedure [dbo].[sp_INSERT_ALERTS_FOR_RELEASED]    Script Date: 10/11/2010 11:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_INSERT_ALERTS_FOR_RELEASED] AS
/************************************************************************
*
* This script inserts data into table T_ALERT detailing each PD or WD that has been released the day before.
* It must be run every day, early in the morning.
*
**************************************************************************/
BEGIN
	INSERT INTO T_ALERT (
		AlertATACode,
		AlertATASubATACode,
		AlertDiagramType,
		AlertUserIdr,
		AlertDiagramReference,
		AlertDiagramIdr,
		AlertDiagramTifFile,
		AlertDiagramDomain
	)
	SELECT
		SUBSTRING (pdds_reference, 4, 2),
		SUBSTRING (pdds_reference, 4, 3) + SUBSTRING (pdds_reference, 8, 1),
		'PD',
		USER_id,
		pdds_reference,
		id_pdds,
		pdds_tifFile,
		PDDSDomain
	FROM
		T_PDDS,
		T_USER
	WHERE
		DATEDIFF(day, convert(datetime, substring(PDDSReleaseDate, 1, 10), 103), dateadd(dd, -1, getdate())) <= 0
--		DATEDIFF(mi, convert(datetime, substring(PDDSReleaseDate, 1, 10), 103) + convert(datetime, substring(PDDSReleaseDate, 11, 8), 108), dateadd(mi, -60, getdate())) <= 0
		AND pdds_status = 'RELEASED'
	UNION
	SELECT
		SUBSTRING (wdds_reference, 4, 2),
		SUBSTRING (wdds_reference, 4, 3) + SUBSTRING (wdds_reference, 8, 1),
		'WD',
		USER_id,
		wdds_reference,
		WDDS_id,
		WddsTifFile,
		WDDSDomain
	FROM
		(SELECT * FROM T_WDDS WHERE WddsType='WD') NOT_EPD,
		T_USER
	WHERE
		DATEDIFF(day, convert(datetime, substring(WDDSReleaseDate, 1, 10), 103), dateadd(dd, -1, getdate())) <= 0
--		DATEDIFF(mi, convert(datetime, substring(WDDSReleaseDate, 1, 10), 103) + convert(datetime, substring(WDDSReleaseDate, 11, 8), 108), dateadd(mi, -60, getdate())) <= 0
		AND WddsStatus = 'RELEASED'

	-- Deletion of alerts older than 2 months
	-- Old PDDS alerts
	DELETE FROM
		T_ALERT
	WHERE
		AlertDiagramType = 'PD'
		AND AlertDiagramIdr IN (
			SELECT
				id_pdds
			FROM
				T_PDDS
			WHERE
				pdds_status = 'RELEASED'
				AND convert(datetime, substring(PDDSReleaseDate, 1, 10), 103) < DATEADD(month, -2, getDate())
		)
	-- Old WDDS alerts
	DELETE FROM
		T_ALERT
	WHERE
		AlertDiagramType = 'WD'
		AND AlertDiagramIdr IN (
			SELECT
				WDDS_id
			FROM
				T_WDDS
			WHERE
				WddsStatus = 'RELEASED'
				AND convert(datetime, substring(WDDSReleaseDate, 1, 10), 103) < DATEADD(month, -2, getDate())
		)

END
