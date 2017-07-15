----------------------------------------------------------------
-- T_MOD
----------------------------------------------------------------
-- Type certif?
	if(not exists(select * from infobase where object_value = 'MODTypeCertiftext' and table_name = 'T_MOD'))
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
			'TYPE CERTIF?',
			'MODTypeCertiftext',
			'T_MOD',
			'text',
			'text',
			NULL,
			'text',
			NULL,
			NULL,
			(
				SELECT     object_order
				FROM         InfoBase
				WHERE     (object_value = 'MODtypeCertif') AND (table_name = 'T_MOD')
			),
			NULL,
			NULL,
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
			0
	end
	else
	begin
		print 'MODTypeCertiftext is already created in Infobase.'
	end

-- MODsiteResponsible
	if(not exists(select * from infobase where object_value = 'MODsiteResponsible' and table_name = 'T_MOD'))
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
			'site responsible',
			'MODsiteResponsible',
			'T_MOD',
			'listv',
			'listv',
			NULL,
			'text',
			NULL,
			NULL,
			(
				SELECT     object_order + 2
				FROM         InfoBase
				WHERE     (object_value = 'MODSiteLeader') AND (table_name = 'T_MOD')
			),
			NULL,
			'TLSE;FLT;HBG;MAD',
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
			0
	end
	else
	begin
		print 'MODsiteResponsible is already created in Infobase.'
	end

-- MODacmtOrigin
	if(not exists(select * from infobase where object_value = 'MODacmtOrigin' and table_name = 'T_MOD'))
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
			'ACMT Origin',
			'MODacmtOrigin',
			'T_MOD',
			'listv',
			'listv',
			NULL,
			'text',
			NULL,
			NULL,
			(
				SELECT     object_order + 1
				FROM         InfoBase
				WHERE     (object_value = 'ModACMTLeader') AND (table_name = 'T_MOD')
			),
			NULL,
			'SYS;PRO;LGS',
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
			0
	end
	else
	begin
		print 'MODacmtOrigin is already created in Infobase.'
	end

----------------------------------------------------------------
-- T_MP
----------------------------------------------------------------
-- MPsiteResponsible
	if(not exists(select * from infobase where object_value = 'MPsiteResponsible' and table_name = 'T_MP'))
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
			'site responsible',
			'MPsiteResponsible',
			'T_MP',
			'listv',
			'listv',
			NULL,
			'text',
			NULL,
			NULL,
			(
				SELECT     object_order + 5
				FROM         InfoBase
				WHERE     (object_value = 'MPApplFromIcc') AND (table_name = 'T_MP')
			),
			NULL,
			'TLSE;FLT;HBG;MAD',
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
			0
	end
	else
	begin
		print 'MPsiteResponsible is already created in Infobase.'
	end
-- MPacmtOrigin
	if(not exists(select * from infobase where object_value = 'MPacmtOrigin' and table_name = 'T_MP'))
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
			'ACMT Origin',
			'MPacmtOrigin',
			'T_MP',
			'listv',
			'listv',
			NULL,
			'text',
			NULL,
			NULL,
			(
				SELECT     object_order + 4
				FROM         InfoBase
				WHERE     (object_value = 'ACMTLeaderMP') AND (table_name = 'T_MP')
			),
			NULL,
			'SYS;PRO;LGS',
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
			0
	end
	else
	begin
		print 'MPacmtOrigin is already created in Infobase.'
	end
-- Update order of "Leader or Involved"
UPDATE infobase SET object_order = (
					SELECT     object_order + 7
					FROM         InfoBase
					WHERE     (object_value = 'ACMTLeaderMP') AND (table_name = 'T_MP')
				)
WHERE (object_value = 'LinvoldMP') AND (table_name = 'T_MP')


----------------------------------------------------------------
-- V_CR
----------------------------------------------------------------
-- cr_CRacmtOrigin
	if(not exists(select * from infobase where object_value = 'cr_CRacmtOrigin' and table_name = 'V_CR'))
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
			'ACMT Origin',
			'cr_CRacmtOrigin',
			'V_CR',
			'listv',
			'listv',
			NULL,
			'text',
			NULL,
			NULL,
			(
				SELECT     object_order + 4
				FROM         InfoBase
				WHERE     (object_value = 'cr_ACMTLeaderCR') AND (table_name = 'V_CR')
			),
			NULL,
			'SYS;PRO;LGS',
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'MAIN') AND (T_OBJECT.table_primary_key = 'V_CR')
			),
			NULL,
			NULL,
			0
	end
	else
	begin
		print 'cr_CRacmtOrigin is already created in Infobase.'
	end
-- Update order of "Leader or Involved"
UPDATE infobase SET object_order = (
					SELECT     object_order + 7
					FROM         InfoBase
					WHERE     (object_value = 'cr_ACMTLeaderCR') AND (table_name = 'V_CR')
				)
WHERE (object_value = 'cr_Linvold') AND (table_name = 'V_CR')

----------------------------------------------------------------
-- V_RFC
----------------------------------------------------------------
-- rfc_RFCacmtOrigin
	if(not exists(select * from infobase where object_value = 'rfc_RFCacmtOrigin' and table_name = 'V_RFC'))
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
			'ACMT Origin',
			'rfc_RFCacmtOrigin',
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
				WHERE     (object_value = 'rfc_ACMTLeaderCR') AND (table_name = 'V_RFC')
			),
			NULL,
			'SYS;PRO;LGS',
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
		print 'rfc_RFCacmtOrigin is already created in Infobase.'
	end
-- Update order of "Leader or Involved"
UPDATE infobase SET object_order = (
					SELECT     object_order + 7
					FROM         InfoBase
					WHERE     (object_value = 'rfc_ACMTLeaderCR') AND (table_name = 'V_RFC')
				)
WHERE (object_value = 'rfc_Linvold') AND (table_name = 'V_RFC')
