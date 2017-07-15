
/*********************************************************************/
/******************** MAFU Common User **********************************/
/*********************************************************************/
	----- rfcEA_expression
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Common User')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'rfcEA_expression' and infoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_expression' AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY' AND T_USER_ROLE.name_role = 'MAFU Common User'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_expression'
					 AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU Common User'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Common User **********************************/
/*********************************************************************/
	----- rfcEA_addOn
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Common User')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'rfcEA_addOn' and infoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_addOn' AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY' AND T_USER_ROLE.name_role = 'MAFU Common User'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_addOn'
					 AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU Common User'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Common User **********************************/
/*********************************************************************/
	----- rfcEA_MSN
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Common User')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'rfcEA_MSN' and infoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_MSN' AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY' AND T_USER_ROLE.name_role = 'MAFU Common User'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_MSN'
					 AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU Common User'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Common User **********************************/
/*********************************************************************/
	----- rfcEA_std
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Common User')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'rfcEA_std' and infoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_std' AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY' AND T_USER_ROLE.name_role = 'MAFU Common User'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_std'
					 AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU Common User'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Common User **********************************/
/*********************************************************************/
	----- rfcEA_indStd
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Common User')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'rfcEA_indStd' and infoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_indStd' AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY' AND T_USER_ROLE.name_role = 'MAFU Common User'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_indStd'
					 AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU Common User'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Common User **********************************/
/*********************************************************************/
	----- rfcEA_version
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Common User')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'rfcEA_version' and infoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_version' AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY' AND T_USER_ROLE.name_role = 'MAFU Common User'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_version'
					 AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU Common User'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Common User **********************************/
/*********************************************************************/
	----- rfcEA_rank
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Common User')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'rfcEA_rank' and infoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_rank' AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY' AND T_USER_ROLE.name_role = 'MAFU Common User'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_rank'
					 AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU Common User'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Common User **********************************/
/*********************************************************************/
	----- rfcEA_model
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Common User')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'rfcEA_model' and infoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_model' AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY' AND T_USER_ROLE.name_role = 'MAFU Common User'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_model'
					 AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU Common User'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Common User **********************************/
/*********************************************************************/
	----- rfcEA_prodRank
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Common User')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'rfcEA_prodRank' and infoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_prodRank' AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY' AND T_USER_ROLE.name_role = 'MAFU Common User'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_prodRank'
					 AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU Common User'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Common User **********************************/
/*********************************************************************/
	----- rfcEA_contractualAC
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Common User')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'rfcEA_contractualAC' and infoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_contractualAC' AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY' AND T_USER_ROLE.name_role = 'MAFU Common User'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_contractualAC'
					 AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU Common User'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Common User **********************************/
/*********************************************************************/
	----- rfcEA_fleet
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Common User')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'rfcEA_fleet' and infoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_fleet' AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY' AND T_USER_ROLE.name_role = 'MAFU Common User'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_fleet'
					 AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU Common User'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Common User **********************************/
/*********************************************************************/
	----- rfcEA_condition
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Common User')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'rfcEA_condition' and infoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_condition' AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY' AND T_USER_ROLE.name_role = 'MAFU Common User'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_condition'
					 AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU Common User'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Common User **********************************/
/*********************************************************************/
	----- rfcEA_exception
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Common User')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'rfcEA_exception' and infoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_exception' AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY' AND T_USER_ROLE.name_role = 'MAFU Common User'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'rfcEA_exception'
					 AND InfoBase.table_name = 'V_RFC_EXPECTED_APPLICABILITY'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU Common User'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end
