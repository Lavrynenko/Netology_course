------------------------------------------------------------------------------------
---------------------------------------- R_FIN_CI ---------------------------------
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- FINCI_PsFinCiNameForMassLoading
------------------------------------------------------------------------------------

IF(NOT EXISTS(SELECT * FROM infobase WHERE object_value = 'FINCI_PsFinCiNameForMassLoading' AND table_name = 'R_FIN_CI'))
	BEGIN
		INSERT INTO infobase 
		(
			object_name, 
			object_value, 
			table_name, 
			type_search, 
			type_edit, 
			reduced_view, 
			type_val, 
			link_page, 
			link_val, 
			object_order, 
			object_infos, 
			list_val, 
			info_ext, 
			idr_group, 
			linked_page, 
			repository, 
			mandatory,
			changeChoicelist
		)
		SELECT
			'PS FIN CI name for Mass Loading',
			'FINCI_PsFinCiNameForMassLoading',
			'R_FIN_CI',
			'text',
			'text',
			0,
			'text',
			NULL,
			NULL,
			275,
			'PS FIN CI name for Mass Loading',
			NULL,
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'R_FIN_CI')
			),
			NULL,
			NULL,
			0,
			0
	END
ELSE
	BEGIN
		PRINT 'FINCI_PsFinCiNameForMassLoading is already created in Infobase.'
	END




------------------------------------------------------------------------------------
-- FINCI_429InputBusName
------------------------------------------------------------------------------------

IF(NOT EXISTS(SELECT * FROM infobase WHERE object_value = 'FINCI_429InputBusName' AND table_name = 'R_FIN_CI'))
	BEGIN
		INSERT INTO infobase 
		(
			object_name, 
			object_value, 
			table_name, 
			type_search, 
			type_edit, 
			reduced_view, 
			type_val, 
			link_page, 
			link_val, 
			object_order, 
			object_infos, 
			list_val, 
			info_ext, 
			idr_group, 
			linked_page, 
			repository, 
			mandatory,
			changeChoicelist
		)
		SELECT
			'429 Input Bus Name',
			'FINCI_429InputBusName',
			'R_FIN_CI',
			'listv',
			'listv',
			0,
			'text',
			NULL,
			NULL,
			423,
			'429 Input Bus Name',
			'SELECT choiceValue FROM T_CHOICELIST WHERE choicelist = ''FINCI_429InputBusName''  ORDER BY ChoiceOrder',
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAPPING TABLE') AND (T_OBJECT.table_primary_key = 'R_FIN_CI')
			),
			NULL,
			NULL,
			0,
			0
	END
ELSE
	BEGIN
		PRINT 'FINCI_429InputBusName is already created in Infobase.'
	END



-- Updated data to table T_CHOICELIST for (FINCI_429InputBusName)

------------------------------------------------------------------------

IF (EXISTS( SELECT * FROM T_CHOICELIST
                    WHERE ChoiceList = 'FINCI_429InputBusName')
	) BEGIN

		DELETE FROM T_CHOICELIST
                    WHERE ChoiceList = 'FINCI_429InputBusName'
 	 END

INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','A429_BITE_OUT_1', 1 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','A429_OUT_BUS_5_1', 2 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','ADF_OUT_1_1', 3 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','AICU_SCI_1', 4 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','AICU_SCI_2', 5 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','BCRU_ARINC_429_OP_1', 6 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','BCRU_ARINC_429_OP_2', 7 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','BCRU_ARINC_429_OP_EMER', 8 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','CVR_BUS_TO_NSS', 9 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','DME_OUT_1_1', 10 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','DME_OUT_1_2', 11 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','EGCU_ARINC_429_OP_1', 12 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','FDU_A429_LINE_SCI_2', 13 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','GGPCU_ARINC_429_OP_A_1', 14 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','GGPCU_ARINC_429_OP_A_2', 15 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','GGPCU_ARINC_429_OP_A_3', 16 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','GGPCU_ARINC_429_OP_A_4', 17 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','GGPCU_ARINC_429_OP_A_5', 18 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','ILS_OUT_2_1', 19 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','ILS_OUT_2_2', 20 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','IPCU_ARINC429_TO_NSS', 21 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','PA_TO_NSS_A429_HS_DATA_BUS_1', 22 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','RA_OUT_2_1', 23 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','RA_OUT_2_2', 24 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','RMP_TO_NSS_LN_1', 25 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','RMP_TO_NSS_LN_2', 26 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','RMP_TO_NSS_LN_3', 27 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','SATCOM_TO_DLCS_A429_HS_DATA_BUS_1', 28 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','SCI_LINE_B', 29 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','SCI_LINE_Y', 30 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','TACAN_OUT_A_1', 31 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','TACAN_OUT_A_2', 32 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','TRU_ARINC_429_OP_1', 33 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','VDR3_BUS_TO_NSS_1', 34 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','VOR_OUT_1_1', 35 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','VOR_OUT_1_2', 36 )
INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder )
		VALUES ( 'FINCI_429InputBusName','WWS_OUT_A_1', 37 )







