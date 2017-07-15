-- Delete before the existing procedure
IF EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE id = object_id(N'[dbo].[sp_UpdateMGCheckSum]')
				AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[sp_UpdateMGCheckSum]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[sp_UpdateMGCheckSum]
(
	@program 	AS VARCHAR(50)
)
AS

	------------------------------------------------------------------------
	-- Update the checksum calculation on MG update
	--
	-- @param		program		The plane program
	------------------------------------------------------------------------

	DECLARE
		@Check 			AS VARCHAR(8000),
		@Object_value 	AS VARCHAR(8000),
		@AFDX 			AS VARCHAR(50)

	SET @AFDX	= ''
	SET @Check 	= ''

	SELECT
		@AFDX 	= 	CASE WHEN application_program='A350'
						THEN 'SSPC_VL_AfdxFallBackStatus'
						ELSE 'SSPC_VL_AfdxFallBackStatusInt'
					END
	FROM
		application_setup


	DECLARE db_cursor CURSOR
	FOR
		SELECT DISTINCT(Object_value)
			FROM T_MG
			JOIN infobase ON infobase.Object_name = T_MG.Object_name
			WHERE table_name = 'R_FIN_DS'
			AND ML IN ('1','2','3')
			ORDER BY Object_value

	OPEN db_cursor
	FETCH NEXT FROM db_cursor INTO @Object_value
	WHILE (@@FETCH_STATUS <> -1)
	BEGIN
		IF @Check = ''
			SET @Check = '
				CREATE FUNCTION [DBO].[ELCOCHECK] (@id_ds AS INT)
				RETURNS VARCHAR(8000) AS
				BEGIN
					DECLARE @Check VARCHAR(8000)
					DECLARE @TT_output VARCHAR(8000)
					SET @Check = ''
					SET @TT_output = ''

					SELECT
						@Check = CONVERT(VARCHAR(8000), ISNULL(' + @Object_value + ', ''''))'
		ELSE
			SET @Check = @Check + ' + CONVERT(VARCHAR(8000), ISNULL(' + @Object_value + ', ''''))'
		FETCH NEXT FROM db_cursor INTO @Object_value
	END
	CLOSE db_cursor
	DEALLOCATE db_cursor

	SET @Check = @Check + '
							FROM
								R_FIN_DS
							WHERE
								R_FIN_DS.id_ds = @id_ds

						SELECT
							@Check = @Check +
							CONVERT(VARCHAR(8000), ISNULL(SSPC_VL_order, '''')) +
							CONVERT(VARCHAR(8000), ISNULL(SSPC_VL_VlIdentifier, '''')) +
							CONVERT(VARCHAR(8000), ISNULL(SSPC_VL_UdpPort, '''')) +
							CONVERT(VARCHAR(8000), ISNULL(SSPC_VL_SignalPosition, '''')) +
							CONVERT(VARCHAR(8000), ISNULL(SSPC_VL_Type, '''')) + '
	IF (@program = 'A350')
		SET @Check = @Check + ' CONVERT(VARCHAR(8000), ISNULL(SSPC_VL_LineName, '''')) + '

	SET @Check = @Check + ' CONVERT(VARCHAR(8000), ISNULL(SSPC_VL_TimeDelay0To1, '''')) +
							CONVERT(VARCHAR(8000), ISNULL(SSPC_VL_TimeDelay1To0, '''')) +
							CONVERT(VARCHAR(8000), ISNULL(' + @AFDX + ', '''')) +
							CONVERT(VARCHAR(8000), ISNULL(SSPC_VL_SignalAddress, ''''))
						FROM
							T_TRUTH_TABLE
							JOIN T_SSPC_VL ON SSPC_VL_TRUTH_TABLE_idr = TRUTH_TABLE_id
						WHERE
							 TRUTH_TABLE_R_FIN_DS_idr = @id_ds

						DECLARE TT_CURSOR CURSOR FOR 
						
							SELECT
								CONVERT(VARCHAR(8000), ISNULL(COMBINAISON_STATUS_Value, ''''))
							FROM
								T_TRUTH_TABLE
								JOIN T_COMBINAISON_STATUS ON COMBINAISON_TRUTH_TABLE_idr = TRUTH_TABLE_id
							WHERE
								TRUTH_TABLE_R_FIN_DS_idr = @id_ds
							ORDER BY
								COMBINAISON_STATUS_id
						
						OPEN TT_CURSOR 
						
						FETCH NEXT FROM TT_CURSOR INTO @TT_output
						
						WHILE @@FETCH_STATUS = 0
						BEGIN
							SET @Check = @Check + @TT_output
							FETCH NEXT FROM TT_CURSOR INTO @TT_output
						END
						CLOSE TT_CURSOR
						DEALLOCATE TT_CURSOR

						RETURN(dbo.fn_CalculCRC32(@Check))
					END'

	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ELCOCHECK]'))
	drop function [dbo].[ELCOCHECK]

	EXEC(@Check)


GO


SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

