if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MaturityGateControl_2to3]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MaturityGateControl_2to3]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE  PROCEDURE [dbo].[MaturityGateControl_2to3](@id_ds AS INTEGER)  AS
DECLARE @SQL AS VARCHAR(8000)
SET @SQL = ''
SELECT
	@SQL = @SQL + CASE WHEN @SQL = '' THEN '' ELSE ' + ' END + 'CASE WHEN ISNULL(' + infobase.object_value + ', '''') = '''' THEN ''' + infobase.object_name + ' is mandatory<br />'' ELSE '''' END'
FROM
	R_FIN_DS,
	infobase,
	T_MG	
WHERE
	id_ds = @id_ds
	AND (table_name = '''R_FIN_DS''' OR table_name = '''V_ELA''')
	AND infobase.object_name = T_MG.object_name
	AND ISNULL(PCType, '') = ISNULL(PowerCenterType, '')
	AND ISNULL(DeviceType, '') = ISNULL(TypeOfProtection, '')
	AND MG = ML - 1
	AND SpecificControl = 0
SET @SQL = @SQL + 
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
			MG = 2 AND
			DIActive = ''yes'' AND
			TypeOfProtection = ''SSPC''
			AND (
				SELECT TOP 1 TRUTH_TABLE_R_FIN_DS_idr FROM T_TRUTH_TABLE,T_SSPC_VL WHERE TRUTH_TABLE_R_FIN_DS_idr = '+ convert(VARCHAR(8000),@id_ds) +' AND T_SSPC_VL.SSPC_VL_TRUTH_TABLE_idr = T_TRUTH_TABLE.TRUTH_TABLE_id
			) IS NULL
		THEN
			''No input in truth table''
		ELSE ''''
	END +
	
	CASE 
		WHEN 
			TypeOfProtection = ''RCCB''
			AND ((
				SELECT idr_equip FROM R_FIN_DS where id_ds = ' + CONVERT(VARCHAR(8000), @id_ds) + '
			) = 0
			OR
			(
				SELECT idr_equip FROM R_FIN_DS where id_ds = ' + CONVERT(VARCHAR(8000), @id_ds) + '
			) IS NULL)
		THEN 
			''No Equipment linked to the DS''
		ELSE ''''
	END +

	CASE 
		WHEN 
		  ((SELECT COUNT(R_FIN_DS.EDDReference)
				FROM T_TRUTH_TABLE INNER JOIN
				       R_FIN_DS ON T_TRUTH_TABLE.TRUTH_TABLE_R_FIN_DS_idr = R_FIN_DS.id_ds INNER JOIN
				       T_COMBINAISON_STATUS ON T_TRUTH_TABLE.TRUTH_TABLE_id = T_COMBINAISON_STATUS.COMBINAISON_TRUTH_TABLE_idr
				WHERE id_ds = ' + CONVERT(VARCHAR(8000), @id_ds) + '
				AND COMBINAISON_STATUS_value is not null
			) = 0)
		THEN 
			''A Truth Table Output must be defined''
	END
	
'
SET @SQL = 'SELECT CONVERT(TEXT, '+ @SQL + ') FROM R_FIN_DS WHERE id_ds = ' + CONVERT(VARCHAR(8000), @id_ds)
EXEC(@SQL)

-- ELCOCHECK
EXECUTE sp_UpdateMGCheckSum
UPDATE R_FIN_DS SET
	EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE
	id_ds = @id_ds

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

