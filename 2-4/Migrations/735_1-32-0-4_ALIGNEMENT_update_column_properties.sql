---------------------------------------------------------------------------------------
-- CREATION OF ATTRIBUTES:
-- - FINDS_Maturity							(R_FIN_DS)
-- - FINCI_SeriesNumberMandatory			(R_FIN_CI)
-- - FINCI_DMURelevant						(R_FIN_CI)
-- - FINCI_ElectricalConsumer				(R_FIN_CI)
-- - Equipment_SeriesNumber					(R_Equipment)
-- - Equipment_EquipementAssemblyType		(R_Equipment)
-- - SI_MAPOfficeDomain						(T_SI)
-- - SI_MainCACode							(T_SI)
-- - SI_GoodForFlight						(T_SI)
-- - SI_GroundTestOnly						(T_SI)
-- - SI_OperationalLimitation				(T_SI)
-- - SI_MaintenanceLimitation				(T_SI)
-- - SI_Origin								(T_SI)
-- - SI_IssueModification					(T_SI)
-- - SI_ReTestRequired						(T_SI)
-- - SI_MEODL								(T_SI)
-- - SI_OMEOL								(T_SI)
-- - SI_DiffusionComment					(T_SI)
-- - SI_ProcurementOffice					(T_SI)
-- - SI_Supplier							(T_SI)
-- - SI_InstructionForProvisionning			(T_SI)
-- - SI_AttachedFiles						(T_SI)
---------------------------------------------------------------------------------------

DECLARE @id_attr_group INT
DECLARE @tableName VARCHAR (50)
DECLARE @objectValue VARCHAR (50)
DECLARE @objectName VARCHAR (50)
DECLARE @fieldType VARCHAR (50)
DECLARE @objectOrder INT
DECLARE @type_search VARCHAR (50)
DECLARE @type_edit VARCHAR (50)
DECLARE @reduced_view VARCHAR (50)
DECLARE @type_val VARCHAR (50)
DECLARE @list_val VARCHAR (500)
DECLARE @link_page VARCHAR (50)
DECLARE @link_val VARCHAR (50)
DECLARE @object_infos VARCHAR (50)
DECLARE @info_ext VARCHAR (50)
DECLARE @linked_page VARCHAR (50)
DECLARE @repository VARCHAR (50)
DECLARE @mandatory VARCHAR (50)

DECLARE @groupLabel VARCHAR (50)
DECLARE @objectLabel VARCHAR (50)

DECLARE @sql nvarchar(4000)

----------------------------------------------------------------------------------------------------------------------------
-- --==================================================================================================================-- --
----------------------------------------------------------------------------------------------------------------------------
SET @sql 			= NULL
SET @id_attr_group 	= NULL
SET @tableName 		= 'R_FIN_DS'
SET @objectValue 	= 'FINDS_Maturity'
SET @objectName 	= 'Maturity'
SET @fieldType	 	= 'VARCHAR (10)'

-- Add the new attribute in table @tableName
IF(NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name = @tableName	AND column_name = @objectValue))
	BEGIN
		SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
		EXEC sp_executesql @sql
	END
ELSE
BEGIN
	SET @sql = 'ALTER TABLE  ' + @tableName + ' DROP COLUMN ' + @objectValue
	EXEC sp_executesql @sql
	SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
	EXEC sp_executesql @sql
END

----------------------------------------------------------------------------------------------------------------------------
-- --==================================================================================================================-- --
----------------------------------------------------------------------------------------------------------------------------
SET @sql 			= NULL
SET @id_attr_group 	= NULL
SET @tableName 		= 'R_FIN_CI'
SET @objectValue 	= 'FINCI_SeriesNumberMandatory'
SET @objectName 	= 'Series Number Mandatory ?'
SET @fieldType	 	= 'VARCHAR (5)'

