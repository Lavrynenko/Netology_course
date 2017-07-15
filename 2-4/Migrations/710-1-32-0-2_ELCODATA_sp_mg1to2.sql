if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MaturityGateControl_1to2]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MaturityGateControl_1to2]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE [dbo].[MaturityGateControl_1to2]
(
	@id_ds AS INTEGER,
	@program AS VARCHAR(50)
)
AS
	------------------------------------------------------------------------
	-- Check EDD attributes to upgrade from MG 1 to MG 2
	--
	-- @param		id_ds		The EDD index in table R_FIN_DS
	-- @param		program		The plane program
	-- @return		sql			A string containing all the check errors
	--
	------------------------------------------------------------------------

	DECLARE @SQL AS VARCHAR(8000)

	SET @SQL = ''


	------------------------------------------------------------------------
	-- check if mandatory attributes are empty
	------------------------------------------------------------------------
	SELECT
		@SQL = 	@SQL +

		CASE
			WHEN @SQL = '' THEN ''
			ELSE ' + '
		END +

		CASE
			WHEN infobase.type_val='int' OR infobase.type_val='float' THEN
				'
					CASE
						WHEN ' + infobase.object_value + '=NULL THEN ''' + infobase.object_name + ' is mandatory<br />''
						ELSE ''''
					END'
			ELSE
				 '
				 	CASE
						WHEN ISNULL(' + infobase.object_value + ', '''') = '''' THEN ''' + infobase.object_name + ' is mandatory<br />''
						ELSE ''''
					END'
		END
	FROM
		R_FIN_DS,
		infobase,
		T_MG
	WHERE
		id_ds = @id_ds
		AND table_name = 'R_FIN_DS'
		AND infobase.object_name = T_MG.object_name
		AND ISNULL(PCType, '') = ISNULL(PowerCenterType, '')
		AND ISNULL(DeviceType, '') = ISNULL(TypeOfProtection, '')
		AND MG = ML - 1
		AND SpecificControl = 0


	------------------------------------------------------------------------
	-- check attributes consistencies
	------------------------------------------------------------------------
	-- check consistency between Phase Type and AC/DC Type fields value
	SET @SQL = @SQL +
	' +
		CASE
			WHEN ISNULL(TypeACDC, '''') <> '''' AND ISNULL(TypePhase, '''') <> '''' AND TypeACDC = ''AC'' AND TypePhase = ''N/A'' THEN ''For AC, phase type must not be N/A<br />'' ELSE ''''
		END +
		CASE
			WHEN ISNULL(TypeACDC, '''') <> '''' AND ISNULL(TypePhase, '''') <> '''' AND TypeACDC = ''DC'' AND TypePhase <> ''N/A'' THEN ''For DC, phase type must be N/A<br />'' ELSE ''''
		END + '

	-- check that the FIN DS is linked to a FIN CI
	SET @SQL = @SQL +
	'
		CASE
			WHEN MG = 1 AND idr_fin IS NULL THEN ''The FIN must be defined<br />'' ELSE ''''
		END + '

	-- check that a MP is linked to the current FIN DS
	SET @SQL = @SQL +
	'
		CASE
			WHEN MG = 1 AND ISNULL((SELECT TOP 1 idr_mp FROM T_IMPACTDS WHERE idr_ds_post =  id_ds), 0) = 0 THEN ''MP is mandatory<br />'' ELSE ''''
		END + '

	-- check consistency between "Power Center Type" and "Device Type"
	SET @SQL = @SQL +
	'
		CASE
			WHEN (SELECT TOP 1 COUNT(*) FROM T_MG WHERE ISNULL(PCType, '''') = ISNULL(PowerCenterType, '''')  AND ISNULL(DeviceType, '''')  = ISNULL(TypeOfProtection, '''') ) = 0 THEN PowerCenterType + '',  '' + TypeOfProtection + '' do not match<br />'' ELSE ''''
		END + '

	-- check "Power Factor" field value consistency
	SET @SQL = @SQL +
	'
		CASE
			WHEN ISNULL(PowerFactor, 0) < 0 OR ISNULL(PowerFactor, 0) > 1 THEN ''Power factor must be >= 0 and <= 1<br />'' ELSE ''''
		END + '

	-- check "MG 2 Data ATAXX notification" field value consistency
	SET @SQL = @SQL +
	'
		CASE
			WHEN MG = 1 AND (VALM1 <> ''Validated'' OR VALM1 is null) THEN ''ATAXX must notify Maturity Gate 2<br />'' ELSE ''''
		END'

	-- check consistency between linked FIN CI "Functional Designation" (if exist) and "Device Type" fields value
	SET @SQL = @SQL +
	' +
		CASE
			WHEN idr_fin IS NOT NULL THEN
				CASE
					WHEN TypeOfProtection = ''RCCB'' THEN
						CASE
							WHEN ( SELECT id_fin FROM R_FIN_CI WHERE id_fin IN (SELECT idr_fin FROM R_FIN_DS WHERE id_ds = ' + CONVERT(VARCHAR(8000), @id_ds) + ') AND FunctionnalDesignation LIKE ''RCCB%'' ) IS NULL THEN
								''The linked FIN CI Functional Designation does not match with the current FIN DS Device Type value<br />''
						ELSE ''''
						END
					WHEN TypeOfProtection = ''C/B'' THEN
						CASE
							WHEN ( SELECT id_fin FROM R_FIN_CI WHERE id_fin IN (SELECT idr_fin FROM R_FIN_DS WHERE id_ds = ' + CONVERT(VARCHAR(8000), @id_ds) + ') AND FunctionnalDesignation LIKE ''C/B%'' ) IS NULL THEN
								''The linked FIN CI Functional Designation does not match with the current FIN DS Device Type value<br />''
						ELSE ''''
						END
					WHEN TypeOfProtection = ''SSPC'' THEN
						CASE
							WHEN ( SELECT id_fin FROM R_FIN_CI WHERE id_fin IN (SELECT idr_fin FROM R_FIN_DS WHERE id_ds = ' + CONVERT(VARCHAR(8000), @id_ds) + ') AND FunctionnalDesignation LIKE ''SSPC%'') IS NULL THEN
								''The linked FIN CI Functional Designation does not match with the current FIN DS Device Type value<br />''
						ELSE ''''
						END
				END
		END
	'
		
	IF (@program = 'A380' OR @program = 'A400M')
	BEGIN
		-- check consistency for "P/CD CTL Connector" and "P/CD CTL Pin Allocation" fields value
		SET @SQL = @SQL +
		' +
			CASE
				WHEN
					FINDS_SSPCCommandType=''Discrete'' AND ISNULL(PCDCont1Con, '''') = '''' THEN
					''P/CD CTL Connector is mandatory<br>''
			END +
			CASE
				WHEN
					FINDS_SSPCCommandType=''Discrete'' AND ISNULL(PCDCont1Pin, '''') = '''' THEN
					''P/CD CTL Pin Allocation is mandatory<br>''
			END
		'
	END


	------------------------------------------------------------------------
	-- Generate the request setting the errors message
	------------------------------------------------------------------------
	SET @SQL = 'SELECT CONVERT(TEXT, '+ @SQL + ') FROM R_FIN_DS WHERE id_ds = ' + CONVERT(VARCHAR(8000), @id_ds)

	EXEC(@SQL)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

