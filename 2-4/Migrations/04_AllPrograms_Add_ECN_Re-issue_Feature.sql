-- *************** PDSS ********************
IF ( EXISTS (
	SELECT
		FEATURE_id
	FROM
		T_EDIP_FEATURE
	WHERE
		FeatureLabel = 'ReIssue ECN'
		AND FeatureLinkedPage  = '?action=reissueECN_form&amp;data=pdds&amp;data_id=#data_id#'
	)
)
BEGIN
	/* Feature defined, update it */
	UPDATE
		T_EDIP_FEATURE
	SET
		FEATURE_FEATURE_GROUP_idr = (SELECT feature_group_id FROM T_EDIP_FEATURE_GROUP WHERE featureGroupLabel = 'PDDS'),
		FeatureLabel = 'ReIssue ECN',
		FeatureDescription = 'ReIssue ECN',
		FeatureOrder = 10,
		FeatureLinkedPage = '?action=reissueECN_form&amp;data=pdds&amp;data_id=#data_id#',
		DisplayContext = ';detail_form/pdds;',
		IsPopup = 0,
		PopupDescription = NULL,
		PopupName = NULL,
		SplitLine = NULL,
		FeatureIcon = 'curseur_rond.gif',
		WhereClause = 'SELECT * FROM T_PDDS INNER JOIN T_DOMAIN ON DomainName = PDDSDomain INNER JOIN T_LINK_CONTEXT__DOMAIN ON CONTEXT__DOMAIN_DOMAIN_idr = DOMAIN_id INNER JOIN T_LINK_CONTEXT__USER ON CONTEXT__USER_CONTEXT_idr = CONTEXT__DOMAIN_CONTEXT_idr WHERE id_pdds = #data_id# AND pdds_Status = ''RELEASED'' AND ContextDomainWriteMode = 1 AND CONTEXT__USER_USER_idr = #USER_id#',
		FeatureObjectUnicity = 0,
		FeatureActionData = ';reissueECN_form/pdds;reissueECN_process/pdds;'
	WHERE
		FeatureLabel = 'ReIssue ECN'
		AND FeatureLinkedPage  = '?action=reissueECN_form&amp;data=pdds&amp;data_id=#data_id#'
END
ELSE BEGIN
	INSERT INTO T_EDIP_FEATURE (
		FEATURE_FEATURE_GROUP_idr,
		FeatureLabel,
		FeatureDescription,
		FeatureOrder,
		FeatureLinkedPage,
		DisplayContext,
		IsPopup,
		PopupDescription,
		PopupName,
		SplitLine,
		FeatureIcon,
		WhereClause,
		FeatureObjectUnicity,
		FeatureActionData
	)
	SELECT
		(SELECT feature_group_id FROM T_EDIP_FEATURE_GROUP WHERE featureGroupLabel = 'PDDS'),
		'ReIssue ECN',
		'ReIssue ECN',
		10,
		'?action=reissueECN_form&amp;data=pdds&amp;data_id=#data_id#',
		';detail_form/pdds;',
		0,
		NULL,
		NULL,
		NULL,
		'curseur_rond.gif',
		'SELECT * FROM T_PDDS INNER JOIN T_DOMAIN ON DomainName = PDDSDomain INNER JOIN T_LINK_CONTEXT__DOMAIN ON CONTEXT__DOMAIN_DOMAIN_idr = DOMAIN_id INNER JOIN T_LINK_CONTEXT__USER ON CONTEXT__USER_CONTEXT_idr = CONTEXT__DOMAIN_CONTEXT_idr WHERE id_pdds = #data_id# AND pdds_Status = ''RELEASED'' AND ContextDomainWriteMode = 1 AND CONTEXT__USER_USER_idr = #USER_id#',
		0,
		';reissueECN_form/pdds;reissueECN_process/pdds;'
END

DELETE FROM T_EDIP_LINK_CONTEXT__FEATURE
WHERE
	CONTEXT__FEATURE_FEATURE_idr IN (
		SELECT 
			FEATURE_id
		FROM
			T_EDIP_FEATURE
		WHERE
			FeatureLabel = 'ReIssue ECN'
			AND FeatureLinkedPage  = '?action=reissueECN_form&amp;data=pdds&amp;data_id=#data_id#'
	)
		

INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (		
	CONTEXT__FEATURE_CONTEXT_idr,	
	CONTEXT__FEATURE_FEATURE_idr,	
	ContextFeatureAvailability)
SELECT
	CONTEXT_id,
	(
		SELECT 
			FEATURE_id
		FROM
			T_EDIP_FEATURE
		WHERE
			FeatureLabel = 'ReIssue ECN'
			AND FeatureLinkedPage  = '?action=reissueECN_form&amp;data=pdds&amp;data_id=#data_id#'
	),
	'1'
FROM
	T_EDIP_CONTEXT
WHERE
	ContextName IN ('Admin')

 
 -- *************** WDSS ********************
 IF ( EXISTS (
 	SELECT
 		FEATURE_id
 	FROM
 		T_EDIP_FEATURE
 	WHERE
 		FeatureLabel = 'ReIssue ECN'
 		AND FeatureLinkedPage  = '?action=reissueECN_form&amp;data=wdds&amp;data_id=#data_id#'
 	)
 )
 BEGIN
 	/* Feature defined, update it */
 	UPDATE
 		T_EDIP_FEATURE
 	SET
 		FEATURE_FEATURE_GROUP_idr = (SELECT feature_group_id FROM T_EDIP_FEATURE_GROUP WHERE featureGroupLabel = 'WDDS'),
 		FeatureLabel = 'ReIssue ECN',
 		FeatureDescription = 'ReIssue ECN',
 		FeatureOrder = 10,
 		FeatureLinkedPage = '?action=reissueECN_form&amp;data=wdds&amp;data_id=#data_id#',
 		DisplayContext = ';detail_form/wdds;',
 		IsPopup = 0,
 		PopupDescription = NULL,
 		PopupName = NULL,
 		SplitLine = NULL,
 		FeatureIcon = 'curseur_rond.gif',
		WhereClause = 'SELECT * FROM T_WDDS INNER JOIN T_DOMAIN ON DomainName = wddsDomain INNER JOIN T_LINK_CONTEXT__DOMAIN ON CONTEXT__DOMAIN_DOMAIN_idr = DOMAIN_id INNER JOIN T_LINK_CONTEXT__USER ON CONTEXT__USER_CONTEXT_idr = CONTEXT__DOMAIN_CONTEXT_idr WHERE WDDS_id = #data_id# AND WddsStatus = ''RELEASED'' AND ((WddsType IS NULL) OR (NOT (WddsType = ''EPD''))) AND ContextDomainWriteMode = 1 AND CONTEXT__USER_USER_idr = #USER_id#',
 		FeatureObjectUnicity = 0,
 		FeatureActionData = ';reissueECN_form/wdds;reissueECN_process/wdds;'
 	WHERE
 		FeatureLabel = 'ReIssue ECN'
 		AND FeatureLinkedPage  = '?action=reissueECN_form&amp;data=wdds&amp;data_id=#data_id#'
 END
 ELSE BEGIN
 	INSERT INTO T_EDIP_FEATURE (
 		FEATURE_FEATURE_GROUP_idr,
 		FeatureLabel,
 		FeatureDescription,
 		FeatureOrder,
 		FeatureLinkedPage,
 		DisplayContext,
 		IsPopup,
 		PopupDescription,
 		PopupName,
 		SplitLine,
 		FeatureIcon,
 		WhereClause,
 		FeatureObjectUnicity,
 		FeatureActionData
 	)
 	SELECT
 		(SELECT feature_group_id FROM T_EDIP_FEATURE_GROUP WHERE featureGroupLabel = 'WDDS'),
 		'ReIssue ECN',
 		'ReIssue ECN',
 		10,
 		'?action=reissueECN_form&amp;data=wdds&amp;data_id=#data_id#',
 		';detail_form/wdds;',
 		0,
 		NULL,
 		NULL,
 		NULL,
 		'curseur_rond.gif',
 		'SELECT * FROM T_WDDS INNER JOIN T_DOMAIN ON DomainName = wddsDomain INNER JOIN T_LINK_CONTEXT__DOMAIN ON CONTEXT__DOMAIN_DOMAIN_idr = DOMAIN_id INNER JOIN T_LINK_CONTEXT__USER ON CONTEXT__USER_CONTEXT_idr = CONTEXT__DOMAIN_CONTEXT_idr WHERE WDDS_id = #data_id# AND WddsStatus = ''RELEASED'' AND ((WddsType IS NULL) OR (NOT (WddsType = ''EPD''))) AND ContextDomainWriteMode = 1 AND CONTEXT__USER_USER_idr = #USER_id#',
 		0,
 		';reissueECN_form/wdds;reissueECN_process/wdds;'
 END
 
 DELETE FROM T_EDIP_LINK_CONTEXT__FEATURE
 WHERE
 	CONTEXT__FEATURE_FEATURE_idr IN (
 		SELECT 
 			FEATURE_id
 		FROM
 			T_EDIP_FEATURE
 		WHERE
 			FeatureLabel = 'ReIssue ECN'
 			AND FeatureLinkedPage  = '?action=reissueECN_form&amp;data=wdds&amp;data_id=#data_id#'
 	)
 		
 
 INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (		
 	CONTEXT__FEATURE_CONTEXT_idr,	
 	CONTEXT__FEATURE_FEATURE_idr,	
 	ContextFeatureAvailability)
 SELECT
 	CONTEXT_id,
 	(
 		SELECT 
 			FEATURE_id
 		FROM
 			T_EDIP_FEATURE
 		WHERE
 			FeatureLabel = 'ReIssue ECN'
 			AND FeatureLinkedPage  = '?action=reissueECN_form&amp;data=wdds&amp;data_id=#data_id#'
 	),
 	'1'
 FROM
 	T_EDIP_CONTEXT
 WHERE
 	ContextName IN ('Admin')
 
  
 -- *************** BDDS ********************
  IF ( EXISTS (
  	SELECT
  		FEATURE_id
  	FROM
  		T_EDIP_FEATURE
  	WHERE
  		FeatureLabel = 'ReIssue ECN'
  		AND FeatureLinkedPage  = '?action=reissueECN_form&amp;data=bdds&amp;data_id=#data_id#'
  	)
  )
  BEGIN
  	/* Feature defined, update it */
  	UPDATE
  		T_EDIP_FEATURE
  	SET
  		FEATURE_FEATURE_GROUP_idr = (SELECT feature_group_id FROM T_EDIP_FEATURE_GROUP WHERE featureGroupLabel = 'BDDS'),
  		FeatureLabel = 'ReIssue ECN',
  		FeatureDescription = 'ReIssue ECN',
  		FeatureOrder = 20,
  		FeatureLinkedPage = '?action=reissueECN_form&amp;data=bdds&amp;data_id=#data_id#',
  		DisplayContext = ';detail_form/bdds;',
  		IsPopup = 0,
  		PopupDescription = NULL,
  		PopupName = NULL,
  		SplitLine = NULL,
  		FeatureIcon = 'curseur_rond.gif',
  		WhereClause = 'SELECT * FROM T_BDDS INNER JOIN T_DOMAIN ON DomainName = BDDSDomain INNER JOIN T_LINK_CONTEXT__DOMAIN ON CONTEXT__DOMAIN_DOMAIN_idr = DOMAIN_id INNER JOIN T_LINK_CONTEXT__USER ON CONTEXT__USER_CONTEXT_idr = CONTEXT__DOMAIN_CONTEXT_idr WHERE BDDS_id = #data_id# AND BDDSStatus = ''RELEASED'' AND ContextDomainWriteMode = 1 AND CONTEXT__USER_USER_idr = #USER_id#',
  		FeatureObjectUnicity = 0,
  		FeatureActionData = ';reissueECN_form/bdds;reissueECN_process/bdds;'
  	WHERE
  		FeatureLabel = 'ReIssue ECN'
  		AND FeatureLinkedPage  = '?action=reissueECN_form&amp;data=bdds&amp;data_id=#data_id#'
  END
  ELSE BEGIN
  	INSERT INTO T_EDIP_FEATURE (
  		FEATURE_FEATURE_GROUP_idr,
  		FeatureLabel,
  		FeatureDescription,
  		FeatureOrder,
  		FeatureLinkedPage,
  		DisplayContext,
  		IsPopup,
  		PopupDescription,
  		PopupName,
  		SplitLine,
  		FeatureIcon,
  		WhereClause,
  		FeatureObjectUnicity,
  		FeatureActionData
  	)
  	SELECT
  		(SELECT feature_group_id FROM T_EDIP_FEATURE_GROUP WHERE featureGroupLabel = 'BDDS'),
  		'ReIssue ECN',
  		'ReIssue ECN',
  		20,
  		'?action=reissueECN_form&amp;data=bdds&amp;data_id=#data_id#',
  		';detail_form/bdds;',
  		0,
  		NULL,
  		NULL,
  		NULL,
  		'curseur_rond.gif',
  		'SELECT * FROM T_BDDS INNER JOIN T_DOMAIN ON DomainName = BDDSDomain INNER JOIN T_LINK_CONTEXT__DOMAIN ON CONTEXT__DOMAIN_DOMAIN_idr = DOMAIN_id INNER JOIN T_LINK_CONTEXT__USER ON CONTEXT__USER_CONTEXT_idr = CONTEXT__DOMAIN_CONTEXT_idr WHERE BDDS_id = #data_id# AND BDDSStatus = ''RELEASED'' AND ContextDomainWriteMode = 1 AND CONTEXT__USER_USER_idr = #USER_id#',
  		0,
  		';reissueECN_form/bdds;reissueECN_process/bdds;'
  END
  
  DELETE FROM T_EDIP_LINK_CONTEXT__FEATURE
  WHERE
  	CONTEXT__FEATURE_FEATURE_idr IN (
  		SELECT 
  			FEATURE_id
  		FROM
  			T_EDIP_FEATURE
  		WHERE
  			FeatureLabel = 'ReIssue ECN'
  			AND FeatureLinkedPage  = '?action=reissueECN_form&amp;data=bdds&amp;data_id=#data_id#'
  	)
  		
  
  INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (		
  	CONTEXT__FEATURE_CONTEXT_idr,	
  	CONTEXT__FEATURE_FEATURE_idr,	
  	ContextFeatureAvailability)
  SELECT
  	CONTEXT_id,
  	(
  		SELECT 
  			FEATURE_id
  		FROM
  			T_EDIP_FEATURE
  		WHERE
  			FeatureLabel = 'ReIssue ECN'
  			AND FeatureLinkedPage  = '?action=reissueECN_form&amp;data=bdds&amp;data_id=#data_id#'
  	),
  	'1'
  FROM
  	T_EDIP_CONTEXT
  WHERE
  	ContextName IN ('Admin_SYSTEM')
  
   
  -- *************** FDDS ********************
   IF ( EXISTS (
   	SELECT
   		FEATURE_id
   	FROM
   		T_EDIP_FEATURE
   	WHERE
   		FeatureLabel = 'ReIssue ECN'
   		AND FeatureLinkedPage  = '?action=reissueECN_form&amp;data=fdds&amp;data_id=#data_id#'
   	)
   )
   BEGIN
   	/* Feature defined, update it */
   	UPDATE
   		T_EDIP_FEATURE
   	SET
   		FEATURE_FEATURE_GROUP_idr = (SELECT feature_group_id FROM T_EDIP_FEATURE_GROUP WHERE featureGroupLabel = 'FDDS'),
   		FeatureLabel = 'ReIssue ECN',
   		FeatureDescription = 'ReIssue ECN',
   		FeatureOrder = 20,
   		FeatureLinkedPage = '?action=reissueECN_form&amp;data=fdds&amp;data_id=#data_id#',
   		DisplayContext = ';detail_form/fdds;',
   		IsPopup = 0,
   		PopupDescription = NULL,
   		PopupName = NULL,
   		SplitLine = NULL,
   		FeatureIcon = 'curseur_rond.gif',
   		WhereClause = 'SELECT * FROM T_FDDS INNER JOIN T_DOMAIN ON DomainName = FDDSDomain INNER JOIN T_LINK_CONTEXT__DOMAIN  ON CONTEXT__DOMAIN_DOMAIN_idr = DOMAIN_id INNER JOIN T_LINK_CONTEXT__USER  ON CONTEXT__USER_CONTEXT_idr = CONTEXT__DOMAIN_CONTEXT_idr WHERE FDDS_id = #data_id# AND FDDSStatus = ''RELEASED'' AND ContextDomainWriteMode = 1 AND CONTEXT__USER_USER_idr = #USER_id#',
   		FeatureObjectUnicity = 0,
   		FeatureActionData = ';reissueECN_form/fdds;reissueECN_process/fdds;;'
   	WHERE
   		FeatureLabel = 'ReIssue ECN'
   		AND FeatureLinkedPage  = '?action=reissueECN_form&amp;data=fdds&amp;data_id=#data_id#'
   END
   ELSE BEGIN
   	INSERT INTO T_EDIP_FEATURE (
   		FEATURE_FEATURE_GROUP_idr,
   		FeatureLabel,
   		FeatureDescription,
   		FeatureOrder,
   		FeatureLinkedPage,
   		DisplayContext,
   		IsPopup,
   		PopupDescription,
   		PopupName,
   		SplitLine,
   		FeatureIcon,
   		WhereClause,
   		FeatureObjectUnicity,
   		FeatureActionData
   	)
   	SELECT
   		(SELECT feature_group_id FROM T_EDIP_FEATURE_GROUP WHERE featureGroupLabel = 'FDDS'),
   		'ReIssue ECN',
   		'ReIssue ECN',
   		20,
   		'?action=reissueECN_form&amp;data=fdds&amp;data_id=#data_id#',
   		';detail_form/fdds;',
   		0,
   		NULL,
   		NULL,
   		NULL,
   		'curseur_rond.gif',
   		'SELECT * FROM T_FDDS INNER JOIN T_DOMAIN ON DomainName = FDDSDomain INNER JOIN T_LINK_CONTEXT__DOMAIN  ON CONTEXT__DOMAIN_DOMAIN_idr = DOMAIN_id INNER JOIN T_LINK_CONTEXT__USER  ON CONTEXT__USER_CONTEXT_idr = CONTEXT__DOMAIN_CONTEXT_idr WHERE FDDS_id = #data_id# AND FDDSStatus = ''RELEASED'' AND ContextDomainWriteMode = 1 AND CONTEXT__USER_USER_idr = #USER_id#',
   		0,
   		';reissueECN_form/fdds;reissueECN_process/fdds;'
   END
   
   DELETE FROM T_EDIP_LINK_CONTEXT__FEATURE
     WHERE
     	CONTEXT__FEATURE_FEATURE_idr IN (
     		SELECT 
     			FEATURE_id
     		FROM
     			T_EDIP_FEATURE
     		WHERE
     			FeatureLabel = 'ReIssue ECN'
     			AND FeatureLinkedPage  = '?action=reissueECN_form&amp;data=fdds&amp;data_id=#data_id#'
     	)
     		
     
     INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (		
     	CONTEXT__FEATURE_CONTEXT_idr,	
     	CONTEXT__FEATURE_FEATURE_idr,	
     	ContextFeatureAvailability)
     SELECT
     	CONTEXT_id,
     	(
     		SELECT 
     			FEATURE_id
     		FROM
     			T_EDIP_FEATURE
     		WHERE
     			FeatureLabel = 'ReIssue ECN'
     			AND FeatureLinkedPage  = '?action=reissueECN_form&amp;data=fdds&amp;data_id=#data_id#'
     	),
     	'1'
     FROM
     	T_EDIP_CONTEXT
     WHERE
  	ContextName IN ('Admin_SYSTEM')
