-- Electrical generation

DECLARE @Table_Name varchar(255),
	@Group INT,
	@New_Group_label VARCHAR(255),
	@Old_Group_label VARCHAR(255),
	@order_group INT,
	@id_object INT


-- init variable
SET @Table_Name='T_MSN'
SET @New_Group_label='Electrical generation'
SET @Group=0
SET @Old_Group_label='Main'
SET @order_group=0
SET @id_object=0


-- search if group exist 
SELECT 
	@Group=T_ATTR_GROUP.id_attr_group
FROM	
	T_ATTR_Group
	INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_attr_group=T_ATTR_GROUP.id_attr_group
	INNER JOIN T_OBJECT ON T_OBJECT.id_object=T_LINK_ATTRGROUP_OBJECT.idr_object
WHERE
	T_ATTR_Group.label = @New_Group_label
	AND T_OBJECT.table_primary_key=@Table_Name

--create group if not exist
if(@Group=0)
BEGIN

	--search order group
	SELECT @order_group=T_ATTR_GROUP.display_order
	FROM	
	T_ATTR_Group
		INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_attr_group=T_ATTR_GROUP.id_attr_group
		INNER JOIN T_OBJECT ON T_OBJECT.id_object=T_LINK_ATTRGROUP_OBJECT.idr_object
	WHERE
		T_ATTR_Group.label = @Old_Group_label
		AND T_OBJECT.table_primary_key=@Table_Name

	--search id_object
	SELECT 
		@id_object=T_OBJECT.id_object
	FROM
		T_ATTR_GROUP
		INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_attr_group=T_ATTR_GROUP.id_attr_group
		INNER JOIN T_OBJECT ON T_OBJECT.id_object=T_LINK_ATTRGROUP_OBJECT.idr_object
	WHERE table_primary_key = @Table_Name	
	GROUP BY T_OBJECT.id_object

	--create new group
	INSERT INTO T_ATTR_GROUP (label,description,display_order)
	VALUES(@New_Group_label,'',@order_group+5)
	

	--store id_group
	SET @Group = @@IDENTITY

	--create link between object and group
	INSERT INTO T_LINK_ATTRGROUP_OBJECT(idr_attr_group,idr_object)
	VALUES(@Group,@id_object)
END




-- SEPDS PED Standard

SET @group=0

SELECT @group = id_attr_group FROM T_ATTR_GROUP WHERE label ='Electrical generation'


IF not exists (SELECT id_infobase FROM Infobase WHERE object_value ='MSN_SEPDS_PED_Standard')
BEGIN
	INSERT INTO
		Infobase (object_name, object_value, table_name, type_val, type_edit, type_search, idr_group, object_order, list_val, fast_search)
	VALUES
		('SEPDS PED Standard', 'MSN_SEPDS_PED_Standard', 'T_MSN', 'text', 'listv', 'listv', @group, '10', 'STD6.4.1;STD8.0', 0) 
END

ELSE
	UPDATE Infobase SET
		object_name = 'SEPDS PED Standard',
		type_val = 'text',
		type_edit = 'listv',
		type_search = 'listv',
		idr_group = @group,
		object_order = '10',
		list_val = 'STD6.4.1;STD8.0',
		fast_search = 0
WHERE object_value = 'MSN_SEPDS_PED_Standard'
AND table_name = 'T_MSN'



-- Ic1 High (Column 1)

SET @group=0

SELECT @group = id_attr_group FROM T_ATTR_GROUP WHERE label ='PED PWR Management Current in Amps'


IF not exists (SELECT id_infobase FROM Infobase WHERE object_value ='Ic1_High_Column1')
BEGIN
	INSERT INTO
		Infobase (object_name, object_value, table_name, type_val, type_edit, type_search, idr_group, object_order, fast_search)
	VALUES
		('Ic1 High (Column 1)', 'Ic1_High_Column1', 'T_LINK_MSN_POWERCENTER', 'float', 'text', 'text', @group, '85', 0) 
END

ELSE
	UPDATE Infobase SET
		object_name = 'Ic1 High (Column 1)',
		type_val = 'float',
		type_edit = 'text',
		type_search = 'text',
		idr_group = @group,
		object_order = '85',
		fast_search = 0
WHERE object_value = 'Ic1_High_Column1'
AND table_name = 'T_LINK_MSN_POWERCENTER'



-- Ic1 Low (Column 1)

SET @group=0

SELECT @group = id_attr_group FROM T_ATTR_GROUP WHERE label ='PED PWR Management Current in Amps'


IF not exists (SELECT id_infobase FROM Infobase WHERE object_value ='Ic1_Low_Column1')
BEGIN
	INSERT INTO
		Infobase (object_name, object_value, table_name, type_val, type_edit, type_search, idr_group, object_order, fast_search)
	VALUES
		('Ic1 Low (Column 1)', 'Ic1_Low_Column1', 'T_LINK_MSN_POWERCENTER', 'float', 'text', 'text', @group, '90', 0) 
