------------------------------------------------------------------------------------
---------------------------------------- MOD ----------------------------------------
------------------------------------------------------------------------------------


-- MOD_ModClosure

if(not exists(select * from infobase where object_value = 'MOD_ModClosure' and table_name = 'T_MOD'))
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
			mandatory,
			changeChoicelist
		)
		select
			'MOD Closure',
			'MOD_ModClosure',
			'T_MOD',
			'listv',
			'listv',
			0,
			'text',
			NULL,
			NULL,
			130,
			'Mod Closure',
			'Open;Stage 0;Stage 3;Stage 3a',
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'T_MOD')
			),
			NULL,
			NULL,
			0,
			0
	end
else
	begin
		print 'MOD_ModClosure is already created in Infobase.'
	end
