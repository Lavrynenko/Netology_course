-- Role Data Admin – Features condition Edit PDDS


DECLARE @FEATURE_id INT

IF EXISTS(SELECT FEATURE_id FROM T_EDIP_FEATURE WHERE FeatureLabel = 'Edit' AND FeatureDescription = 'Edit a PDDS')
BEGIN
SELECT @FEATURE_id = FEATURE_id FROM T_EDIP_FEATURE WHERE FeatureLabel = 'Edit' AND FeatureDescription = 'Edit a PDDS'

UPDATE T_EDIP_FEATURE SET WhereClause = 'SELECT * FROM T_PDDS 
INNER JOIN T_DOMAIN ON DomainName = PDDSDomain 
INNER JOIN T_LINK_CONTEXT__DOMAIN ON CONTEXT__DOMAIN_DOMAIN_idr = DOMAIN_id             
INNER JOIN T_LINK_CONTEXT__USER ON CONTEXT__USER_CONTEXT_idr = CONTEXT__DOMAIN_CONTEXT_idr 
WHERE id_pdds = #data_id#             
AND ((pdds_Status = ''WIP'') OR (pdds_Status = ''PREVIEW'') OR (pdds_Status = ''RELEASED'' AND CONTEXT__USER_CONTEXT_idr=(SELECT CONTEXT_id from T_EDIP_CONTEXT where ContextName=''A400M_Admin_Data'')) )             
AND ContextDomainWriteMode = 1             
AND CONTEXT__USER_USER_idr = #USER_id#' WHERE FEATURE_id = @FEATURE_id
END




