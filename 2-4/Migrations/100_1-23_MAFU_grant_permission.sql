-- Grant permission to the new Type Certif?
if(not exists(select * from t_permission_access_attribute where idr_infobase = (select id_infobase
			from infobase
			where object_value = 'MODTypeCertiftext' and table_name = 't_mod')))
begin
	insert into t_permission_access_attribute (idr_user_role, idr_infobase, read_mode, write_mode)
	select idr_user_role,
		(select id_infobase
				from infobase
				where object_value = 'MODTypeCertiftext' and table_name = 't_mod'),
		read_mode,
		write_mode
	from t_permission_access_attribute
	where idr_infobase = (	select id_infobase
				from infobase
				where object_value = 'MODtypeCertif' and table_name = 't_mod')
end

-- Remove old permission
delete from t_permission_access_attribute where idr_infobase = (	select id_infobase
			from infobase
			where object_value = 'MODtypeCertif' and table_name = 't_mod')
			
/*********************************************************************/
/******************** Administrator *****************************/
/*********************************************************************/
----- MODsiteResponsible
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'Administrator')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MODsiteResponsible' and infoBase.table_name = 'T_MOD')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MODsiteResponsible' AND InfoBase.table_name = 'T_MOD' AND T_USER_ROLE.name_role = 'Administrator'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MODsiteResponsible'
		 AND InfoBase.table_name = 'T_MOD'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'Administrator'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
----- MPsiteResponsible
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'Administrator')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPsiteResponsible' and infoBase.table_name = 'T_MP')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MPsiteResponsible' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'Administrator'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MPsiteResponsible'
		 AND InfoBase.table_name = 'T_MP'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'Administrator'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
----- MODacmtOrigin
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'Administrator')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MODacmtOrigin' and infoBase.table_name = 'T_MOD')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MODacmtOrigin' AND InfoBase.table_name = 'T_MOD' AND T_USER_ROLE.name_role = 'Administrator'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MODacmtOrigin'
		 AND InfoBase.table_name = 'T_MOD'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'Administrator'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
----- MPacmtOrigin
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'Administrator')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPacmtOrigin' and infoBase.table_name = 'T_MP')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MPacmtOrigin' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'Administrator'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MPacmtOrigin'
		 AND InfoBase.table_name = 'T_MP'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'Administrator'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
----- cr_CRacmtOrigin
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'Administrator')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'cr_CRacmtOrigin' and infoBase.table_name = 'V_CR')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'cr_CRacmtOrigin' AND InfoBase.table_name = 'V_CR' AND T_USER_ROLE.name_role = 'Administrator'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'cr_CRacmtOrigin'
		 AND InfoBase.table_name = 'V_CR'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'Administrator'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
----- rfc_RFCacmtOrigin
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'Administrator')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'rfc_RFCacmtOrigin' and infoBase.table_name = 'V_RFC')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'rfc_RFCacmtOrigin' AND InfoBase.table_name = 'V_RFC' AND T_USER_ROLE.name_role = 'Administrator'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'rfc_RFCacmtOrigin'
		 AND InfoBase.table_name = 'V_RFC'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'Administrator'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
			
/*********************************************************************/
/******************** MAFU Change Leader *****************************/
/*********************************************************************/
----- MODsiteResponsible
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Change Leader')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MODsiteResponsible' and infoBase.table_name = 'T_MOD')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MODsiteResponsible' AND InfoBase.table_name = 'T_MOD' AND T_USER_ROLE.name_role = 'MAFU Change Leader'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MODsiteResponsible'
		 AND InfoBase.table_name = 'T_MOD'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'MAFU Change Leader'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
----- MPsiteResponsible
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Change Leader')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPsiteResponsible' and infoBase.table_name = 'T_MP')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MPsiteResponsible' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Change Leader'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MPsiteResponsible'
		 AND InfoBase.table_name = 'T_MP'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'MAFU Change Leader'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
----- MODacmtOrigin
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Change Leader')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MODacmtOrigin' and infoBase.table_name = 'T_MOD')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MODacmtOrigin' AND InfoBase.table_name = 'T_MOD' AND T_USER_ROLE.name_role = 'MAFU Change Leader'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MODacmtOrigin'
		 AND InfoBase.table_name = 'T_MOD'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'MAFU Change Leader'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
----- MPacmtOrigin
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Change Leader')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPacmtOrigin' and infoBase.table_name = 'T_MP')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MPacmtOrigin' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Change Leader'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MPacmtOrigin'
		 AND InfoBase.table_name = 'T_MP'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'MAFU Change Leader'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
----- cr_CRacmtOrigin
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Change Leader')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'cr_CRacmtOrigin' and infoBase.table_name = 'V_CR')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'cr_CRacmtOrigin' AND InfoBase.table_name = 'V_CR' AND T_USER_ROLE.name_role = 'MAFU Change Leader'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'cr_CRacmtOrigin'
		 AND InfoBase.table_name = 'V_CR'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'MAFU Change Leader'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
----- rfc_RFCacmtOrigin
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Change Leader')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'rfc_RFCacmtOrigin' and infoBase.table_name = 'V_RFC')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'rfc_RFCacmtOrigin' AND InfoBase.table_name = 'V_RFC' AND T_USER_ROLE.name_role = 'MAFU Change Leader'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'rfc_RFCacmtOrigin'
		 AND InfoBase.table_name = 'V_RFC'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'MAFU Change Leader'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
			
