-- Role Data Admin – Features condition Edit FDDS


DECLARE @FEATURE_id INT

IF EXISTS(SELECT FEATURE_id FROM T_EDIP_FEATURE WHERE FeatureLabel = 'Edit' AND FeatureDescription = 'Edit a FDDS')
BEGIN
SELECT @FEATURE_id = FEATURE_id FROM T_EDIP_FEATURE WHERE FeatureLabel = 'Edit' AND FeatureDescription = 'Edit a FDDS'

UPDATE T_EDIP_FEATURE SET WhereClause = 'SELECT * FROM T_FDDS 
INNER JOIN T_DOMAIN     ON DomainName = FDDSDomain    
INNER JOIN T_LINK_CONTEXT__DOMAIN  ON CONTEXT__DOMAIN_DOMAIN_idr = DOMAIN_id    
INNER JOIN T_LINK_CONTEXT__USER      ON CONTEXT__USER_CONTEXT_idr = CONTEXT__DOMAIN_CONTEXT_idr  
WHERE   FDDS_id = #data_id#   
AND 
(
  (
    ((FDDSStatus = ''WIP'')OR (FDDSStatus = ''PREVIEW'')) 
	AND CONTEXT__USER_CONTEXT_idr NOT in(SELECT CONTEXT_id FROM T_EDIP_CONTEXT WHERE ContextName  in (''A350_DDC_Checker'',''A400M_DDC_Checker''))
  )
  OR 
  ( FDDSStatus = ''HELD'' AND CONTEXT__USER_CONTEXT_idr in((SELECT CONTEXT_id FROM T_EDIP_CONTEXT WHERE ContextName in (''A350_DDC_Checker'',''A400M_DDC_Checker'')))    )
  OR 
  ( FDDSStatus = ''RELEASED'' AND CONTEXT__USER_CONTEXT_idr in(SELECT CONTEXT_id FROM T_EDIP_CONTEXT WHERE ContextName=''A380_Admin_Data''))
 )
 AND ContextDomainWriteMode = 1   AND CONTEXT__USER_USER_idr = #USER_id#' WHERE FEATURE_id = @FEATURE_id
END




