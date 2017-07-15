-- ******************************************************************************
-- Name : 305_1-27_ELCODATA_Truth_Table_Group_PCD_Command.sql
-- Date : 14/08/2008
-- Spec : ELCODATA_V1.27_synthesis_sheet_A350_Truth_Tables.doc
-- Create group Information about PCD Command for object R_FIN_DS
-- ******************************************************************************

DECLARE @Table_Name varchar(50),
	@id_object INT,
	@Group INT,
	@Group_label VARCHAR(50),
	@Group_description VARCHAR(50)


----------------------------
-- Get R_FIN_DS object id --
----------------------------

SET @Table_Name = 'R_FIN_DS'
SET @id_object = 0

SELECT 
	@id_object = T_OBJECT.id_object
FROM
	T_OBJECT
WHERE
	T_OBJECT.table_primary_key = @Table_Name


------------------------------------------------
-- Create group Information about PCD Command --
------------------------------------------------

SET @Group_label = 'Information about PCD Command'
SET @Group = 0
Set @Group_description = 'Information about PCD Command'

SELECT 
	@Group = T_ATTR_GROUP.id_attr_group
FROM
	T_ATTR_GROUP
	INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_attr_group = T_ATTR_GROUP.id_attr_group
	INNER JOIN T_OBJECT ON T_OBJECT.id_object = T_LINK_ATTRGROUP_OBJECT.idr_object
WHERE
	T_ATTR_Group.label = @Group_label
	AND T_OBJECT.table_primary_key = @Table_Name

IF (@Group = 0)
BEGIN

	INSERT INTO 
		T_ATTR_GROUP (label, description)
	VALUES 
		(@Group_label, @Group_description)

	SET @Group = @@IDENTITY

	INSERT INTO 
		T_LINK_ATTRGROUP_OBJECT (idr_attr_group, idr_object)
	VALUES 
		(@Group, @id_object)

END
