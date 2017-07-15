----Add DQN/RDR Number + Sketch  Attributes on PDDS(TSD-ESDCR_DM-510)
------------------------------------------------------------------------------------------------------------------------------------------------------------
--Adding MAIN group into table T_EDIP_ATTRIBUTE_GROUP (if it is not already existing)
DECLARE @ATTRIBUTE_GROUP_OBJECT_idr INT
DECLARE @AttributeGroupOrder INT
SET @AttributeGroupOrder=9
SELECT @ATTRIBUTE_GROUP_OBJECT_idr= OBJECT_id FROM T_EDIP_OBJECT WHERE ObjectLabel='PDDS'
IF (NOT EXISTS(	SELECT * FROM T_EDIP_ATTRIBUTE_GROUP WHERE AttributeGroupLabel='MAIN' AND ATTRIBUTE_GROUP_OBJECT_idr=@ATTRIBUTE_GROUP_OBJECT_idr))
BEGIN
INSERT INTO T_EDIP_ATTRIBUTE_GROUP (ATTRIBUTE_GROUP_OBJECT_idr, AttributeGroupLabel, AttributeGroupDescription, AttributeGroupOrder) VALUES (@ATTRIBUTE_GROUP_OBJECT_idr,'MAIN', 'MAIN', @AttributeGroupOrder)
END
------------------------------------------------------------------------------------------------------------------------------------------------------------
--Inserting attribute "DQN/RDR Number" into T_EDIP_ATTRIBUTE
DECLARE @ATTRIBUTE_ATTRIBUTE_GROUP_idr INT
DECLARE @AttributeOrder INT
DECLARE @FieldSize INT
DECLARE @MaxLength INT
DECLARE @ReadOnly INT
SELECT @ATTRIBUTE_ATTRIBUTE_GROUP_idr=ATTRIBUTE_GROUP_id FROM T_EDIP_ATTRIBUTE_GROUP WHERE AttributeGroupLabel='MAIN' AND ATTRIBUTE_GROUP_OBJECT_idr=@ATTRIBUTE_GROUP_OBJECT_idr
SET @AttributeOrder=26
SET @FieldSize=20
SET @MaxLength=20
SET @ReadOnly=1
IF (NOT EXISTS(SELECT * FROM T_EDIP_ATTRIBUTE WHERE AttributeLabel='DQN/RDR Number' AND ATTRIBUTE_ATTRIBUTE_GROUP_idr=@ATTRIBUTE_ATTRIBUTE_GROUP_idr))
BEGIN
INSERT INTO T_EDIP_ATTRIBUTE (ATTRIBUTE_ATTRIBUTE_GROUP_idr,AttributeLabel,AttributeName,TableName,SearchType,EditType,AttributeType,AttributeOrder,AttributeDescription,ValuesList,FieldSize,MaxLength,ReadOnly) VALUES (@ATTRIBUTE_ATTRIBUTE_GROUP_idr,'DQN/RDR Number','PDDSDQNNumber','T_PDDS','text','text','text',@AttributeOrder,'DQN/RDR Number',NULL,@FieldSize,@MaxLength,@ReadOnly)
END
--Give access rights for the attribute "DQN/RDR Number" to "Admin" Role
DECLARE @ATTRIBUTE__CONTEXT_ATTRIBUTE_idr INT
DECLARE @ATTRIBUTE__CONTEXT_CONTEXT_idr INT
DECLARE @AttributeContextReadMode INT
DECLARE @AttributeContextWriteMode INT
SELECT @ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=ATTRIBUTE_id FROM T_EDIP_ATTRIBUTE WHERE AttributeLabel='DQN/RDR Number' AND AttributeName='PDDSDQNNumber'
SELECT @ATTRIBUTE__CONTEXT_CONTEXT_idr=CONTEXT_id FROM T_EDIP_CONTEXT WHERE ContextName='Admin'
SET @AttributeContextReadMode=1
SET @AttributeContextWriteMode=0
IF(NOT EXISTS(SELECT * FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@ATTRIBUTE__CONTEXT_ATTRIBUTE_idr AND ATTRIBUTE__CONTEXT_CONTEXT_idr=@ATTRIBUTE__CONTEXT_CONTEXT_idr ))
BEGIN
INSERT INTO  T_EDIP_LINK_ATTRIBUTE__CONTEXT (ATTRIBUTE__CONTEXT_ATTRIBUTE_idr,ATTRIBUTE__CONTEXT_CONTEXT_idr,AttributeContextReadMode,AttributeContextWriteMode) VALUES (@ATTRIBUTE__CONTEXT_ATTRIBUTE_idr,@ATTRIBUTE__CONTEXT_CONTEXT_idr,@AttributeContextReadMode,@AttributeContextWriteMode) 
END
------------------------------------------------------VIEWER-----------------------------------------------------------------------------
SET @AttributeContextWriteMode=0
DECLARE VIEWERRIGHTS_CURSOR CURSOR FOR SELECT CONTEXT_id FROM T_EDIP_Context WHERE ContextName like '%VIEWER%'

