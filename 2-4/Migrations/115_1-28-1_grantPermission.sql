----- cr_Prerequisite_File
if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU CM Change Leader')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'cr_Prerequisite_File' and infoBase.table_name = 'V_CR')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'cr_Prerequisite_File' AND InfoBase.table_name = 'V_CR' AND T_USER_ROLE.name_role = 'MAFU CM Change Leader'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'cr_Prerequisite_File'
					 AND InfoBase.table_name = 'V_CR'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU CM Change Leader'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end
					 
if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU IPT CM Group Leader')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'cr_Prerequisite_File' and infoBase.table_name = 'V_CR')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'cr_Prerequisite_File' AND InfoBase.table_name = 'V_CR' AND T_USER_ROLE.name_role = 'MAFU IPT CM Group Leader'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'cr_Prerequisite_File'
					 AND InfoBase.table_name = 'V_CR'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU IPT CM Group Leader'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end
					 
if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU PDT CM Group Leader')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'cr_Prerequisite_File' and infoBase.table_name = 'V_CR')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'cr_Prerequisite_File' AND InfoBase.table_name = 'V_CR' AND T_USER_ROLE.name_role = 'MAFU PDT CM Group Leader'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'cr_Prerequisite_File'
					 AND InfoBase.table_name = 'V_CR'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU PDT CM Group Leader'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end
					 
if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'Administrator')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'cr_Prerequisite_File' and infoBase.table_name = 'V_CR')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'cr_Prerequisite_File' AND InfoBase.table_name = 'V_CR' AND T_USER_ROLE.name_role = 'Administrator'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'cr_Prerequisite_File'
					 AND InfoBase.table_name = 'V_CR'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'Administrator'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end