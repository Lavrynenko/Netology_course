											-----------------------
											-- DELETE ATTRIBUTES --
											-----------------------

-- Declare variable
	DECLARE @Table_name varchar(255),
	@Attribute varchar(255),
	@Attribute_Name varchar(255)


---------------------------------------------------------
-- DELETE ATTRIBUTE : ELCOPSE128-SD-ELAattributes-010 ---
---------------------------------------------------------


-- Init variable
SET @Table_Name='V_ELA'
SET @Attribute='TEFO_High_Speed_Max'
SET @Attribute_Name='TEFO High Speed Max (%)'

--Delete permission
DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE 
WHERE idr_infobase IN (SELECT id_infobase 
			FROM infobase 
			WHERE object_name = @Attribute_Name 
			AND object_value = @Attribute 
			AND table_name=@Table_name) 

			
			
-- Init variable
SET @Table_Name='V_ELA'
SET @Attribute='TEFO_HighSpeed_Operational'
SET @Attribute_Name='TEFO High Speed Operational (%)'

--Delete permission
DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE 
WHERE idr_infobase IN (SELECT id_infobase 
			FROM infobase 
			WHERE object_name = @Attribute_Name 
			AND object_value = @Attribute 
			AND table_name=@Table_name) 
			
			
-- Init variable
SET @Table_Name='V_ELA'
SET @Attribute='TEFO_LowSpeed_max'
SET @Attribute_Name='TEFO Low Speed Max (%)'

--Delete permission
DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE 
WHERE idr_infobase IN (SELECT id_infobase 
			FROM infobase 
			WHERE object_name = @Attribute_Name 
			AND object_value = @Attribute 
			AND table_name=@Table_name) 
			
			
-- Init variable
SET @Table_Name='V_ELA'
SET @Attribute='TEFO_LowSpeed_Operational'
SET @Attribute_Name='TEFO Low Speed Operational (%)'

--Delete permission
DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE 
WHERE idr_infobase IN (SELECT id_infobase 
			FROM infobase 
			WHERE object_name = @Attribute_Name 
			AND object_value = @Attribute 
			AND table_name=@Table_name) 