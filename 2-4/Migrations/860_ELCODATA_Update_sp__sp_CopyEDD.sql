ALTER PROCEDURE [dbo].[sp_CopyEDD](@TT INT, @Copy INT, @Paste INT, @attributes as VARCHAR(50), @program as VARCHAR(50), @type as VARCHAR(50)) AS

DECLARE
    @SQL VARCHAR(8000),
    @CopyTT INT

SET @SQL = 'UPDATE p SET '

IF (@program = 'A400M')
BEGIN
    SELECT
        @SQL = @SQL + CASE WHEN @SQL = 'UPDATE p SET ' THEN 'p.' ELSE ', p.' END + object_value + ' = c.' + object_value
    FROM
        InfoBase
        INNER JOIN T_ATTR_GROUP ON T_ATTR_GROUP.id_attr_group = InfoBase.idr_group
        INNER JOIN T_PERMISSION_ACCESS_ATTRIBUTE ON idr_infobase=id_infobase
        INNER JOIN T_USER_ROLE ON id_role=idr_user_role
    WHERE
        (
			(InfoBase.table_name = 'R_FIN_DS' AND @attributes<>'none')
        )
        AND object_value NOT IN ('InstallationSection', 'InstallationZone', 'InstallationPanel', 'NeedQuantity', 'SystemViewStatus', 'Comments',
					'DS_AIR_Recorded', 'DSEffectivity', 'DS_SI_Reference', 'OriginOfRequest', 'SerialNumber', 'DS_CA_CI',
					'developmentEffectivity', 'ds_type', 'Dev_Solution', 'ANSI_CODE', 'Name', 'Category', 'TypeEqt', 'Label',
					'ReasonNotRecordedAIR', 'BasicOptional', 'ProvisioningType', 'FinInstallBenchTest', 'AccesDoorPanel',
					'WeightStatus', 'SVStatus', 'FinDsCreationDate', 'FinDsUpdateDate', 'FinDsSWLoadingType', 'FinDsDescription','mg','VALM0','VALM1',
                    'VALM2')

        AND
        (
			(name_role = 'EPC ATA24' AND @attributes='ata24' AND write_mode=1)
			OR
			(name_role = 'EPC ATAXX' AND @attributes='ataXX' AND write_mode=1)
			OR
			((name_role = 'EPC ATAXX' OR name_role = 'EPC ATA24') AND @attributes='all' AND write_mode=1)
        )
    GROUP BY object_value

    SET @SQL = @SQL + ' FROM R_FIN_DS c, R_FIN_DS p WHERE c.id_ds = ' + CONVERT(VARCHAR(8000), @Copy) + ' AND p.id_ds = ' + CONVERT(VARCHAR(8000), @Paste)
END
ELSE IF (@program = 'A380')
BEGIN
  SELECT
        @SQL = @SQL + CASE WHEN @SQL = 'UPDATE p SET ' THEN 'p.' ELSE ', p.' END + object_value + ' = c.' + object_value
    FROM
        InfoBase
        INNER JOIN T_ATTR_GROUP ON T_ATTR_GROUP.id_attr_group = InfoBase.idr_group
        INNER JOIN T_PERMISSION_ACCESS_ATTRIBUTE ON idr_infobase=id_infobase
	    INNER JOIN T_USER_ROLE ON id_role=idr_user_role
    WHERE
        (
			(InfoBase.table_name = 'R_FIN_DS' AND @attributes<>'none')
        )
		AND object_value NOT IN ('InstallationSection', 'InstallationZone', 'InstallationPanel', 'NeedQuantity', 'SystemViewStatus', 'Comments',
				'DS_AIR_Recorded', 'DSEffectivity', 'DS_SI_Reference', 'OriginOfRequest', 'SerialNumber', 'DS_CA_CI',
				'developmentEffectivity', 'ds_type', 'Dev_Solution', 'ANSI_CODE', 'Name', 'Category', 'TypeEqt', 'Label',
				'ReasonNotRecordedAIR', 'BasicOptional', 'ProvisioningType', 'FinInstallBenchTest', 'AccesDoorPanel',
				'WeightStatus', 'SVStatus', 'FinDsCreationDate', 'FinDsUpdateDate', 'FinDsSWLoadingType', 'FinDsDescription','MG',
				'VALM0', 'VALM1', 'VALM2')
        AND
        (
			(name_role = 'EPC ATA24' AND @attributes='ata24' AND write_mode=1)
			OR
			(name_role = 'EPC ATAXX' AND @attributes='ataXX' AND write_mode=1)
			OR
			((name_role = 'EPC ATAXX' OR name_role = 'EPC ATA24') AND @attributes='all' AND write_mode=1)
        )
    GROUP BY object_value



