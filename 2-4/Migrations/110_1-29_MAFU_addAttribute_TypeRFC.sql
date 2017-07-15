IF EXISTS (SELECT name FROM sysobjects WHERE name = 'ADD_ROLE') DROP PROCEDURE ADD_ROLE
GO

CREATE PROCEDURE ADD_ROLE
	@roleName	varchar(50),
	@attribute_id int,
	@readAccess	int,
	@writeAccess	int
as
if not exists (
	select * from dbo.T_PERMISSION_ACCESS_ATTRIBUTE
	inner join dbo.T_USER_ROLE on id_role = idr_user_role
	where name_role = @roleName
	and idr_user_role = @attribute_id
	)
begin
	insert into dbo.T_PERMISSION_ACCESS_ATTRIBUTE (
		idr_user_role,
		idr_infobase,
		read_mode,
		write_mode,
		fast_search
	)
	select
		id_role,
		@attribute_id,
		@readAccess,
		@writeAccess,
		0
	from dbo.T_USER_ROLE
	where name_role = @roleName
end
GO

---------------------------
-- get attribute order (to be displayed after attribute 'RFC Status')
	declare @rfcStatusOrder as int
	declare @order as int
	select @rfcStatusOrder= object_order from infobase where object_value ='rfc_RFCStatus'
	set @order = @rfcStatusOrder +1

if not exists (
	select * from infobase
	where object_value = 'rfc_TypeRFC'
	and table_name='v_rfc'
)

begin
	-- insert attribute
	insert into infobase (
		object_name,
		object_value,
		table_name,
		type_search,
		type_edit,
		reduced_view,
		type_val,
		object_order,
		idr_group,
		mandatory,
		fast_search
	)
	select
		'Type RFC',
		'rfc_TypeRFC',
		'v_rfc',
		'text',
		'text',
		0,
		'text',
		@order,
		id_attr_group,
		0,
		0
	from dbo.T_ATTR_GROUP
	inner join dbo.T_LINK_ATTRGROUP_OBJECT on idr_attr_group = id_attr_group
	inner join dbo.T_OBJECT on id_object = T_LINK_ATTRGROUP_OBJECT.idr_object
	where T_ATTR_GROUP.label = 'MAIN'
	and T_OBJECT. table_primary_key = 'v_rfc'
	
	-- Give access rights to the various roles
	declare @attribute_id as int
	select @attribute_id=id_infobase from dbo.InfoBase
	where object_value = 'rfc_TypeRFC'
	and table_name='v_rfc'
	-- add access to the different roles
	EXECUTE ADD_ROLE 'Administrator', @attribute_id, 1, 0
	EXECUTE ADD_ROLE 'Common User', @attribute_id, 1, 0
	EXECUTE ADD_ROLE 'Certification Coordinator', @attribute_id, 1, 0
	EXECUTE ADD_ROLE 'Industrial', @attribute_id, 1, 0
	EXECUTE ADD_ROLE 'MAFU BNDYE', @attribute_id, 1, 0
	EXECUTE ADD_ROLE 'MAFU BNDYOCS dummy MP owner', @attribute_id, 1, 0
	EXECUTE ADD_ROLE 'MAFU Change Leader', @attribute_id, 1, 0
	EXECUTE ADD_ROLE 'MAFU Chief BNDYOCS', @attribute_id, 1, 0
	EXECUTE ADD_ROLE 'MAFU Delta0 Admin', @attribute_id, 1, 0
	EXECUTE ADD_ROLE 'MAFU Delta0 Indus', @attribute_id, 1, 0
	EXECUTE ADD_ROLE 'MAFU Edit Search', @attribute_id, 1, 0
	EXECUTE ADD_ROLE 'MAFU Group Leader', @attribute_id, 1, 0
	EXECUTE ADD_ROLE 'MAFU Head of Conf', @attribute_id, 1, 0
	EXECUTE ADD_ROLE 'MAFU Operational Support', @attribute_id, 1, 0
	EXECUTE ADD_ROLE 'MAFU Reader', @attribute_id, 1, 0
end

else
begin
	-- get attribute group id
	declare @att_grp_id as int
	select @att_grp_id= idr_group from infobase where object_value ='rfc_RFCStatus'
	update infobase set
		object_name = 'Type RFC',
		type_search = 'text',
		type_edit = 'text',
		reduced_view = 0,
		type_val = 'text',
		object_order = @order,
		idr_group = @att_grp_id,
		mandatory = 0,
		fast_search = 0
	where object_value = 'rfc_TypeRFC'
	and table_name='v_rfc'
end

DROP PROCEDURE ADD_ROLE
