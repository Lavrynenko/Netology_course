if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MaturityGateControl_0to1_A350]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MaturityGateControl_0to1_A350]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE  PROCEDURE [dbo].[MaturityGateControl_0to1_A350](@id_ds AS INTEGER)  AS
DECLARE @SQL AS VARCHAR(8000)
SET @SQL = ''

SET @SQL = @SQL + 
' +
	CASE WHEN MG = 0 AND (VALM0 <> ''Validated''  OR VALM0 is null) THEN ''ATAXX must notify Maturity Gate 1<br />'' ELSE '''' END +
	CASE WHEN MG = 0 AND idr_fin IS NULL THEN ''The FIN must be defined<br />'' ELSE '''' END +
	CASE WHEN MG = 0 AND ReferenceConnector IS NULL THEN ''The Power Output Connector is mandatory<br />'' ELSE '''' END +
	CASE WHEN MG = 0 AND PINAllocation IS NULL THEN ''The Power Output Pin Allocation is mandatory<br />'' ELSE '''' END +
	CASE WHEN ISNULL(PowerFactor, 0) < 0 OR ISNULL(PowerFactor, 0) > 1 THEN ''Power factor must be >= 0 and <= 1<br />'' ELSE '''' END +
	
	CASE
		WHEN
			FINDS_SSPCCommandType = ''Logic'' 
			AND (
				SELECT TOP 1 TRUTH_TABLE_R_FIN_DS_idr FROM T_TRUTH_TABLE, T_COMBINAISON_STATUS WHERE TRUTH_TABLE_R_FIN_DS_idr = '+ convert(VARCHAR(8000), @id_ds) +' AND T_COMBINAISON_STATUS.combinaison_truth_table_idr = T_TRUTH_TABLE.TRUTH_TABLE_id
			) IS NULL
		THEN
			''No output in truth table''
		ELSE ''''
	END
'

SET @SQL = 'SELECT CONVERT(TEXT, '+ @SQL + ') FROM R_FIN_DS WHERE id_ds = ' + CONVERT(VARCHAR(8000), @id_ds)

EXEC(@SQL)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

