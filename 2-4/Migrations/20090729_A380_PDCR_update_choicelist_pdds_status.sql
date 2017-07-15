DECLARE @Table_Name varchar(255),
	@Attribute_Name varchar(255),
	@Attribute varchar(255),
	@ListValues varchar(255)

--------------------------------------------------------------------
-- UPDATE ATTRIBUTES PROPERTIES: PDCR (pdds_status) (incident: 4417445)
--------------------------------------------------------------------	
SET @Table_Name='T_PDDS'
SET @Attribute_Name='Status'
SET @Attribute='pdds_status'
SET @ListValues='NOT VALIDATED;PPD, for information only;VALIDATED BY PD LOCAL MANAGER;INTERFACE REQUESTED;INTERFACE DEFINED;PENDING CIN STACK CLEANING'

UPDATE InfoBase
SET list_val=@ListValues
WHERE id_infobase IN (SELECT id_infobase 
			FROM infobase 
			WHERE object_name = @Attribute_Name 
			AND object_value = @Attribute 
			AND table_name=@Table_name) 