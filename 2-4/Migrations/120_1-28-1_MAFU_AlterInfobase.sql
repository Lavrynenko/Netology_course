-- Ajout aux RFC.

-- A/C ICD IMPACT
	if(not exists(select * from infobase where object_value = 'rfc_cr_acIcdImpact' and table_name = 'V_RFC'))
	begin
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
			fast_search
		)
		select
			'A/C ICD IMPACT',
			'rfc_cr_acIcdImpact',
			'V_RFC',
			'listv',
			'listv',
			NULL,
			'text',
			NULL,
			NULL,
			(
				SELECT     object_order + 1
				FROM         InfoBase
				WHERE     (object_value = 'rfc_ImplementationInFAL') AND (table_name = 'V_RFC')
			),
			NULL,
			'YES;NO;TBC;YES TBC; NO TBC',
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'V_RFC')
			),
			NULL,
			NULL,
			0
	end
	else
	begin
		UPDATE Infobase
		SET
			object_name = 'A/C ICD IMPACT', 
			object_order = (
				SELECT     object_order + 1
				FROM         InfoBase
				WHERE     (object_value = 'rfc_ImplementationInFAL') AND (table_name = 'V_RFC')
			),
			list_val = 'YES;NO;TBC;YES TBC; NO TBC',
			idr_group = (
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'V_RFC')
			)
		WHERE
			object_value = 'rfc_cr_acIcdImpact' and table_name = 'V_RFC'
	end
	
	
-- XML and/or FMD IMPACT
	if(not exists(select * from infobase where object_value = 'rfc_cr_xmlFmdImpact' and table_name = 'V_RFC'))
	begin
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
			fast_search
		)
		select
			'XML and/or FMD IMPACT',
			'rfc_cr_xmlFmdImpact',
			'V_RFC',
			'listv',
			'listv',
			NULL,
			'text',
			NULL,
			NULL,
			(
				SELECT     object_order + 2
				FROM         InfoBase
				WHERE     (object_value = 'rfc_ImplementationInFAL') AND (table_name = 'V_RFC')
			),
			NULL,
			'YES;NO;TBC;YES TBC; NO TBC',
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'V_RFC')
			),
			NULL,
			NULL,
			0
	end
	else
	begin
		UPDATE Infobase
		SET
			object_name = 'XML and/or FMD IMPACT', 
			object_order = (
				SELECT     object_order + 2
				FROM         InfoBase
				WHERE     (object_value = 'rfc_ImplementationInFAL') AND (table_name = 'V_RFC')
			),
			list_val = 'YES;NO;TBC;YES TBC; NO TBC',
			idr_group = (
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'V_RFC')
			)
		WHERE
			object_value = 'rfc_cr_xmlFmdImpact' and table_name = 'V_RFC'
	end
	
	
-- C/B or RCCB or SSPC IMPACT
	if(not exists(select * from infobase where object_value = 'rfc_cr_cbRccbSspcImpact' and table_name = 'V_RFC'))
	begin
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
			fast_search
		)
		select
			'C/B or RCCB or SSPC IMPACT',
			'rfc_cr_cbRccbSspcImpact',
			'V_RFC',
			'listv',
			'listv',
			NULL,
			'text',
			NULL,
			NULL,
			(
				SELECT     object_order + 3
				FROM         InfoBase
				WHERE     (object_value = 'rfc_ImplementationInFAL') AND (table_name = 'V_RFC')
			),
			NULL,
			'YES;NO;TBC;YES TBC; NO TBC',
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'V_RFC')
			),
			NULL,
			NULL,
			0
	end
	else
	begin
		UPDATE Infobase
		SET
			object_name = 'C/B or RCCB or SSPC IMPACT', 
			object_order = (
				SELECT     object_order + 3
				FROM         InfoBase
				WHERE     (object_value = 'rfc_ImplementationInFAL') AND (table_name = 'V_RFC')
			),
			list_val = 'YES;NO;TBC;YES TBC; NO TBC',
			idr_group = (
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'V_RFC')
			)
		WHERE
			object_value = 'rfc_cr_cbRccbSspcImpact' and table_name = 'V_RFC'
	end
	
	
-- SERVICE BULLETIN
	if(not exists(select * from infobase where object_value = 'rfc_cr_sb' and table_name = 'V_RFC'))
	begin
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
			fast_search
		)
		select
			'SERVICE BULLETIN',
			'rfc_cr_sb',
			'V_RFC',
			'listv',
			'listv',
			NULL,
			'text',
			NULL,
			NULL,
			(
				SELECT     object_order + 4
				FROM         InfoBase
				WHERE     (object_value = 'rfc_ImplementationInFAL') AND (table_name = 'V_RFC')
			),
			NULL,
			'YES;NO;TBC;YES TBC; NO TBC',
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'V_RFC')
			),
			NULL,
			NULL,
			0
	end
	else
	begin
		UPDATE Infobase
		SET
			object_name = 'SERVICE BULLETIN', 
			object_order = (
				SELECT     object_order + 4
				FROM         InfoBase
				WHERE     (object_value = 'rfc_ImplementationInFAL') AND (table_name = 'V_RFC')
			),
			list_val = 'YES;NO;TBC;YES TBC; NO TBC',
			idr_group = (
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'V_RFC')
			)
		WHERE
			object_value = 'rfc_cr_sb' and table_name = 'V_RFC'
	end
	
	
