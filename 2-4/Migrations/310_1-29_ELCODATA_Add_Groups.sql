											----------------
											-- ADD GROUPS --
											----------------

---------------------------------------------------
-- ADD GROUP : ID => 							 --
---------------------------------------------------
DECLARE	@Label varchar(255),
	@ObjectValue varchar(255),
	@OrderAttribute varchar(255),
	@IdGroupAttr varchar(255),
	@ListValue varchar(255)

SET @Label='SPDB Specific Information'

if( not exists(SELECT *
		FROM T_ATTR_GROUP
		WHERE label=@Label))

BEGIN
	--Insert the group
	INSERT INTO T_ATTR_GROUP (label,description,display_order)
	VALUES (@Label,@Label,'3')
	
	INSERT INTO T_LINK_ATTRGROUP_OBJECT (idr_attr_group,idr_object) 
	SELECT 
		(SELECT @@identity as last_id),
		(SELECT id_object
			FROM T_OBJECT
			WHERE table_primary_key='R_FIN_DS')
END