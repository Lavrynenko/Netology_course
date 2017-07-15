--Add Domestic MOD attribute for the table T_DOMESTICMOD(TSD-ESDCR_MOD_DOMESTIC-020)

IF(NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='T_DOMESTICMOD'))
BEGIN
CREATE TABLE [dbo].[T_DOMESTICMOD](
	[DomesticMOD_id] [int] IDENTITY(1,1) NOT NULL,
	[DomModNumber] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[DomesticMOD_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
------------------------------------------------------------------------------------------------------------------------------------------------------
--Creation of object DOMESTIC MOD in Table T_EDIP_OBJECT
DECLARE @ObjectOrder INT
DECLARE @ObjectPrimaryKey VARCHAR(40)
DECLARE @ObjectTablePrimaryKey VARCHAR(40)
--SELECT @ObjectPrimaryKey=  name FROM sys.columns WHERE object_id = OBJECT_ID('T_DOMESTICMOD') AND is_identity=1
SET @ObjectPrimaryKey='DomesticMOD_id'
SET @ObjectOrder=14
SET @ObjectTablePrimaryKey='T_DOMESTICMOD'
IF(NOT EXISTS(SELECT * FROM T_EDIP_OBJECT WHERE ObjectLabel='DOMESTICMOD'))
BEGIN
INSERT INTO T_EDIP_OBJECT (ObjectLabel,ObjectDescription,ObjectOrder,ObjectPrimaryKey,ObjectTablePrimaryKey) VALUES ('DOMESTICMOD','DOMESTIC MOD',@ObjectOrder,@ObjectPrimaryKey,@ObjectTablePrimaryKey)
END
-----------------------------------------------------------------------------------------------------------------------------------------------------
--Adding MAIN group into table T_EDIP_ATTRIBUTE_GROUP (TSD-ESDCR_MOD_DOMESTIC-030)
DECLARE @ATTRIBUTE_GROUP_OBJECT_idr INT
DECLARE @AttributeGroupOrder INT
SET @AttributeGroupOrder=1
SELECT @ATTRIBUTE_GROUP_OBJECT_idr= OBJECT_id FROM T_EDIP_OBJECT WHERE ObjectLabel='DOMESTICMOD'
IF (NOT EXISTS(	SELECT * FROM T_EDIP_ATTRIBUTE_GROUP WHERE AttributeGroupLabel='MAIN' AND ATTRIBUTE_GROUP_OBJECT_idr=@ATTRIBUTE_GROUP_OBJECT_idr))
BEGIN
INSERT INTO T_EDIP_ATTRIBUTE_GROUP (ATTRIBUTE_GROUP_OBJECT_idr, AttributeGroupLabel, AttributeGroupDescription, AttributeGroupOrder) VALUES (@ATTRIBUTE_GROUP_OBJECT_idr,'MAIN', 'MAIN', @AttributeGroupOrder)
END
-----------------------------------------------------------------------------------------------------------------------------------------------------
--Adding attribute "Domestic MOD Number" for the group "MAIN" in T_EDIP_ATTRIBUTE(TSD-ESDCR_MOD_DOMESTIC-040 and (TSD-ESDCR_MOD_DOMESTIC-050))
DECLARE @ATTRIBUTE_ATTRIBUTE_GROUP_idr INT
DECLARE @ReducedView INT
DECLARE @AttributeOrder INT
DECLARE @FieldSize INT
DECLARE @MaxLength INT
DECLARE @ReadOnly INT
DECLARE @Mandatory INT
SELECT @ATTRIBUTE_ATTRIBUTE_GROUP_idr=ATTRIBUTE_GROUP_id FROM T_EDIP_ATTRIBUTE_GROUP WHERE AttributeGroupLabel='MAIN' AND ATTRIBUTE_GROUP_OBJECT_idr=@ATTRIBUTE_GROUP_OBJECT_idr
SET @ReducedView=1
SET @AttributeOrder=1
SET @FieldSize=10
SET @MaxLength=6
SET @ReadOnly=0
SET @Mandatory=1
IF (NOT EXISTS(SELECT * FROM T_EDIP_ATTRIBUTE WHERE AttributeLabel='Domestic MOD Number' AND ATTRIBUTE_ATTRIBUTE_GROUP_idr=@ATTRIBUTE_ATTRIBUTE_GROUP_idr))
BEGIN
INSERT INTO T_EDIP_ATTRIBUTE (ATTRIBUTE_ATTRIBUTE_GROUP_idr,AttributeLabel,AttributeName,TableName,SearchType,EditType,ReducedView,AttributeType,AttributeOrder,AttributeDescription,ValuesList,FieldSize,MaxLength,ReadOnly,Mandatory) VALUES (@ATTRIBUTE_ATTRIBUTE_GROUP_idr,'Domestic MOD Number','DomModNumber','T_DOMESTICMOD','text','text',@ReducedView,'text',@AttributeOrder,'DomModNumber',NULL,@FieldSize,@MaxLength,@ReadOnly,@Mandatory)
END
--Give access rights for the attribute "Domestic MOD Number" to "viewer" and "Writer" Role
DECLARE @ATTRIBUTE__CONTEXT_ATTRIBUTE_idr INT
DECLARE @ATTRIBUTE__CONTEXT_CONTEXT_idr INT
DECLARE @AttributeContextReadMode INT
DECLARE @AttributeContextWriteMode INT
SELECT @ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=ATTRIBUTE_id FROM T_EDIP_ATTRIBUTE WHERE AttributeLabel='Domestic MOD Number' AND AttributeName='DomModNumber'
SELECT @ATTRIBUTE__CONTEXT_CONTEXT_idr=CONTEXT_id FROM T_EDIP_CONTEXT WHERE ContextName='admin'
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