OPEN VIEWERRIGHTS_CURSOR

FETCH NEXT FROM VIEWERRIGHTS_CURSOR INTO @ATTRIBUTE__CONTEXT_CONTEXT_idr
WHILE @@FETCH_STATUS=0
BEGIN 
IF(NOT EXISTS(SELECT * FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@ATTRIBUTE__CONTEXT_ATTRIBUTE_idr AND ATTRIBUTE__CONTEXT_CONTEXT_idr=@ATTRIBUTE__CONTEXT_CONTEXT_idr))
INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT (ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode ) VALUES (@ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, @ATTRIBUTE__CONTEXT_CONTEXT_idr, @AttributeContextReadMode, @AttributeContextWriteMode )
FETCH NEXT FROM VIEWERRIGHTS_CURSOR INTO @ATTRIBUTE__CONTEXT_CONTEXT_idr
END

CLOSE VIEWERRIGHTS_CURSOR
DEALLOCATE VIEWERRIGHTS_CURSOR
-------------------------------------------------------WRITER----------------------------------------------------------------------------------
SET @AttributeContextWriteMode=1
DECLARE WRITERRIGHTS_CURSOR CURSOR FOR SELECT CONTEXT_id FROM T_EDIP_Context WHERE ContextName like '%Writer%'

OPEN WRITERRIGHTS_CURSOR

FETCH NEXT FROM WRITERRIGHTS_CURSOR INTO @ATTRIBUTE__CONTEXT_CONTEXT_idr
WHILE @@FETCH_STATUS=0
BEGIN 
IF(NOT EXISTS(SELECT * FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE  ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@ATTRIBUTE__CONTEXT_ATTRIBUTE_idr AND ATTRIBUTE__CONTEXT_CONTEXT_idr=@ATTRIBUTE__CONTEXT_CONTEXT_idr))
INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT (ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode ) VALUES (@ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, @ATTRIBUTE__CONTEXT_CONTEXT_idr, @AttributeContextReadMode, @AttributeContextWriteMode )
FETCH NEXT FROM WRITERRIGHTS_CURSOR INTO @ATTRIBUTE__CONTEXT_CONTEXT_idr
END

CLOSE WRITERRIGHTS_CURSOR
DEALLOCATE WRITERRIGHTS_CURSOR
------------------------------------------------------------------------------------------------------------------------------------------------------------
--Inserting attribute "Sketch Number" into T_EDIP_ATTRIBUTE
--DECLARE @ATTRIBUTE_ATTRIBUTE_GROUP_idr INT
--DECLARE @ATTRIBUTE_id INT
--DECLARE @AttributeOrder INT
--DECLARE @FieldSize INT
--DECLARE @MaxLength INT
--DECLARE @ReadOnly INT
--SELECT @ATTRIBUTE_ATTRIBUTE_GROUP_idr=ATTRIBUTE_GROUP_id FROM T_EDIP_ATTRIBUTE_GROUP WHERE AttributeGroupLabel='MAIN' AND ATTRIBUTE_GROUP_OBJECT_idr=@ATTRIBUTE_GROUP_OBJECT_idr
SET @AttributeOrder=27
SET @FieldSize=20
SET @MaxLength=20
SET @ReadOnly=1
IF (NOT EXISTS(SELECT * FROM T_EDIP_ATTRIBUTE WHERE AttributeLabel='Sketch Number' AND ATTRIBUTE_ATTRIBUTE_GROUP_idr=@ATTRIBUTE_ATTRIBUTE_GROUP_idr))
BEGIN
INSERT INTO T_EDIP_ATTRIBUTE (ATTRIBUTE_ATTRIBUTE_GROUP_idr,AttributeLabel,AttributeName,TableName,SearchType,EditType,AttributeType,AttributeOrder,AttributeDescription,ValuesList,FieldSize,MaxLength,ReadOnly) VALUES (@ATTRIBUTE_ATTRIBUTE_GROUP_idr,'Sketch Number','PDDSSketchNumber','T_PDDS','text','text','text',@AttributeOrder,'Sketch Number',NULL,@FieldSize,@MaxLength,@ReadOnly)
END
--Give access rights for the attribute "Sketch Number" to "Admin" Role
SELECT @ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=ATTRIBUTE_id FROM T_EDIP_ATTRIBUTE WHERE AttributeLabel='Sketch Number' AND AttributeName='PDDSSketchNumber'
SET @AttributeContextReadMode=1
SET @AttributeContextWriteMode=0
IF(NOT EXISTS(SELECT * FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@ATTRIBUTE__CONTEXT_ATTRIBUTE_idr AND ATTRIBUTE__CONTEXT_CONTEXT_idr=@ATTRIBUTE__CONTEXT_CONTEXT_idr ))
BEGIN
INSERT INTO  T_EDIP_LINK_ATTRIBUTE__CONTEXT (ATTRIBUTE__CONTEXT_ATTRIBUTE_idr,ATTRIBUTE__CONTEXT_CONTEXT_idr,AttributeContextReadMode,AttributeContextWriteMode) VALUES (@ATTRIBUTE__CONTEXT_ATTRIBUTE_idr,@ATTRIBUTE__CONTEXT_CONTEXT_idr,@AttributeContextReadMode,@AttributeContextWriteMode) 
END
------------------------------------------------------VIEWER-----------------------------------------------------------------------------
SET @AttributeContextWriteMode=0
DECLARE VIEWERRIGHTS_CURSOR CURSOR FOR SELECT CONTEXT_id FROM T_EDIP_Context WHERE ContextName like '%VIEWER%'

