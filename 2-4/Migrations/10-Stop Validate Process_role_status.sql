
------------------------------------------------------------------------
-- MANAGE ATTRIBUTES 
-- 
-- @program		A400M
-- @version		5.0
-- @module		ESDCR
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Update ValueList: ”Stop Validate Process” roles

/*The features are:

•	Stop Validation Process (For PDDS)
•	Stop Validation Process (For WDDS)

This feature is assigned to the roles A400M_Approver.  */

------------------------------------------------------------------------

DECLARE @CONTEXT__FEATURE_CONTEXT_idr1 INT
DECLARE @CONTEXT__FEATURE_FEATURE_idr1 INT
SELECT @CONTEXT__FEATURE_CONTEXT_idr1= CONTEXT_id FROM T_EDIP_CONTEXT WHERE ContextName='A400M_Approver'
SELECT @CONTEXT__FEATURE_FEATURE_idr1= FEATURE_id FROM T_EDIP_FEATURE WHERE FeatureLabel='Stop Validate Process' AND DisplayContext = ';detail_form/pdds;'

IF (NOT EXISTS(	SELECT * FROM T_EDIP_LINK_CONTEXT__FEATURE WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT__FEATURE_CONTEXT_idr1 AND CONTEXT__FEATURE_FEATURE_idr=@CONTEXT__FEATURE_FEATURE_idr1)
) BEGIN
	INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE VALUES (@CONTEXT__FEATURE_CONTEXT_idr1,@CONTEXT__FEATURE_FEATURE_idr1,1) 
END

ELSE 

BEGIN
      UPDATE T_EDIP_LINK_CONTEXT__FEATURE SET CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT__FEATURE_CONTEXT_idr1,CONTEXT__FEATURE_FEATURE_idr=@CONTEXT__FEATURE_FEATURE_idr1,ContextFeatureAvailability=1 WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT__FEATURE_CONTEXT_idr1 AND CONTEXT__FEATURE_FEATURE_idr=@CONTEXT__FEATURE_FEATURE_idr1
END


DECLARE @CONTEXT__FEATURE_CONTEXT_idr2 INT
DECLARE @CONTEXT__FEATURE_FEATURE_idr2 INT
SELECT @CONTEXT__FEATURE_CONTEXT_idr2= CONTEXT_id FROM T_EDIP_CONTEXT WHERE ContextName='A400M_Approver'
SELECT @CONTEXT__FEATURE_FEATURE_idr2= FEATURE_id FROM T_EDIP_FEATURE WHERE FeatureLabel='Stop Validate Process' AND DisplayContext = ';detail_form/wdds;'

IF (NOT EXISTS(	SELECT * FROM T_EDIP_LINK_CONTEXT__FEATURE WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT__FEATURE_CONTEXT_idr2 AND CONTEXT__FEATURE_FEATURE_idr=@CONTEXT__FEATURE_FEATURE_idr2)
) BEGIN
	INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE VALUES (@CONTEXT__FEATURE_CONTEXT_idr2,@CONTEXT__FEATURE_FEATURE_idr2,1) 
END

ELSE 

BEGIN
      UPDATE T_EDIP_LINK_CONTEXT__FEATURE SET CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT__FEATURE_CONTEXT_idr2,CONTEXT__FEATURE_FEATURE_idr=@CONTEXT__FEATURE_FEATURE_idr2,ContextFeatureAvailability=1 WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT__FEATURE_CONTEXT_idr2 AND CONTEXT__FEATURE_FEATURE_idr=@CONTEXT__FEATURE_FEATURE_idr2
END



------------------------------------------------------------------------
-- Update ValueList: ”Stop Validate Process” roles

/*The features are:

•	Stop Validation Process (For BDDS)
•	Stop Validation Process (For FDDS)

This feature is assigned to the roles A400M_System_Manager_SYSTEM.  */

------------------------------------------------------------------------

DECLARE @CONTEXT__FEATURE_CONTEXT_idr3 INT
DECLARE @CONTEXT__FEATURE_FEATURE_idr3 INT
SELECT @CONTEXT__FEATURE_CONTEXT_idr3= CONTEXT_id FROM T_EDIP_CONTEXT WHERE ContextName='A400M_System_Manager_SYSTEM'
SELECT @CONTEXT__FEATURE_FEATURE_idr3= FEATURE_id FROM T_EDIP_FEATURE WHERE FeatureLabel='Stop Validation' AND DisplayContext = ';detail_form/bdds;'
IF (NOT EXISTS(	SELECT * FROM T_EDIP_LINK_CONTEXT__FEATURE WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT__FEATURE_CONTEXT_idr3 AND CONTEXT__FEATURE_FEATURE_idr=@CONTEXT__FEATURE_FEATURE_idr3)
) BEGIN
	INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE VALUES (@CONTEXT__FEATURE_CONTEXT_idr3,@CONTEXT__FEATURE_FEATURE_idr3,1) 
END

ELSE 

BEGIN
      UPDATE T_EDIP_LINK_CONTEXT__FEATURE SET CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT__FEATURE_CONTEXT_idr3,CONTEXT__FEATURE_FEATURE_idr=@CONTEXT__FEATURE_FEATURE_idr3,ContextFeatureAvailability=1 WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT__FEATURE_CONTEXT_idr3 AND CONTEXT__FEATURE_FEATURE_idr=@CONTEXT__FEATURE_FEATURE_idr3