-- ATA 42 IMPACT
	if(not exists(select * from infobase where object_value = 'rfc_cr_Ata42Impact' and table_name = 'V_RFC'))
	begin
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
			fast_search
		)
		select
			'ATA 42 IMPACT',
			'rfc_cr_Ata42Impact',
			'V_RFC',
			'listv',
			'listv',
			NULL,
			'text',
			NULL,
			NULL,
			(
				SELECT     object_order + 5
				FROM         InfoBase
				WHERE     (object_value = 'rfc_ImplementationInFAL') AND (table_name = 'V_RFC')
			),
			NULL,
			'YES;NO;TBC;YES TBC; NO TBC',
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'V_RFC')
			),
			NULL,
			NULL,
			0
	end
	else
	begin
		UPDATE Infobase
		SET
			object_name = 'ATA 42 IMPACT', 
			object_order = (
				SELECT     object_order + 5
				FROM         InfoBase
				WHERE     (object_value = 'rfc_ImplementationInFAL') AND (table_name = 'V_RFC')
			),
			list_val = 'YES;NO;TBC;YES TBC; NO TBC',
			idr_group = (
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'V_RFC')
			)
		WHERE
			object_value = 'rfc_cr_Ata42Impact' and table_name = 'V_RFC'
	end
	
	
-- ATQC IMPACT
	if(not exists(select * from infobase where object_value = 'rfc_cr_AtqcImpact' and table_name = 'V_RFC'))
	begin
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
			fast_search
		)
		select
			'ATQC IMPACT',
			'rfc_cr_AtqcImpact',
			'V_RFC',
			'listv',
			'listv',
			NULL,
			'text',
			NULL,
			NULL,
			(
				SELECT     object_order + 6
				FROM         InfoBase
				WHERE     (object_value = 'rfc_ImplementationInFAL') AND (table_name = 'V_RFC')
			),
			NULL,
			'YES;NO;TBC;YES TBC; NO TBC',
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'V_RFC')
			),
			NULL,
			NULL,
			0
	end
	else
	begin
		UPDATE Infobase
		SET
			object_name = 'ATQC IMPACT', 
			object_order = (
				SELECT     object_order + 6
				FROM         InfoBase
				WHERE     (object_value = 'rfc_ImplementationInFAL') AND (table_name = 'V_RFC')
			),
			list_val = 'YES;NO;TBC;YES TBC; NO TBC',
			idr_group = (
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'V_RFC')
			)
		WHERE
			object_value = 'rfc_cr_AtqcImpact' and table_name = 'V_RFC'
	end
	
	
-- DSA REQUIRED
	if(not exists(select * from infobase where object_value = 'rfc_cr_dsaRequired' and table_name = 'V_RFC'))
	begin
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
			fast_search
		)
		select
			'DSA REQUIRED',
			'rfc_cr_dsaRequired',
			'V_RFC',
			'listv',
			'listv',
			NULL,
			'text',
			NULL,
			NULL,
			(
				SELECT     object_order + 7
				FROM         InfoBase
				WHERE     (object_value = 'rfc_ImplementationInFAL') AND (table_name = 'V_RFC')
			),
			NULL,
			'YES;NO;CHECKLIST;TBC;YES TBC; NO TBC',
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'V_RFC')
			),
			NULL,
			NULL,
			0
	end
	else
	begin
		UPDATE Infobase
		SET
			object_name = 'DSA REQUIRED', 
			object_order = (
				SELECT     object_order + 7
				FROM         InfoBase
				WHERE     (object_value = 'rfc_ImplementationInFAL') AND (table_name = 'V_RFC')
			),
			list_val = 'YES;NO;CHECKLIST;TBC;YES TBC; NO TBC',
			idr_group = (
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'V_RFC')
			)
		WHERE
			object_value = 'rfc_cr_dsaRequired' and table_name = 'V_RFC'
	end
	
	
-- DMU IMPACT
	if(not exists(select * from infobase where object_value = 'rfc_cr_dmuIpact' and table_name = 'V_RFC'))
	begin
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
			fast_search
		)
		select
			'DMU IMPACT',
			'rfc_cr_dmuIpact',
			'V_RFC',
			'listv',
			'listv',
			NULL,
			'text',
			NULL,
			NULL,
			(
				SELECT     object_order + 8
				FROM         InfoBase
				WHERE     (object_value = 'rfc_ImplementationInFAL') AND (table_name = 'V_RFC')
			),
			NULL,
			'YES;NO;TBC;YES TBC; NO TBC',
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'V_RFC')
			),
			NULL,
			NULL,
			0
	end
	else
	begin
		UPDATE Infobase
		SET
			object_name = 'DMU IMPACT', 
			object_order = (
				SELECT     object_order + 8
				FROM         InfoBase
				WHERE     (object_value = 'rfc_ImplementationInFAL') AND (table_name = 'V_RFC')
			),
			list_val = 'YES;NO;TBC;YES TBC; NO TBC',
			idr_group = (
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'V_RFC')
			)
		WHERE
			object_value = 'rfc_cr_dmuIpact' and table_name = 'V_RFC'
	end
	 
	 
	 
	 
	 