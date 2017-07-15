
/*********************************************************************/
/******************** MAFU Administrator  **********************************/
/*********************************************************************/
----- MPSysCentralCMComment
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Administrator')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPSysCentralCMComment' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPSysCentralCMComment' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Administrator'
end
else
begin 		-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPSysCentralCMComment'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Administrator'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Administrator  **********************************/
/*********************************************************************/
----- MPTaskForceFollowUp
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Administrator')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPTaskForceFollowUp' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceFollowUp' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Administrator'
end
else
begin 		-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceFollowUp'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Administrator'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Administrator **********************************/
/*********************************************************************/
----- MPTaskForceItem
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Administrator')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPTaskForceItem' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceItem' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Administrator'
end
else
begin 		-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceItem'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Administrator'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU ATA 24 Change Leader  **********************************/
/*********************************************************************/
----- MPSysCentralCMComment
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU ATA 24 Change Leader')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPSysCentralCMComment' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPSysCentralCMComment' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU ATA 24 Change Leader'
end
else
begin 		-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPSysCentralCMComment'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU ATA 24 Change Leader'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU ATA 24 Change Leader **********************************/
/*********************************************************************/
----- MPTaskForceFollowUp
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU ATA 24 Change Leader')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPTaskForceFollowUp' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceFollowUp' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU ATA 24 Change Leader'
end
else
begin 		-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceFollowUp'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU ATA 24 Change Leader'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU ATA 24 Change Leader **********************************/
/*********************************************************************/
----- MPTaskForceItem
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU ATA 24 Change Leader')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPTaskForceItem' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceItem' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU ATA 24 Change Leader'
end
else
begin 		-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceItem'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU ATA 24 Change Leader'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU central CM team  **********************************/
/*********************************************************************/
----- MPSysCentralCMComment
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU central CM team')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPSysCentralCMComment' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPSysCentralCMComment' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU central CM team'
end
else
begin 		-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPSysCentralCMComment'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU central CM team'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU central CM team **********************************/
/*********************************************************************/
----- MPTaskForceFollowUp
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU central CM team')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPTaskForceFollowUp' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceFollowUp' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU central CM team'
end
else
begin 		-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceFollowUp'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU central CM team'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU central CM team **********************************/
/*********************************************************************/
----- MPTaskForceItem
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU central CM team')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPTaskForceItem' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceItem' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU central CM team'
end
else
begin 		-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceItem'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU central CM team'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Change group leader  **********************************/
/*********************************************************************/
----- MPSysCentralCMComment
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Change group leader')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPSysCentralCMComment' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPSysCentralCMComment' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Change group leader'
end
else
begin 		-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPSysCentralCMComment'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Change group leader'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Change group leader **********************************/
/*********************************************************************/
----- MPTaskForceFollowUp
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Change group leader')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPTaskForceFollowUp' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceFollowUp' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Change group leader'
end
else
begin 		-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceFollowUp'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Change group leader'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Change group leader **********************************/
/*********************************************************************/
----- MPTaskForceItem
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Change group leader')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPTaskForceItem' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceItem' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Change group leader'
end
else
begin 		-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceItem'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Change group leader'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Change leader  **********************************/
/*********************************************************************/
----- MPSysCentralCMComment
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Change leader')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPSysCentralCMComment' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPSysCentralCMComment' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Change leader'
end
else
begin 		-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPSysCentralCMComment'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Change leader'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Change leader **********************************/
/*********************************************************************/
----- MPTaskForceFollowUp
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Change leader')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPTaskForceFollowUp' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceFollowUp' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Change leader'
end
else
begin 		-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceFollowUp'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Change leader'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Change leader **********************************/
/*********************************************************************/
----- MPTaskForceItem
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Change leader')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPTaskForceItem' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceItem' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Change leader'
end
else
begin 		-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceItem'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Change leader'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Change reader **********************************/
/*********************************************************************/
----- MPSysCentralCMComment
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Change reader')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPSysCentralCMComment' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPSysCentralCMComment' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Change reader'
end
else
begin 		-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPSysCentralCMComment'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Change reader'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Change reader **********************************/
/*********************************************************************/
----- MPTaskForceFollowUp
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Change reader')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPTaskForceFollowUp' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceFollowUp' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Change reader'
end
else
begin 		-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceFollowUp'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Change reader'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Change reader **********************************/
/*********************************************************************/
----- MPTaskForceItem
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Change reader')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPTaskForceItem' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceItem' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Change reader'
end
else
begin 		-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceItem'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU Change reader'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU costing  **********************************/
/*********************************************************************/
----- MPSysCentralCMComment
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU costing')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPSysCentralCMComment' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPSysCentralCMComment' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU costing'
end
else
begin 		-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPSysCentralCMComment'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU costing'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU costing **********************************/
/*********************************************************************/
----- MPTaskForceFollowUp
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU costing')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPTaskForceFollowUp' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceFollowUp' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU costing'
end
else
begin 		-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceFollowUp'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU costing'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU costing **********************************/
/*********************************************************************/
----- MPTaskForceItem
if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU costing')
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPTaskForceItem' and infoBase.table_name = 'T_MP')))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceItem' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU costing'
end
else
begin 		-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = 'MPTaskForceItem'
	 AND InfoBase.table_name = 'T_MP'
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = 'MAFU costing'
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end
