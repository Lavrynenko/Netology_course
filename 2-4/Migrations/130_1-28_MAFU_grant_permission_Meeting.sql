
/*********************************************************************/
/******************** MAFU CM Change Leader **********************************/
/*********************************************************************/
	----- meetName
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU CM Change Leader')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'meetName' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetName' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'MAFU CM Change Leader'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetName'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU CM Change Leader'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU CM Change Leader **********************************/
/*********************************************************************/
	----- meetDate
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU CM Change Leader')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'meetDate' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetDate' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'MAFU CM Change Leader'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetDate'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU CM Change Leader'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU CM Change Leader **********************************/
/*********************************************************************/
	----- MeetActions
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU CM Change Leader')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MeetActions' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetActions' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'MAFU CM Change Leader'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetActions'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU CM Change Leader'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU CM Change Leader **********************************/
/*********************************************************************/
	----- MeetComment
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU CM Change Leader')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MeetComment' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetComment' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'MAFU CM Change Leader'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetComment'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU CM Change Leader'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU IPT CM Group Leader **********************************/
/*********************************************************************/
	----- meetName
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU IPT CM Group Leader')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'meetName' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetName' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'MAFU IPT CM Group Leader'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetName'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU IPT CM Group Leader'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU IPT CM Group Leader **********************************/
/*********************************************************************/
	----- meetDate
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU IPT CM Group Leader')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'meetDate' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetDate' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'MAFU IPT CM Group Leader'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetDate'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU IPT CM Group Leader'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU IPT CM Group Leader **********************************/
/*********************************************************************/
	----- MeetActions
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU IPT CM Group Leader')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MeetActions' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetActions' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'MAFU IPT CM Group Leader'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetActions'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU IPT CM Group Leader'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU IPT CM Group Leader **********************************/
/*********************************************************************/
	----- MeetComment
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU IPT CM Group Leader')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MeetComment' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetComment' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'MAFU IPT CM Group Leader'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetComment'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU IPT CM Group Leader'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU PDT CM Group Leader **********************************/
/*********************************************************************/
	----- meetName
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU PDT CM Group Leader')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'meetName' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetName' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'MAFU PDT CM Group Leader'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetName'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU PDT CM Group Leader'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU PDT CM Group Leader **********************************/
/*********************************************************************/
	----- meetDate
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU PDT CM Group Leader')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'meetDate' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetDate' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'MAFU PDT CM Group Leader'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetDate'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU PDT CM Group Leader'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU PDT CM Group Leader **********************************/
/*********************************************************************/
	----- MeetActions
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU PDT CM Group Leader')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MeetActions' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetActions' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'MAFU PDT CM Group Leader'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetActions'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU PDT CM Group Leader'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU PDT CM Group Leader **********************************/
/*********************************************************************/
	----- MeetComment
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU PDT CM Group Leader')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MeetComment' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetComment' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'MAFU PDT CM Group Leader'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetComment'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU PDT CM Group Leader'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU PDT Operational Team **********************************/
/*********************************************************************/
	----- meetName
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU PDT Operational Team')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'meetName' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetName' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'MAFU PDT Operational Team'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetName'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU PDT Operational Team'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU PDT Operational Team **********************************/
/*********************************************************************/
	----- meetDate
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU PDT Operational Team')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'meetDate' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetDate' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'MAFU PDT Operational Team'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetDate'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU PDT Operational Team'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU PDT Operational Team **********************************/
/*********************************************************************/
	----- MeetActions
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU PDT Operational Team')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MeetActions' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetActions' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'MAFU PDT Operational Team'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetActions'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU PDT Operational Team'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU PDT Operational Team **********************************/
/*********************************************************************/
	----- MeetComment
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU PDT Operational Team')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MeetComment' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetComment' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'MAFU PDT Operational Team'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetComment'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU PDT Operational Team'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Common User **********************************/
/*********************************************************************/
	----- meetName
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Common User')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'meetName' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetName' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'MAFU Common User'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetName'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU Common User'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Common User **********************************/
/*********************************************************************/
	----- meetDate
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Common User')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'meetDate' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetDate' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'MAFU Common User'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetDate'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU Common User'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Common User **********************************/
/*********************************************************************/
	----- MeetActions
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Common User')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MeetActions' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetActions' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'MAFU Common User'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetActions'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU Common User'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Common User **********************************/
/*********************************************************************/
	----- MeetComment
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Common User')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MeetComment' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetComment' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'MAFU Common User'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetComment'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU Common User'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** MAFU Customisation Team **********************************/
/*********************************************************************/
	----- meetName
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'MAFU Customisation Team')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'meetName' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetName' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'MAFU Customisation Team'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetName'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'MAFU Customisation Team'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** Administrator **********************************/
/*********************************************************************/
	----- meetName
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'Administrator')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'meetName' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetName' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'Administrator'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetName'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'Administrator'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** Administrator **********************************/
/*********************************************************************/
	----- meetDate
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'Administrator')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'meetDate' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetDate' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'Administrator'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'meetDate'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'Administrator'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** Administrator **********************************/
/*********************************************************************/
	----- MeetActions
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'Administrator')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MeetActions' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetActions' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'Administrator'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetActions'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'Administrator'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end

/*********************************************************************/
/******************** Administrator **********************************/
/*********************************************************************/
	----- MeetComment
				if (not exists(select * 
					from T_PERMISSION_ACCESS_ATTRIBUTE 
					where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'Administrator')
					 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'MeetComment' and infoBase.table_name = 'T_MEETING')))
				begin
					-- add permission
					Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
					SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,1 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetComment' AND InfoBase.table_name = 'T_MEETING' AND T_USER_ROLE.name_role = 'Administrator'
				end
				else
				begin 		-- update permission
					UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 1
					FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'MeetComment'
					 AND InfoBase.table_name = 'T_MEETING'
					 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
					 AND T_USER_ROLE.name_role = 'Administrator'
					 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role  end
