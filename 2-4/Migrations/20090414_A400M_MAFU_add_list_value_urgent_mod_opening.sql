DECLARE @Table_Name varchar(255),
	@Attribute_Name varchar(255),
	@Attribute varchar(255),
	@ListValues varchar(255)

--------------------------------------------------------------------
-- UPDATE ATTRIBUTES PROPERTIES: MAFU (Urgent MOD opening) (incident: 4193245)
--------------------------------------------------------------------	
SET @Table_Name='T_MP'
SET @Attribute_Name='Urgent MOD opening'
SET @Attribute='UProcMP'
SET @ListValues='Yes;No;Signed'

UPDATE InfoBase
SET list_val=@ListValues
WHERE id_infobase IN (SELECT id_infobase 
			FROM infobase 
			WHERE object_name = @Attribute_Name 
			AND object_value = @Attribute 
			AND table_name=@Table_name) 