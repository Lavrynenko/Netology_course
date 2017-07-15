------------------------------------------------------------------------------------
---------------------------------------- MP ----------------------------------------
------------------------------------------------------------------------------------


-- MP_MASStatusFromACC2

IF(NOT EXISTS(SELECT * FROM infobase WHERE object_value = 'MP_MASStatusFromACC2' AND table_name = 'T_MP'))
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
			'MAS Status from ACC2',
			'MP_MASStatusFromACC2',
			'T_MP',
			'listv',
			'listv',
			NULL,
			'text',
			NULL,
			NULL,
			170,
			NULL,
			'TC;FC;FA;PA',
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'T_MP')
			),
			NULL,
			NULL,
			0,
			0
	END
ELSE
	BEGIN
		UPDATE infobase SET object_order = 170 WHERE object_value = 'MP_MASStatusFromACC2' AND table_name = 'T_MP'
		PRINT 'MP_MASStatusFromACC2 is updated in Infobase.'
	END
