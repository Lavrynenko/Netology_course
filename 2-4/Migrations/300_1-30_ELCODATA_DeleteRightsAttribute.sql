											-----------------------
											-- DELETE ATTRIBUTES --
											-----------------------

-- Declare variable
DECLARE @Table_name varchar(255),
	@Attribute varchar(255),
	@Attribute_Name varchar(255),
	@Role varchar(255)


-----------------------------------------------------------------
-- DELETE ATTRIBUTE : ID => ELCOPSE130-SD-DeleteAttributes-010 --
-----------------------------------------------------------------

---------------------------- ROLE : EPC ATAXX -------------------
-- Init variable
SET @Table_Name='R_FIN_DS'
SET @Attribute='DefaultValueStatus'
SET @Attribute_Name='P/CD Startup Default'
SET @Role='EPC ATAXX'

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


---------------------------- ROLE : EPC Consult -------------------
-- Init variable
SET @Table_Name='R_FIN_DS'
SET @Attribute='DefaultValueStatus'
SET @Attribute_Name='P/CD Startup Default'
SET @Role='EPC Consult'

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