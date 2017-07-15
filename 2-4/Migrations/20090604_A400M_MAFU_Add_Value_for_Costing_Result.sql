DECLARE @Table_Name varchar(255),
	@Attribute_Name varchar(255),
	@Attribute varchar(255),
	@ListValues varchar(255)

--------------------------------------------------------------------
-- UPDATE ATTRIBUTES PROPERTIES: MAFU (Costing Result) (incident: 4247599)
--------------------------------------------------------------------	
SET @Table_Name='V_CR'
SET @Attribute_Name='Costing Result'
SET @Attribute='cr_CESResults'
SET @ListValues='High;Low;Not needed;Pending'

UPDATE InfoBase
SET list_val=@ListValues
WHERE id_infobase IN (SELECT id_infobase 
			FROM infobase 
			WHERE object_name = @Attribute_Name 
			AND object_value = @Attribute 
			AND table_name=@Table_name) 