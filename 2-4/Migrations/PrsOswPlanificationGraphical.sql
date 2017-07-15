/***************************
Create the stored procedure
****************************/


/***************************
insert a line in t_dbactions
****************************/
if (not exists (SELECT *
		FROM t_report_group
		WHERE report_group_label='INDUSTRIAL'))
begin
	INSERT INTO t_report_group (report_group_label)
	SELECT 'INDUSTRIAL'
end


DELETE FROM T_DBActions WHERE label='PRS Remain to do OSW Planification'

INSERT INTO t_dbactions 
(label, command, comments, report_commentary, parameters, mandatory_fields, report_group_idr, template_page)
SELECT
	'PRS Remain to do OSW Planification',
	'DECLARE
	@MSNEFFRANGE VARCHAR(8000)
SET @MSNEFFRANGE = ''#msn#''





SELECT    
	V_PRS.prs_FinCountRackableHW + V_PRS.prs_FinCountOtherHW CountSum,
	T_PRS_PHASES.prs_phases_MsnConcerned MSN,
	T_PHASE.phase_label Phase
INTO
	#@PhaseMSN
FROM         
	T_PRS_PHASES 
	JOIN T_INVOLVED_TEAM_MP ON T_INVOLVED_TEAM_MP.id_itmp = T_PRS_PHASES.idr_involved_team_mp 
	JOIN T_COE_CMIT ON T_COE_CMIT.coe_cmit_label = T_INVOLVED_TEAM_MP.ACMTImpacted 
	JOIN T_PHASE ON T_PHASE.phase_label = T_PRS_PHASES.prs_phases_label
	JOIN V_PRS ON V_PRS.id_prs = T_INVOLVED_TEAM_MP.mp_idr
WHERE    
	 T_COE_CMIT.coe_cmit_type = ''COE'' 
	AND T_INVOLVED_TEAM_MP.NotDisplayed <> 1
	AND T_PHASE.phase_stage IS NOT NULL

DECLARE
	@MSN INTEGER,
	@value VARCHAR(8000),
	@c CHAR(1),
	@i INTEGER,
	@from INTEGER,
	@to INTEGER,
	@inrange INTEGER,
	@SQL VARCHAR(8000)

SET @SQL = ''SELECT
	#@PhaseMSN.Phase''

DECLARE db_cursorMSN CURSOR FOR
	SELECT DISTINCT
		CONVERT(INTEGER, MSN) MSN
	FROM
		tmpsv_ACEAAT
	ORDER BY
		CONVERT(INTEGER, MSN)
BEGIN
	OPEN db_cursorMSN
	FETCH NEXT FROM db_cursorMSN INTO @MSN
	WHILE (@@FETCH_STATUS <> -1)
	BEGIN
		SET @value = ''''
		SET @i = 1
		SET @inrange = 0
		SET @from = 0
	
		IF @MSNEFFRANGE = ''1-9999'' OR @MSNEFFRANGE = ''0001-9999''
			SET @inrange = 1
		ELSE
		BEGIN
			WHILE @i <= LEN(@MSNEFFRANGE)
			BEGIN
				SET @c = SUBSTRING(@MSNEFFRANGE, @i, 1)
				IF @c >= ''0'' AND @c <= ''9''
					SET @value = @value + @c
				ELSE
				BEGIN
					IF @c = ''-''
			    			SET @from = CONVERT(INTEGER, @value)
					ELSE
					BEGIN
						SET @to = CONVERT(INTEGER, @value)
						IF @from > 0 AND @MSN >= @from AND @MSN <= @to
							SET @inrange = 1
						IF @from = 0 AND @MSN = @to
							SET @inrange = 1
						SET @from = 0
					END
					SET @value = ''''
				END
				SET @i = @i + 1
			END
		
			SET @to = CONVERT(INTEGER, @value)
		
			IF @from > 0 AND @MSN >= @from AND @MSN <= @to
				SET @inrange = 1
			IF @from = 0 AND @MSN = @to
				SET @inrange = 1
		END
		IF @inrange = 1
		BEGIN
			SET @SQL = @SQL + '',
	(SELECT SUM(MSNSum.CountSum) Total FROM #@PhaseMSN MSNSum WHERE MSNSum.Phase = #@PhaseMSN.Phase AND MSNSum.MSN LIKE ''''%-'' + CONVERT(VARCHAR(8000), @MSN) + ''-%'''' GROUP BY MSNSum.Phase) MSN'' + CONVERT(VARCHAR(8000), @MSN)
		END
		FETCH NEXT FROM db_cursorMSN INTO @MSN
	END
	CLOSE db_cursorMSN
	DEALLOCATE db_cursorMSN
END

SET @SQL = @SQL + ''
FROM
	#@PhaseMSN
GROUP BY
	#@PhaseMSN.Phase''

EXECUTE(@SQL)
DROP TABLE #@PhaseMSN
',
	'- Comparison between OSW planned and MSN achieved. <br/>- Maximum MSN treated : 15',
	'Several combinations are possible : <br/>- 1-9 ==> MSN1 to MSN9<br/>- 1;9 ==> MSN1 and MSN9<br/>- 2-4;6-8;16;18 ==> MSN2, MSN3, MSN4, MSN6, MSN7, MSN8, MSN16 and MSN 18',
	'MSN :#msn#',
	'msn',
	report_group_id, 
	'PRS_OSWplanificationGraphical.php'
FROM
	t_report_group
WHERE
	report_group_label='INDUSTRIAL'