DECLARE @roles varchar(1000)
DECLARE @_table varchar(1000)
DECLARE @_read bit
DECLARE @_write bit
DECLARE @_group varchar(1000)
DECLARE @refAttribute varchar(1000)
DECLARE @attr varchar(1000)

--------------------------------------------------------------
-- Group Military Specific : read mode for Common User
--------------------------------------------------------------
print('Group : Software Data'+char(13)+char(10));		

set @roles = 'Common User'
set @_table = 'R_FIN_CI'
set @_read = 1
set @_write = 0
set @_group = '%Software Data%'

DECLARE attribute CURSOR FOR 
select object_value from infobase where table_name = @_table and idr_group  in (
				SELECT     
					id_attr_group
                            	FROM          
					T_ATTR_GROUP
                            	WHERE      
					(label LIKE @_group))
					 
OPEN attribute
FETCH NEXT FROM attribute INTO
    @attr					

WHILE @@FETCH_STATUS = 0
BEGIN 
if( not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = @roles)
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = @attr)))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, @_read, @_write FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @attr AND InfoBase.table_name = @_table AND T_USER_ROLE.name_role = @roles
	print(@attr+' : attribute added'+char(13)+char(10));
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = @_read, write_mode = @_write
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @attr
	 AND InfoBase.table_name = @_table
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = @roles
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	 print(@attr+' : attribute modified'+char(13)+char(10));
end
 
FETCH NEXT FROM attribute INTO
    @attr
    
END 

CLOSE attribute
DEALLOCATE attribute

print(char(13)+char(10)+char(13)+char(10));		

--------------------------------------------------------------
-- Group Military Specific : read mode for Common User
--------------------------------------------------------------
print('Group : Military Specific'+char(13)+char(10));	

set @roles = 'Common User'
set @_table = 'R_FIN_CI'
set @_read = 1
set @_write = 0
set @_group = '%Military Specific%'

DECLARE attribute CURSOR FOR 
select object_value from infobase where table_name = @_table and idr_group  in (
				SELECT     
					id_attr_group
                            	FROM          
					T_ATTR_GROUP
                            	WHERE      
					(label LIKE @_group))

OPEN attribute
FETCH NEXT FROM attribute INTO
    @attr					

WHILE @@FETCH_STATUS = 0
BEGIN 
if( not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = @roles)
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = @attr)))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, @_read, @_write FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @attr AND InfoBase.table_name = @_table AND T_USER_ROLE.name_role = @roles
	print(@attr+' : attribute added'+char(13)+char(10));
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = @_read, write_mode = @_write
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @attr
	 AND InfoBase.table_name = @_table
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = @roles
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	 print(@attr+' : attribute modified'+char(13)+char(10));
end
 
FETCH NEXT FROM attribute INTO
    @attr
    
END 

CLOSE attribute
DEALLOCATE attribute

print(char(13)+char(10)+char(13)+char(10));

-----------------------------------------------------------------------
-- Attribute  PS FINCI Reference : read mode for Common User
-----------------------------------------------------------------------

print('Attribute : PS FINCI Reference'+char(13)+char(10));	

set @roles = 'Common User'
set @_table = 'R_FIN_CI'
set @_read = 1
set @_write = 0
set @refAttribute = 'fin_ci_sv'

if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = @roles)
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = @refAttribute and infoBase.table_name = @_table)))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, @_read, @_write FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @refAttribute AND InfoBase.table_name = @_table AND T_USER_ROLE.name_role = @roles
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = @_read, write_mode = @_write
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @refAttribute
	 AND InfoBase.table_name = @_table
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = @roles
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
end

print(char(13)+char(10)+char(13)+char(10));


-----------------------------------------------------------------------
-- Attribute  Description : read mode for Common User
-----------------------------------------------------------------------

print('Attribute : Description'+char(13)+char(10));	

set @roles = 'Common User'
set @_table = 'R_FIN_DS'
set @_read = 1
set @_write = 0
set @refAttribute = 'FinDsDescription'

if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = @roles)
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = @refAttribute and infoBase.table_name = @_table)))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, @_read, @_write FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @refAttribute AND InfoBase.table_name = @_table AND T_USER_ROLE.name_role = @roles
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = @_read, write_mode = @_write
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @refAttribute
	 AND InfoBase.table_name = @_table
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = @roles
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
end

print(char(13)+char(10)+char(13)+char(10));



-----------------------------------------------------------------------
-- Attribute  Type of DS : read mode for Common User
-----------------------------------------------------------------------

print('Attribute : Type of DS'+char(13)+char(10));	

set @roles = 'Common User'
set @_table = 'R_FIN_DS'
set @_read = 1
set @_write = 0
set @refAttribute = 'ds_type'

if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = @roles)
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = @refAttribute and infoBase.table_name = @_table)))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, @_read, @_write FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @refAttribute AND InfoBase.table_name = @_table AND T_USER_ROLE.name_role = @roles
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = @_read, write_mode = @_write
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @refAttribute
	 AND InfoBase.table_name = @_table
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = @roles
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
end

