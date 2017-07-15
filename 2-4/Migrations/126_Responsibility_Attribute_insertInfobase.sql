------------------------------------------------------------------------------------
---------------------------------------- T_Responsibility --------------------------
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- RESP_RespTreePosition
------------------------------------------------------------------------------------

IF(NOT EXISTS(SELECT * FROM infobase WHERE object_value = 'RESP_RespTreePosition' AND table_name = 'T_Responsibility'))
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
			'Resp Tree Position',
			'RESP_RespTreePosition',
			'T_Responsibility',
			'text',
			'text',
			0,
			'text',
			NULL,
			NULL,
			NULL,
			'Resp Tree Position',
			NULL,
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'T_Responsibility')
			),
			NULL,
			NULL,
			0,
			0
	END
ELSE
	BEGIN
		PRINT 'column RESP_RespTreePosition is already created in Infobase.'
	END



------------------------------------------------------------------------------------
-- RESP_HoVDMURelevant
------------------------------------------------------------------------------------

IF(NOT EXISTS(SELECT * FROM infobase WHERE object_value = 'RESP_HoVDMURelevant' AND table_name = 'T_Responsibility'))
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
			'HoV DMU Relevant',
			'RESP_HoVDMURelevant',
			'T_Responsibility',
			'listv',
			'listv',
			0,
			'text',
			NULL,
			NULL,
			220,
			'HoV DMU Relevant',
			'true;false',
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'T_Responsibility')
			),
			NULL,
			NULL,
			0,
			0
	END
ELSE
	BEGIN
		PRINT ' column RESP_HoVDMURelevant is already created in Infobase.'
	END




------------------------------------------------------------------------------------
-- RESP_HoVFINCategory
------------------------------------------------------------------------------------

IF(NOT EXISTS(SELECT * FROM infobase WHERE object_value = 'RESP_HoVFINCategory' AND table_name = 'T_Responsibility'))
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
			'HoV FIN Category',
			'RESP_HoVFINCategory',
			'T_Responsibility',
			'listv',
			'listv',
			0,
			'text',
			NULL,
			NULL,
			210,
			'HoV FIN Category',
			'SELECT ChoiceValue FROM t_choicelist WHERE ChoiceList = ''Fincategory''  ORDER BY ChoiceOrder ',
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'T_Responsibility')
			),
			NULL,
			NULL,
			0,
			0
	END
ELSE
	BEGIN
		PRINT 'column RESP_HoVFINCategory is already created in Infobase.'
	END


------------------------------------------------------------------------------------
-- ins_HoVFINCategory  
------------------------------------------------------------------------------------

IF(NOT EXISTS(SELECT * FROM infobase WHERE object_value = 'ins_HoVFINCategory' AND table_name = 'V_Installation_responsibility'))
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
			'HoV FIN Category',
			'ins_HoVFINCategory',
			'V_Installation_responsibility',
			'listv',
			'listv',
			0,
			'text',
			NULL,
			NULL,
			42,
			'HoV FIN Category',
			'SELECT ChoiceValue FROM t_choicelist WHERE ChoiceList = ''Fincategory''  ORDER BY ChoiceOrder ',
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'V_Installation_responsibility')
			),
			NULL,
			NULL,
			0,
			0
	END
ELSE
	BEGIN
		PRINT 'column ins_HoVFINCategory is already created in Infobase.'
	END



------------------------------------------------------------------------------------
-- ins_HoVDMURelevant
------------------------------------------------------------------------------------

IF(NOT EXISTS(SELECT * FROM infobase WHERE object_value = 'ins_HoVDMURelevant' AND table_name = 'V_Installation_responsibility'))
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
			'HoV DMU Relevant',
			'ins_HoVDMURelevant',
			'V_Installation_responsibility',
			'listv',
			'listv',
			0,
			'text',
			NULL,
			NULL,
			43,
			'HoV DMU Relevant',
			'true;false',
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'V_Installation_responsibility')
			),
			NULL,
			NULL,
			0,
			0
	END
ELSE
	BEGIN
		PRINT 'column ins_HoVDMURelevant is already created in Infobase.'
	END