END



DECLARE @CONTEXT__FEATURE_CONTEXT_idr4 INT
DECLARE @CONTEXT__FEATURE_FEATURE_idr4 INT
SELECT @CONTEXT__FEATURE_CONTEXT_idr4= CONTEXT_id FROM T_EDIP_CONTEXT WHERE ContextName='A400M_System_Manager_SYSTEM'
SELECT @CONTEXT__FEATURE_FEATURE_idr4= FEATURE_id FROM T_EDIP_FEATURE WHERE FeatureLabel='Stop Validation' AND DisplayContext = ';detail_form/fdds;'
IF (NOT EXISTS(	SELECT * FROM T_EDIP_LINK_CONTEXT__FEATURE WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT__FEATURE_CONTEXT_idr4 AND CONTEXT__FEATURE_FEATURE_idr=@CONTEXT__FEATURE_FEATURE_idr4)
) BEGIN
	INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE VALUES (@CONTEXT__FEATURE_CONTEXT_idr4,@CONTEXT__FEATURE_FEATURE_idr4,1) 
END

ELSE 

BEGIN
      UPDATE T_EDIP_LINK_CONTEXT__FEATURE SET CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT__FEATURE_CONTEXT_idr4,CONTEXT__FEATURE_FEATURE_idr=@CONTEXT__FEATURE_FEATURE_idr4,ContextFeatureAvailability=1 WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT__FEATURE_CONTEXT_idr4 AND CONTEXT__FEATURE_FEATURE_idr=@CONTEXT__FEATURE_FEATURE_idr4
END


------------------------------------------------------------------------
-- Update ValueList: ”Stop Validate Process” feature and roles for PDDS and WDDS
------------------------------------------------------------------------
UPDATE T_EDIP_FEATURE 
SET
WhereClause = 'SELECT   *  FROM   T_PDDS   INNER JOIN T_DOMAIN    ON DomainName = PddsDomain   INNER JOIN T_LINK_CONTEXT__DOMAIN    ON CONTEXT__DOMAIN_DOMAIN_idr = DOMAIN_id   INNER JOIN T_LINK_CONTEXT__USER    ON CONTEXT__USER_CONTEXT_idr = CONTEXT__DOMAIN_CONTEXT_idr  WHERE   id_pdds = #data_id#   AND (pdds_status =  ''CHECKED'')    AND ContextDomainWriteMode = 1   AND CONTEXT__USER_USER_idr = #USER_id#'
WHERE FeatureLinkedPage = '?action=stop_validate_form&amp;data=pdds&amp;data_id=#data_id#';


UPDATE T_EDIP_FEATURE 
SET
WhereClause = 'SELECT   *  FROM   T_WDDS   INNER JOIN T_DOMAIN    ON DomainName = wddsDomain   INNER JOIN T_LINK_CONTEXT__DOMAIN    ON CONTEXT__DOMAIN_DOMAIN_idr = DOMAIN_id   INNER JOIN T_LINK_CONTEXT__USER    ON CONTEXT__USER_CONTEXT_idr = CONTEXT__DOMAIN_CONTEXT_idr  WHERE   WDDS_id = #data_id#   AND (WddsStatus = ''CHECKED'')    AND ((WddsType IS NULL) OR (NOT (WddsType = "EPD")))   AND ContextDomainWriteMode = 1   AND CONTEXT__USER_USER_idr = #USER_id#'
WHERE FeatureLinkedPage = '?action=stop_validate_form&amp;data=wdds&amp;data_id=#data_id#';

------------------------------------------------------------------------
-- Update ValueList: ”Stop Validate” feature and roles for BDDS and FDDS
------------------------------------------------------------------------
UPDATE T_EDIP_FEATURE 
SET
WhereClause = 'SELECT    * FROM    T_BDDS    INNER JOIN T_DOMAIN  ON DomainName = BDDSDomain    INNER JOIN T_LINK_CONTEXT__DOMAIN  ON CONTEXT__DOMAIN_DOMAIN_idr = DOMAIN_id    INNER JOIN T_LINK_CONTEXT__USER  ON CONTEXT__USER_CONTEXT_idr = CONTEXT__DOMAIN_CONTEXT_idr WHERE    BDDS_id = #data_id#    AND BDDSStatus = ''CHECKED'' AND ContextDomainWriteMode = 1    AND CONTEXT__USER_USER_idr = #USER_id#'
WHERE FeatureLinkedPage = '?action=stop_validate_form&amp;data=bdds&amp;data_id=#data_id#';


UPDATE T_EDIP_FEATURE 
SET
WhereClause = 'SELECT    * FROM    T_FDDS    INNER JOIN T_DOMAIN  ON DomainName = FDDSDomain    INNER JOIN T_LINK_CONTEXT__DOMAIN  ON CONTEXT__DOMAIN_DOMAIN_idr = DOMAIN_id    INNER JOIN T_LINK_CONTEXT__USER  ON CONTEXT__USER_CONTEXT_idr = CONTEXT__DOMAIN_CONTEXT_idr WHERE    FDDS_id = #data_id#    AND FDDSStatus = ''CHECKED'' AND ContextDomainWriteMode = 1    AND CONTEXT__USER_USER_idr = #USER_id#'
WHERE FeatureLinkedPage = '?action=stop_validate_form&amp;data=fdds&amp;data_id=#data_id#';