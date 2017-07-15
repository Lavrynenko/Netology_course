if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MaturityGateControl_0to1]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MaturityGateControl_0to1]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE [dbo].[MaturityGateControl_0to1]
(
	@id_ds AS INTEGER,
	@program AS VARCHAR(50)
)
AS
	------------------------------------------------------------------------
	-- Check EDD attributes to upgrade from MG 0 to MG 1
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
		id_ds 						= @id_ds
		AND table_name 				= 'R_FIN_DS'
		AND infobase.object_name 	= T_MG.object_name
		AND ISNULL(PCType, '') 		= ISNULL(PowerCenterType, '')
		AND ISNULL(DeviceType, '') 	= ISNULL(TypeOfProtection, '')
		AND MG 						= ML - 1
		AND SpecificControl 		= 0


	------------------------------------------------------------------------
	-- check attributes consistencies
	------------------------------------------------------------------------
	-- check consistency between Nominal Power fields value
	SET @SQL = @SQL +
	' +
		CASE
			WHEN MG = 0 AND TypeACDC = ''DC'' THEN
				CASE WHEN ISNULL(cast(NPP1 as varchar(8000)),'''') <> '''' THEN ''For DC Nominal Power PhA (V.A) must be empty<br />'' ELSE '''' END +
				CASE WHEN ISNULL(cast(NPP2 as varchar(8000)),'''') <> '''' THEN ''For DC Nominal Power PhB (V.A) must be empty<br />'' ELSE '''' END +
				CASE WHEN ISNULL(cast(NPP3 as varchar(8000)),'''') <> '''' THEN ''For DC Nominal Power PhC (V.A) must be empty<br />'' ELSE '''' END +
				CASE WHEN ISNULL(cast(NominalPower as varchar(8000)),'''') = '''' THEN ''For DC Nominal Power (W or V.A) is mandatory<br />'' ELSE '''' END
			WHEN MG = 0 AND TypeACDC = ''AC'' AND TypePhase = ''1Ph'' THEN
				CASE WHEN ISNULL(cast(NPP1 as varchar(8000)),'''') <> '''' THEN ''For AC 1ph Nominal Power PhA (V.A) must be empty<br />'' ELSE '''' END +
				CASE WHEN ISNULL(cast(NPP2 as varchar(8000)),'''') <> '''' THEN ''For AC 1ph Nominal Power PhB (V.A) must be empty<br />'' ELSE '''' END +
				CASE WHEN ISNULL(cast(NPP3 as varchar(8000)),'''')  <> '''' THEN ''For AC 1ph Nominal Power PhC (V.A) must be empty<br />'' ELSE '''' END +
				CASE WHEN ISNULL(cast(NominalPower as varchar(8000)),'''') = '''' THEN ''For AC 1ph Nominal Power (W or V.A) is mandatory<br />'' ELSE '''' END
			WHEN MG = 0 AND TypeACDC = ''AC'' AND AllocatedPhase = ''AB'' THEN
				CASE WHEN ISNULL(cast(NPP1 as varchar(8000)),'''') = '''' THEN ''For AC 2ph AB Nominal Power PhA (V.A) is mandatory<br />'' ELSE '''' END +
				CASE WHEN ISNULL(cast(NPP2 as varchar(8000)),'''') = '''' THEN ''For AC 2ph AB Nominal Power PhB (V.A) is mandatory<br />'' ELSE '''' END +
				CASE WHEN ISNULL(cast(NPP3 as varchar(8000)),'''')  <> '''' THEN ''For AC 2ph AB Nominal Power PhC (V.A) must be empty<br />'' ELSE '''' END +
				CASE WHEN ISNULL(cast(NominalPower as varchar(8000)),'''') <> '''' THEN ''For AC 2ph AB Nominal Power (W or V.A) must be empty<br />'' ELSE '''' END
			WHEN MG = 0 AND TypeACDC = ''AC'' AND AllocatedPhase = ''AC'' THEN
				CASE WHEN ISNULL(cast(NPP1 as varchar(8000)),'''') = '''' THEN ''For AC 2ph AC Nominal Power PhA (V.A) is mandatory<br />'' ELSE '''' END +
				CASE WHEN ISNULL(cast(NPP2 as varchar(8000)),'''') <> '''' THEN ''For AC 2ph AC Nominal Power PhB (V.A) must be empty<br />'' ELSE '''' END +
				CASE WHEN ISNULL(cast(NPP3 as varchar(8000)),'''')  = '''' THEN ''For AC 2ph AC Nominal Power PhC (V.A) is mandatory<br />'' ELSE '''' END +
				CASE WHEN ISNULL(cast(NominalPower as varchar(8000)),'''') <> '''' THEN ''ForAC 2ph ACNominal Power (W or V.A) must be empty<br />'' ELSE '''' END
			WHEN MG = 0 AND TypeACDC = ''AC'' AND AllocatedPhase = ''BC'' THEN
				CASE WHEN ISNULL(cast(NPP1 as varchar(8000)),'''') <> '''' THEN ''For AC 2ph BC Nominal Power PhA (V.A) must be empty<br />'' ELSE '''' END +
				CASE WHEN ISNULL(cast(NPP2 as varchar(8000)),'''') = '''' THEN ''For AC 2ph BC Nominal Power PhB (V.A) is mandatory<br />'' ELSE '''' END +
				CASE WHEN ISNULL(cast(NPP3 as varchar(8000)),'''')  = '''' THEN ''For AC 2ph BC Nominal Power PhC (V.A) is mandatory<br />'' ELSE '''' END +
				CASE WHEN ISNULL(cast(NominalPower as varchar(8000)),'''') <> '''' THEN ''For AC 2ph BC Nominal Power (W or V.A) must be empty<br />'' ELSE '''' END
			WHEN MG = 0 AND TypeACDC = ''AC'' AND AllocatedPhase = ''ABC'' THEN
				CASE WHEN ISNULL(cast(NPP1 as varchar(8000)),'''') = '''' THEN ''For AC 3ph ABC Nominal Power PhA (V.A) is mandatory<br />'' ELSE '''' END +
				CASE WHEN ISNULL(cast(NPP2 as varchar(8000)),'''') = '''' THEN ''For AC 3ph ABC Nominal Power PhB (V.A) is mandatory<br />'' ELSE '''' END +
				CASE WHEN ISNULL(cast(NPP3 as varchar(8000)),'''') = '''' THEN ''For AC 3ph ABC Nominal Power PhC (V.A) is mandatory<br />'' ELSE '''' END +
				CASE WHEN ISNULL(cast(NominalPower as varchar(8000)),'''') <> '''' THEN ''For AC 3ph ABC Nominal Power (W or V.A) must be empty<br />'' ELSE '''' END
			ELSE ''''
		END + '

	-- check consistency between Phase Type and AC/DC Type fields value
	SET @SQL = @SQL +
	'
		CASE
			WHEN  ISNULL(TypeACDC, '''') <> '''' AND ISNULL(TypePhase, '''') <> '''' AND TypeACDC = ''AC'' AND TypePhase = ''N/A'' THEN ''For AC, phase type must not be N/A<br />'' ELSE ''''
		END +
		CASE
			WHEN  ISNULL(TypeACDC, '''') <> '''' AND ISNULL(TypePhase, '''') <> '''' AND TypeACDC = ''DC'' AND TypePhase <> ''N/A'' THEN ''For DC, phase type must be N/A<br />'' ELSE ''''
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

	-- check "MG 1 Data ATAXX notification" field value consistency
	SET @SQL = @SQL +
	'
		CASE
			WHEN MG = 0 AND (VALM0 <> ''Validated'' OR VALM0 is null) THEN ''ATAXX must notify Maturity Gate 1<br />'' ELSE ''''
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

	------------------------------------------------------------------------
	-- Generate the request setting the errors message
	------------------------------------------------------------------------
	SET @SQL = 'SELECT CONVERT(TEXT, ' + @SQL + ') FROM R_FIN_DS WHERE id_ds = ' + CONVERT(VARCHAR(8000), @id_ds)

	EXEC(@SQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

