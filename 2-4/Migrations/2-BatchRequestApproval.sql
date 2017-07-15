-------------------------------------------------------------------
--Create new feature BATCH REQUEST APPROVAL PDDS 
-------------------------------------------------------------------
DECLARE @FEATURE_FEATURE_GROUP_idr INT
SELECT @FEATURE_FEATURE_GROUP_idr= FEATURE_GROUP_id FROM T_EDIP_FEATURE_GROUP WHERE FeatureGroupLabel='Worklists'
IF (NOT EXISTS(	SELECT * FROM T_EDIP_FEATURE
					WHERE FeatureLabel = 'Batch Request Approval PD' AND FEATURE_FEATURE_GROUP_idr=@FEATURE_FEATURE_GROUP_idr
					))
BEGIN
INSERT INTO T_EDIP_FEATURE (FEATURE_FEATURE_GROUP_idr,FeatureLabel,FeatureDescription,FeatureOrder,FeatureLinkedPage,DisplayContext,IsPopup,PopupDescription,PopupName,SplitLine,FeatureIcon,WhereClause,FeatureObjectUnicity,FeatureActionData) VALUES (@FEATURE_FEATURE_GROUP_idr,'Batch Request Approval PD','Batch Request Approval PD',18,'?action=listAndAction_form&amp;data=ata&amp;todo=batch_request_approvalPD_form&amp;role=CC&amp;title=Batch%20Request%20Approval%20PDDS',NULL,0,NULL,NULL,NULL,'curseur_rond.gif',NULL,0,';listAndAction_form/ata;batch_request_approvalPD_form/ata;batch_request_approvalPD_process/ata;')
END

---------------------------------------------------------------------------
-- Grant Rights to the feature "BATCH REQUEST APPROVAL PDDS" to the role "A400M_Checker"
---------------------------------------------------------------------------
DECLARE @CONTEXT__FEATURE_CONTEXT_idr INT
DECLARE @CONTEXT__FEATURE_FEATURE_idr INT
SELECT @CONTEXT__FEATURE_CONTEXT_idr= CONTEXT_id FROM T_EDIP_CONTEXT WHERE ContextName='A400M_Checker'
SELECT @CONTEXT__FEATURE_FEATURE_idr= FEATURE_id FROM T_EDIP_FEATURE WHERE FeatureLabel='Batch Request Approval PD'
IF (NOT EXISTS(	SELECT * FROM T_EDIP_LINK_CONTEXT__FEATURE WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT__FEATURE_CONTEXT_idr AND CONTEXT__FEATURE_FEATURE_idr=@CONTEXT__FEATURE_FEATURE_idr)
) BEGIN
	INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE VALUES (@CONTEXT__FEATURE_CONTEXT_idr,@CONTEXT__FEATURE_FEATURE_idr,1) 
END
ELSE 

BEGIN
      UPDATE T_EDIP_LINK_CONTEXT__FEATURE SET CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT__FEATURE_CONTEXT_idr,CONTEXT__FEATURE_FEATURE_idr=@CONTEXT__FEATURE_FEATURE_idr,ContextFeatureAvailability=1 WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT__FEATURE_CONTEXT_idr AND CONTEXT__FEATURE_FEATURE_idr=@CONTEXT__FEATURE_FEATURE_idr
END


-------------------------------------------------------------------
--Create new feature BATCH REQUEST APPROVAL WDDS 
-------------------------------------------------------------------
SELECT @FEATURE_FEATURE_GROUP_idr= FEATURE_GROUP_id FROM T_EDIP_FEATURE_GROUP WHERE FeatureGroupLabel='Worklists'
IF (NOT EXISTS(	SELECT * FROM T_EDIP_FEATURE
					WHERE FeatureLabel = 'Batch Request Approval WD' AND FEATURE_FEATURE_GROUP_idr=@FEATURE_FEATURE_GROUP_idr
					))
BEGIN
--INSERT INTO T_EDIP_FEATURE (FEATURE_FEATURE_GROUP_idr,FeatureLabel,FeatureDescription,FeatureOrder,FeatureLinkedPage,DisplayContext,IsPopup,PopupDescription,PopupName,SplitLine,FeatureIcon,WhereClause,FeatureObjectUnicity,FeatureActionData) VALUES (@FEATURE_FEATURE_GROUP_idr,'Batch Request Approval WD','Batch Request Approval WD',18,'?action=listAndAction_form&amp;data=ata&amp;todo=batch_request_approvalWD_form&amp;role=CC&amp;title=Batch%20Request%20Approval%20WDDS',NULL,0,NULL,NULL,NULL,'curseur_rond.gif',NULL,0,';listAndAction_form/ata;batch_request_approvalWD_form/ata;batch_request_approvalWD_process/ata;')
INSERT INTO T_EDIP_FEATURE (FEATURE_FEATURE_GROUP_idr,FeatureLabel,FeatureDescription,FeatureOrder,FeatureLinkedPage,DisplayContext,IsPopup,PopupDescription,PopupName,SplitLine,FeatureIcon,WhereClause,FeatureObjectUnicity,FeatureActionData) VALUES (@FEATURE_FEATURE_GROUP_idr,'Batch Request Approval WD','Batch Request Approval WD',18,'?action=listAndAction_form&amp;data=ata&amp;todo=batch_request_approvalWD_form&amp;role=CHK&amp;title=Batch%20Request%20Approval%20WDDS',NULL,0,NULL,NULL,NULL,'curseur_rond.gif',NULL,0,';listAndAction_form/ata;batch_request_approvalWD_form/ata;batch_request_approvalWD_process/ata;')
END

---------------------------------------------------------------------------
-- Grant Rights to the feature "BATCH REQUEST APPROVAL WDDS" to the role "A400M_Checker"
---------------------------------------------------------------------------
SELECT @CONTEXT__FEATURE_CONTEXT_idr= CONTEXT_id FROM T_EDIP_CONTEXT WHERE ContextName='A400M_Checker'
SELECT @CONTEXT__FEATURE_FEATURE_idr= FEATURE_id FROM T_EDIP_FEATURE WHERE FeatureLabel='Batch Request Approval WD'
IF (NOT EXISTS(	SELECT * FROM T_EDIP_LINK_CONTEXT__FEATURE WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT__FEATURE_CONTEXT_idr AND CONTEXT__FEATURE_FEATURE_idr=@CONTEXT__FEATURE_FEATURE_idr)
) BEGIN
	INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE VALUES (@CONTEXT__FEATURE_CONTEXT_idr,@CONTEXT__FEATURE_FEATURE_idr,1) 
END
ELSE 

BEGIN
      UPDATE T_EDIP_LINK_CONTEXT__FEATURE SET CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT__FEATURE_CONTEXT_idr,CONTEXT__FEATURE_FEATURE_idr=@CONTEXT__FEATURE_FEATURE_idr,ContextFeatureAvailability=1 WHERE CONTEXT__FEATURE_CONTEXT_idr=@CONTEXT__FEATURE_CONTEXT_idr AND CONTEXT__FEATURE_FEATURE_idr=@CONTEXT__FEATURE_FEATURE_idr
END