/*********************************************************************/
/******************** MAFU Group Leader *****************************/
/*********************************************************************/
----- MODsiteResponsible
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Group Leader')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MODsiteResponsible' and infoBase.table_name = 'T_MOD')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MODsiteResponsible' AND InfoBase.table_name = 'T_MOD' AND T_USER_ROLE.name_role = 'MAFU Group Leader'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MODsiteResponsible'
		 AND InfoBase.table_name = 'T_MOD'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'MAFU Group Leader'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
----- MPsiteResponsible
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Group Leader')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPsiteResponsible' and infoBase.table_name = 'T_MP')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MPsiteResponsible' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Group Leader'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MPsiteResponsible'
		 AND InfoBase.table_name = 'T_MP'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'MAFU Group Leader'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
----- MODacmtOrigin
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Group Leader')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MODacmtOrigin' and infoBase.table_name = 'T_MOD')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MODacmtOrigin' AND InfoBase.table_name = 'T_MOD' AND T_USER_ROLE.name_role = 'MAFU Group Leader'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MODacmtOrigin'
		 AND InfoBase.table_name = 'T_MOD'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'MAFU Group Leader'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
----- MPacmtOrigin
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Group Leader')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPacmtOrigin' and infoBase.table_name = 'T_MP')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MPacmtOrigin' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Group Leader'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MPacmtOrigin'
		 AND InfoBase.table_name = 'T_MP'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'MAFU Group Leader'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
----- cr_CRacmtOrigin
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Group Leader')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'cr_CRacmtOrigin' and infoBase.table_name = 'V_CR')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'cr_CRacmtOrigin' AND InfoBase.table_name = 'V_CR' AND T_USER_ROLE.name_role = 'MAFU Group Leader'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'cr_CRacmtOrigin'
		 AND InfoBase.table_name = 'V_CR'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'MAFU Group Leader'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
----- rfc_RFCacmtOrigin
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Group Leader')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'rfc_RFCacmtOrigin' and infoBase.table_name = 'V_RFC')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 1 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'rfc_RFCacmtOrigin' AND InfoBase.table_name = 'V_RFC' AND T_USER_ROLE.name_role = 'MAFU Group Leader'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'rfc_RFCacmtOrigin'
		 AND InfoBase.table_name = 'V_RFC'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'MAFU Group Leader'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
			
/*********************************************************************/
/******************** MAFU Reader *****************************/
/*********************************************************************/
----- MODsiteResponsible
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Reader')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MODsiteResponsible' and infoBase.table_name = 'T_MOD')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 0 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MODsiteResponsible' AND InfoBase.table_name = 'T_MOD' AND T_USER_ROLE.name_role = 'MAFU Reader'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MODsiteResponsible'
		 AND InfoBase.table_name = 'T_MOD'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'MAFU Reader'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
----- MPsiteResponsible
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Reader')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPsiteResponsible' and infoBase.table_name = 'T_MP')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 0 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MPsiteResponsible' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Reader'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MPsiteResponsible'
		 AND InfoBase.table_name = 'T_MP'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'MAFU Reader'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
----- MODacmtOrigin
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Reader')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MODacmtOrigin' and infoBase.table_name = 'T_MOD')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 0 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MODacmtOrigin' AND InfoBase.table_name = 'T_MOD' AND T_USER_ROLE.name_role = 'MAFU Reader'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MODacmtOrigin'
		 AND InfoBase.table_name = 'T_MOD'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'MAFU Reader'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
----- MPacmtOrigin
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Reader')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MPacmtOrigin' and infoBase.table_name = 'T_MP')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 0 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MPacmtOrigin' AND InfoBase.table_name = 'T_MP' AND T_USER_ROLE.name_role = 'MAFU Reader'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'MPacmtOrigin'
		 AND InfoBase.table_name = 'T_MP'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'MAFU Reader'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
----- cr_CRacmtOrigin
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Reader')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'cr_CRacmtOrigin' and infoBase.table_name = 'V_CR')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 0 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'cr_CRacmtOrigin' AND InfoBase.table_name = 'V_CR' AND T_USER_ROLE.name_role = 'MAFU Reader'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'cr_CRacmtOrigin'
		 AND InfoBase.table_name = 'V_CR'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'MAFU Reader'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
----- rfc_RFCacmtOrigin
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Reader')
		 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'rfc_RFCacmtOrigin' and infoBase.table_name = 'V_RFC')))
	begin
		-- add permission
		Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
		SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1, 0 FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'rfc_RFCacmtOrigin' AND InfoBase.table_name = 'V_RFC' AND T_USER_ROLE.name_role = 'MAFU Reader'
	end
	else
	begin
		-- update permission
		UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
		FROM InfoBase CROSS JOIN T_USER_ROLE 
		WHERE InfoBase.object_value = 'rfc_RFCacmtOrigin'
		 AND InfoBase.table_name = 'V_RFC'
		 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
		 AND T_USER_ROLE.name_role = 'MAFU Reader'
		 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	end
	