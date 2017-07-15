UPDATE Infobase
SET idr_group = 
	(SELECT
		id_attr_group 
	FROM
		T_ATTR_GROUP 
		INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_attr_group=T_ATTR_GROUP.id_attr_group
		INNER JOIN T_OBJECT ON T_OBJECT.id_object=T_LINK_ATTRGROUP_OBJECT.idr_object
	WHERE 
		T_ATTR_GROUP.label='MAIN' 
		AND T_OBJECT.label='Equipment') 
FROM
	Infobase as Infobase
WHERE Infobase.object_value='ForGroundUseOnly' 

UPDATE Infobase 
SET idr_group = NULL
WHERE Infobase.object_value='EquipGroupUseOnly' 


DELETE 
	T_PERMISSION_ACCESS_ATTRIBUTE
FROM
	T_PERMISSION_ACCESS_ATTRIBUTE
	JOIN Infobase ON Infobase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
WHERE
	Infobase.object_value = 'ForGroundUseOnly'
	OR Infobase.object_value = 'EquipGroupUseOnly'
	
	
		
-- add permission
Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'ForGroundUseOnly'  AND T_USER_ROLE.name_role = 'Common User'
					
Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'ForGroundUseOnly'  AND T_USER_ROLE.name_role = 'Administrator'
					
Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
					WHERE InfoBase.object_value = 'EquipGroupUseOnly'  AND T_USER_ROLE.name_role = 'Administrator'
					


UPDATE Infobase
SET idr_group = 
	(SELECT
		id_attr_group 
	FROM
		T_ATTR_GROUP 
		INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_attr_group=T_ATTR_GROUP.id_attr_group
		INNER JOIN T_OBJECT ON T_OBJECT.id_object=T_LINK_ATTRGROUP_OBJECT.idr_object
	WHERE 
		T_ATTR_GROUP.label='MAIN' 
		AND T_OBJECT.label='Equipment') 
FROM
	Infobase as Infobase
WHERE Infobase.object_value='Standard' 

UPDATE Infobase 
SET idr_group = NULL
WHERE Infobase.object_value='EquipStandard' 


DELETE 
	T_PERMISSION_ACCESS_ATTRIBUTE
FROM
	T_PERMISSION_ACCESS_ATTRIBUTE
	JOIN Infobase ON Infobase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
WHERE
	Infobase.object_value = 'EquipStandard'
	OR Infobase.object_value = 'Standard'					
					
if (not exists(select * 
			from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = 'Common User')
		and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'Standard' and infoBase.table_name = 'R_equipment')))	
		begin
			-- add permission
			Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
			SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, 1,0 FROM InfoBase CROSS JOIN T_USER_ROLE 
			WHERE InfoBase.object_value = 'Standard' AND InfoBase.table_name = 'R_equipment' AND T_USER_ROLE.name_role = 'Common User'
		end
		else
		begin
			-- update permission
			UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = 1, write_mode = 0	
			WHERE idr_user_role = (select id_role from T_USER_ROLE where name_role = 'Common User')
				and idr_infobase = (select id_infobase from infobase where infoBase.object_value = 'Standard' and infoBase.table_name = 'R_equipment')	
		end