------------------------------------------------------------------------------------
-- FINCI_429InputBusName
------------------------------------------------------------------------------------

IF(NOT EXISTS(SELECT * FROM infobase WHERE object_value = 'FINCI_ParameterLocalName' AND table_name = 'R_FIN_CI'))
	BEGIN
		INSERT INTO infobase 
		(
			object_name, 
			object_value, 
			table_name, 
			type_search, 
			type_edit, 
			reduced_view, 
			type_val, 
			link_page, 
			link_val, 
			object_order, 
			object_infos, 
			list_val, 
			info_ext, 
			idr_group, 
			linked_page, 
			repository, 
			mandatory,
			changeChoicelist
		)
		SELECT
			'Parameter local name',
			'FINCI_ParameterLocalName',
			'R_FIN_CI',
			'text',
			'text',
			0,
			'text',
			NULL,
			NULL,
			426,
			'Parameter local name',
			'',
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAPPING TABLE') AND (T_OBJECT.table_primary_key = 'R_FIN_CI')
			),
			NULL,
			NULL,
			0,
			0
	END
ELSE
	BEGIN
		PRINT 'FINCI_ParameterLocalName is already created in Infobase.'
	END




------------------------------------------------------------------------------------
-- FINCI_Sensitive
------------------------------------------------------------------------------------

IF(NOT EXISTS(SELECT * FROM infobase WHERE object_value = 'FINCI_Sensitive' AND table_name = 'R_FIN_CI'))
	BEGIN
		INSERT INTO infobase 
		(
			object_name, 
			object_value, 
			table_name, 
			type_search, 
			type_edit, 
			reduced_view, 
			type_val, 
			link_page, 
			link_val, 
			object_order, 
			object_infos, 
			list_val, 
			info_ext, 
			idr_group, 
			linked_page, 
			repository, 
			mandatory,
			changeChoicelist
		)
		SELECT
			'Sensitive',
			'FINCI_Sensitive',
			'R_FIN_CI',
			'listv',
			'listv',
			0,
			'text',
			NULL,
			NULL,
			375,
			'Sensitive',
			'Yes;No',
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAPPING TABLE') AND (T_OBJECT.table_primary_key = 'R_FIN_CI')
			),
			NULL,
			NULL,
			0,
			0
	END
ELSE
	BEGIN
		PRINT 'FINCI_Sensitive is already created in Infobase.'
	END



------------------------------------------------------------------------------------
-- FINCI_Sensitive
------------------------------------------------------------------------------------

IF(NOT EXISTS(SELECT * FROM infobase WHERE object_value = 'FINCI_Sensitive' AND table_name = 'R_FIN_CI'))
	BEGIN
		INSERT INTO infobase 
		(
			object_name, 
			object_value, 
			table_name, 
			type_search, 
			type_edit, 
			reduced_view, 
			type_val, 
			link_page, 
			link_val, 
			object_order, 
			object_infos, 
			list_val, 
			info_ext, 
			idr_group, 
			linked_page, 
			repository, 
			mandatory,
			changeChoicelist
		)
		SELECT
			'Sensitive',
			'FINCI_Sensitive',
			'R_FIN_CI',
			'listv',
			'listv',
			0,
			'text',
			NULL,
			NULL,
			375,
			'Sensitive',
			'Yes;No',
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAPPING TABLE') AND (T_OBJECT.table_primary_key = 'R_FIN_CI')
			),
			NULL,
			NULL,
			0,
			0
	END
ELSE
	BEGIN
		PRINT 'FINCI_Sensitive is already created in Infobase.'
	END



------------------------------------------------------------------------------------
-- ASSFINCI_name
------------------------------------------------------------------------------------

IF(NOT EXISTS(SELECT * FROM infobase WHERE object_value = 'ASSFINCI_name' AND table_name = 'V_ASS_SUB_FIN_CI'))
	BEGIN
		INSERT INTO infobase 
		(
			object_name, 
			object_value, 
			table_name, 
			type_search, 
			type_edit, 
			reduced_view, 
			type_val, 
			link_page, 
			link_val, 
			object_order, 
			object_infos, 
			list_val, 
			info_ext, 
			idr_group, 
			linked_page, 
			repository, 
			mandatory,
			changeChoicelist
		)
		SELECT
			'FIN Name',
			'ASSFINCI_name',
			'V_ASS_SUB_FIN_CI',
			'text',
			'text',
			0,
			'text',
			NULL,
			NULL,
			10,
			'FIN Name',
			NULL,
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'V_ASS_SUB_FIN_CI')
			),
			'FIN_CI_Consultation',
			NULL,
			0,
			0
	END
ELSE
	BEGIN
		PRINT 'Column ASSFINCI_name is already created in Infobase.'
	END