----Add CIN Closure Attributes on WDDS(TSD-ESDCR_DM-530_540)
------------------------------------------------------------------------------------------------------------------------------------------------------------
--Adding CIN Closure Status group into table T_EDIP_ATTRIBUTE_GROUP
DECLARE @ATTRIBUTE_GROUP_OBJECT_idr INT
DECLARE @AttributeGroupOrder INT
SELECT @ATTRIBUTE_GROUP_OBJECT_idr= OBJECT_id FROM T_EDIP_OBJECT WHERE ObjectLabel='WDDS'
SET @AttributeGroupOrder=7
IF (NOT EXISTS(	SELECT * FROM T_EDIP_ATTRIBUTE_GROUP WHERE AttributeGroupLabel='CIN Closure Status' AND ATTRIBUTE_GROUP_OBJECT_idr=@ATTRIBUTE_GROUP_OBJECT_idr))
BEGIN
INSERT INTO T_EDIP_ATTRIBUTE_GROUP (ATTRIBUTE_GROUP_OBJECT_idr, AttributeGroupLabel, AttributeGroupDescription, AttributeGroupOrder) VALUES (@ATTRIBUTE_GROUP_OBJECT_idr,'CIN Closure Status', 'CIN Closure Status', @AttributeGroupOrder)
END
------------------------------------------------------------------------------------------------------------------------------------------------------------
----Inserting attribute "Closure Status" into T_EDIP_ATTRIBUTE
DECLARE @ATTRIBUTE_ATTRIBUTE_GROUP_idr INT
DECLARE @AttributeOrder INT
DECLARE @FieldSize INT
DECLARE @MaxLength INT
DECLARE @ReadOnly INT
SELECT @ATTRIBUTE_ATTRIBUTE_GROUP_idr=ATTRIBUTE_GROUP_id FROM T_EDIP_ATTRIBUTE_GROUP WHERE AttributeGroupLabel='CIN Closure Status' AND ATTRIBUTE_GROUP_OBJECT_idr=@ATTRIBUTE_GROUP_OBJECT_idr
SET @AttributeOrder=1
SET @FieldSize=20
SET @MaxLength=20
SET @ReadOnly=1
IF (NOT EXISTS(SELECT * FROM T_EDIP_ATTRIBUTE WHERE AttributeLabel='Closure Status' AND ATTRIBUTE_ATTRIBUTE_GROUP_idr=@ATTRIBUTE_ATTRIBUTE_GROUP_idr))
BEGIN
INSERT INTO T_EDIP_ATTRIBUTE (ATTRIBUTE_ATTRIBUTE_GROUP_idr,AttributeLabel,AttributeName,TableName,SearchType,EditType,AttributeType,AttributeOrder,AttributeDescription,ValuesList,FieldSize,MaxLength,ReadOnly) VALUES (@ATTRIBUTE_ATTRIBUTE_GROUP_idr,'Closure status','WDDSClosureStatus','T_WDDS','list','listv','text',@AttributeOrder,'Closure status','Open stage;CIN Closed Stage 0;CIN Closed Stage 3;CIN Closed Stage 3A;CIN not OK;',@FieldSize,@MaxLength,@ReadOnly)
END
--Give access rights for the attribute "Closure Status" to "Admin" Role
DECLARE @ATTRIBUTE__CONTEXT_ATTRIBUTE_idr INT
DECLARE @ATTRIBUTE__CONTEXT_CONTEXT_idr INT
DECLARE @AttributeContextReadMode INT
DECLARE @AttributeContextWriteMode INT
SELECT @ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=ATTRIBUTE_id FROM T_EDIP_ATTRIBUTE WHERE AttributeLabel='Closure Status' AND AttributeName='WDDSClosureStatus'
SELECT @ATTRIBUTE__CONTEXT_CONTEXT_idr=CONTEXT_id FROM T_EDIP_CONTEXT WHERE ContextName='Admin'
SET @AttributeContextReadMode=1
SET @AttributeContextWriteMode=1
IF(NOT EXISTS(SELECT * FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@ATTRIBUTE__CONTEXT_ATTRIBUTE_idr AND ATTRIBUTE__CONTEXT_CONTEXT_idr=@ATTRIBUTE__CONTEXT_CONTEXT_idr ))
BEGIN
INSERT INTO  T_EDIP_LINK_ATTRIBUTE__CONTEXT (ATTRIBUTE__CONTEXT_ATTRIBUTE_idr,ATTRIBUTE__CONTEXT_CONTEXT_idr,AttributeContextReadMode,AttributeContextWriteMode) VALUES (@ATTRIBUTE__CONTEXT_ATTRIBUTE_idr,@ATTRIBUTE__CONTEXT_CONTEXT_idr,@AttributeContextReadMode,@AttributeContextWriteMode) 
END
------------------------------------------------------VIEWER-----------------------------------------------------------------------------
SET @AttributeContextWriteMode=0
DECLARE VIEWERRIGHTS_CURSOR CURSOR FOR SELECT CONTEXT_id FROM T_EDIP_Context WHERE ContextName in ('A400M_Viewer_DO','A400M_Viewer_FTI','A400M_Viewer_Labo','A350_Viewer_DO','A350_Viewer_FTI','A350_Viewer_Labo','A380_Viewer_DO','A380_Viewer_FTI','A380_Viewer_Labo')

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
DECLARE WRITERRIGHTS_CURSOR CURSOR FOR SELECT CONTEXT_id FROM T_EDIP_Context WHERE ContextName in('A350_Compiler','A400M_Compiler','A380_Compiler')

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
--Inserting attribute "Closure date" into T_EDIP_ATTRIBUTE
--DECLARE @ATTRIBUTE_ATTRIBUTE_GROUP_idr INT
--DECLARE @AttributeOrder INT
--DECLARE @FieldSize INT
--DECLARE @MaxLength INT
--DECLARE @ReadOnly INT
--SELECT @ATTRIBUTE_ATTRIBUTE_GROUP_idr=ATTRIBUTE_GROUP_id FROM T_EDIP_ATTRIBUTE_GROUP WHERE AttributeGroupLabel='CIN Closure Status' AND ATTRIBUTE_GROUP_OBJECT_idr=@ATTRIBUTE_GROUP_OBJECT_idr
SET @AttributeOrder=2
SET @FieldSize=50
SET @MaxLength=50
SET @ReadOnly=1
IF (NOT EXISTS(SELECT * FROM T_EDIP_ATTRIBUTE WHERE AttributeLabel='Closure Date' AND ATTRIBUTE_ATTRIBUTE_GROUP_idr=@ATTRIBUTE_ATTRIBUTE_GROUP_idr))
BEGIN
INSERT INTO T_EDIP_ATTRIBUTE (ATTRIBUTE_ATTRIBUTE_GROUP_idr,AttributeLabel,AttributeName,TableName,SearchType,EditType,AttributeType,AttributeOrder,AttributeDescription,ValuesList,FieldSize,MaxLength,ReadOnly) VALUES (@ATTRIBUTE_ATTRIBUTE_GROUP_idr,'Closure Date','WDDSClosureDate','T_WDDS','text','text','text',@AttributeOrder,'Closure Date',NULL,@FieldSize,@MaxLength,@ReadOnly)
END
--Give access rights for the attribute "Closure Date" to "Admin" Role
SELECT @ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=ATTRIBUTE_id FROM T_EDIP_ATTRIBUTE WHERE AttributeLabel='Closure Date' AND AttributeName='WDDSClosureDate'
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
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Inserting attribute "Under Domestic MOD" into T_EDIP_ATTRIBUTE
--DECLARE @ATTRIBUTE_ATTRIBUTE_GROUP_idr INT
--DECLARE @AttributeOrder INT
--DECLARE @FieldSize INT
--DECLARE @MaxLength INT
--DECLARE @ReadOnly INT
--SELECT @ATTRIBUTE_ATTRIBUTE_GROUP_idr=ATTRIBUTE_GROUP_OBJECT_idr FROM T_EDIP_ATTRIBUTE_GROUP WHERE AttributeGroupLabel='CIN Closure Status'
SET @AttributeOrder=3
SET @FieldSize=3
SET @MaxLength=3
SET @ReadOnly=1
IF (NOT EXISTS(SELECT * FROM T_EDIP_ATTRIBUTE WHERE AttributeLabel='Under Domestic MOD' AND ATTRIBUTE_ATTRIBUTE_GROUP_idr=@ATTRIBUTE_ATTRIBUTE_GROUP_idr))
BEGIN
INSERT INTO T_EDIP_ATTRIBUTE (ATTRIBUTE_ATTRIBUTE_GROUP_idr,AttributeLabel,AttributeName,TableName,SearchType,EditType,AttributeType,AttributeOrder,AttributeDescription,ValuesList,FieldSize,MaxLength,ReadOnly) VALUES (@ATTRIBUTE_ATTRIBUTE_GROUP_idr,'Under Domestic MOD','WDDSUnderDomMod','T_WDDS','text','text','text',@AttributeOrder,'Under Domestic MOD',NULL,@FieldSize,@MaxLength,@ReadOnly)
END
--Give access rights for the attribute "Under Domestic MOD" to "Admin" Role
SELECT @ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=ATTRIBUTE_id FROM T_EDIP_ATTRIBUTE WHERE AttributeLabel='Under Domestic MOD' AND AttributeName='WDDSUnderDomMod'
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
----------------------------------------------------------------------------------------------------------------------------------
--Adding column "WDDSClosureStatus" in table T_WDDS
IF (NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
            WHERE TABLE_NAME = 'T_WDDS' 
           AND  COLUMN_NAME = 'WDDSClosureStatus'))
BEGIN
ALTER TABLE T_WDDS ADD WDDSClosureStatus varchar(20)
END 
----------------------------------------------------------------------------------------------------------------------------------
--Adding column "WDDSClosureDate" in table T_WDDS
IF (NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
            WHERE TABLE_NAME = 'T_WDDS' 
           AND  COLUMN_NAME = 'WDDSClosureDate'))
BEGIN
ALTER TABLE T_WDDS ADD WDDSClosureDate varchar(50)
END 
----------------------------------------------------------------------------------------------------------------------------------
--Adding column "WDDSUnderDomMod" in table T_WDDS
IF (NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
            WHERE TABLE_NAME = 'T_WDDS' 
           AND  COLUMN_NAME = 'WDDSUnderDomMod'))
BEGIN
ALTER TABLE T_WDDS ADD WDDSUnderDomMod varchar(50)
END 