print(char(13)+char(10)+char(13)+char(10));



-----------------------------------------------------------------------
-- Attribute  SW Loading Type : read mode for Common User
-----------------------------------------------------------------------

print('Attribute : SW Loading Type'+char(13)+char(10));	

set @roles = 'Common User'
set @_table = 'R_FIN_DS'
set @_read = 1
set @_write = 0
set @refAttribute = 'FinDsSWLoadingType'

if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = @roles)
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = @refAttribute and infoBase.table_name = @_table)))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, @_read, @_write FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @refAttribute AND InfoBase.table_name = @_table AND T_USER_ROLE.name_role = @roles
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = @_read, write_mode = @_write
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @refAttribute
	 AND InfoBase.table_name = @_table
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = @roles
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
end

print(char(13)+char(10)+char(13)+char(10));



-----------------------------------------------------------------------
-- Attribute  Team : read mode for Common User
-----------------------------------------------------------------------

Print('Attribute : Team , NOT FOUND'+char(13)+char(10))


-----------------------------------------------------------------------
-- Attribute  PS FIN DS Reference : read mode for Common User
-----------------------------------------------------------------------

print('Attribute : PS FIN DS Reference'+char(13)+char(10));	

set @roles = 'Common User'
set @_table = 'R_FIN_DS'
set @_read = 1
set @_write = 0
set @refAttribute = 'fin_ds_sv'

if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = @roles)
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = @refAttribute and infoBase.table_name = @_table)))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, @_read, @_write FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @refAttribute AND InfoBase.table_name = @_table AND T_USER_ROLE.name_role = @roles
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = @_read, write_mode = @_write
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @refAttribute
	 AND InfoBase.table_name = @_table
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = @roles
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
end

print(char(13)+char(10)+char(13)+char(10));



-----------------------------------------------------------------------
-- Attribute  Modele Required : read mode for Common User
-----------------------------------------------------------------------

print('Attribute : Modele Required'+char(13)+char(10));	

set @roles = 'Common User'
set @_table = 'R_EQUIPMENT'
set @_read = 1
set @_write = 0
set @refAttribute = 'ModelRequired'

if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = @roles)
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = @refAttribute and infoBase.table_name = @_table)))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, @_read, @_write FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @refAttribute AND InfoBase.table_name = @_table AND T_USER_ROLE.name_role = @roles
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = @_read, write_mode = @_write
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @refAttribute
	 AND InfoBase.table_name = @_table
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = @roles
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
end

print(char(13)+char(10)+char(13)+char(10));



-----------------------------------------------------------------------
-- Attribute  Team : read mode for Common User
-----------------------------------------------------------------------

Print('Attribute : Team , NOT FOUND'+char(13)+char(10))


-----------------------------------------------------------------------
-- Attribute  Modele Required : read mode for Common User
-----------------------------------------------------------------------

print('Attribute : Modele Required'+char(13)+char(10));	

set @roles = 'Common User'
set @_table = 'R_EQUIPMENT'
set @_read = 1
set @_write = 0
set @refAttribute = 'ModelRequired'

if (not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = @roles)
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = @refAttribute and infoBase.table_name = @_table)))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, @_read, @_write FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @refAttribute AND InfoBase.table_name = @_table AND T_USER_ROLE.name_role = @roles
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = @_read, write_mode = @_write
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @refAttribute
	 AND InfoBase.table_name = @_table
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = @roles
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
end

print(char(13)+char(10)+char(13)+char(10));


-------------------------------------------------------------------------------------------------
-- SUPPRESSION D'ATTRIBUT : "Software Uploading Type" de la table EQUIPMENT
-------------------------------------------------------------------------------------------------
set @_table = 'R_EQUIPMENT'
set @refAttribute = 'SoftwareUploadingType'

print('Delete of Software Uploading Type Attribute'+char(13)+char(10));

-- suppression des droits pour tous les roles
DELETE 
from 
	T_PERMISSION_ACCESS_ATTRIBUTE 
where 
	idr_infobase in (
		select 
			id_infobase 
		from 
			Infobase 
		where 
			object_value = @refAttribute 
			and table_name = @_table)
-- suppression dans infobase
DELETE FROM infobase WHERE table_name = @_table AND object_value = @refAttribute
-- suppression de l'attribut dans la table
--print ('ALTER TABLE '+ @_table +' DROP COLUMN '+ @refAttribute)

print(char(13)+char(10)+char(13)+char(10));

----------------------------------------------------------------------------------
-- SUPPRESSION D'ATTRIBUT : "FLS Domain" de la table EQUIPMENT
----------------------------------------------------------------------------------
set @_table = 'R_EQUIPMENT'
set @refAttribute = 'FLSDomain'

print('Delete of FLS Domain Attribute'+char(13)+char(10));

-- suppression des droits pour tous les roles
DELETE 
from 
	T_PERMISSION_ACCESS_ATTRIBUTE 
