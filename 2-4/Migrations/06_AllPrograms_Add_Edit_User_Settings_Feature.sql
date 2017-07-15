-- **** ADD FEATURE ****
IF ( EXISTS (
	SELECT
		FEATURE_id
	FROM
		T_EDIP_FEATURE
	WHERE
		FeatureLabel = 'User Settings'
		AND FeatureLinkedPage  = '?action=update_settings_form&amp;data=user&amp;data_id=#data_id#'
	)
)
BEGIN
	/* Feature defined, update it */
	UPDATE
		T_EDIP_FEATURE
	SET
		FEATURE_FEATURE_GROUP_idr = (SELECT feature_group_id FROM T_EDIP_FEATURE_GROUP WHERE featureGroupLabel = 'Administration'),
		FeatureLabel = 'User Settings',
		FeatureDescription = 'User Settings',
		FeatureOrder = 7,
		FeatureLinkedPage = '?action=update_settings_form&amp;data=user&amp;data_id=#data_id#',
		DisplayContext = ';homepage_form/user;',
		IsPopup = 0,
		PopupDescription = NULL,
		PopupName = NULL,
		SplitLine = NULL,
		FeatureIcon = 'curseur_rond.gif',
		WhereClause = '',
		FeatureObjectUnicity = 0,
		FeatureActionData = ';update_settings_form/user;update_settings_process/user;'
	WHERE
		FeatureLabel = 'User Settings'
		AND FeatureLinkedPage  = '?action=update_settings_form&amp;data=user&amp;data_id=#data_id#'
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
		(SELECT feature_group_id FROM T_EDIP_FEATURE_GROUP WHERE featureGroupLabel = 'Administration'),
		'User Settings',
		'User Settings',
		7,
		'?action=update_settings_form&amp;data=user&amp;data_id=#data_id#',
		';homepage_form/user;',
		0,
		NULL,
		NULL,
		NULL,
		'curseur_rond.gif',
		'',
		0,
		';update_settings_form/user;update_settings_process/user;'
END


-- **** DELETE FEATURE CONTEXT LINK ****
DELETE FROM T_EDIP_LINK_CONTEXT__FEATURE
WHERE
	CONTEXT__FEATURE_FEATURE_idr IN (
		SELECT 
			FEATURE_id
		FROM
			T_EDIP_FEATURE
		WHERE
			FeatureLabel = 'User Settings'
			AND FeatureLinkedPage  = '?action=update_settings_form&amp;data=user&amp;data_id=#data_id#'
	)
		
-- **** CREATE FEATURE CONTEXT LINK ****
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
			FeatureLabel = 'User Settings'
			AND FeatureLinkedPage  = '?action=update_settings_form&amp;data=user&amp;data_id=#data_id#'
	),
	'1'
FROM
	T_EDIP_CONTEXT
WHERE
	ContextName IN ('Admin','Admin_SYSTEM','Admin_User','A350_Compiler','A350_Compiler_CIRCE-C','A350_Support ','A350_Designer_SYSTEM','A400M_Compiler','A400M_Compiler_CIRCE-C','A400M_Support ','A400M_Designer_SYSTEM','A380_Compiler','A380_Compiler_CIRCE-C','A380_Support ','A380_Designer_SYSTEM')

		