-- Add the new attribute in table @tableName
IF(NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name = @tableName	AND column_name = @objectValue))
	BEGIN
		SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
		EXEC sp_executesql @sql
	END
ELSE
BEGIN
	SET @sql = 'ALTER TABLE  ' + @tableName + ' DROP COLUMN ' + @objectValue
	EXEC sp_executesql @sql
	SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
	EXEC sp_executesql @sql
END
----------------------------------------------------------------------------------------------------------------------------
-- --==================================================================================================================-- --
----------------------------------------------------------------------------------------------------------------------------
SET @sql 			= NULL
SET @id_attr_group 	= NULL
SET @tableName 		= 'R_FIN_CI'
SET @objectValue 	= 'FINCI_DMURelevant'
SET @objectName 	= 'DMU Relevant'
SET @fieldType	 	= 'VARCHAR (5)'

-- Add the new attribute in table @tableName
IF(NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name = @tableName	AND column_name = @objectValue))
	BEGIN
		SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
		EXEC sp_executesql @sql
	END
ELSE
BEGIN
	SET @sql = 'ALTER TABLE  ' + @tableName + ' DROP COLUMN ' + @objectValue
	EXEC sp_executesql @sql
	SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
	EXEC sp_executesql @sql
END
----------------------------------------------------------------------------------------------------------------------------
-- --==================================================================================================================-- --
----------------------------------------------------------------------------------------------------------------------------
SET @sql 			= NULL
SET @id_attr_group 	= NULL
SET @tableName 		= 'R_FIN_CI'
SET @objectValue 	= 'FINCI_ElectricalConsumer'
SET @objectName 	= 'Electrical Consumer'
SET @fieldType	 	= 'VARCHAR (5)'

-- Add the new attribute in table @tableName
IF(NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name = @tableName	AND column_name = @objectValue))
	BEGIN
		SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
		EXEC sp_executesql @sql
	END
ELSE
BEGIN
	SET @sql = 'ALTER TABLE  ' + @tableName + ' DROP COLUMN ' + @objectValue
	EXEC sp_executesql @sql
	SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
	EXEC sp_executesql @sql
END

----------------------------------------------------------------------------------------------------------------------------
-- --==================================================================================================================-- --
----------------------------------------------------------------------------------------------------------------------------
SET @sql 			= NULL
SET @id_attr_group 	= NULL
SET @tableName 		= 'R_Equipment'
SET @objectValue 	= 'Equipment_SeriesNumber'
SET @objectName 	= 'Series Number'
SET @fieldType	 	= 'VARCHAR (10)'

-- Add the new attribute in table @tableName
IF(NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name = @tableName	AND column_name = @objectValue))
	BEGIN
		SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
		EXEC sp_executesql @sql
	END
ELSE
BEGIN
	SET @sql = 'ALTER TABLE  ' + @tableName + ' DROP COLUMN ' + @objectValue
	EXEC sp_executesql @sql
	SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
	EXEC sp_executesql @sql
END

----------------------------------------------------------------------------------------------------------------------------
-- --==================================================================================================================-- --
----------------------------------------------------------------------------------------------------------------------------

SET @sql 			= NULL
SET @id_attr_group 	= NULL
SET @tableName 		= 'R_Equipment'
SET @objectValue 	= 'Equipment_EquipementAssemblyType'
SET @objectName 	= 'Equipment Assembly Type'
SET @fieldType	 	= 'VARCHAR (9)'
SET @objectOrder	= 27
SET @type_search	= 'listv'
SET @type_edit		= 'listv'
SET @reduced_view	= '0'
SET @type_val		= 'text'
SET @list_val		= 'N/A;Variant;Invariant;'
SET @link_page		= null
SET @link_val		= null
SET @object_infos	= @objectName
SET @info_ext		= null
SET @linked_page	= null
SET @repository		= null
SET @mandatory		= 0
-- Add the new attribute in table @tableName
IF(NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name = @tableName	AND column_name = @objectValue))
	BEGIN
		SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
		EXEC sp_executesql @sql
	END