where 
	idr_infobase in (
		select 
			id_infobase 
		from 
			Infobase 
		where 
			object_value = @refAttribute 
			and table_name = @_table)
-- suppression dans infobase
DELETE FROM infobase WHERE table_name = @_table AND object_value = @refAttribute
-- suppression de l'attribut dans la table
--print ('ALTER TABLE '+ @_table +' DROP COLUMN '+ @refAttribute)

print(char(13)+char(10)+char(13)+char(10));

---------------------------------------------------------------------------------------------------------
-- SUPPRESSION D'ATTRIBUT : "FLS User Modification Capacity" de la table EQUIPMENT
---------------------------------------------------------------------------------------------------------
set @_table = 'R_EQUIPMENT'
set @refAttribute = 'FLSUserModificationCapacity'

print('FLS User Modification Capacity'+char(13)+char(10));

-- suppression des droits pour tous les roles
DELETE 
from 
	T_PERMISSION_ACCESS_ATTRIBUTE 
where 
	idr_infobase in (
		select 
			id_infobase 
		from 
			Infobase 
		where 
			object_value = @refAttribute 
			and table_name = @_table)
-- suppression dans infobase
DELETE FROM infobase WHERE table_name = @_table AND object_value = @refAttribute
-- suppression de l'attribut dans la table
--print ('ALTER TABLE '+ @_table +' DROP COLUMN '+ @refAttribute)

print(char(13)+char(10)+char(13)+char(10));

--------------------------------------------------------------
-- Group Military Specific : read mode for Common User
--------------------------------------------------------------
print('Group : Military Specific'+char(13)+char(10));	

set @roles = 'Common User'
set @_table = 'R_EQUIPMENT'
set @_read = 1
set @_write = 0
set @_group = '%Military Specific%'

DECLARE attribute CURSOR FOR 
select object_value from infobase where table_name = @_table and idr_group  in (
				SELECT     
					id_attr_group
                            	FROM          
					T_ATTR_GROUP
                            	WHERE      
					(label LIKE @_group))

OPEN attribute
FETCH NEXT FROM attribute INTO
    @attr					

WHILE @@FETCH_STATUS = 0
BEGIN 
if( not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = @roles)
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = @attr)))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, @_read, @_write FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @attr AND InfoBase.table_name = @_table AND T_USER_ROLE.name_role = @roles
	print(@attr+' : attribute added'+char(13)+char(10));
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = @_read, write_mode = @_write
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @attr
	 AND InfoBase.table_name = @_table
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = @roles
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	 print(@attr+' : attribute modified'+char(13)+char(10));
end
 
FETCH NEXT FROM attribute INTO
    @attr
    
END 

CLOSE attribute
DEALLOCATE attribute

print(char(13)+char(10)+char(13)+char(10));	


--------------------------------------------------------------
-- Group Software Data : read mode for Common User
--------------------------------------------------------------
print('Group : Software Data'+char(13)+char(10));	

set @roles = 'Common User'
set @_table = 'R_EQUIPMENT'
set @_read = 1
set @_write = 0
set @_group = '%Software Data%'

DECLARE attribute CURSOR FOR 
select object_value from infobase where table_name = @_table and idr_group  in (
				SELECT     
					id_attr_group
                            	FROM          
					T_ATTR_GROUP
                            	WHERE      
					(label LIKE @_group))

OPEN attribute
FETCH NEXT FROM attribute INTO
    @attr					

WHILE @@FETCH_STATUS = 0
BEGIN 
if( not exists(select * 
	from T_PERMISSION_ACCESS_ATTRIBUTE 
	where idr_user_role = (select id_role from T_USER_ROLE where name_role = @roles)
	 and idr_infobase = (select id_infobase from infobase where infoBase.object_value = @attr)))
begin
	-- add permission
	Insert into T_PERMISSION_ACCESS_ATTRIBUTE ( idr_user_role, idr_infobase, read_mode, write_mode)
	SELECT DISTINCT T_USER_ROLE.id_role, InfoBase.id_infobase, @_read, @_write FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @attr AND InfoBase.table_name = @_table AND T_USER_ROLE.name_role = @roles
	print(@attr+' : attribute added'+char(13)+char(10));
end
else
begin
	-- update permission
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE set read_mode = @_read, write_mode = @_write
	FROM InfoBase CROSS JOIN T_USER_ROLE 
	WHERE InfoBase.object_value = @attr
	 AND InfoBase.table_name = @_table
	 AND InfoBase.id_infobase = T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase
	 AND T_USER_ROLE.name_role = @roles
	 AND T_USER_ROLE.id_role = T_PERMISSION_ACCESS_ATTRIBUTE.idr_user_role
	 print(@attr+' : attribute modified'+char(13)+char(10));
end
 
FETCH NEXT FROM attribute INTO
    @attr
    
END 

CLOSE attribute
DEALLOCATE attribute

print(char(13)+char(10)+char(13)+char(10));