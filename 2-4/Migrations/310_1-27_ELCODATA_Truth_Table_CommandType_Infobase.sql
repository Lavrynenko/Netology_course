-- ******************************************************************************
-- Name : 310_1-27_ELCODATA_Truth_Table_CommandType_Infobase.sql
-- Date : 14/08/2008
-- Spec : ELCODATA_V1.27_synthesis_sheet_A350_Truth_Tables.doc
-- Modify attribute "Command Type" in Infobase
--   for object "R_FIN_DS"
--   in group "Information about PCD Command"
-- ******************************************************************************

DECLARE 
	@idr_group INT, 
	@idr_infobase INT

------------------------------------------------
-- Delete permissions and entries in Infobase --
------------------------------------------------

SET @idr_infobase = 0

SELECT 
	@idr_infobase = id_infobase
FROM
	INFOBASE
WHERE
	object_value = 'CommandType' 
	AND table_name = 'R_FIN_DS'


if (@idr_infobase <> 0) 
BEGIN
	DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_infobase = @idr_infobase
	DELETE FROM Infobase where object_value = 'CommandType'
END


---------------------
-- Update Infobase --
---------------------

SET @idr_group = 0

SELECT 
	@idr_group = T_ATTR_GROUP.id_attr_group 
FROM 
	T_ATTR_GROUP 
	INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
	INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
WHERE 
	(T_ATTR_GROUP.label = 'Information about PCD Command') 
	AND (T_OBJECT.table_primary_key = 'R_FIN_DS')


IF (EXISTS (SELECT * FROM infobase WHERE object_value = 'FINDS_SSPCCommandType' AND table_name = 'R_FIN_DS')) 
BEGIN 
	UPDATE 
		infobase 
	SET 
		object_name = 'Command Type', 
		object_order = 1, 
		list_val = 'Logic;AFDX;Discrete;Always On', 
		idr_group = @idr_group, 
		mandatory = 0
	WHERE 
		object_value = 'FINDS_SSPCCommandType'
END 
ELSE 
BEGIN 
	print 'CommandType does not exist in Infobase.'
END
