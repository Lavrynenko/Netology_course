ALTER PROCEDURE [dbo].[sp_CopyAsNewEDD]
(
	@TT		AS INT,
	@Copy		AS INT,
	@Paste		AS INT,
	@program 	AS VARCHAR(50)
)
AS

	------------------------------------------------------------------------
	-- Copy several attributes from an EDD to a new one
	--
	-- @param		TT		if = 1 => Copy also the truth table
	-- @param		Copy		The index from EDD source
	-- @param		Paste		The index from new EDD
	-- @param		program		The plane program
	------------------------------------------------------------------------

	DECLARE @SQL VARCHAR(8000), @CopyTT INT
	SET @SQL = 'UPDATE p SET '

	IF (@program = 'A350')
	BEGIN

		------------------------------------------------------------------------
		-- Part 1 : copy EDD attributes
		------------------------------------------------------------------------
		SELECT
			@SQL = @SQL + CASE WHEN @SQL = 'UPDATE p SET ' THEN 'p.' ELSE ', p.' END + object_value + ' = c.' + object_value
		FROM
			InfoBase
	        INNER JOIN T_PERMISSION_ACCESS_ATTRIBUTE ON idr_infobase=id_infobase
	        INNER JOIN T_USER_ROLE ON id_role=idr_user_role
		WHERE
			table_name = 'R_FIN_DS'
		AND object_value NOT IN ('DS_SI_Reference', 'NAME', 'AccesDoorPanel', 'ANSI_CODE', 'BasicOptional', 'Category', 'Comments',
				'Dev_Solution', 'DevelopmentEffectivity', 'DS_AIR_Recorded', 'DS_CA_CI', 'DS_SI_Reference', 'ds_type',
				'DSEffectivity', 'FINDSCreationDate', 'FinDsDescription', 'FinDsSWLoadingType', 'FINDSUpdateDate', 'FinInstallBenchTest',
				'idr_equip', 'InstallationPanel', 'InstallationSection', 'InstallationZone', 'Label', 'Link to equipement', 'NAME',
				'NeedQuantity', 'OriginOfRequest', 'ProvisioningType', 'ReasonNotRecordedAIR', 'RefDS', 'Section', 'SerialNumber',
				'SVStatus', 'SystemViewStatus', 'TypeEqt', 'Version', 'WeightStatus','EDDCheckSum',
				'VALM0', 'VALM1', 'VALM2')
	    AND ((name_role = 'EPC ATAXX' OR name_role = 'EPC ATA24') AND write_mode=1)
		GROUP BY object_value

		SET @SQL = @SQL +' FROM R_FIN_DS c, R_FIN_DS p WHERE c.id_ds = ' + CONVERT(VARCHAR(8000), @Copy) + ' AND p.id_ds = ' + CONVERT(VARCHAR(8000), @Paste)
		EXEC(@SQL)

		------------------------------------------------------------------------
		-- Part 2 : copy truth table attributes
		------------------------------------------------------------------------
		IF @TT = 1
		BEGIN
			SELECT @TT = TRUTH_TABLE_id FROM T_TRUTH_TABLE WHERE TRUTH_TABLE_R_FIN_DS_idr = @Paste
			SELECT @CopyTT = TRUTH_TABLE_id FROM T_TRUTH_TABLE WHERE TRUTH_TABLE_R_FIN_DS_idr = @Copy
			DELETE T_TRUTH_TABLE WHERE TRUTH_TABLE_id = @TT
			DELETE T_SSPC_VL WHERE SSPC_VL_TRUTH_TABLE_idr = @TT
			DELETE T_COMBINAISON_STATUS WHERE COMBINAISON_TRUTH_TABLE_idr = @TT
			INSERT INTO T_TRUTH_TABLE ( TRUTH_TABLE_R_FIN_DS_idr ) SELECT @Paste
			SELECT @TT = MAX(TRUTH_TABLE_id) FROM T_TRUTH_TABLE
			INSERT INTO T_SSPC_VL (SSPC_VL_order, SSPC_VL_Designation, SSPC_VL_type, SSPC_VL_number, SSPC_VL_PinNumber, SSPC_VL_ConnectorNumber, SSPC_VL_VlName, SSPC_VL_VlIdentifier, SSPC_VL_UdpPort, SSPC_VL_SignalAddress, SSPC_VL_SignalPosition, SSPC_VL_AfdxFallBackStatus, SSPC_VL_AfdxFallBackStatusInt, SSPC_VL_TimeDelay0To1, SSPC_VL_TimeDelay1To0, SSPC_VL_BooleanFalseDefinition, SSPC_VL_BooleanTrueDefinition, SSPC_VL_LineName, SSPC_VL_SignalName, SSPC_VL_TRUTH_TABLE_idr)
							SELECT SSPC_VL_order, SSPC_VL_Designation, SSPC_VL_type, SSPC_VL_number, SSPC_VL_PinNumber, SSPC_VL_ConnectorNumber, SSPC_VL_VlName, SSPC_VL_VlIdentifier, SSPC_VL_UdpPort, SSPC_VL_SignalAddress, SSPC_VL_SignalPosition, SSPC_VL_AfdxFallBackStatus, SSPC_VL_AfdxFallBackStatusInt, SSPC_VL_TimeDelay0To1, SSPC_VL_TimeDelay1To0, SSPC_VL_BooleanFalseDefinition, SSPC_VL_BooleanTrueDefinition, SSPC_VL_LineName, SSPC_VL_SignalName, @TT
							FROM T_SSPC_VL WHERE SSPC_VL_TRUTH_TABLE_idr = @CopyTT
			INSERT INTO T_COMBINAISON_STATUS SELECT COMBINAISON_STATUS_order, COMBINAISON_STATUS_value, @TT FROM T_COMBINAISON_STATUS WHERE COMBINAISON_TRUTH_TABLE_idr = @CopyTT
		END
	END

	ELSE IF (@program = 'A380')
	BEGIN

		------------------------------------------------------------------------
		-- Part 1 : copy EDD attributes
		------------------------------------------------------------------------
		SET @SQL =  'UPDATE p SET '
		SELECT
			@SQL = @SQL + CASE WHEN @SQL = 'UPDATE p SET ' THEN 'p.' ELSE ', p.' END + object_value + ' = c.' + object_value
		FROM
			InfoBase
	        INNER JOIN T_PERMISSION_ACCESS_ATTRIBUTE ON idr_infobase=id_infobase
	        INNER JOIN T_USER_ROLE ON id_role=idr_user_role
		WHERE
			((name_role = 'EPC ATAXX' OR name_role = 'EPC ATA24') AND write_mode=1)
		AND object_value NOT IN ('DS_SI_Reference', 'NAME', 'AccesDoorPanel', 'ANSI_CODE', 'BasicOptional', 'Category', 'Comments',
				'Dev_Solution', 'DevelopmentEffectivity', 'DS_AIR_Recorded', 'DS_CA_CI', 'DS_SI_Reference', 'ds_type',
				'DSEffectivity', 'FINDSCreationDate', 'FinDsDescription', 'FinDsSWLoadingType', 'FINDSUpdateDate', 'FinInstallBenchTest',
				'idr_equip', 'InstallationPanel', 'InstallationSection', 'InstallationZone', 'Label', 'Link to equipement', 'NAME',
				'NeedQuantity', 'OriginOfRequest', 'ProvisioningType', 'ReasonNotRecordedAIR', 'RefDS', 'Section', 'SerialNumber',
				'SVStatus', 'SystemViewStatus', 'TypeEqt', 'Version', 'WeightStatus','EDDCheckSum',
				'VALM0', 'VALM1', 'VALM2')
		AND table_name = 'R_FIN_DS'
		GROUP BY object_value

		SET @SQL = @SQL +'  FROM R_FIN_DS c, R_FIN_DS p WHERE c.id_ds = ' + CONVERT(VARCHAR(8000), @Copy) + ' AND p.id_ds = ' + CONVERT(VARCHAR(8000), @Paste)
		EXEC(@SQL)

		------------------------------------------------------------------------
		-- Part 2 : copy truth table attributes
		------------------------------------------------------------------------
		IF @TT = 1
		BEGIN
			SELECT @TT = TRUTH_TABLE_id FROM T_TRUTH_TABLE WHERE TRUTH_TABLE_R_FIN_DS_idr = @Paste
			SELECT @CopyTT = TRUTH_TABLE_id FROM T_TRUTH_TABLE WHERE TRUTH_TABLE_R_FIN_DS_idr = @Copy
			DELETE T_TRUTH_TABLE WHERE TRUTH_TABLE_id = @TT
			DELETE T_SSPC_VL WHERE SSPC_VL_TRUTH_TABLE_idr = @TT
			DELETE T_COMBINAISON_STATUS WHERE COMBINAISON_TRUTH_TABLE_idr = @TT
			INSERT INTO T_TRUTH_TABLE ( TRUTH_TABLE_R_FIN_DS_idr ) SELECT @Paste
			SELECT @TT = MAX(TRUTH_TABLE_id) FROM T_TRUTH_TABLE
			INSERT INTO T_SSPC_VL (SSPC_VL_order, SSPC_VL_Designation, SSPC_VL_type, SSPC_VL_number, SSPC_VL_PinNumber, SSPC_VL_ConnectorNumber, SSPC_VL_VlName, SSPC_VL_VlIdentifier, SSPC_VL_UdpPort, SSPC_VL_SignalAddress, SSPC_VL_SignalPosition, SSPC_VL_AfdxFallBackStatus, SSPC_VL_AfdxFallBackStatusInt, SSPC_VL_TimeDelay0To1, SSPC_VL_TimeDelay1To0, SSPC_VL_BooleanFalseDefinition, SSPC_VL_BooleanTrueDefinition, SSPC_VL_LineName, SSPC_VL_SignalName, SSPC_VL_TRUTH_TABLE_idr)
							SELECT SSPC_VL_order, SSPC_VL_Designation, SSPC_VL_type, SSPC_VL_number, SSPC_VL_PinNumber, SSPC_VL_ConnectorNumber, SSPC_VL_VlName, SSPC_VL_VlIdentifier, SSPC_VL_UdpPort, SSPC_VL_SignalAddress, SSPC_VL_SignalPosition, SSPC_VL_AfdxFallBackStatus, SSPC_VL_AfdxFallBackStatusInt, SSPC_VL_TimeDelay0To1, SSPC_VL_TimeDelay1To0, SSPC_VL_BooleanFalseDefinition, SSPC_VL_BooleanTrueDefinition, SSPC_VL_LineName, SSPC_VL_SignalName, @TT
							FROM T_SSPC_VL WHERE SSPC_VL_TRUTH_TABLE_idr = @CopyTT
			INSERT INTO T_COMBINAISON_STATUS SELECT COMBINAISON_STATUS_order, COMBINAISON_STATUS_value, @TT FROM T_COMBINAISON_STATUS WHERE COMBINAISON_TRUTH_TABLE_idr = @CopyTT
		END
	END

	ELSE IF (@program = 'A400M')
	BEGIN

		------------------------------------------------------------------------
		-- Copy EDD attributes
		------------------------------------------------------------------------
		SET @SQL =  'UPDATE p SET '

		SELECT
			@SQL = @SQL + CASE WHEN @SQL = 'UPDATE p SET ' THEN 'p.' ELSE ', p.' END + object_value + ' = c.' + object_value
		FROM
			InfoBase
	        INNER JOIN T_PERMISSION_ACCESS_ATTRIBUTE ON idr_infobase=id_infobase
	        INNER JOIN T_USER_ROLE ON id_role=idr_user_role
		WHERE
			((name_role = 'EPC ATAXX' OR name_role = 'EPC ATA24') AND write_mode=1)
		AND object_value NOT IN ('DS_SI_Reference', 'NAME', 'AccesDoorPanel', 'ANSI_CODE', 'BasicOptional', 'Category', 'Comments',
				'Dev_Solution', 'DevelopmentEffectivity', 'DS_AIR_Recorded', 'DS_CA_CI', 'DS_SI_Reference', 'ds_type',
				'DSEffectivity', 'FINDSCreationDate', 'FinDsDescription', 'FinDsSWLoadingType', 'FINDSUpdateDate', 'FinInstallBenchTest',
				'idr_equip', 'InstallationPanel', 'InstallationSection', 'InstallationZone', 'Label', 'Link to equipement', 'NAME',
				'NeedQuantity', 'OriginOfRequest', 'ProvisioningType', 'ReasonNotRecordedAIR', 'RefDS', 'Section', 'SerialNumber',
				'SVStatus', 'SystemViewStatus', 'TypeEqt', 'Version', 'WeightStatus','EDDCheckSum',
				'VALM0', 'VALM1', 'VALM2')
		AND table_name = 'R_FIN_DS'
		GROUP BY object_value

		SET @SQL = @SQL +'  FROM R_FIN_DS c, R_FIN_DS p WHERE c.id_ds = ' + CONVERT(VARCHAR(8000), @Copy) + ' AND p.id_ds = ' + CONVERT(VARCHAR(8000), @Paste)
		EXEC(@SQL)

	END

