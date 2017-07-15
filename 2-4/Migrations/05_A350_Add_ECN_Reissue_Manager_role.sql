-- ********* BEGIN Add role 'A350_ECN_Reissue_Manager' *********
	/* Creation of the Context */
	IF ( NOT EXISTS (
		SELECT
			CONTEXT_id
		FROM
			T_EDIP_CONTEXT
		WHERE
			ContextName = 'A350_ECN_Reissue_Manager'
		)
	)
	BEGIN
		INSERT INTO T_EDIP_CONTEXT (
			ContextName,
			ContextType,
			ContextPowerValue
		)
		VALUES (
			'A350_ECN_Reissue_Manager',
			1,
			10
		)
	END
	ELSE BEGIN
		/* The role exists, update its values */
		UPDATE
			T_EDIP_CONTEXT
		SET
			ContextType = 1,
			ContextPowerValue = 10
		WHERE
			ContextName = 'A350_ECN_Reissue_Manager'
	END

	/* Deletion of the Context/Attributes configuration */
	DELETE FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE ATTRIBUTE__CONTEXT_CONTEXT_idr = (SELECT CONTEXT_id FROM T_EDIP_CONTEXT WHERE ContextName = 'A350_ECN_Reissue_Manager');
	/* Creation of the Context/Attributes configuration */
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 0, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'BDDSDescriptionOfChange' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 0, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'FDDSDescriptionOfChange' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 0, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'PDDSDescriptionOfChange' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 0, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'WDDSDescriptionOfChange' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 0, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'BDDSEcnIssue' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 0, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'FDDSEcnIssue' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 0, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'PDDSEcnIssue' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 0, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'WDDSEcnIssue' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 0, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'BDDSecnArchived' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 0, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'FDDSecnArchived' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 0, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'PDDSecnArchived' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 0, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'WDDSecnArchived' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 0, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'BDDSEcnFile' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 0, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'FDDSEcnFile' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 0, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'pdds_ecnFile' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 0, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'WddsEcnFile' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 1, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'BDDSEcnReIssueBy' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 1, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'BDDSEcnReIssueDate' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 1, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'FDDSEcnReIssueBy' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 1, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'FDDSEcnReIssueDate' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 1, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'PDDSEcnReIssueBy' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 1, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'PDDSEcnReIssueDate' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 1, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'WDDSEcnReIssueBy' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) SELECT ATTRIBUTE_id, CONTEXT_id, 1, 1 FROM T_EDIP_ATTRIBUTE, T_EDIP_CONTEXT WHERE AttributeName = 'WDDSEcnReIssueDate' AND ContextName = 'A350_ECN_Reissue_Manager';
	
	/* Deletion of the Context/Features configuration  */
	DELETE FROM T_EDIP_LINK_CONTEXT__FEATURE WHERE CONTEXT__FEATURE_CONTEXT_idr = (SELECT CONTEXT_id FROM T_EDIP_CONTEXT WHERE ContextName = 'A350_ECN_Reissue_Manager');
	/* Creation of the Context/Features configuration */
	INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE(CONTEXT__FEATURE_FEATURE_idr, CONTEXT__FEATURE_CONTEXT_idr, ContextFeatureAvailability) SELECT FEATURE_id, CONTEXT_id, 1 FROM T_EDIP_FEATURE, T_EDIP_CONTEXT WHERE FeatureLabel = 'ReIssue ECN' AND FeatureLinkedPage = '?action=reissueECN_form&amp;data=bdds&amp;data_id=#data_id#' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE(CONTEXT__FEATURE_FEATURE_idr, CONTEXT__FEATURE_CONTEXT_idr, ContextFeatureAvailability) SELECT FEATURE_id, CONTEXT_id, 1 FROM T_EDIP_FEATURE, T_EDIP_CONTEXT WHERE FeatureLabel = 'ReIssue ECN' AND FeatureLinkedPage = '?action=reissueECN_form&amp;data=fdds&amp;data_id=#data_id#' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE(CONTEXT__FEATURE_FEATURE_idr, CONTEXT__FEATURE_CONTEXT_idr, ContextFeatureAvailability) SELECT FEATURE_id, CONTEXT_id, 1 FROM T_EDIP_FEATURE, T_EDIP_CONTEXT WHERE FeatureLabel = 'ReIssue ECN' AND FeatureLinkedPage = '?action=reissueECN_form&amp;data=pdds&amp;data_id=#data_id#' AND ContextName = 'A350_ECN_Reissue_Manager';
	INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE(CONTEXT__FEATURE_FEATURE_idr, CONTEXT__FEATURE_CONTEXT_idr, ContextFeatureAvailability) SELECT FEATURE_id, CONTEXT_id, 1 FROM T_EDIP_FEATURE, T_EDIP_CONTEXT WHERE FeatureLabel = 'ReIssue ECN' AND FeatureLinkedPage = '?action=reissueECN_form&amp;data=wdds&amp;data_id=#data_id#' AND ContextName = 'A350_ECN_Reissue_Manager';

	/* Deletion of the Context/Domains configuration  */
	DELETE FROM T_LINK_CONTEXT__DOMAIN WHERE CONTEXT__DOMAIN_CONTEXT_idr = (SELECT CONTEXT_id FROM T_EDIP_CONTEXT WHERE ContextName = 'A350_ECN_Reissue_Manager');
	/* Creation of the Context/Domains configuration */
	
	/* Deletion of the Context/User configuration  */
	DELETE FROM T_LINK_CONTEXT__USER WHERE CONTEXT__USER_CONTEXT_idr = (SELECT CONTEXT_id FROM T_EDIP_CONTEXT WHERE ContextName = 'A350_ECN_Reissue_Manager');
	
	/* Add Role to Admin and support */
	INSERT INTO T_LINK_CONTEXT__USER(CONTEXT__USER_CONTEXT_idr, CONTEXT__USER_USER_idr)
		SELECT DISTINCT
			CONTEXT_id,
			USER_id
		FROM
			T_USER,
			T_EDIP_CONTEXT
		WHERE
			ContextName = 'A350_ECN_Reissue_Manager' AND
			USER_id 
			IN (
				SELECT
					USER_id
				FROM
					T_USER
					INNER JOIN T_LINK_CONTEXT__USER ON CONTEXT__USER_USER_idr = USER_id
					INNER JOIN T_EDIP_CONTEXT ON CONTEXT__USER_CONTEXT_idr = CONTEXT_id
				WHERE
					ContextName IN ('Admin','Admin_SYSTEM','A350_Support')
					
			)
					
-- ********* END   Add role 'A350_ECN_Reissue_Manager' *********