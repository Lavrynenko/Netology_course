--Update role A400M_Circuit_Checker to A400M_Approver
IF EXISTS( select * from T_EDIP_CONTEXT where ContextName='A400M_Circuit_Checker')
BEGIN
UPDATE T_EDIP_CONTEXT SET ContextName='A400M_Approver' where ContextName='A400M_Circuit_Checker'
END
ELSE IF (NOT EXISTS (select * from T_EDIP_CONTEXT where ContextName='A400M_Approver'))
BEGIN
INSERT INTO T_EDIP_CONTEXT (ContextName,ContextType,ContextPowerValue) VALUES ('A400M_Approver',1,1) 
END
-----------------------------------------------------------------------------------
--Access rights to the role A400M_Approver for feature Review PD (APP) or Review PDDS (CC) 
DECLARE @CONTEXT_id int
DECLARE @FEATURE_id int
select @CONTEXT_id= CONTEXT_id from T_EDIP_CONTEXT where ContextName='A400M_Approver'
select @FEATURE_id=FEATURE_id from T_EDIP_FEATURE where FeatureLabel='Review PD (APP)'

IF ( NOT EXISTS(select * from T_EDIP_LINK_CONTEXT__FEATURE where CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id))
BEGIN
INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (CONTEXT__FEATURE_CONTEXT_idr,CONTEXT__FEATURE_FEATURE_idr,ContextFeatureAvailability) VALUES (@CONTEXT_id,@FEATURE_id,1)

END
ELSE
BEGIN
UPDATE T_EDIP_LINK_CONTEXT__FEATURE SET ContextFeatureAvailability=1 WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id
END
-----------------------------------------------------------------------------
--Access rights to the role A400M_Approver for feature Approve WD or Review WDDS

select @CONTEXT_id= CONTEXT_id from T_EDIP_CONTEXT where ContextName='A400M_Approver'
select @FEATURE_id=FEATURE_id from T_EDIP_FEATURE where FeatureLabel='Review WD'

IF ( NOT EXISTS(select * from T_EDIP_LINK_CONTEXT__FEATURE where CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id))
BEGIN
INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (CONTEXT__FEATURE_CONTEXT_idr,CONTEXT__FEATURE_FEATURE_idr,ContextFeatureAvailability) VALUES (@CONTEXT_id,@FEATURE_id,1)

END
ELSE
BEGIN
UPDATE T_EDIP_LINK_CONTEXT__FEATURE SET ContextFeatureAvailability=1 WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id
END
-----------------------------------------------------------------------------
--Access rights to the role A400M_Approver for feature Batch Review PD (APP) or Batch Review PDDS (CC)

select @CONTEXT_id= CONTEXT_id from T_EDIP_CONTEXT where ContextName='A400M_Approver'
select @FEATURE_id=FEATURE_id from T_EDIP_FEATURE where FeatureLabel='Batch Review PD (APP)'

IF ( NOT EXISTS(select * from T_EDIP_LINK_CONTEXT__FEATURE where CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id))
BEGIN
INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (CONTEXT__FEATURE_CONTEXT_idr,CONTEXT__FEATURE_FEATURE_idr,ContextFeatureAvailability) VALUES (@CONTEXT_id,@FEATURE_id,1)

END
ELSE
BEGIN
UPDATE T_EDIP_LINK_CONTEXT__FEATURE SET ContextFeatureAvailability=1 WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id
END
-----------------------------------------------------------------------------
--Access rights to the role A400M_Approver for feature Batch Review WD or Batch Review WDDS

select @CONTEXT_id= CONTEXT_id from T_EDIP_CONTEXT where ContextName='A400M_Approver'
select @FEATURE_id=FEATURE_id from T_EDIP_FEATURE where FeatureLabel='Batch Review WD'

IF ( NOT EXISTS(select * from T_EDIP_LINK_CONTEXT__FEATURE where CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id))
BEGIN
INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (CONTEXT__FEATURE_CONTEXT_idr,CONTEXT__FEATURE_FEATURE_idr,ContextFeatureAvailability) VALUES (@CONTEXT_id,@FEATURE_id,1)

END
ELSE
BEGIN
UPDATE T_EDIP_LINK_CONTEXT__FEATURE SET ContextFeatureAvailability=1 WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id
END
-----------------------------------------------------------------------------
--Access rights to the role A400M_Approver for feature Stop Validate Process PD
DECLARE @FEATURE_FEATURE_GROUP_id INT
select @CONTEXT_id= CONTEXT_id from T_EDIP_CONTEXT where ContextName='A400M_Approver'
select @FEATURE_FEATURE_GROUP_id= FEATURE_GROUP_id from T_EDIP_FEATURE_GROUP where FeatureGroupLabel='PDDS'
select @FEATURE_id=FEATURE_id from T_EDIP_FEATURE where FeatureLabel='Stop Validate Process' AND FEATURE_FEATURE_GROUP_idr=@FEATURE_FEATURE_GROUP_id

