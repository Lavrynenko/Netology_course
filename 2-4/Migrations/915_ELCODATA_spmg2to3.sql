if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MaturityGateControl_2to3]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MaturityGateControl_2to3]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE [dbo].[MaturityGateControl_2to3]
(
	@id_ds 		AS INTEGER,
	@program 	AS VARCHAR(50)
)
AS

	------------------------------------------------------------------------
	-- Check EDD attributes to upgrade from MG 2 to MG 3
	-- The generated request is split in 2 parts because of its too long size
	-- The request will also be run in 2 parts stored together in a temporary table,
	-- to concatenate the error message in the end
	--
	-- @param		id_ds		The EDD index in table R_FIN_DS
	-- @param		program		The plane program
	-- @return		sql			A string containing all the check errors
	--
	------------------------------------------------------------------------

	DECLARE @SQL1 AS VARCHAR(8000),
			@SQL2 AS VARCHAR(8000),
			@message AS VARCHAR(8000),
			@colonnes AS VARCHAR(8000)


	SET @SQL1 		= ''
	SET @SQL2 		= ''
	SET @message 	= ''
	SET @colonnes 	= ''


	CREATE TABLE [dbo].[#@tmp_MG2TO3] (
		[message_error] [varchar] (8000) NULL
	) ON [PRIMARY]


	IF (@program = 'A380')
	BEGIN

		------------------------------------------------------------------------
		-- check if mandatory attributes are empty
		------------------------------------------------------------------------
		SELECT
			@SQL1 = @SQL1 +
			CASE
				WHEN @SQL1 = '' THEN ''
				ELSE ' + '
			END +
			CASE
				WHEN infobase.type_val='int' OR infobase.type_val='float' THEN
					'CASE
						WHEN ' + infobase.object_value + ' IS NULL THEN ''' + infobase.object_name + ' is mandatory<br />''
						ELSE ''''
					END'
				ELSE
					 'CASE
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
			AND (table_name = 'R_FIN_DS' OR table_name = 'V_ELA')
			AND infobase.object_name = T_MG.object_name
			AND ISNULL(PCType, '') = ISNULL(PowerCenterType, '')
			AND ISNULL(DeviceType, '') = ISNULL(TypeOfProtection, '')
			AND MG = ML - 1
			AND SpecificControl = 0

		------------------------------------------------------------------------
		-- check attributes consistencies
		------------------------------------------------------------------------
		SET @SQL2 = @SQL2 +
		' +
			CASE WHEN  ISNULL(TypeACDC, '''') <> '''' AND ISNULL(TypePhase, '''') <> '''' AND TypeACDC = ''AC'' AND TypePhase = ''N/A'' THEN ''For AC, phase type must not be N/A<br />'' ELSE '''' END +
			CASE WHEN  ISNULL(TypeACDC, '''') <> '''' AND ISNULL(TypePhase, '''') <> '''' AND TypeACDC = ''DC'' AND TypePhase <> ''N/A'' THEN ''For DC, phase type must be N/A<br />'' ELSE '''' END +
			CASE WHEN MG = 2 AND (VALM2 = ''Not validated''  OR VALM2 is null) THEN ''ATAXX must notify Maturity Gate 3<br />'' ELSE '''' END +
			CASE WHEN (SELECT TOP 1 COUNT(*) FROM T_MG WHERE ISNULL(PCType, '''') = ISNULL(PowerCenterType, '''')  AND ISNULL(DeviceType, '''')  = ISNULL(TypeOfProtection, '''') ) = 0 THEN PowerCenterType + '',  '' + TypeOfProtection + '' do not match<br />'' ELSE '''' END +
			CASE WHEN MG = 2 AND (SELECT TOP 1 ISNULL(finci_status, '''') FROM R_FIN_CI WHERE id_fin = idr_fin) <> ''DESIGNATION_OK'' THEN ''FIN CI Status must be DESIGNATION_OK<br />'' ELSE '''' END +
			CASE WHEN MG = 2 AND (ISNULL(SystemViewStatus, '''') <> ''HELD''  AND ISNULL(SystemViewStatus, '''') <> ''RELEASED'') THEN ''EDD DS State must be HELD or RELEASED<br />'' ELSE '''' END +
			CASE WHEN MG = 2 AND ISNULL(DSEffectivity, '''') = '''' THEN ''EDD must be effective on A/C<br />'' ELSE '''' END +
			CASE WHEN ISNULL(PowerFactor, 0) < 0 OR ISNULL(PowerFactor, 0) > 1 THEN ''Power factor must be >= 0 and <= 1<br />'' ELSE '''' END +
			CASE
				WHEN
					MG = 2
					AND PowerCenterType=''SEPDC''
					AND (
						SELECT TOP 1
							MG3.SSPCTypeCard
						FROM
							T_MSN
							JOIN
							(
								SELECT
									SSPCTypeCard,
									MSN
								FROM
									R_FIN_DS DSMG3
									JOIN T_MSN MSNMG3 ON DSMG3.DSEffectivity LIKE ''%-'' + CONVERT(VARCHAR(8000), MSNMG3.MSN) + ''-%''
								WHERE
									DSMG3.SSPCAllocatedCardFIN = R_FIN_DS.SSPCAllocatedCardFIN
									AND DSMG3.MG = 3
									AND DSMG3.SSPCTypeCard <> R_FIN_DS.SSPCTypeCard
							) MG3 ON
								MG3.MSN = T_MSN.MSN
						WHERE
							R_FIN_DS.DSEffectivity LIKE ''%-'' + CONVERT(VARCHAR(8000), T_MSN.MSN) + ''-%''
					) IS NOT NULL
				THEN
					''Card types are inconsistent<br>''
				ELSE ''''
			END +
			CASE
			WHEN
				MG = 2 AND
				DIActive = ''yes'' AND
				TypeOfProtection = ''SSPC''
				AND ((SELECT COUNT(R_FIN_DS.EDDReference)
					FROM T_TRUTH_TABLE INNER JOIN
					       R_FIN_DS ON T_TRUTH_TABLE.TRUTH_TABLE_R_FIN_DS_idr = R_FIN_DS.id_ds INNER JOIN
					       T_COMBINAISON_STATUS ON T_TRUTH_TABLE.TRUTH_TABLE_id = T_COMBINAISON_STATUS.COMBINAISON_TRUTH_TABLE_idr
					WHERE id_ds = ' + CONVERT(VARCHAR(8000), @id_ds) + '
					AND COMBINAISON_STATUS_value is not null
					) = 0)
			THEN
				''A Truth Table Output must be defined''
			END+
			CASE
				WHEN
					MG = 2
					AND SVMAJ_DS = ''CIRCE''
					AND TypeOfProtection = ''C/B''
					AND ASNE = ''NOTINSTALLED''
				THEN
					''C/B for EDD PCD should not be NOT INSTALLED<br>''
				ELSE ''''
			END	
		'
	END

	IF (@program = 'A400M')
	BEGIN

		------------------------------------------------------------------------
		-- check if mandatory attributes are empty
		------------------------------------------------------------------------
		SELECT
			@SQL1 = @SQL1 +
			CASE
				WHEN @SQL1 = '' THEN ''
				ELSE ' + '
			END +
			CASE
				WHEN infobase.type_val='int' OR infobase.type_val='float' THEN
					'CASE WHEN ' + infobase.object_value + ' IS NULL THEN ''' + infobase.object_name + ' is mandatory<br />'' ELSE '''' END'
				ELSE
					'CASE WHEN ISNULL(' + infobase.object_value + ', '''') = '''' THEN ''' + infobase.object_name + ' is mandatory<br />'' ELSE '''' END'
			END
		FROM
			R_FIN_DS,
			infobase,
			T_MG
		WHERE
			id_ds = @id_ds
			AND (table_name = 'R_FIN_DS' OR table_name = 'V_ELA')
			AND infobase.object_name = T_MG.object_name
			AND ISNULL(PCType, '') = ISNULL(PowerCenterType, '')
			AND ISNULL(DeviceType, '') = ISNULL(TypeOfProtection, '')
			AND MG = ML - 1
			AND SpecificControl = 0

		------------------------------------------------------------------------
		-- check attributes consistencies
		------------------------------------------------------------------------
		SET @SQL2 = @SQL2 +
		' +
			CASE WHEN  ISNULL(TypeACDC, '''') <> '''' AND ISNULL(TypePhase, '''') <> '''' AND TypeACDC = ''AC'' AND TypePhase = ''N/A'' THEN ''For AC, phase type must not be N/A<br />'' ELSE '''' END +
			CASE WHEN  ISNULL(TypeACDC, '''') <> '''' AND ISNULL(TypePhase, '''') <> '''' AND TypeACDC = ''DC'' AND TypePhase <> ''N/A'' THEN ''For DC, phase type must be N/A<br />'' ELSE '''' END +
			CASE WHEN MG = 2 AND (VALM2 = ''Not validated''  OR VALM2 is null) THEN ''ATAXX must notify Maturity Gate 3<br />'' ELSE '''' END +
			CASE WHEN (SELECT TOP 1 COUNT(*) FROM T_MG WHERE ISNULL(PCType, '''') = ISNULL(PowerCenterType, '''')  AND ISNULL(DeviceType, '''')  = ISNULL(TypeOfProtection, '''') ) = 0 THEN PowerCenterType + '',  '' + TypeOfProtection + '' do not match<br />'' ELSE '''' END +
			CASE WHEN MG = 2 AND (SELECT TOP 1 ISNULL(finci_status, '''') FROM R_FIN_CI WHERE id_fin = idr_fin) <> ''DESIGNATION_OK'' THEN ''FIN CI Status must be DESIGNATION_OK<br />'' ELSE '''' END +
			CASE WHEN MG = 2 AND (ISNULL(SystemViewStatus, '''') <> ''HELD''  AND ISNULL(SystemViewStatus, '''') <> ''RELEASED'') THEN ''EDD DS State must be HELD or RELEASED<br />'' ELSE '''' END +
			CASE WHEN MG = 2 AND ISNULL(DSEffectivity, '''') = '''' THEN ''EDD must be effective on A/C<br />'' ELSE '''' END +
			CASE WHEN ISNULL(PowerFactor, 0) < 0 OR ISNULL(PowerFactor, 0) > 1 THEN ''Power factor must be >= 0 and <= 1<br />'' ELSE '''' END +
			CASE
				WHEN
					MG = 2
					AND (
						SELECT TOP 1
							MG3.SSPCTypeCard
						FROM
							T_MSN
							JOIN
							(
								SELECT
									SSPCTypeCard,
									MSN
								FROM
									R_FIN_DS DSMG3
									JOIN T_MSN MSNMG3 ON DSMG3.DSEffectivity LIKE ''%-'' + CONVERT(VARCHAR(8000), MSNMG3.MSN) + ''-%''
								WHERE
									DSMG3.SSPCAllocatedCardFIN = R_FIN_DS.SSPCAllocatedCardFIN
									AND DSMG3.MG = 3
									AND DSMG3.SSPCTypeCard <> R_FIN_DS.SSPCTypeCard
							) MG3 ON
								MG3.MSN = T_MSN.MSN
						WHERE
							R_FIN_DS.DSEffectivity LIKE ''%-'' + CONVERT(VARCHAR(8000), T_MSN.MSN) + ''-%''
					) IS NOT NULL
				THEN
					''Card types are inconsistent<br>''
				ELSE ''''
			END +
			CASE
				WHEN
					MG = 2
					AND SVMAJ_DS = ''CIRCE''
					AND TypeOfProtection = ''C/B''
					AND ASNE = ''NOTINSTALLED''
				THEN
					''C/B for EDD PCD should not be NOT INSTALLED<br>''
				ELSE ''''
			END		
		'

	END

	IF (@program = 'A350')
	BEGIN

		------------------------------------------------------------------------
		-- check if mandatory attributes are empty
		------------------------------------------------------------------------
		SELECT
			@SQL1 = @SQL1 +
			CASE
				WHEN @SQL1 = '' THEN ''
				ELSE ' + '
			END +
			CASE
				WHEN infobase.type_val='int' OR infobase.type_val='float' THEN
					'CASE WHEN ' + infobase.object_value + ' IS NULL THEN ''' + infobase.object_name + ' is mandatory<br />'' ELSE '''' END'
				ELSE
					'CASE WHEN ISNULL(' + infobase.object_value + ', '''') = '''' THEN ''' + infobase.object_name + ' is mandatory<br />'' ELSE '''' END'
			END
		FROM
			R_FIN_DS,
			infobase,
			T_MG
		WHERE
			id_ds = @id_ds
			AND (table_name = 'R_FIN_DS' OR table_name = 'V_ELA')
			AND infobase.object_name = T_MG.object_name
			AND ISNULL(PCType, '') = ISNULL(PowerCenterType, '')
			AND ISNULL(DeviceType, '') = ISNULL(TypeOfProtection, '')
			AND MG = ML - 1
			AND SpecificControl = 0

		------------------------------------------------------------------------
		-- check attributes consistencies
		------------------------------------------------------------------------
		SET @SQL2 = @SQL2 +
		' +
			CASE WHEN  ISNULL(TypeACDC, '''') <> '''' AND ISNULL(TypePhase, '''') <> '''' AND TypeACDC = ''AC'' AND TypePhase = ''N/A'' THEN ''For AC, phase type must not be N/A<br />'' ELSE '''' END +
			CASE WHEN  ISNULL(TypeACDC, '''') <> '''' AND ISNULL(TypePhase, '''') <> '''' AND TypeACDC = ''DC'' AND TypePhase <> ''N/A'' THEN ''For DC, phase type must be N/A<br />'' ELSE '''' END +
			CASE WHEN MG = 2 AND (VALM2 = ''Not validated''  OR VALM2 is null) THEN ''ATAXX must notify Maturity Gate 3<br />'' ELSE '''' END +
			CASE WHEN (SELECT TOP 1 COUNT(*) FROM T_MG WHERE ISNULL(PCType, '''') = ISNULL(PowerCenterType, '''')  AND ISNULL(DeviceType, '''')  = ISNULL(TypeOfProtection, '''') ) = 0 THEN PowerCenterType + '',  '' + TypeOfProtection + '' do not match<br />'' ELSE '''' END +
			CASE WHEN MG = 2 AND (SELECT TOP 1 ISNULL(finci_status, '''') FROM R_FIN_CI WHERE id_fin = idr_fin) <> ''DESIGNATION_OK'' THEN ''FIN CI Status must be DESIGNATION_OK<br />'' ELSE '''' END +
			CASE WHEN MG = 2 AND (ISNULL(SystemViewStatus, '''') <> ''HELD''  AND ISNULL(SystemViewStatus, '''') <> ''RELEASED'') THEN ''EDD DS State must be HELD or RELEASED<br />'' ELSE '''' END +
			CASE WHEN MG = 2 AND ISNULL(DSEffectivity, '''') = '''' THEN ''EDD must be effective on A/C<br />'' ELSE '''' END +
			CASE WHEN ISNULL(PowerFactor, 0) < 0 OR ISNULL(PowerFactor, 0) > 1 THEN ''Power factor must be >= 0 and <= 1<br />'' ELSE '''' END +
			CASE
				WHEN
					MG = 2
					AND (
						SELECT TOP 1
							MG3.SSPCTypeCard
						FROM
							T_MSN
							JOIN
							(
								SELECT
									SSPCTypeCard,
									MSN
								FROM
									R_FIN_DS DSMG3
									JOIN T_MSN MSNMG3 ON DSMG3.DSEffectivity LIKE ''%-'' + CONVERT(VARCHAR(8000), MSNMG3.MSN) + ''-%''
								WHERE
									DSMG3.SSPCAllocatedCardFIN = R_FIN_DS.SSPCAllocatedCardFIN
									AND DSMG3.MG = 3
									AND DSMG3.SSPCTypeCard <> R_FIN_DS.SSPCTypeCard
							) MG3 ON
								MG3.MSN = T_MSN.MSN
						WHERE
							R_FIN_DS.DSEffectivity LIKE ''%-'' + CONVERT(VARCHAR(8000), T_MSN.MSN) + ''-%''
					) IS NOT NULL
				THEN
					''Card types are inconsistent<br>''
				ELSE ''''
			END +

			CASE
				WHEN
					PowerCenterType = ''SPDB''
					AND ((
						SELECT LoadGroup2 FROM R_FIN_DS where id_ds = ' + CONVERT(VARCHAR(8000), @id_ds) + '
					) = 0
					OR
					(
						SELECT LoadGroup2 FROM R_FIN_DS where id_ds = ' + CONVERT(VARCHAR(8000), @id_ds) + '
					) IS NULL)
				THEN
					''CIDS Load group 1 is mandatory<br>''
				ELSE ''''
			END +

			CASE
				WHEN
					PowerCenterType = ''SPDB''
					AND ((

						SELECT LoadGroup3 FROM R_FIN_DS where id_ds = ' + CONVERT(VARCHAR(8000), @id_ds) + '
					) = 0
					OR
					(
						SELECT LoadGroup3 FROM R_FIN_DS where id_ds = ' + CONVERT(VARCHAR(8000), @id_ds) + '
					) IS NULL)
				THEN
					''CIDS Load group 2 is mandatory<br>''
				ELSE ''''
			END +

			CASE
				WHEN
					PowerCenterType = ''SPDB''
					AND ((
						SELECT LoadGroup4 FROM R_FIN_DS where id_ds = ' + CONVERT(VARCHAR(8000), @id_ds) + '
					) = 0
					OR
					(
						SELECT LoadGroup4 FROM R_FIN_DS where id_ds = ' + CONVERT(VARCHAR(8000), @id_ds) + '
					) IS NULL)
				THEN
					''CIDS Load group 3 is mandatory<br>''
				ELSE ''''
			END +

			CASE
				WHEN
					R_FIN_DS.FINDS_SSPCCommandType = ''Logic''
					AND ((SELECT COUNT(R_FIN_DS.EDDReference)
						FROM T_TRUTH_TABLE INNER JOIN
						       R_FIN_DS ON T_TRUTH_TABLE.TRUTH_TABLE_R_FIN_DS_idr = R_FIN_DS.id_ds INNER JOIN
						       T_COMBINAISON_STATUS ON T_TRUTH_TABLE.TRUTH_TABLE_id = T_COMBINAISON_STATUS.COMBINAISON_TRUTH_TABLE_idr
						WHERE id_ds = ' + CONVERT(VARCHAR(8000), @id_ds) + '
						AND COMBINAISON_STATUS_value is not null
						) = 0)
				THEN
					''A Truth Table Output must be defined''
			END +
			CASE
				WHEN
					TypeOfProtection<>''C/B''
					AND  R_FIN_DS.FINDS_SSPCCommandType = ''Always On''
					AND DelayValueStatus IS  NULL
				THEN
					''P/CD Startup Delay  is mandatory.''
			END
		'

	END

	------------------------------------------------------------------------
	-- link the 2 requests into the temporary table
	-- look trougth the temporary table to generate the error message
	------------------------------------------------------------------------
	IF (@SQL1<>'')
	BEGIN
		SET @SQL1 = 'SELECT CONVERT(TEXT, '+ @SQL1 + ') FROM R_FIN_DS WHERE id_ds = ' + CONVERT(VARCHAR(8000), @id_ds)
		INSERT INTO #@tmp_MG2TO3 EXEC(@SQL1)
	END
	
	IF (@SQL2<>'') 
	BEGIN
		SET @SQL2 = 'SELECT CONVERT(TEXT, '+ @SQL2 + ') FROM R_FIN_DS WHERE id_ds = ' + CONVERT(VARCHAR(8000), @id_ds)
		INSERT INTO #@tmp_MG2TO3 EXEC(@SQL2)
	END
	

	DECLARE db_cursor CURSOR FOR
		SELECT *
		FROM #@tmp_MG2TO3
	BEGIN
		OPEN db_cursor
		FETCH NEXT FROM db_cursor INTO @colonnes
		WHILE (@@FETCH_STATUS <> -1)
		BEGIN
			--print @colonnes
			SET @message=@message + @colonnes
			FETCH NEXT FROM db_cursor INTO @colonnes
		END
	END
	CLOSE db_cursor
	DEALLOCATE db_cursor


	SELECT CONVERT(TEXT, @message)

	DROP TABLE [dbo].[#@tmp_MG2TO3]

	------------------------------------------------------------------------
	-- update checksum (ELCOCHECK)
	------------------------------------------------------------------------
	EXECUTE sp_UpdateMGCheckSum @program
	UPDATE R_FIN_DS SET
		EDDCheckSum = dbo.ELCOCHECK(@id_ds)
	WHERE
		id_ds = @id_ds
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