ELSE
BEGIN
	SET @sql = 'ALTER TABLE  ' + @tableName + ' DROP COLUMN ' + @objectValue
	EXEC sp_executesql @sql
	SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
	EXEC sp_executesql @sql
END


----------------------------------------------------------------------------------------------------------------------------
-- --==================================================================================================================-- --
----------------------------------------------------------------------------------------------------------------------------

-- CREATE FIELD SI_MainCACode
SET @sql 			= NULL
SET @id_attr_group 	= NULL
SET @tableName 		= 'T_SI'
SET @objectValue 	= 'SI_MainCACode'
SET @objectName 	= 'Main CA Code'
SET @fieldType	 	= 'VARCHAR (5)'

-- Add the new attribute in table @tableName
IF(NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name = @tableName	AND column_name = @objectValue))
	BEGIN
		SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
		EXEC sp_executesql @sql
	END
ELSE
BEGIN
	SET @sql = 'ALTER TABLE  ' + @tableName + ' DROP COLUMN ' + @objectValue
	EXEC sp_executesql @sql
	SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
	EXEC sp_executesql @sql
END

----------------------------------------------------------------------------------------------------------------------------
-- --==================================================================================================================-- --
----------------------------------------------------------------------------------------------------------------------------

-- CREATE FIELD SI_GoodForFlight
SET @sql 			= NULL
SET @id_attr_group 	= NULL
SET @tableName 		= 'T_SI'
SET @objectValue 	= 'SI_GoodForFlight'
SET @objectName 	= 'Good For Flight'
SET @fieldType	 	= 'VARCHAR (5)'


-- Add the new attribute in table @tableName
IF(NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name = @tableName	AND column_name = @objectValue))
	BEGIN
		SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
		EXEC sp_executesql @sql
	END
ELSE
BEGIN
	SET @sql = 'ALTER TABLE  ' + @tableName + ' DROP COLUMN ' + @objectValue
	EXEC sp_executesql @sql
	SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
	EXEC sp_executesql @sql
END

----------------------------------------------------------------------------------------------------------------------------
-- --==================================================================================================================-- --
----------------------------------------------------------------------------------------------------------------------------

-- CREATE FIELD SI_GroundTestOnly
SET @sql 			= NULL
SET @id_attr_group 	= NULL
SET @tableName 		= 'T_SI'
SET @objectValue 	= 'SI_GroundTestOnly'
SET @objectName 	= 'Ground Test Only'
SET @fieldType	 	= 'VARCHAR (5)'

-- Add the new attribute in table @tableName
IF(NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name = @tableName	AND column_name = @objectValue))
	BEGIN
		SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
		EXEC sp_executesql @sql
	END
ELSE
BEGIN
	SET @sql = 'ALTER TABLE  ' + @tableName + ' DROP COLUMN ' + @objectValue
	EXEC sp_executesql @sql
	SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
	EXEC sp_executesql @sql
END
----------------------------------------------------------------------------------------------------------------------------
-- --==================================================================================================================-- --
----------------------------------------------------------------------------------------------------------------------------

-- CREATE FIELD SI_OperationalLimitation
SET @sql 			= NULL
SET @id_attr_group 	= NULL
SET @tableName 		= 'T_SI'
SET @objectValue 	= 'SI_OperationalLimitation'
SET @objectName 	= 'Operational Limitation'
SET @fieldType	 	= 'VARCHAR (5)'

-- Add the new attribute in table @tableName
IF(NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name = @tableName	AND column_name = @objectValue))
	BEGIN
		SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
		EXEC sp_executesql @sql
	END
ELSE
BEGIN
	SET @sql = 'ALTER TABLE  ' + @tableName + ' DROP COLUMN ' + @objectValue
	EXEC sp_executesql @sql
	SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
	EXEC sp_executesql @sql
END

