-- **** ADD NEW ATTRIBUTE ****
IF
(
	NOT exists (select * from syscolumns where syscolumns.id = (select sysobjects.id from sysobjects where name = 'T_USER') and syscolumns.name  = 'UserProjectTeam')
)
BEGIN
	--Alter The table
	ALTER TABLE T_USER ADD UserProjectTeam  VARCHAR(50) DEFAULT NULL
END

IF
(
	NOT exists (select * from syscolumns where syscolumns.id = (select sysobjects.id from sysobjects where name = 'T_USER') and syscolumns.name  = 'UserDesignOfficeDescription')
)
BEGIN
	--Alter The table
	ALTER TABLE T_USER ADD UserDesignOfficeDescription  VARCHAR(50) DEFAULT NULL
END

IF
(
	NOT exists (select * from syscolumns where syscolumns.id = (select sysobjects.id from sysobjects where name = 'T_USER') and syscolumns.name  = 'UserWorkPackage')
)
BEGIN
	--Alter The table
	ALTER TABLE T_USER ADD UserWorkPackage  VARCHAR(50) DEFAULT NULL
END

IF
(
	NOT exists (select * from syscolumns where syscolumns.id = (select sysobjects.id from sysobjects where name = 'T_USER') and syscolumns.name  = 'UserReleaseNumber')
)
BEGIN
	--Alter The table
	ALTER TABLE T_USER ADD UserReleaseNumber  VARCHAR(50) DEFAULT NULL
END

IF
(
	NOT exists (select * from syscolumns where syscolumns.id = (select sysobjects.id from sysobjects where name = 'T_USER') and syscolumns.name  = 'UserModRelOrig')
)
BEGIN
	--Alter The table
	ALTER TABLE T_USER ADD UserModRelOrig  VARCHAR(50) DEFAULT NULL
END

-- **** ADD RIGHTS TO USER OBJECT ****
DELETE FROM 
	T_EDIP_LINK_ATTRIBUTE__CONTEXT
WHERE 
	ATTRIBUTE__CONTEXT_CONTEXT_idr in (SELECT CONTEXT_id FROM T_EDIP_CONTEXT WHERE ContextName IN ('A350_Compiler','A350_Compiler_CIRCE-C','A350_Designer_SYSTEM','A400M_Compiler','A400M_Compiler_CIRCE-C','A400M_Designer_SYSTEM','A380_Compiler','A380_Compiler_CIRCE-C','A380_Designer_SYSTEM'))
	AND
	ATTRIBUTE__CONTEXT_ATTRIBUTE_idr in (SELECT ATTRIBUTE_id FROM T_EDIP_ATTRIBUTE WHERE AttributeName IN ('UserProjectTeam','UserDesignOfficeDescription','UserWorkPackage','UserReleaseNumber','UserModRelOrig'));

-- **** DELETE FROM T_EDIP_ATTRIBUTE ****
DELETE FROM
	T_EDIP_ATTRIBUTE
WHERE
	AttributeName IN ('UserProjectTeam','UserDesignOfficeDescription','UserWorkPackage','UserReleaseNumber','UserModRelOrig')


-- **** ADD 'ECN Default Values' ATTRIBUTE GROUP ****
DECLARE @ObjectIdUSER int
DECLARE @ECNIdUSER int

SELECT
	@ObjectIdUSER =  OBJECT_id
FROM
	T_EDIP_OBJECT
WHERE
	ObjectLabel = 'USER'

IF NOT EXISTS (SELECT * FROM T_EDIP_ATTRIBUTE_GROUP WHERE AttributeGroupLabel = 'ECN Default Values' AND ATTRIBUTE_GROUP_OBJECT_idr = (SELECT @ObjectIdUSER))
BEGIN
	INSERT INTO
		T_EDIP_ATTRIBUTE_GROUP
		(ATTRIBUTE_GROUP_OBJECT_idr,AttributeGroupLabel,AttributeGroupDescription,AttributeGroupOrder)
	SELECT
		@ObjectIdUSER,
		'ECN Default Values',
		'ECN Default Values', 
		MAX(AttributeGroupOrder) + 1
	FROM
		T_EDIP_ATTRIBUTE_GROUP
	WHERE
		ATTRIBUTE_GROUP_OBJECT_idr = @ObjectIdUSER	
END
SELECT @ECNIdUSER = ATTRIBUTE_GROUP_id FROM T_EDIP_ATTRIBUTE_GROUP WHERE AttributeGroupLabel = 'ECN Default Values' AND ATTRIBUTE_GROUP_OBJECT_idr = @ObjectIdUSER;



-- **** ADD ATTRIBUTES IN T_EDIP_ATTRIBUTE ****
INSERT INTO
	T_EDIP_ATTRIBUTE(ATTRIBUTE_ATTRIBUTE_GROUP_idr,AttributeLabel,AttributeName,TableName,SearchType,EditType,ReducedView,AttributeType,AttributeOrder,FieldSize,MaxLength,ReadOnly)
SELECT 
	@ECNIdUSER,'Project team','UserProjectTeam','T_USER','text','text',0,'text',8,13,13,0;

INSERT INTO
	T_EDIP_ATTRIBUTE(ATTRIBUTE_ATTRIBUTE_GROUP_idr,AttributeLabel,AttributeName,TableName,SearchType,EditType,ReducedView,AttributeType,AttributeOrder,FieldSize,MaxLength,ReadOnly) 
SELECT 
	@ECNIdUSER,'Design office description','UserDesignOfficeDescription','T_USER','text','text',0,'text',9,21,21,0;

INSERT INTO
	T_EDIP_ATTRIBUTE(ATTRIBUTE_ATTRIBUTE_GROUP_idr,AttributeLabel,AttributeName,TableName,SearchType,EditType,ReducedView,AttributeType,AttributeOrder,FieldSize,MaxLength,ReadOnly) 
SELECT 
	@ECNIdUSER,'Work Package','UserWorkPackage','T_USER','text','text',0,'text',10,10,10,0;

INSERT INTO
	T_EDIP_ATTRIBUTE(ATTRIBUTE_ATTRIBUTE_GROUP_idr,AttributeLabel,AttributeName,TableName,SearchType,EditType,ReducedView,AttributeType,AttributeOrder,FieldSize,MaxLength,ReadOnly) 
SELECT 
	@ECNIdUSER,'Release Number','UserReleaseNumber','T_USER','text','text',0,'text',11,16,16,0;

INSERT INTO
	T_EDIP_ATTRIBUTE(ATTRIBUTE_ATTRIBUTE_GROUP_idr,AttributeLabel,AttributeName,TableName,SearchType,EditType,ReducedView,AttributeType,AttributeOrder,FieldSize,MaxLength,ValuesList,ReadOnly) 
SELECT 
	@ECNIdUSER,'MOD Rel Orig','UserModRelOrig','T_USER','list','list',0,'text',12,20,20,';NEW DEFINITION;DO EVOLUTION',0;
	


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
		1
	FROM
		T_EDIP_ATTRIBUTE,
		T_EDIP_CONTEXT
	WHERE
		AttributeName IN ('UserProjectTeam','UserDesignOfficeDescription','UserWorkPackage','UserReleaseNumber','UserModRelOrig')
		AND
		ContextName IN ('A350_Compiler','A350_Compiler_CIRCE-C','A350_Designer_SYSTEM','A400M_Compiler','A400M_Compiler_CIRCE-C','A400M_Designer_SYSTEM','A380_Compiler','A380_Compiler_CIRCE-C','A380_Designer_SYSTEM')
		
