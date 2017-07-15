-- **** ADD NEW ATTRIBUTE ****
IF
(
	NOT exists (select * from syscolumns where syscolumns.id = (select sysobjects.id from sysobjects where name = 'T_BDDS') and syscolumns.name  = 'BDDSMODStacking')
)
BEGIN
	--Alter The table
	ALTER TABLE T_BDDS ADD BDDSMODStacking AS (nullif(([BDDSMOD]+space((1)))+[BDDSAdditionalMod],space((1))))
END

IF
(
	NOT exists (select * from syscolumns where syscolumns.id = (select sysobjects.id from sysobjects where name = 'T_FDDS') and syscolumns.name  = 'FDDSMODStacking')
)
BEGIN
	--Alter The table
	ALTER TABLE T_FDDS ADD FDDSMODStacking  AS (nullif(([FDDSMOD]+space((1)))+[FDDSAdditionalMod],space((1))))
END

IF
(
	NOT exists (select * from syscolumns where syscolumns.id = (select sysobjects.id from sysobjects where name = 'T_PDDS') and syscolumns.name  = 'PDDSMODStacking')
)
BEGIN
	--Alter The table
	ALTER TABLE T_PDDS ADD PDDSMODStacking  AS (nullif(([pdds_mainMod]+space((1)))+[PDDSAdditionalMod],space((1))))
END

IF
(
	NOT exists (select * from syscolumns where syscolumns.id = (select sysobjects.id from sysobjects where name = 'T_WDDS') and syscolumns.name  = 'WDDSMODStacking')
)
BEGIN
	--Alter The table
	ALTER TABLE T_WDDS ADD WDDSMODStacking  AS (nullif(([wdds_mainMod]+space((1)))+[WDDSAdditionalMod],space((1))))
END


-- **** ADD RIGHTS TO USER OBJECT ****
DELETE FROM 
	T_EDIP_LINK_ATTRIBUTE__CONTEXT
WHERE 
	ATTRIBUTE__CONTEXT_CONTEXT_idr in (SELECT CONTEXT_id FROM T_EDIP_CONTEXT WHERE ContextName IN ('A400M_Viewer_SYSTEM','A350_Viewer_SYSTEM','A380_Viewer_SYSTEM', 'Admin_SYSTEM', 'A400M_Designer_SYSTEM', 'A350_Designer_SYSTEM', 'A380_Designer_SYSTEM'))
	AND
	ATTRIBUTE__CONTEXT_ATTRIBUTE_idr in (SELECT ATTRIBUTE_id FROM T_EDIP_ATTRIBUTE WHERE AttributeName IN ('BDDSMODStacking','FDDSMODStacking'));

DELETE FROM 
	T_EDIP_LINK_ATTRIBUTE__CONTEXT
WHERE 
	ATTRIBUTE__CONTEXT_CONTEXT_idr in (SELECT CONTEXT_id FROM T_EDIP_CONTEXT WHERE ContextName IN ('A400M_Viewer_DO','A400M_Viewer_FTI','A400M_Viewer_Labo','A350_Viewer_DO','A350_Viewer_FTI','A350_Viewer_Labo','A380_Viewer_DO','A380_Viewer_FTI','A380_Viewer_Labo', 'admin', 'A350_Compiler', 'A400M_Compiler', 'A380_Compiler'))
	AND
	ATTRIBUTE__CONTEXT_ATTRIBUTE_idr in (SELECT ATTRIBUTE_id FROM T_EDIP_ATTRIBUTE WHERE AttributeName IN ('PDDSMODStacking','WDDSMODStacking'));


-- **** DELETE FROM T_EDIP_ATTRIBUTE ****
DELETE FROM
	T_EDIP_ATTRIBUTE
WHERE
	AttributeName IN ('BDDSMODStacking','FDDSMODStacking','PDDSMODStacking','WDDSMODStacking')


-- **** GET ATTRIBUTE GROUPS ****
DECLARE @ObjectIdBDDS int
DECLARE @GroupIdBDDS int

DECLARE @ObjectIdFDDS int
DECLARE @GroupIdFDDS int

DECLARE @ObjectIdPDDS int
DECLARE @GroupIdPDDS int

DECLARE @ObjectIdWDDS int
DECLARE @GroupIdWDDS int

SELECT
	@ObjectIdBDDS =  OBJECT_id
FROM
	T_EDIP_OBJECT
WHERE
	ObjectLabel = 'BDDS'

SELECT @GroupIdBDDS = ATTRIBUTE_GROUP_id FROM T_EDIP_ATTRIBUTE_GROUP WHERE AttributeGroupLabel = 'Main' AND ATTRIBUTE_GROUP_OBJECT_idr = @ObjectIdBDDS;


SELECT
	@ObjectIdFDDS =  OBJECT_id
FROM
	T_EDIP_OBJECT
WHERE
	ObjectLabel = 'FDDS'

SELECT @GroupIdFDDS = ATTRIBUTE_GROUP_id FROM T_EDIP_ATTRIBUTE_GROUP WHERE AttributeGroupLabel = 'Main' AND ATTRIBUTE_GROUP_OBJECT_idr = @ObjectIdFDDS;


SELECT
	@ObjectIdPDDS =  OBJECT_id
FROM
	T_EDIP_OBJECT
WHERE
	ObjectLabel = 'PDDS'

SELECT @GroupIdPDDS = ATTRIBUTE_GROUP_id FROM T_EDIP_ATTRIBUTE_GROUP WHERE AttributeGroupLabel = 'Main' AND ATTRIBUTE_GROUP_OBJECT_idr = @ObjectIdPDDS;


