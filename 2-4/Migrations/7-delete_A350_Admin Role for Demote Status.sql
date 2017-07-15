-----------------------------------------------------------------------------------
--Access rights to the role Admin for feature Demote Status BD/FD
-----------------------------------------------------------------------------------
--Access rights to the role Admin for feature Demote Status BD/FD
DECLARE @CONTEXT_id int
DECLARE @FEATURE_id int
select @CONTEXT_id= CONTEXT_id from T_EDIP_CONTEXT where ContextName='Admin'
select @FEATURE_id=FEATURE_id from T_EDIP_FEATURE where FeatureLabel='Demote Status'

IF (  EXISTS(select * from T_EDIP_LINK_CONTEXT__FEATURE where CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT_id AND CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id))
BEGIN
DELETE from  T_EDIP_LINK_CONTEXT__FEATURE where CONTEXT__FEATURE_FEATURE_idr=@FEATURE_id

END
ELSE
BEGIN
INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (CONTEXT__FEATURE_CONTEXT_idr,CONTEXT__FEATURE_FEATURE_idr,ContextFeatureAvailability) VALUES (@CONTEXT_id,@FEATURE_id,1)
END


