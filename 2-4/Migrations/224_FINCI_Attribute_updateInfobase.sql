------------------------------------------------------------------------------------
---------------------------------------- R_FIN_CI ---------------------------------
------------------------------------------------------------------------------------


-- Update Associated Sub FIN CI  Main group

IF( EXISTS(SELECT * FROM T_ATTR_GROUP WHERE label='MAIN' and description = 'Associated Sub FIN CI Main group'))
BEGIN
	UPDATE T_ATTR_GROUP SET label = 'Associated Sub FIN-CI' WHERE label='MAIN' and description = 'Associated Sub FIN CI Main group'
END


------------------------------------------------------------------------------------
-- ASSFINCI_name
------------------------------------------------------------------------------------

IF(EXISTS(SELECT * FROM infobase WHERE object_value = 'ASSFINCI_name' AND table_name = 'V_ASS_SUB_FIN_CI'))
	BEGIN
		UPDATE infobase 
			SET object_name = 'Sub Component (Structure)',
				idr_group= (
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'Associated Sub FIN-CI') AND (T_OBJECT.table_primary_key = 'V_ASS_SUB_FIN_CI')
			)
			WHERE  object_value = 'ASSFINCI_name' 
	END



