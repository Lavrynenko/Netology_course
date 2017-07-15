----Domestic MOD Number Features--TSD-ESDCR_MOD_DOMESTIC-060
--Adding the feature group DOMESTIC MOD for the display in the menu
DECLARE @FEATURE_GRP_FEATURE_GROUP_idr INT
DECLARE @FeatureGroupOrder INT
SET @FEATURE_GRP_FEATURE_GROUP_idr=5
SET @FeatureGroupOrder=11
IF(NOT EXISTS(SELECT * FROM T_EDIP_FEATURE_GROUP WHERE FeatureGroupLabel='DOMESTIC MOD'))
BEGIN
INSERT INTO T_EDIP_FEATURE_GROUP (FEATURE_GRP_FEATURE_GROUP_idr,FeatureGroupLabel,FeatureGroupOrder) VALUES (@FEATURE_GRP_FEATURE_GROUP_idr,'DOMESTIC MOD',@FeatureGroupOrder)
END
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Adding feature New/List/Edit/Delete for the group "DOMESTIC MOD"
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Adding the feature "New" for the group "DOMESTIC MOD"
DECLARE @FEATURE_FEATURE_GROUP_idr INT
DECLARE @FeatureOrder INT
SELECT @FEATURE_FEATURE_GROUP_idr=FEATURE_GROUP_id FROM T_EDIP_FEATURE_GROUP WHERE FeatureGroupLabel='DOMESTIC MOD'
SET @FeatureOrder=1
IF(NOT EXISTS(SELECT * FROM T_EDIP_FEATURE WHERE FeatureLabel='New' AND FEATURE_FEATURE_GROUP_idr=@FEATURE_FEATURE_GROUP_idr))
BEGIN
INSERT INTO T_EDIP_FEATURE (FEATURE_FEATURE_GROUP_idr,FeatureLabel,FeatureDescription,FeatureOrder,FeatureLinkedPage,FeatureIcon,FeatureActionData) VALUES (@FEATURE_FEATURE_GROUP_idr,'New','Create a New Domestic MOD',@FeatureOrder,'?action=New_form&amp;data=DOMESTICMOD','curseur_rond.gif',';New_form/DOMESTICMOD;New_process/DOMESTICMOD;')
END

--Give access right for the feature 'New' to the Admin/Support Roles
DECLARE @CONTEXT__FEATURE_FEATURE_idr INT
SELECT @CONTEXT__FEATURE_FEATURE_idr=FEATURE_id FROM T_EDIP_FEATURE WHERE FeatureLabel='New' AND FEATURE_FEATURE_GROUP_idr=@FEATURE_FEATURE_GROUP_idr

DELETE FROM T_EDIP_LINK_CONTEXT__FEATURE
WHERE
	CONTEXT__FEATURE_FEATURE_idr = @CONTEXT__FEATURE_FEATURE_idr
		

INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (		
	CONTEXT__FEATURE_CONTEXT_idr,	
	CONTEXT__FEATURE_FEATURE_idr,	
	ContextFeatureAvailability)
SELECT
	CONTEXT_id,
	@CONTEXT__FEATURE_FEATURE_idr,
	'1'
FROM
	T_EDIP_CONTEXT
WHERE
	ContextName = 'Admin' OR ContextName like '%support'
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Adding the feature "List" for the group "DOMESTIC MOD"
--DECLARE @FEATURE_FEATURE_GROUP_idr INT
--DECLARE @FeatureOrder INT
--SELECT @FEATURE_FEATURE_GROUP_idr=FEATURE_GROUP_id FROM T_EDIP_FEATURE_GROUP WHERE FeatureGroupLabel='DOMESTIC MOD'
SET @FeatureOrder=2
IF(NOT EXISTS(SELECT * FROM T_EDIP_FEATURE WHERE FeatureLabel='List' AND FEATURE_FEATURE_GROUP_idr=@FEATURE_FEATURE_GROUP_idr))
BEGIN
INSERT INTO T_EDIP_FEATURE (FEATURE_FEATURE_GROUP_idr,FeatureLabel,FeatureDescription,FeatureOrder,FeatureLinkedPage,FeatureIcon,FeatureActionData) VALUES (@FEATURE_FEATURE_GROUP_idr,'List','Display the List of Domestic MOD',@FeatureOrder,'?action=List_form&amp;data=DOMESTICMOD','curseur_rond.gif',';List_form/DOMESTICMOD;request_List_form/DOMESTICMOD;')
END
------------------------------------------------------------------------------------------------------------------------------------------
--Give access right for the feature "List" to the Admin/Support/Viewer Roles
SELECT @CONTEXT__FEATURE_FEATURE_idr=FEATURE_id FROM T_EDIP_FEATURE WHERE FeatureLabel='List' AND FEATURE_FEATURE_GROUP_idr=@FEATURE_FEATURE_GROUP_idr

DELETE FROM T_EDIP_LINK_CONTEXT__FEATURE
WHERE
	CONTEXT__FEATURE_FEATURE_idr = @CONTEXT__FEATURE_FEATURE_idr
		

INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (		
	CONTEXT__FEATURE_CONTEXT_idr,	
	CONTEXT__FEATURE_FEATURE_idr,	
	ContextFeatureAvailability)
SELECT
	CONTEXT_id,
	@CONTEXT__FEATURE_FEATURE_idr,
	'1'
FROM
	T_EDIP_CONTEXT
WHERE
	ContextName = 'Admin' OR ContextName like '%support' OR ContextName like '%viewer%'
	
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Adding the feature "Edit" for the group "DOMESTIC MOD"
--DECLARE @FEATURE_FEATURE_GROUP_idr INT
--DECLARE @FeatureOrder INT
--SELECT @FEATURE_FEATURE_GROUP_idr=FEATURE_GROUP_id FROM T_EDIP_FEATURE_GROUP WHERE FeatureGroupLabel='DOMESTIC MOD'
SET @FeatureOrder=3
IF(NOT EXISTS(SELECT * FROM T_EDIP_FEATURE WHERE FeatureLabel='Edit' AND FEATURE_FEATURE_GROUP_idr=@FEATURE_FEATURE_GROUP_idr))
BEGIN
INSERT INTO T_EDIP_FEATURE (FEATURE_FEATURE_GROUP_idr,FeatureLabel,FeatureDescription,FeatureOrder,FeatureLinkedPage,DisplayContext,FeatureIcon,FeatureActionData) VALUES (@FEATURE_FEATURE_GROUP_idr,'Edit','Update the Domestic MOD',@FeatureOrder,'?action=update_form&amp;data=DOMESTICMOD&amp;data_id=#data_id#',';detail_form/DOMESTICMOD;','curseur_rond.gif',';update_form/DOMESTICMOD;update_process/DOMESTICMOD;')
END
--Give access right for the feature "Edit" to the Admin/Support Roles

SELECT @CONTEXT__FEATURE_FEATURE_idr=FEATURE_id FROM T_EDIP_FEATURE WHERE FeatureLabel='Edit' AND FEATURE_FEATURE_GROUP_idr=@FEATURE_FEATURE_GROUP_idr

DELETE FROM T_EDIP_LINK_CONTEXT__FEATURE
WHERE
	CONTEXT__FEATURE_FEATURE_idr = @CONTEXT__FEATURE_FEATURE_idr
		

INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (		
	CONTEXT__FEATURE_CONTEXT_idr,	
	CONTEXT__FEATURE_FEATURE_idr,	
	ContextFeatureAvailability)
SELECT
	CONTEXT_id,
	@CONTEXT__FEATURE_FEATURE_idr,
	'1'
FROM
	T_EDIP_CONTEXT
WHERE
	ContextName = 'Admin' OR ContextName like '%support'
	
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Adding the feature "Delete" for the group "DOMESTIC MOD"
--DECLARE @FEATURE_FEATURE_GROUP_idr INT
--DECLARE @FeatureOrder INT
--SELECT @FEATURE_FEATURE_GROUP_idr=FEATURE_GROUP_id FROM T_EDIP_FEATURE_GROUP WHERE FeatureGroupLabel='DOMESTIC MOD'
SET @FeatureOrder=4
IF(NOT EXISTS(SELECT * FROM T_EDIP_FEATURE WHERE FeatureLabel='Delete' AND FEATURE_FEATURE_GROUP_idr=@FEATURE_FEATURE_GROUP_idr))
BEGIN
INSERT INTO T_EDIP_FEATURE (FEATURE_FEATURE_GROUP_idr,FeatureLabel,FeatureDescription,FeatureOrder,FeatureLinkedPage,DisplayContext,FeatureIcon,FeatureActionData) VALUES (@FEATURE_FEATURE_GROUP_idr,'Delete','Delete the Domestic MOD',@FeatureOrder,'?action=Delete_form&amp;data=DOMESTICMOD&amp;data_id=#data_id#',';detail_form/DOMESTICMOD;','curseur_rond.gif',';Delete_form/DOMESTICMOD;Delete_process/DOMESTICMOD;')
END
--Give access right for the feature "Delete" to the Writer/Viewer Roles
SELECT @CONTEXT__FEATURE_FEATURE_idr=FEATURE_id FROM T_EDIP_FEATURE WHERE FeatureLabel='Delete' AND FEATURE_FEATURE_GROUP_idr=@FEATURE_FEATURE_GROUP_idr

DELETE FROM T_EDIP_LINK_CONTEXT__FEATURE
WHERE
	CONTEXT__FEATURE_FEATURE_idr = @CONTEXT__FEATURE_FEATURE_idr
		

INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (		
	CONTEXT__FEATURE_CONTEXT_idr,	
	CONTEXT__FEATURE_FEATURE_idr,	
	ContextFeatureAvailability)
SELECT
	CONTEXT_id,
	@CONTEXT__FEATURE_FEATURE_idr,
	'1'
FROM
	T_EDIP_CONTEXT
WHERE
	ContextName = 'Admin' OR ContextName like '%support'
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------