END

ELSE
	UPDATE Infobase SET
		object_name = 'Ic1 Low (Column 1)',
		type_val = 'float',
		type_edit = 'text',
		type_search = 'text',
		idr_group = @group,
		object_order = '90',
		fast_search = 0
WHERE object_value = 'Ic1_Low_Column1'
AND table_name = 'T_LINK_MSN_POWERCENTER'



-- Ic2 High (Column 1)

SET @group=0

SELECT @group = id_attr_group FROM T_ATTR_GROUP WHERE label ='PED PWR Management Current in Amps'


IF not exists (SELECT id_infobase FROM Infobase WHERE object_value ='Ic2_High_Column1')
BEGIN
	INSERT INTO
		Infobase (object_name, object_value, table_name, type_val, type_edit, type_search, idr_group, object_order, fast_search)
	VALUES
		('Ic2 High (Column 1)', 'Ic2_High_Column1', 'T_LINK_MSN_POWERCENTER', 'float', 'text', 'text', @group, '95', 0) 
END

ELSE
	UPDATE Infobase SET
		object_name = 'Ic2 High (Column 1)',
		type_val = 'float',
		type_edit = 'text',
		type_search = 'text',
		idr_group = @group,
		object_order = '95',
		fast_search = 0
WHERE object_value = 'Ic2_High_Column1'
AND table_name = 'T_LINK_MSN_POWERCENTER'



-- Ic2 Low (Column 1)

SET @group=0

SELECT @group = id_attr_group FROM T_ATTR_GROUP WHERE label ='PED PWR Management Current in Amps'


IF not exists (SELECT id_infobase FROM Infobase WHERE object_value ='Ic2_Low_Column1')
BEGIN
	INSERT INTO
		Infobase (object_name, object_value, table_name, type_val, type_edit, type_search, idr_group, object_order, fast_search)
	VALUES
		('Ic2 Low (Column 1)', 'Ic2_Low_Column1', 'T_LINK_MSN_POWERCENTER', 'float', 'text', 'text', @group, '100', 0) 
END

ELSE
	UPDATE Infobase SET
		object_name = 'Ic2 Low (Column 1)',
		type_val = 'float',
		type_edit = 'text',
		type_search = 'text',
		idr_group = @group,
		object_order = '100',
		fast_search = 0
WHERE object_value = 'Ic2_Low_Column1'
AND table_name = 'T_LINK_MSN_POWERCENTER'



-- Ic1 High (Column 2)

SET @group=0

SELECT @group = id_attr_group FROM T_ATTR_GROUP WHERE label ='PED PWR Management Current in Amps'


IF not exists (SELECT id_infobase FROM Infobase WHERE object_value ='Ic1_High_Column2')
BEGIN
	INSERT INTO
		Infobase (object_name, object_value, table_name, type_val, type_edit, type_search, idr_group, object_order, fast_search)
	VALUES
		('Ic1 High (Column 2)', 'Ic1_High_Column2', 'T_LINK_MSN_POWERCENTER', 'float', 'text', 'text', @group, '105', 0) 
END

ELSE
	UPDATE Infobase SET
		object_name = 'Ic1 High (Column 2)',
		type_val = 'float',
		type_edit = 'text',
		type_search = 'text',
		idr_group = @group,
		object_order = '105',
		fast_search = 0
WHERE object_value = 'Ic1_High_Column2'
AND table_name = 'T_LINK_MSN_POWERCENTER'



-- Ic1 Low (Column 2)

SET @group=0

SELECT @group = id_attr_group FROM T_ATTR_GROUP WHERE label ='PED PWR Management Current in Amps'


IF not exists (SELECT id_infobase FROM Infobase WHERE object_value ='Ic1_Low_Column2')
BEGIN
	INSERT INTO
		Infobase (object_name, object_value, table_name, type_val, type_edit, type_search, idr_group, object_order, fast_search)
	VALUES
		('Ic1 Low (Column 2)', 'Ic1_Low_Column2', 'T_LINK_MSN_POWERCENTER', 'float', 'text', 'text', @group, '110', 0) 
END

ELSE
	UPDATE Infobase SET
		object_name = 'Ic1 Low (Column 2)',
		type_val = 'float',
		type_edit = 'text',
		type_search = 'text',
		idr_group = @group,
		object_order = '110',
		fast_search = 0
WHERE object_value = 'Ic1_Low_Column2'
AND table_name = 'T_LINK_MSN_POWERCENTER'



-- Ic2 High (Column 2)

SET @group=0

SELECT @group = id_attr_group FROM T_ATTR_GROUP WHERE label ='PED PWR Management Current in Amps'


