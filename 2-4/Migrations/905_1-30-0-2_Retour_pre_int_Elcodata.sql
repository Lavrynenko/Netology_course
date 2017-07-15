------------- Changement de type d'un champ (surcharge)---------------------------------------
UPDATE
	infobase
SET
	type_val='int'
WHERE 
	object_value in ('LoadGroup2',
			'LoadGroup3',
			'LoadGroup4')
	and table_name='r_fin_ds'
	
	
	
	
-------------------- suppression d'un champs à l'écran ----------------------------------------	
DECLARE @Table_Name varchar(50)
DECLARE @Attribute varchar(50)
DECLARE @Attribute_Name varchar(50)
DECLARE @Role varchar(50)
---------------------------- ROLE : EPC ATA24 -------------------
-- Init variable
SET @Table_Name='R_FIN_DS'
SET @Attribute='DefaultValueStatus'
SET @Attribute_Name='P/CD Startup Default'
SET @Role='EPC ATA24'

--Delete permission
DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE 
WHERE idr_infobase IN (SELECT id_infobase 
			FROM infobase 
			WHERE object_name = @Attribute_Name 
			AND object_value = @Attribute 
			AND table_name=@Table_name) 
AND idr_user_role IN (SELECT id_role
			FROM T_USER_ROLE
			WHERE name_role = @Role)


---------------------------- ROLE : EPC super admin -------------------
-- Init variable
SET @Table_Name='R_FIN_DS'
SET @Attribute='DefaultValueStatus'
SET @Attribute_Name='P/CD Startup Default'
SET @Role='EPC Super Admin'

--Delete permission
DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE 
WHERE idr_infobase IN (SELECT id_infobase 
			FROM infobase 
			WHERE object_name = @Attribute_Name 
			AND object_value = @Attribute 
			AND table_name=@Table_name) 
AND idr_user_role IN (SELECT id_role
			FROM T_USER_ROLE
			WHERE name_role = @Role)
			
			
DELETE FROM
	T_MG
WHERE
	object_name = 'P/CD Startup Default'
	
------------------Rajout des droits en lecture -----------------------------------------
if not exists(select *
from infobase
inner join t_permission_access_attribute on idr_infobase=id_infobase
inner join t_user_role on idr_user_role=id_role
where object_value='DelayValueStatus'
	and table_name='r_fin_ds'
and name_role='EPC Consult')
BEGIN
	insert into 
		t_permission_access_attribute (
				read_mode,
				write_mode,
				idr_user_role,
				idr_infobase
		)
	select
		1,
		0,
		id_role,
		id_infobase 
	from
		infobase,
		t_user_role
	where
		object_value='DelayValueStatus'
		and table_name='r_fin_ds'
		and name_role='EPC Consult'
END
		