----------------------------------------------------------------------------------------------------------------------------
-- --==================================================================================================================-- --
----------------------------------------------------------------------------------------------------------------------------

-- CREATE FIELD SI_MaintenanceLimitation
SET @sql 			= NULL
SET @id_attr_group 	= NULL
SET @tableName 		= 'T_SI'
SET @objectValue 	= 'SI_MaintenanceLimitation'
SET @objectName 	= 'Maintenance Limitation'
SET @fieldType	 	= 'VARCHAR (5)'

-- Add the new attribute in table @tableName
IF(NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name = @tableName	AND column_name = @objectValue))
	BEGIN
		SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
		EXEC sp_executesql @sql
	END
ELSE
BEGIN
	SET @sql = 'ALTER TABLE  ' + @tableName + ' DROP COLUMN ' + @objectValue
	EXEC sp_executesql @sql
	SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
	EXEC sp_executesql @sql
END

----------------------------------------------------------------------------------------------------------------------------
-- --==================================================================================================================-- --
----------------------------------------------------------------------------------------------------------------------------

-- CREATE FIELD SI_ReTestRequired
SET @sql 			= NULL
SET @id_attr_group 	= NULL
SET @tableName 		= 'T_SI'
SET @objectValue 	= 'SI_ReTestRequired'
SET @objectName 	= 'Re-Test Required'
SET @fieldType	 	= 'VARCHAR (5)'

-- Add the new attribute in table @tableName
IF(NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name = @tableName	AND column_name = @objectValue))
	BEGIN
		SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
		EXEC sp_executesql @sql
	END
ELSE
BEGIN
	SET @sql = 'ALTER TABLE  ' + @tableName + ' DROP COLUMN ' + @objectValue
	EXEC sp_executesql @sql
	SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
	EXEC sp_executesql @sql
END



----------------------------------------------------------------------------------------------------------------------------
-- --==================================================================================================================-- --
----------------------------------------------------------------------------------------------------------------------------

-- CREATE FIELD SI_Supplier
SET @sql 			= NULL
SET @id_attr_group 	= NULL
SET @tableName 		= 'T_SI'
SET @objectValue 	= 'SI_Supplier'
SET @objectName 	= 'Supplier'
SET @fieldType	 	= 'VARCHAR (5)'

-- Add the new attribute in table @tableName
IF(NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name = @tableName	AND column_name = @objectValue))
	BEGIN
		SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
		EXEC sp_executesql @sql
	END
ELSE
BEGIN
	SET @sql = 'ALTER TABLE  ' + @tableName + ' DROP COLUMN ' + @objectValue
	EXEC sp_executesql @sql
	SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
	EXEC sp_executesql @sql
END

----------------------------------------------------------------------------------------------------------------------------
-- --==================================================================================================================-- --
----------------------------------------------------------------------------------------------------------------------------

-- CREATE FIELD SI_AttachedFiles
SET @sql 			= NULL
SET @id_attr_group 	= NULL
SET @tableName 		= 'T_SI'
SET @objectValue 	= 'SI_AttachedFiles'
SET @objectName 	= 'Attached Files'
SET @fieldType	 	= 'VARCHAR (5)'

-- Add the new attribute in table @tableName
IF(NOT EXISTS( SELECT column_name FROM information_schema.columns WHERE table_name = @tableName	AND column_name = @objectValue))
	BEGIN
		SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
		EXEC sp_executesql @sql
	END
ELSE
BEGIN
	SET @sql = 'ALTER TABLE  ' + @tableName + ' DROP COLUMN ' + @objectValue
	EXEC sp_executesql @sql
	SET @sql = 'ALTER TABLE ' + @tableName + ' ADD ' + @objectValue + ' ' + @fieldType + ' ;'
	EXEC sp_executesql @sql
END

----------------------------------------------------------------------------------------------------------------------------
-- --==================================================================================================================-- --
----------------------------------------------------------------------------------------------------------------------------