IF not exists (SELECT id_infobase FROM Infobase WHERE object_value ='Ic2_High_Column2')
BEGIN
	INSERT INTO
		Infobase (object_name, object_value, table_name, type_val, type_edit, type_search, idr_group, object_order, fast_search)
	VALUES
		('Ic2 High (Column 2)', 'Ic2_High_Column2', 'T_LINK_MSN_POWERCENTER', 'float', 'text', 'text', @group, '115', 0) 
END

ELSE
	UPDATE Infobase SET
		object_name = 'Ic2 High (Column 2)',
		type_val = 'float',
		type_edit = 'text',
		type_search = 'text',
		idr_group = @group,
		object_order = '115',
		fast_search = 0
WHERE object_value = 'Ic2_High_Column2'
AND table_name = 'T_LINK_MSN_POWERCENTER'



-- Ic2 Low (Column 2)

SET @group=0

SELECT @group = id_attr_group FROM T_ATTR_GROUP WHERE label ='PED PWR Management Current in Amps'


IF not exists (SELECT id_infobase FROM Infobase WHERE object_value ='Ic2_Low_Column2')
BEGIN
	INSERT INTO
		Infobase (object_name, object_value, table_name, type_val, type_edit, type_search, idr_group, object_order, fast_search)
	VALUES
		('Ic2 Low (Column 2)', 'Ic2_Low_Column2', 'T_LINK_MSN_POWERCENTER', 'float', 'text', 'text', @group, '120', 0) 
END

ELSE
	UPDATE Infobase SET
		object_name = 'Ic2 Low (Column 2)',
		type_val = 'float',
		type_edit = 'text',
		type_search = 'text',
		idr_group = @group,
		object_order = '120',
		fast_search = 0
WHERE object_value = 'Ic2_Low_Column2'
AND table_name = 'T_LINK_MSN_POWERCENTER'



-- Ic1 High (Column 3)

SET @group=0

SELECT @group = id_attr_group FROM T_ATTR_GROUP WHERE label ='PED PWR Management Current in Amps'


IF not exists (SELECT id_infobase FROM Infobase WHERE object_value ='Ic1_High_Column3')
BEGIN	
	INSERT INTO
		Infobase (object_name, object_value, table_name, type_val, type_edit, type_search, idr_group, object_order, fast_search)
	VALUES
		('Ic1 High (Column 3)', 'Ic1_High_Column3', 'T_LINK_MSN_POWERCENTER', 'float', 'text', 'text', @group, '125', 0) 
END

ELSE
	UPDATE Infobase SET
		object_name = 'Ic1 High (Column 3)',
		type_val = 'float',
		type_edit = 'text',
		type_search = 'text',
		idr_group = @group,
		object_order = '125',
		fast_search = 0
WHERE object_value = 'Ic1_High_Column3'
AND table_name = 'T_LINK_MSN_POWERCENTER'



-- Ic1 Low (Column 3)

SET @group=0

SELECT @group = id_attr_group FROM T_ATTR_GROUP WHERE label ='PED PWR Management Current in Amps'


IF not exists (SELECT id_infobase FROM Infobase WHERE object_value ='Ic1_Low_Column3')
BEGIN	
	INSERT INTO
		Infobase (object_name, object_value, table_name, type_val, type_edit, type_search, idr_group, object_order, fast_search)
	VALUES
		('Ic1 Low (Column 3)', 'Ic1_Low_Column3', 'T_LINK_MSN_POWERCENTER', 'float', 'text', 'text', @group, '130', 0) 
END

ELSE
	UPDATE Infobase SET
		object_name = 'Ic1 Low (Column 3)',
		type_val = 'float',
		type_edit = 'text',
		type_search = 'text',
		idr_group = @group,
		object_order = '130',
		fast_search = 0
WHERE object_value = 'Ic1_Low_Column3'
AND table_name = 'T_LINK_MSN_POWERCENTER'



-- Ic2 High (Column 3)

SET @group=0

SELECT @group = id_attr_group FROM T_ATTR_GROUP WHERE label ='PED PWR Management Current in Amps'


IF not exists (SELECT id_infobase FROM Infobase WHERE object_value ='Ic2_High_Column3')
BEGIN	
	INSERT INTO
		Infobase (object_name, object_value, table_name, type_val, type_edit, type_search, idr_group, object_order, fast_search)
	VALUES
		('Ic2 High (Column 3)', 'Ic2_High_Column3', 'T_LINK_MSN_POWERCENTER', 'float', 'text', 'text', @group, '135', 0) 
END

ELSE
	UPDATE Infobase SET
		object_name = 'Ic2 High (Column 3)',
		type_val = 'float',
		type_edit = 'text',
		type_search = 'text',
		idr_group = @group,
		object_order = '135',
		fast_search = 0