IF ( NOT EXISTS(select * from T_EDIP_LINK_CONTEXT__FEATURE where CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id))
BEGIN
INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (CONTEXT__FEATURE_CONTEXT_idr,CONTEXT__FEATURE_FEATURE_idr,ContextFeatureAvailability) VALUES (@CONTEXT_id,@FEATURE_id,1)

END
ELSE
BEGIN
UPDATE T_EDIP_LINK_CONTEXT__FEATURE SET ContextFeatureAvailability=1 WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id
END
-----------------------------------------------------------------------------
--Access rights to the role A400M_Approver for feature Stop Validate Process WD

select @CONTEXT_id= CONTEXT_id from T_EDIP_CONTEXT where ContextName='A400M_Approver'
select @FEATURE_FEATURE_GROUP_id= FEATURE_GROUP_id from T_EDIP_FEATURE_GROUP where FeatureGroupLabel='WDDS'
select @FEATURE_id=FEATURE_id from T_EDIP_FEATURE where FeatureLabel='Stop Validate Process' AND FEATURE_FEATURE_GROUP_idr=@FEATURE_FEATURE_GROUP_id
IF ( NOT EXISTS(select * from T_EDIP_LINK_CONTEXT__FEATURE where CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id))
BEGIN
INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (CONTEXT__FEATURE_CONTEXT_idr,CONTEXT__FEATURE_FEATURE_idr,ContextFeatureAvailability) VALUES (@CONTEXT_id,@FEATURE_id,1)

END
ELSE
BEGIN
UPDATE T_EDIP_LINK_CONTEXT__FEATURE SET ContextFeatureAvailability=1 WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id
END
-----------------------------------------------------------------------------
--Access rights to the role A400M_Approver for feature Load in CIRCE PD

select @CONTEXT_id= CONTEXT_id from T_EDIP_CONTEXT where ContextName='A400M_Approver'
select @FEATURE_FEATURE_GROUP_id= FEATURE_GROUP_id from T_EDIP_FEATURE_GROUP where FeatureGroupLabel='PDDS'
select @FEATURE_id=FEATURE_id from T_EDIP_FEATURE where FeatureLabel='Load in CIRCE' AND FEATURE_FEATURE_GROUP_idr=@FEATURE_FEATURE_GROUP_id
IF ( NOT EXISTS(select * from T_EDIP_LINK_CONTEXT__FEATURE where CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id))
BEGIN
INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (CONTEXT__FEATURE_CONTEXT_idr,CONTEXT__FEATURE_FEATURE_idr,ContextFeatureAvailability) VALUES (@CONTEXT_id,@FEATURE_id,1)

END
ELSE
BEGIN
UPDATE T_EDIP_LINK_CONTEXT__FEATURE SET ContextFeatureAvailability=1 WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id
END
---------------------------------------------------------------------------------
-----------------------------------------------------------------------------
--Access rights to the role A400M_Approver for feature Load in CIRCE WD

select @CONTEXT_id= CONTEXT_id from T_EDIP_CONTEXT where ContextName='A400M_Approver'
select @FEATURE_FEATURE_GROUP_id= FEATURE_GROUP_id from T_EDIP_FEATURE_GROUP where FeatureGroupLabel='WDDS'
select @FEATURE_id=FEATURE_id from T_EDIP_FEATURE where FeatureLabel='Load in CIRCE' AND FEATURE_FEATURE_GROUP_idr=@FEATURE_FEATURE_GROUP_id
IF ( NOT EXISTS(select * from T_EDIP_LINK_CONTEXT__FEATURE where CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id))
BEGIN
INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (CONTEXT__FEATURE_CONTEXT_idr,CONTEXT__FEATURE_FEATURE_idr,ContextFeatureAvailability) VALUES (@CONTEXT_id,@FEATURE_id,1)

END
ELSE
BEGIN
UPDATE T_EDIP_LINK_CONTEXT__FEATURE SET ContextFeatureAvailability=1 WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id
END
---------------------------------------------------------------------------------




-- RENAME prg_Designer_CIRCE-C in prg_Compiler_CIRCE-C
UPDATE T_EDIP_CONTEXT SET ContextName='A400M_Compiler_CIRCE-C' where ContextName='A400M_Designer_CIRCE-C'

