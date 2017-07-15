/******************************************************************************************
		Add Attribute Groups   
*******************************************************************************************/


-- RCCB Specific Information group

IF( NOT EXISTS(SELECT * FROM T_ATTR_GROUP WHERE label='RCCB Specific Information'))
BEGIN
	INSERT INTO T_ATTR_GROUP (label, description, display_order)
		VALUES (
			'RCCB Specific Information', 
			NULL, 
			(SELECT display_order+2 from T_ATTR_GROUP where label = 'SSPC Specific Information')		
		)

	INSERT INTO T_LINK_ATTRGROUP_OBJECT (idr_attr_group, idr_object)
		SELECT  (Select id_attr_group FROM T_ATTR_GROUP WHERE label = 'RCCB Specific Information' ), 
			(Select id_object FROM T_OBJECT WHERE label = 'FIN DS')	
END