WHERE object_value = 'Ic2_High_Column3'



-- Ic2 Low (Column 3)

SET @group=0

SELECT @group = id_attr_group FROM T_ATTR_GROUP WHERE label ='PED PWR Management Current in Amps'


IF not exists (SELECT id_infobase FROM Infobase WHERE object_value ='Ic2_Low_Column3')
BEGIN	
	INSERT INTO
		Infobase (object_name, object_value, table_name, type_val, type_edit, type_search, idr_group, object_order, fast_search)
	VALUES
		('Ic2 Low (Column 3)', 'Ic2_Low_Column3', 'T_LINK_MSN_POWERCENTER', 'float', 'text', 'text', @group, '140', 0) 
END

ELSE
	UPDATE Infobase SET
		object_name = 'Ic2 Low (Column 3)',
		type_val = 'float',
		type_edit = 'text',
		type_search = 'text',
		idr_group = @group,
		object_order = '140',
		fast_search = 0
WHERE object_value = 'Ic2_Low_Column3'



-- Ic1 High (Column 4)

SET @group=0

SELECT @group = id_attr_group FROM T_ATTR_GROUP WHERE label ='PED PWR Management Current in Amps'


IF not exists (SELECT id_infobase FROM Infobase WHERE object_value ='Ic1_High_Column4')
BEGIN	
	INSERT INTO
		Infobase (object_name, object_value, table_name, type_val, type_edit, type_search, idr_group, object_order, fast_search)
	VALUES
		('Ic1 High (Column 4)', 'Ic1_High_Column4', 'T_LINK_MSN_POWERCENTER', 'float', 'text', 'text', @group, '145', 0) 
END

ELSE
	UPDATE Infobase SET
		object_name = 'Ic1 High (Column 4)',
		type_val = 'float',
		type_edit = 'text',
		type_search = 'text',
		idr_group = @group,
		object_order = '145',
		fast_search = 0
WHERE object_value = 'Ic1_High_Column4'



-- Ic1 Low (Column 4)

SET @group=0

SELECT @group = id_attr_group FROM T_ATTR_GROUP WHERE label ='PED PWR Management Current in Amps'


IF not exists (SELECT id_infobase FROM Infobase WHERE object_value ='Ic1_Low_Column4')
BEGIN	
	INSERT INTO
		Infobase (object_name, object_value, table_name, type_val, type_edit, type_search, idr_group, object_order, fast_search)
	VALUES
		('Ic1 Low (Column 4)', 'Ic1_Low_Column4', 'T_LINK_MSN_POWERCENTER', 'float', 'text', 'text', @group, '150', 0) 
END

ELSE
	UPDATE Infobase SET
		object_name = 'Ic1 Low (Column 4)',
		type_val = 'float',
		type_edit = 'text',
		type_search = 'text',
		idr_group = @group,
		object_order = '150',
		fast_search = 0
WHERE object_value = 'Ic1_Low_Column4'



-- Ic2 High (Column 4)

SET @group=0

SELECT @group = id_attr_group FROM T_ATTR_GROUP WHERE label ='PED PWR Management Current in Amps'


IF not exists (SELECT id_infobase FROM Infobase WHERE object_value ='Ic2_High_Column4')
BEGIN	
	INSERT INTO
		Infobase (object_name, object_value, table_name, type_val, type_edit, type_search, idr_group, object_order, fast_search)
	VALUES
		('Ic2 High (Column 4)', 'Ic2_High_Column4', 'T_LINK_MSN_POWERCENTER', 'float', 'text', 'text', @group, '155', 0) 
END

ELSE
	UPDATE Infobase SET
		object_name = 'Ic2 High (Column 4)',
		type_val = 'float',
		type_edit = 'text',
		type_search = 'text',
		idr_group = @group,
		object_order = '155',
		fast_search = 0
WHERE object_value = 'Ic2_High_Column4'



-- Ic2 Low (Column 4)

SET @group=0

SELECT @group = id_attr_group FROM T_ATTR_GROUP WHERE label ='PED PWR Management Current in Amps'


IF not exists (SELECT id_infobase FROM Infobase WHERE object_value ='Ic2_Low_Column4')
BEGIN	
	INSERT INTO
		Infobase (object_name, object_value, table_name, type_val, type_edit, type_search, idr_group, object_order, fast_search)
	VALUES
		('Ic2 Low (Column 4)', 'Ic2_Low_Column4', 'T_LINK_MSN_POWERCENTER', 'float', 'text', 'text', @group, '160', 0) 
END

ELSE
	UPDATE Infobase SET
		object_name = 'Ic2 Low (Column 4)',
		type_val = 'float',
		type_edit = 'text',
		type_search = 'text',
		idr_group = @group,
		object_order = '160',
		fast_search = 0
WHERE object_value = 'Ic2_Low_Column4'