OPEN VIEWERRIGHTS_CURSOR

FETCH NEXT FROM VIEWERRIGHTS_CURSOR INTO @ATTRIBUTE__CONTEXT_CONTEXT_idr
WHILE @@FETCH_STATUS=0
BEGIN 
IF(NOT EXISTS(SELECT * FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@ATTRIBUTE__CONTEXT_ATTRIBUTE_idr AND ATTRIBUTE__CONTEXT_CONTEXT_idr=@ATTRIBUTE__CONTEXT_CONTEXT_idr))
INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT (ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode ) VALUES (@ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, @ATTRIBUTE__CONTEXT_CONTEXT_idr, @AttributeContextReadMode, @AttributeContextWriteMode )
FETCH NEXT FROM VIEWERRIGHTS_CURSOR INTO @ATTRIBUTE__CONTEXT_CONTEXT_idr
END

CLOSE VIEWERRIGHTS_CURSOR
DEALLOCATE VIEWERRIGHTS_CURSOR
-------------------------------------------------------WRITER----------------------------------------------------------------------------------
SET @AttributeContextWriteMode=1
DECLARE WRITERRIGHTS_CURSOR CURSOR FOR SELECT CONTEXT_id FROM T_EDIP_Context WHERE ContextName like '%Writer%'

OPEN WRITERRIGHTS_CURSOR

FETCH NEXT FROM WRITERRIGHTS_CURSOR INTO @ATTRIBUTE__CONTEXT_CONTEXT_idr
WHILE @@FETCH_STATUS=0
BEGIN 
IF(NOT EXISTS(SELECT * FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE  ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@ATTRIBUTE__CONTEXT_ATTRIBUTE_idr AND ATTRIBUTE__CONTEXT_CONTEXT_idr=@ATTRIBUTE__CONTEXT_CONTEXT_idr))
INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT (ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode ) VALUES (@ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, @ATTRIBUTE__CONTEXT_CONTEXT_idr, @AttributeContextReadMode, @AttributeContextWriteMode )
FETCH NEXT FROM WRITERRIGHTS_CURSOR INTO @ATTRIBUTE__CONTEXT_CONTEXT_idr
END

CLOSE WRITERRIGHTS_CURSOR
DEALLOCATE WRITERRIGHTS_CURSOR
----------------------------------------------------------------------------------------------------------------------------------
--Adding column "PDDSDQNNumber" in table T_PDDS
IF (NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
            WHERE TABLE_NAME = 'T_PDDS' 
           AND  COLUMN_NAME = 'PDDSDQNNumber'))
BEGIN
ALTER TABLE T_PDDS ADD PDDSDQNNumber varchar(20)
END 
----------------------------------------------------------------------------------------------------------------------------------
--Adding column "PDDSSketchNumber" in table T_PDDS
IF (NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
            WHERE TABLE_NAME = 'T_PDDS' 
           AND  COLUMN_NAME = 'PDDSSketchNumber'))
BEGIN
ALTER TABLE T_PDDS ADD PDDSSketchNumber varchar(20)
END 
