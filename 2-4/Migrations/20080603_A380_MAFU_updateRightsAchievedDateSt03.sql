-- Delete Rights
UPDATE T_PERMISSION_ACCESS_ATTRIBUTE SET write_mode = 0
WHERE idr_infobase in (SELECT id_infobase FROM Infobase WHERE infoBase.object_value = 'stage0_modClosureDateA' and infoBase.table_name = 'V_MOD_CLOSURE_STAGE0')
	AND idr_user_role in (SELECT id_role FROM T_USER_ROLE WHERE name_role = 'MAFU Change Leader')
	
UPDATE T_PERMISSION_ACCESS_ATTRIBUTE SET write_mode = 0
WHERE idr_infobase in (SELECT id_infobase FROM Infobase WHERE infoBase.object_value = 'stage0_modClosureDateA' and infoBase.table_name = 'V_MOD_CLOSURE_STAGE0')
	AND idr_user_role in (SELECT id_role FROM T_USER_ROLE WHERE name_role = 'MAFU Group Leader')

UPDATE T_PERMISSION_ACCESS_ATTRIBUTE SET write_mode = 0
WHERE idr_infobase in (SELECT id_infobase FROM Infobase WHERE infoBase.object_value = 'stage3_modClosureDateA' and infoBase.table_name = 'V_MOD_CLOSURE_STAGE3')
	AND idr_user_role in (SELECT id_role FROM T_USER_ROLE WHERE name_role = 'MAFU Change Leader')
	
UPDATE T_PERMISSION_ACCESS_ATTRIBUTE SET write_mode = 0
WHERE idr_infobase in (SELECT id_infobase FROM Infobase WHERE infoBase.object_value = 'stage3_modClosureDateA' and infoBase.table_name = 'V_MOD_CLOSURE_STAGE3')
	AND idr_user_role in (SELECT id_role FROM T_USER_ROLE WHERE name_role = 'MAFU Group Leader')

-- Grant permission
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Operational Support')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'stage0_modClosureDateA' and infoBase.table_name = 'V_MOD_CLOSURE_STAGE0')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'stage0_modClosureDateA' AND InfoBase.table_name = 'V_MOD_CLOSURE_STAGE0' AND T_USER_ROLE.name_role = 'MAFU Operational Support'
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'stage0_modClosureDateA'
	 AND InfoBase.table_name = 'V_MOD_CLOSURE_STAGE0'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Operational Support'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
end

if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Chief BNDYOCS')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'stage0_modClosureDateA' and infoBase.table_name = 'V_MOD_CLOSURE_STAGE0')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'stage0_modClosureDateA' AND InfoBase.table_name = 'V_MOD_CLOSURE_STAGE0' AND T_USER_ROLE.name_role = 'MAFU Chief BNDYOCS'
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'stage0_modClosureDateA'
	 AND InfoBase.table_name = 'V_MOD_CLOSURE_STAGE0'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Chief BNDYOCS'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
end

if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Head of Conf')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'stage0_modClosureDateA' and infoBase.table_name = 'V_MOD_CLOSURE_STAGE0')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'stage0_modClosureDateA' AND InfoBase.table_name = 'V_MOD_CLOSURE_STAGE0' AND T_USER_ROLE.name_role = 'MAFU Head of Conf'
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'stage0_modClosureDateA'
	 AND InfoBase.table_name = 'V_MOD_CLOSURE_STAGE0'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Head of Conf'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
end

if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Operational Support')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'stage3_modClosureDateA' and infoBase.table_name = 'V_MOD_CLOSURE_STAGE3')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'stage3_modClosureDateA' AND InfoBase.table_name = 'V_MOD_CLOSURE_STAGE3' AND T_USER_ROLE.name_role = 'MAFU Operational Support'
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'stage3_modClosureDateA'
	 AND InfoBase.table_name = 'V_MOD_CLOSURE_STAGE3'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Operational Support'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
end

if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Chief BNDYOCS')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'stage3_modClosureDateA' and infoBase.table_name = 'V_MOD_CLOSURE_STAGE3')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'stage3_modClosureDateA' AND InfoBase.table_name = 'V_MOD_CLOSURE_STAGE3' AND T_USER_ROLE.name_role = 'MAFU Chief BNDYOCS'
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'stage3_modClosureDateA'
	 AND InfoBase.table_name = 'V_MOD_CLOSURE_STAGE3'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Chief BNDYOCS'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
end

if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Head of Conf')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'stage3_modClosureDateA' and infoBase.table_name = 'V_MOD_CLOSURE_STAGE3')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'stage3_modClosureDateA' AND InfoBase.table_name = 'V_MOD_CLOSURE_STAGE3' AND T_USER_ROLE.name_role = 'MAFU Head of Conf'
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'stage3_modClosureDateA'
	 AND InfoBase.table_name = 'V_MOD_CLOSURE_STAGE3'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Head of Conf'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
end