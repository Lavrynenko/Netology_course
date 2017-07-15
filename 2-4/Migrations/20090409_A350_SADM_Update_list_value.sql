DECLARE @Table_Name varchar(255),
	@Attribute_Name varchar(255),
	@Attribute varchar(255),
	@ListValues varchar(255)

--------------------------------------------------------------------
-- UPDATE ATTRIBUTES PROPERTIES: SADM (Associated Program SIGLUM) (incident: 4163759)
--------------------------------------------------------------------	
SET @Table_Name='T_SIRD'
SET @Attribute_Name='Associated Program SIGLUM'
SET @Attribute='SIRDAssociatedProgramSiglum'
SET @ListValues=';;KEL;KEC;KYK;KYL;KYA;KYT;KYC;KYM;KYZ;KYB;KYU;KCB;KCY;KLY'

UPDATE InfoBase
SET list_val=@ListValues
WHERE id_infobase IN (SELECT id_infobase 
			FROM infobase 
			WHERE object_name = @Attribute_Name 
			AND object_value = @Attribute 
			AND table_name=@Table_name) 