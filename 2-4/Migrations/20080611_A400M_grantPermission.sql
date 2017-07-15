-- Grant permission
-- Read/write
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Central CM team')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'INVpEDESRef' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'INVpEDESRef' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Central CM team'
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'INVpEDESRef'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Central CM team'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
end

-- Read only
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Administrator')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'INVpEDESRef' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 0 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'INVpEDESRef' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Administrator'
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'INVpEDESRef'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Administrator'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
end

if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Change leader')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'INVpEDESRef' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 0 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'INVpEDESRef' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Change leader'
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'INVpEDESRef'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Change leader'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
end

if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Change group leader')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'INVpEDESRef' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 0 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'INVpEDESRef' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Change group leader'
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'INVpEDESRef'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Change group leader'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
end

if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Change reader')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'INVpEDESRef' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 0 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'INVpEDESRef' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Change reader'
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'INVpEDESRef'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Change reader'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
end


-- Rename label
UPDATE
	Infobase
SET
	object_name = 'CATEGORY B VALIDITY',
	object_order = 200,
	idr_group = (	SELECT     T_ATTR_GROUP.id_attr_group
					FROM         T_ATTR_GROUP INNER JOIN
					                      T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group INNER JOIN
					                      T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
					WHERE     (T_OBJECT.label LIKE 'mp%') AND (T_ATTR_GROUP.label LIKE 'MAIN')
	
	)
WHERE
	id_infobase = (	SELECT id_infobase
					FROM Infobase
					WHERE
						table_name = 'T_MP'
						AND object_value = 'INVpEDESRef'
	)
