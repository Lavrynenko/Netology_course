											--------------------------------------------
											-- DELETE/UPDATE RIGHTS ACCESS ATTRIBUTES --
											--------------------------------------------

-- Declare variable
DECLARE @Table_name varchar(255),
	@Attribute varchar(255),
	@Attribute_Name varchar(255),
	@Role varchar(255),
	@User_Name varchar(255),
	@User_id varchar(255),
	@Infobase_id varchar(255)


-------------------------------------------------------------
-- DELETE ATTRIBUTE : ID => ELCOPSE130-SD-ReplaceState-010 --
-------------------------------------------------------------
-- Init variable
SET @Table_Name='R_FIN_DS'
SET @Attribute='SVStatus'
SET @Attribute_Name='State'
SET @User_Name='EPC Consult'

--Delete permission
DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE 
WHERE idr_infobase IN (SELECT id_infobase 
			FROM infobase 
			WHERE object_name = @Attribute_Name 
			AND object_value = @Attribute 
			AND table_name=@Table_name) 
AND idr_user_role IN (SELECT id_role FROM T_USER_ROLE WHERE name_role=@User_Name)


--------------------------
-- ADD ATTRIBUT RIGHTS  --
--------------------------
-- Init variabbe
SET @User_id=(SELECT id_role FROM T_USER_ROLE WHERE name_role=@User_Name)
SET @Infobase_id=(SELECT id_infobase FROM infobase 
				WHERE object_name = @Attribute_Name	AND object_value = 'SystemViewStatus' AND table_name=@Table_name)

-- Add permission			
if NOT EXISTS (SELECT idr_infobase 
				FROM T_PERMISSION_ACCESS_ATTRIBUTE 
				WHERE idr_infobase=@Infobase_id AND idr_user_role=@User_id)
BEGIN
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE(idr_user_role, idr_infobase, read_mode, write_mode,fast_search) 
	VALUES (@User_id,@Infobase_id,1,0,0)
END