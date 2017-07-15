--Update role A400M_Designer to A400M_Compiler
IF EXISTS( select * from T_EDIP_CONTEXT where ContextName='A400M_Designer')
BEGIN
UPDATE T_EDIP_CONTEXT SET ContextName='A400M_Compiler' where ContextName='A400M_Designer'
END
ELSE IF (NOT EXISTS (select * from T_EDIP_CONTEXT where ContextName='A400M_Compiler'))
BEGIN
INSERT INTO T_EDIP_CONTEXT (ContextName,ContextType,ContextPowerValue) VALUES ('A400M_Compiler',1,1) 
END
-----------------------------------------------------------------------------------
--Access rights to the role A400M_Compiler for feature Vault a PD/WD
DECLARE @CONTEXT_id int
DECLARE @FEATURE_id int
select @CONTEXT_id= CONTEXT_id from T_EDIP_CONTEXT where ContextName='A400M_Compiler'
select @FEATURE_id=FEATURE_id from T_EDIP_FEATURE where FeatureLabel='Vault a PD/WD'

IF ( NOT EXISTS(select * from T_EDIP_LINK_CONTEXT__FEATURE where CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id))
BEGIN
INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (CONTEXT__FEATURE_CONTEXT_idr,CONTEXT__FEATURE_FEATURE_idr,ContextFeatureAvailability) VALUES (@CONTEXT_id,@FEATURE_id,1)

END
ELSE
BEGIN
UPDATE T_EDIP_LINK_CONTEXT__FEATURE SET ContextFeatureAvailability=1 WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id
END
-----------------------------------------------------------------------------
--Access rights to the role A400M_Compiler for feature Quality Result PD

select @CONTEXT_id= CONTEXT_id from T_EDIP_CONTEXT where ContextName='A400M_Compiler'
select @FEATURE_id=FEATURE_id from T_EDIP_FEATURE where FeatureLabel='Quality Result PD'

IF ( NOT EXISTS(select * from T_EDIP_LINK_CONTEXT__FEATURE where CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id))
BEGIN
INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (CONTEXT__FEATURE_CONTEXT_idr,CONTEXT__FEATURE_FEATURE_idr,ContextFeatureAvailability) VALUES (@CONTEXT_id,@FEATURE_id,1)

END
ELSE
BEGIN
UPDATE T_EDIP_LINK_CONTEXT__FEATURE SET ContextFeatureAvailability=1 WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id
END
-----------------------------------------------------------------------------
--Access rights to the role A400M_Compiler for feature All Quality Result PD

select @CONTEXT_id= CONTEXT_id from T_EDIP_CONTEXT where ContextName='A400M_Compiler'
select @FEATURE_id=FEATURE_id from T_EDIP_FEATURE where FeatureLabel='All Quality Result PD'

IF ( NOT EXISTS(select * from T_EDIP_LINK_CONTEXT__FEATURE where CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id))
BEGIN
INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (CONTEXT__FEATURE_CONTEXT_idr,CONTEXT__FEATURE_FEATURE_idr,ContextFeatureAvailability) VALUES (@CONTEXT_id,@FEATURE_id,1)

END
ELSE
BEGIN
UPDATE T_EDIP_LINK_CONTEXT__FEATURE SET ContextFeatureAvailability=1 WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id
END
-----------------------------------------------------------------------------
--Access rights to the role A400M_Compiler for feature Batch change state PD

select @CONTEXT_id= CONTEXT_id from T_EDIP_CONTEXT where ContextName='A400M_Compiler'
select @FEATURE_id=FEATURE_id from T_EDIP_FEATURE where FeatureLabel='Batch change state PD'

IF ( NOT EXISTS(select * from T_EDIP_LINK_CONTEXT__FEATURE where CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id))
BEGIN
INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (CONTEXT__FEATURE_CONTEXT_idr,CONTEXT__FEATURE_FEATURE_idr,ContextFeatureAvailability) VALUES (@CONTEXT_id,@FEATURE_id,1)

END
ELSE
BEGIN
UPDATE T_EDIP_LINK_CONTEXT__FEATURE SET ContextFeatureAvailability=1 WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id
END
-----------------------------------------------------------------------------
--Access rights to the role A400M_Compiler for feature Batch change state WD

select @CONTEXT_id= CONTEXT_id from T_EDIP_CONTEXT where ContextName='A400M_Compiler'
select @FEATURE_id=FEATURE_id from T_EDIP_FEATURE where FeatureLabel='Batch change state WD'

IF ( NOT EXISTS(select * from T_EDIP_LINK_CONTEXT__FEATURE where CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id))
BEGIN
INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (CONTEXT__FEATURE_CONTEXT_idr,CONTEXT__FEATURE_FEATURE_idr,ContextFeatureAvailability) VALUES (@CONTEXT_id,@FEATURE_id,1)

END
ELSE
BEGIN
UPDATE T_EDIP_LINK_CONTEXT__FEATURE SET ContextFeatureAvailability=1 WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id
END
-----------------------------------------------------------------------------
--Access rights to the role A400M_Compiler for feature Batch request validation PD

select @CONTEXT_id= CONTEXT_id from T_EDIP_CONTEXT where ContextName='A400M_Compiler'
select @FEATURE_id=FEATURE_id from T_EDIP_FEATURE where FeatureLabel='Batch request validation PD'

IF ( NOT EXISTS(select * from T_EDIP_LINK_CONTEXT__FEATURE where CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id))
BEGIN
INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (CONTEXT__FEATURE_CONTEXT_idr,CONTEXT__FEATURE_FEATURE_idr,ContextFeatureAvailability) VALUES (@CONTEXT_id,@FEATURE_id,1)

END
ELSE
BEGIN
UPDATE T_EDIP_LINK_CONTEXT__FEATURE SET ContextFeatureAvailability=1 WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id
END
-----------------------------------------------------------------------------
--Access rights to the role A400M_Compiler for feature Batch request validation WD

select @CONTEXT_id= CONTEXT_id from T_EDIP_CONTEXT where ContextName='A400M_Compiler'
select @FEATURE_id=FEATURE_id from T_EDIP_FEATURE where FeatureLabel='Batch request validation WD'

IF ( NOT EXISTS(select * from T_EDIP_LINK_CONTEXT__FEATURE where CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id))
BEGIN
INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (CONTEXT__FEATURE_CONTEXT_idr,CONTEXT__FEATURE_FEATURE_idr,ContextFeatureAvailability) VALUES (@CONTEXT_id,@FEATURE_id,1)

END
ELSE
BEGIN
UPDATE T_EDIP_LINK_CONTEXT__FEATURE SET ContextFeatureAvailability=1 WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id
END
---------------------------------------------------------------------------------
