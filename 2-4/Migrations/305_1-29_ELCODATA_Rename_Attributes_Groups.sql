											-----------------------------
											-- RENAME ATTRIBUTES GROUPS --
											-----------------------------

------------------------------------------------------------------
-- RENAME ATTRIBUTE GROUP: ID => ELCOPSE130-SD-rename_group-010 --
------------------------------------------------------------------
UPDATE
	T_ATTR_GROUP
SET 
	label = 'EDD Maturity Status'
FROM
	T_ATTR_GROUP
	INNER JOIN T_LINK_ATTRGROUP_OBJECT on id_attr_group=idr_attr_group
	INNER JOIN T_OBJECT on id_object=idr_object
WHERE
	T_OBJECT.label='FIN DS'
	AND T_ATTR_GROUP.label='Configuration Management'	


------------------------------------------------------------------
-- RENAME ATTRIBUTE GROUP: ID => ELCOPSE130-SD-rename_group-030 --
------------------------------------------------------------------
UPDATE
	T_ATTR_GROUP
SET 
	label = 'Information about PCD monitoring and shedding'
FROM
	T_ATTR_GROUP
	INNER JOIN T_LINK_ATTRGROUP_OBJECT on id_attr_group=idr_attr_group
	INNER JOIN T_OBJECT on id_object=idr_object
WHERE
	T_OBJECT.label='FIN DS'
	AND T_ATTR_GROUP.label='PCD Status Monitoring'	
	
	
------------------------------------------------------------------
-- RENAME ATTRIBUTE GROUP: ID => ELCOPSE130-SD-rename_group-040 --
------------------------------------------------------------------

UPDATE
	T_ATTR_GROUP
SET 
	label = 'General Information about Load'
FROM
	T_ATTR_GROUP
	INNER JOIN T_LINK_ATTRGROUP_OBJECT on id_attr_group=idr_attr_group
	INNER JOIN T_OBJECT on id_object=idr_object
WHERE
	T_OBJECT.label='FIN DS'
	AND T_ATTR_GROUP.label='Load'	