SET @SQL = @SQL + ' FROM R_FIN_DS c, R_FIN_DS p WHERE c.id_ds = ' + CONVERT(VARCHAR(8000), @Copy) + ' AND p.id_ds = ' + CONVERT(VARCHAR(8000), @Paste)
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
ELSE IF (@program = 'A350')
BEGIN
  IF (@type = 'LOAD')
  BEGIN
    SELECT
        @SQL = @SQL + CASE WHEN @SQL = 'UPDATE p SET ' THEN 'p.' ELSE ', p.' END + IB.object_value + ' = c.' + IB.object_value
      FROM
        InfoBase IB
        INNER JOIN T_ATTR_GROUP AG ON AG.id_attr_group = IB.idr_group
        INNER JOIN T_PERMISSION_ACCESS_ATTRIBUTE PAA ON PAA.idr_infobase=IB.id_infobase
        INNER JOIN T_USER_ROLE UR ON UR.id_role=PAA.idr_user_role
      WHERE
        (
        (IB.table_name IN ('R_FIN_DS','V_ELA') AND @attributes = 'all')
        OR
		(IB.table_name = 'V_ELA' AND @attributes = 'ela')
		OR
		(IB.table_name = 'R_FIN_DS' AND @attributes = 'edd')
		)
		AND AG.label IN ('Electrical Information','Information about ELA')
		AND IB.object_value NOT IN ('FINDS_gonogo','Sheddable','FINDS_SheddableLPMF','EDDLoad')
		AND UR.name_role = 'EPC ATAXX' AND PAA.write_mode=1
      GROUP BY IB.object_value
  END
  ELSE
  BEGIN
    SELECT
          @SQL = @SQL + CASE WHEN @SQL = 'UPDATE p SET ' THEN 'p.' ELSE ', p.' END + object_value + ' = c.' + object_value
      FROM
          InfoBase
          INNER JOIN T_ATTR_GROUP ON T_ATTR_GROUP.id_attr_group = InfoBase.idr_group
          INNER JOIN T_PERMISSION_ACCESS_ATTRIBUTE ON idr_infobase=id_infobase
	      INNER JOIN T_USER_ROLE ON id_role=idr_user_role
      WHERE
        InfoBase.table_name = 'R_FIN_DS' AND @attributes<>'none'
		AND object_value NOT IN ('DS_SI_Reference', 'NAME', 'AccesDoorPanel', 'ANSI_CODE', 'BasicOptional', 'Category', 'Comments', 'Dev_Solution', 'DevelopmentEffectivity',
	   			  'DS_AIR_Recorded', 'DS_CA_CI', 'DS_SI_Reference', 'ds_type', 'DSEffectivity', 'FINDSCreationDate', 'FinDsDescription', 'FinDsSWLoadingType',
				  'FINDSUpdateDate', 'FinInstallBenchTest', 'idr_equip', 'InstallationPanel', 'InstallationSection', 'InstallationZone', 'Label', 'Link to equipement',
				  'NAME', 'NeedQuantity', 'OriginOfRequest', 'ProvisioningType', 'ReasonNotRecordedAIR', 'RefDS', 'Section', 'SerialNumber', 'SVStatus',
				  'SystemViewStatus', 'TypeEqt', 'Version', 'WeightStatus', 'MG', 'VALM0', 'VALM1', 'VALM2', 'EDDCheckSum', ' EDD_FIN_CI')

		AND
		(
		  (name_role = 'EPC ATA24' AND @attributes='ata24' AND write_mode=1)
		  OR
		  (name_role = 'EPC ATAXX' AND @attributes='ataXX' AND write_mode=1)
		  OR
		  ((name_role = 'EPC ATAXX' OR name_role = 'EPC ATA24') AND @attributes='all' AND write_mode=1)
		)
      GROUP BY object_value
  END


SET @SQL = @SQL + ' FROM R_FIN_DS c, R_FIN_DS p WHERE c.id_ds = ' + CONVERT(VARCHAR(8000), @Copy) + ' AND p.id_ds = ' + CONVERT(VARCHAR(8000), @Paste)
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


EXEC(@SQL)

