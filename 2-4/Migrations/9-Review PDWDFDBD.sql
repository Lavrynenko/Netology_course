
------------------------------------------------------------------------
-- MANAGE ATTRIBUTES 
-- 
-- @program		A400M
-- @version		5.0
-- @module		ESDCR
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Update ValueList: ”Approve PD (SR)” GUI modifications
------------------------------------------------------------------------


UPDATE T_EDIP_FEATURE 
SET
FeatureLinkedPage = '?action=listAndAction_form&amp;data=ata&amp;todo=review_form&amp;role=SR&amp;title=Review%20PDDS%20(SR)' WHERE FeatureLabel = 'Review PD (SR)';


UPDATE T_EDIP_FEATURE 
SET
FeatureLinkedPage = '?action=listAndAction_form&amp;data=ata&amp;todo=mass_review_form&amp;role=SR&amp;title=Batch%20Review%20PDDS%20(SR)' WHERE FeatureLabel = 'Batch Review PD (SR)';




------------------------------------------------------------------------
-- MANAGE ATTRIBUTES 
-- 
-- @program		A400M
-- @version		5.0
-- @module		ESDCR
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Update ValueList: Approve PD/WD APP” GUI Modification
------------------------------------------------------------------------


UPDATE T_EDIP_FEATURE 
SET
FeatureLinkedPage = '?action=listAndAction_form&amp;data=ata&amp;todo=review_form&amp;role=SRC&amp;title=Review%20PDDS%20(SRC)' WHERE FeatureLabel = 'Review PD (SRC)';


UPDATE T_EDIP_FEATURE 
SET
FeatureLinkedPage = '?action=listAndAction_form&amp;data=ata&amp;todo=mass_review_form&amp;role=SRC&amp;title=Batch%20Review%20PDDS%20(SRC)' WHERE FeatureLabel = 'Batch Review PD (SRC)';





------------------------------------------------------------------------
-- MANAGE ATTRIBUTES 
-- 
-- @program		A400M
-- @version		5.0
-- @module		ESDCR
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Update ValueList: Approve PD/WD APP” GUI Modification
------------------------------------------------------------------------


UPDATE T_EDIP_FEATURE 
SET
FeatureLinkedPage = '?action=listAndAction_form&amp;data=ata&amp;todo=review_form&amp;role=CC&amp;title=Review%20PDDS%20(APP)' WHERE FeatureLabel = 'Review PD (APP)';


UPDATE T_EDIP_FEATURE 
SET
FeatureLinkedPage = '?action=listAndAction_form&amp;data=ata&amp;todo=mass_review_form&amp;role=CC&amp;title=Batch%20Review%20PDDS%20(APP)' WHERE FeatureLabel = 'Batch Review PD (APP)';


UPDATE T_EDIP_FEATURE 
SET
FeatureLinkedPage = '?action=listAndAction_form&amp;data=ata&amp;todo=reviewWD_form&amp;role=CC&amp;title=Review%20WDDS' WHERE FeatureLabel = 'Review WD';


UPDATE T_EDIP_FEATURE 
SET
FeatureLinkedPage = '?action=listAndAction_form&amp;data=ata&amp;todo=mass_reviewWD_form&amp;role=CC&amp;title=Batch%20Review%20WDDS' WHERE FeatureLabel = 'Batch Review WD';







------------------------------------------------------------------------
-- MANAGE ATTRIBUTES 
-- 
-- @program		A400M
-- @version		5.0
-- @module		ESDCR
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Update ValueList: TSD-ESDCR_REL_PROC-320   Features “Approve and review BD/FD”
------------------------------------------------------------------------
update t_edip_feature
set 
	featureLinkedPage = '?action=listAndAction_form&amp;data=ata&amp;todo=ApproveBD_form&amp;title=Approve%20BDDS&amp;role=System%20Reviewer',
	featureActionData = ';listAndAction_form/ata;ApproveBD_form/ata;approveBD_detail_form/ata;approveBD_process/ata;'
where featurelabel = 'Request Approval BD'

update t_edip_feature
set 
	featureLinkedPage = '?action=listAndAction_form&amp;data=ata&amp;todo=reviewBD_form&amp;title=Review%20BDDS&amp;role=System%20Manager',
	featureActionData = ';listAndAction_form/ata;reviewBD_form/ata;reviewBD_detail_form/ata;reviewBD_process/ata;'
where featurelabel = 'Review BD (SM)'

update t_edip_feature
set 
	featureLinkedPage = '?action=listAndAction_form&amp;data=ata&amp;todo=ApproveFD_form&amp;title=Approve%20FDDS&amp;role=System%20Reviewer',
	featureActionData = ';listAndAction_form/ata;ApproveFD_form/ata;approveFD_detail_form/ata;approveFD_process/ata;'
where featurelabel = 'Request Approval FD'

update t_edip_feature
set 
	featureLinkedPage = '?action=listAndAction_form&amp;data=ata&amp;todo=reviewFD_form&amp;title=Review%20FDDS&amp;role=System%20Manager',
	featureActionData = ';listAndAction_form/ata;reviewFD_form/ata;reviewFD_detail_form/ata;reviewFD_process/ata;'
where featurelabel = 'Review FD (SM)'