SELECT
	@ObjectIdWDDS =  OBJECT_id
FROM
	T_EDIP_OBJECT
WHERE
	ObjectLabel = 'WDDS'

SELECT @GroupIdWDDS = ATTRIBUTE_GROUP_id FROM T_EDIP_ATTRIBUTE_GROUP WHERE AttributeGroupLabel = 'Main' AND ATTRIBUTE_GROUP_OBJECT_idr = @ObjectIdWDDS;


-- **** ADD ATTRIBUTES IN T_EDIP_ATTRIBUTE ****
INSERT INTO
	T_EDIP_ATTRIBUTE(ATTRIBUTE_ATTRIBUTE_GROUP_idr,AttributeLabel,AttributeName,TableName,SearchType,EditType,ReducedView,AttributeType,AttributeOrder,FieldSize,MaxLength,ReadOnly)
SELECT 
	@GroupIdBDDS,'MOD Stacking','BDDSMODStacking','T_BDDS','text','text',0,'text',11,100,8000,1;

INSERT INTO
	T_EDIP_ATTRIBUTE(ATTRIBUTE_ATTRIBUTE_GROUP_idr,AttributeLabel,AttributeName,TableName,SearchType,EditType,ReducedView,AttributeType,AttributeOrder,FieldSize,MaxLength,ReadOnly)
SELECT 
	@GroupIdFDDS,'MOD Stacking','FDDSMODStacking','T_FDDS','text','text',0,'text',11,100,8000,1;
	
INSERT INTO
	T_EDIP_ATTRIBUTE(ATTRIBUTE_ATTRIBUTE_GROUP_idr,AttributeLabel,AttributeName,TableName,SearchType,EditType,ReducedView,AttributeType,AttributeOrder,FieldSize,MaxLength,ReadOnly)
SELECT 
	@GroupIdPDDS,'MOD Stacking','PDDSMODStacking','T_PDDS','text','text',0,'text',23,100,8000,1;

INSERT INTO
	T_EDIP_ATTRIBUTE(ATTRIBUTE_ATTRIBUTE_GROUP_idr,AttributeLabel,AttributeName,TableName,SearchType,EditType,ReducedView,AttributeType,AttributeOrder,FieldSize,MaxLength,ReadOnly)
SELECT 
	@GroupIdWDDS,'MOD Stacking','WDDSMODStacking','T_WDDS','text','text',0,'text',23,100,8000,1;

-- **** ADD RIGTHS TO USER OBJECT ****
INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(
	ATTRIBUTE__CONTEXT_ATTRIBUTE_idr,
	ATTRIBUTE__CONTEXT_CONTEXT_idr,
	AttributeContextReadMode,
	AttributeContextWriteMode
) 
	SELECT 
		ATTRIBUTE_id,
		CONTEXT_id,
		1,
		0
	FROM
		T_EDIP_ATTRIBUTE,
		T_EDIP_CONTEXT
	WHERE
		AttributeName IN ('BDDSMODStacking','FDDSMODStacking')
		AND
		ContextName IN ('A400M_Viewer_SYSTEM','A350_Viewer_SYSTEM','A380_Viewer_SYSTEM')

INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(
	ATTRIBUTE__CONTEXT_ATTRIBUTE_idr,
	ATTRIBUTE__CONTEXT_CONTEXT_idr,
	AttributeContextReadMode,
	AttributeContextWriteMode
) 
	SELECT 
		ATTRIBUTE_id,
		CONTEXT_id,
		1,
		0
	FROM
		T_EDIP_ATTRIBUTE,
		T_EDIP_CONTEXT
	WHERE
		AttributeName IN ('PDDSMODStacking','WDDSMODStacking')
		AND
		ContextName IN ('A400M_Viewer_DO','A400M_Viewer_FTI','A400M_Viewer_Labo','A350_Viewer_DO','A350_Viewer_FTI','A350_Viewer_Labo','A380_Viewer_DO','A380_Viewer_FTI','A380_Viewer_Labo')

INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(
	ATTRIBUTE__CONTEXT_ATTRIBUTE_idr,
	ATTRIBUTE__CONTEXT_CONTEXT_idr,
	AttributeContextReadMode,
	AttributeContextWriteMode
) 
	SELECT 
		ATTRIBUTE_id,
		CONTEXT_id,
		1,
		1
	FROM
		T_EDIP_ATTRIBUTE,
		T_EDIP_CONTEXT
	WHERE
		AttributeName IN ('BDDSMODStacking','FDDSMODStacking')
		AND
		ContextName IN ('Admin_SYSTEM', 'A400M_Designer_SYSTEM', 'A350_Designer_SYSTEM', 'A380_Designer_SYSTEM')

INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(
	ATTRIBUTE__CONTEXT_ATTRIBUTE_idr,
	ATTRIBUTE__CONTEXT_CONTEXT_idr,
	AttributeContextReadMode,
	AttributeContextWriteMode
) 
	SELECT 
		ATTRIBUTE_id,
		CONTEXT_id,
		1,
		0
	FROM
		T_EDIP_ATTRIBUTE,
		T_EDIP_CONTEXT
	WHERE
		AttributeName IN ('PDDSMODStacking','WDDSMODStacking')
		AND
		ContextName IN ('admin', 'A350_Compiler', 'A400M_Compiler', 'A380_Compiler')
