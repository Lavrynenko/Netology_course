										--------------------------------------
										-- MOVE ATTRIBUTES IN ANOTHER GROUP --
										--------------------------------------

DECLARE @Attribut_Group_id varchar(255),
	@Attribut_Group_label varchar(255),
	@Object_label varchar(255),
	@Table_Name varchar(255),
	@Attribute varchar(255),
	@Attribute_Name varchar(255)


									-----------------------------------------------------
									-- ATTRIBUTE GROUP: General Information about Load --
									-----------------------------------------------------
-- Set ID of the new attribut group	
SET @Attribut_Group_label='General Information about Load'
SET @Object_label='FIN DS'

SELECT TOP 1 @Attribut_Group_id =  id_attr_group
FROM	T_ATTR_GROUP
	INNER JOIN T_LINK_ATTRGROUP_OBJECT on id_attr_group=idr_attr_group
	INNER JOIN T_OBJECT on id_object=idr_object
WHERE
	T_OBJECT.label=@Object_label
AND	T_ATTR_GROUP.label=@Attribut_Group_label	

---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE130-SD-change_group-120 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='EDDLoad'
SET @Attribute_Name='EDD Load FIN'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name) 

---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE130-SD-change_group-130 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='AllocatedPhase'
SET @Attribute_Name='Allocated Phase'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name)

---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE130-SD-change_group-280 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='TripCurve'
SET @Attribute_Name='Route'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name)

--------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: Sheddable by LPMF --
---------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='FINDS_SheddableLPMF'
SET @Attribute_Name='Sheddable by LPMF'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name)



									-----------------------------------------------------
									-- ATTRIBUTE GROUP: General Information about PCD --
									-----------------------------------------------------

-- Set ID of the new attribut group	
SET @Attribut_Group_label='General Information about PCD'
SET @Object_label='FIN DS'

SELECT TOP 1 @Attribut_Group_id =  id_attr_group
FROM	T_ATTR_GROUP
	INNER JOIN T_LINK_ATTRGROUP_OBJECT on id_attr_group=idr_attr_group
	INNER JOIN T_OBJECT on id_object=idr_object
WHERE
	T_OBJECT.label=@Object_label
AND	T_ATTR_GROUP.label=@Attribut_Group_label	

---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE130-SD-change_group-290 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='TypeOfProtection'
SET @Attribute_Name='Device Type'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name)

---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE130-SD-change_group-300 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='Rating'
SET @Attribute_Name='Rating (A)'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name)

---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE130-SD-change_group-310 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='Panel'
SET @Attribute_Name='Power Center'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name)

---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE130-SD-change_group-320 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='PowerCenterType'
SET @Attribute_Name='Power Center Type'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name)

---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE130-SD-change_group-330 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='GroundServiceSupply'
SET @Attribute_Name='Ground Service Supply'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id,
	list_val='Yes;No'
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name)

---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE130-SD-change_group-340 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='Busbar'
SET @Attribute_Name='Busbar'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name) 
						
---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE130-SD-change_group-350 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='SubBusBar'
SET @Attribute_Name='Sub Busbar'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name)

---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE130-SD-change_group-360 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='FINDS_NetworkType'
SET @Attribute_Name='Network Type'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name) 

---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE130-SD-change_group-370 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='Side'
SET @Attribute_Name='Side'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name) 

---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE130-SD-change_group-380 --
---------------------------------------------------------------------------
SET @Table_Name='R_FIN_DS'
SET @Attribute='EDDOption'
SET @Attribute_Name='EDD Option'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name) 

---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE130-SD-change_group-390 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='GFITripCurrent'
SET @Attribute_Name='GFI Trip Current (mA)'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name) 

---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE130-SD-change_group-400 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='GFITripTime'
SET @Attribute_Name='GFI Trip Time (ms)'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name) 

---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE130-SD-change_group-410 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='GFIEnabled'
SET @Attribute_Name='GFI'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name) 

---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE130-SD-change_group-420 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='BackUpValueStatus'
SET @Attribute_Name='Back Up Status'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name)

---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE130-SD-change_group-430 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='DefaultValueStatus'
SET @Attribute_Name='Default Status'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name) 

---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE130-SD-change_group-440 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='Location'
SET @Attribute_Name='Location'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name) 



							--------------------------------------------------------------------
							-- ATTRIBUTE GROUP: Information about PCD monitoring and shedding --
							--------------------------------------------------------------------

-- Set ID of the new attribut group	
SET @Attribut_Group_label='Information about PCD monitoring and shedding'
SET @Object_label='FIN DS'

SELECT TOP 1 @Attribut_Group_id =  id_attr_group
FROM	T_ATTR_GROUP
	INNER JOIN T_LINK_ATTRGROUP_OBJECT on id_attr_group=idr_attr_group
	INNER JOIN T_OBJECT on id_object=idr_object
WHERE
	T_OBJECT.label=@Object_label
AND	T_ATTR_GROUP.label=@Attribut_Group_label		

---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE130-SD-change_group-480 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='Group_'
SET @Attribute_Name='ELMF Group'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name)					
						
						
												
							-----------------------------------------------------
							-- ATTRIBUTE GROUP: Information about P/CD command --
							-----------------------------------------------------

-- Set ID of the new attribut group	
SET @Attribut_Group_label='Information about PCD command'
SET @Object_label='FIN DS'

SELECT TOP 1 @Attribut_Group_id =  id_attr_group
FROM	T_ATTR_GROUP
	INNER JOIN T_LINK_ATTRGROUP_OBJECT on id_attr_group=idr_attr_group
	INNER JOIN T_OBJECT on id_object=idr_object
WHERE
	T_OBJECT.label=@Object_label
AND	T_ATTR_GROUP.label=@Attribut_Group_label			

---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE129-SD-change_group-560 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='FINDS_SSPCVLCommandName'
SET @Attribute_Name='Command VL name'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name)
						
						
						
							-----------------------------------------
							-- ATTRIBUTE GROUP: EPCs Wiring Output --
							-----------------------------------------

-- Set ID of the new attribut group	
SET @Attribut_Group_label='EPCs Wiring Output'
SET @Object_label='FIN DS'

SELECT TOP 1 @Attribut_Group_id =  id_attr_group
FROM	T_ATTR_GROUP
	INNER JOIN T_LINK_ATTRGROUP_OBJECT on id_attr_group=idr_attr_group
	INNER JOIN T_OBJECT on id_object=idr_object
WHERE
	T_OBJECT.label=@Object_label
AND	T_ATTR_GROUP.label=@Attribut_Group_label	

---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE129-SD-change_group-090 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='ReferenceConnector'
SET @Attribute_Name='Power Output Connector'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name)
						
---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE129-SD-change_group-100 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='PCDStatCon'
SET @Attribute_Name='P/CD Status Connector'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name)
						
---------------------------------------------------------------------------
-- MOVE ATTRIBUTE IN ANOTHER GROUP: ID => ELCOPSE129-SD-change_group-110 --
---------------------------------------------------------------------------
-- Move Attribut Group
SET @Table_Name='R_FIN_DS'
SET @Attribute='PCDStatPin'
SET @Attribute_Name='P/CD Status Pin Allocation'

UPDATE InfoBase
SET idr_group=@Attribut_Group_id
WHERE id_infobase IN (SELECT id_infobase 
						FROM infobase 
						WHERE object_name = @Attribute_Name 
						AND object_value = @Attribute 
						AND table_name=@Table_name)