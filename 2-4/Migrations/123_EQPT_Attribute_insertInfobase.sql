------------------------------------------------------------------------------------
---------------------------------------- Equipment----------------------------------
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- EQPT_TCIForManufacturingDateMonth
------------------------------------------------------------------------------------

IF(NOT EXISTS(SELECT * FROM infobase WHERE object_value = 'EQPT_TCIForManufacturingDateMonth' AND table_name = 'R_Equipment'))
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
			'Time control interval for manufacturing date (Month(s))',
			'EQPT_TCIForManufacturingDateMonth',
			'R_Equipment',
			'text',
			'text',
			0,
			'int',
			NULL,
			NULL,
			10,
			'Time control interval for manufacturing date (Month(s))',
			NULL,
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'Equipment Time Control Data') AND (T_OBJECT.table_primary_key = 'R_Equipment')
			),
			NULL,
			NULL,
			0,
			0
	END
ELSE
	BEGIN
		PRINT 'EQPT_TCIForManufacturingDateMonth is already created in Infobase.'
	END


------------------------------------------------------------------------------------
-- EQPT_TCIForWeightDateMonth
------------------------------------------------------------------------------------

IF(NOT EXISTS(SELECT * FROM infobase WHERE object_value = 'EQPT_TCIForWeightDateMonth' AND table_name = 'R_Equipment'))
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
			'Time control interval for weight date (Month(s))',
			'EQPT_TCIForWeightDateMonth',
			'R_Equipment',
			'text',
			'text',
			0,
			'int',
			NULL,
			NULL,
			20,
			'Time control interval for weight date (Month(s))',
			NULL,
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'Equipment Time Control Data') AND (T_OBJECT.table_primary_key = 'R_Equipment')
			),
			NULL,
			NULL,
			0,
			0
	END
ELSE
	BEGIN
		PRINT 'EQPT_TCIForWeightDateMonth is already created in Infobase.'
	END

------------------------------------------------------------------------------------
-- EQPT_TCIForDateOfHydrostaticTestMonth
------------------------------------------------------------------------------------

IF(NOT EXISTS(SELECT * FROM infobase WHERE object_value = 'EQPT_TCIForDateOfHydrostaticTestMonth' AND table_name = 'R_Equipment'))
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
			'Time control interval for date of  hydrostatic test (Month(s))',
			'EQPT_TCIForDateOfHydrostaticTestMonth',
			'R_Equipment',
			'text',
			'text',
			0,
			'int',
			NULL,
			NULL,
			30,
			'Time control interval for date of  hydrostatic test (Month(s))',
			NULL,
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'Equipment Time Control Data') AND (T_OBJECT.table_primary_key = 'R_Equipment')
			),
			NULL,
			NULL,
			0,
			0
	END
ELSE
	BEGIN
		PRINT 'EQPT_TCIForDateOfHydrostaticTestMonth is already created in Infobase.'
	END



------------------------------------------------------------------------------------
-- EQPT_TCIForBatteryExpiryDateMonth
------------------------------------------------------------------------------------

IF(NOT EXISTS(SELECT * FROM infobase WHERE object_value = 'EQPT_TCIForBatteryExpiryDateMonth' AND table_name = 'R_Equipment'))
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
			'Time control interval for battery expiry date (Month(s))',
			'EQPT_TCIForBatteryExpiryDateMonth',
			'R_Equipment',
			'text',
			'text',
			0,
			'int',
			NULL,
			NULL,
			40,
			'Time control interval for battery expiry date (Month(s))',
			NULL,
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'Equipment Time Control Data') AND (T_OBJECT.table_primary_key = 'R_Equipment')
			),
			NULL,
			NULL,
			0,
			0
	END
ELSE
	BEGIN
		PRINT 'EQPT_TCIForBatteryExpiryDateMonth is already created in Infobase.'
	END












































