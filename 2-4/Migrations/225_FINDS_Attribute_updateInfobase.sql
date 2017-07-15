------------------------------------------------------------------------------------
---------------------------------------- R_FIN_DS ---------------------------------
------------------------------------------------------------------------------------


-- Update Associated Top FIN DS Main group

IF( EXISTS(SELECT * FROM T_ATTR_GROUP WHERE label='MAIN' and description = 'Associated Top FIN DS Main group'))
BEGIN
	UPDATE T_ATTR_GROUP SET label = 'Associated Upper FIN-DS' WHERE label='MAIN' and description = 'Associated Top FIN DS Main group'
END


------------------------------------------------------------------------------------
-- ASSFINDS_name
------------------------------------------------------------------------------------

IF(EXISTS(SELECT * FROM infobase WHERE object_value = 'ASSFINDS_name' AND table_name = 'V_ASS_TOP_FIN_DS'))
	BEGIN
		UPDATE infobase 
			SET object_name = 'Associated Primary DS (Struc)',
				idr_group= (
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'Associated Upper FIN-DS') AND (T_OBJECT.table_primary_key = 'V_ASS_TOP_FIN_DS')
			)
			WHERE  object_value = 'ASSFINDS_name' 
	END






