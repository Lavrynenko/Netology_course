/* EDIP Features Creation */

DECLARE @featureGroupID INT
DECLARE @featureID INT
DECLARE @featureGroupLabel VARCHAR(50)
DECLARE @featureGroupOrder INT
DECLARE @featureGroupIDObjects INT
DECLARE @featureAdministrationID INT
DECLARE @featureLabel VARCHAR(50)


/* Delete all features contexts / features and features group linked to features group ESDDS */

/* Get the ID in feature_group for label 'Objects' */
SET @featureGroupLabel = 'Objects'

SELECT @featureGroupIDObjects = FEATURE_GROUP_id FROM T_EDIP_FEATURE_GROUP WHERE FeatureGroupLabel = @featureGroupLabel

IF (@featureGroupIDObjects IS NOT NULL)
	BEGIN
		/* Get ID for feature group BDCI */
		SET @featureGroupLabel = 'ESDDS'
		SET @featureGroupID = NULL
		
		SELECT @featureGroupID = FEATURE_GROUP_id FROM T_EDIP_FEATURE_GROUP WHERE FeatureGroupLabel = @featureGroupLabel
		
		IF (@featureGroupID IS NOT NULL)
			BEGIN
				/* Delete all FEATURE CONTEXT linked to features linked to Feature group BDCI  */
				DELETE FROM T_EDIP_LINK_CONTEXT__FEATURE
				WHERE CONTEXT__FEATURE_FEATURE_idr IN (
						SELECT Feature_id FROM T_EDIP_FEATURE WHERE FEATURE_FEATURE_GROUP_idr = @featureGroupID
				)
				
				/* Delete all FEATURES linked to Feature group BDCI  */
				DELETE FROM T_EDIP_FEATURE WHERE FEATURE_FEATURE_GROUP_idr = @featureGroupID
				
				/* Delete Feature group BDCI  */
				DELETE FROM T_EDIP_FEATURE_GROUP WHERE FEATURE_GROUP_id = @featureGroupID
			END
		--END IF
	END
ELSE PRINT 'ERROR: No Objects group...'


/* Contexts creation */

DECLARE @contextIDAdmin INT
DECLARE @contextIDDesigner INT
DECLARE @contextIDSystemDesigner INT
DECLARE @contextIDManager INT
DECLARE @contextIDSystemManager INT
DECLARE @contextIDBusinessApprover INT
DECLARE @contextIDBusinessAcceptanceReviewer1 INT
DECLARE @contextIDBusinessAcceptanceReviewer2 INT
DECLARE @contextIDBusinessAcceptanceReviewer3 INT
DECLARE @contextName VARCHAR(50)

/* Verification of context existence */
SET @contextName = 'basic role'
SELECT @contextIDAdmin = CONTEXT_id FROM T_EDIP_CONTEXT WHERE ContextName = @contextName
IF @contextIDAdmin IS NULL
	BEGIN
		/* Create new context */
		INSERT INTO T_EDIP_CONTEXT (ContextName,ContextType,ContextPowerValue) VALUES (@contextName,1,1);
		SET @contextIDAdmin = @@IDENTITY
	END
--END IF


/* Get max order for feature groups linked to Objects feature group */
SELECT @featureGroupOrder = MAX(FeatureGroupOrder) FROM T_EDIP_FEATURE_GROUP WHERE FEATURE_GRP_FEATURE_GROUP_idr = @featureGroupIDObjects


/* BEGIN DATA IMPORT */

/* **** */
/* ESDDS */
/* **** */

/* Features Group creation for BDCI */

/* Create Feature Group for BDCI */
SET @featureGroupID = NULL
SET @featureGroupLabel = 'ESDDS'
SET @featureGroupOrder = @featureGroupOrder + 1

INSERT INTO T_EDIP_FEATURE_GROUP (FEATURE_GRP_FEATURE_GROUP_idr,FeatureGroupLabel,FeatureGroupOrder)
VALUES (@featureGroupIDObjects, @featureGroupLabel, @featureGroupOrder)

SET @featureGroupID = @@IDENTITY

/* Create features for BDCI */
SET @featureID = NULL

INSERT INTO T_EDIP_FEATURE VALUES (@featureGroupID,'Process','ESDDS Process','1','?action=detail_form&amp;data=esdds&amp;reference=#reference#&amp;domain=#domain#',NULL,'0',NULL,NULL,NULL,'curseur_rond.gif','select * from T_USER where 1=2','0',';detail_form/esdds;');
SET @featureID = @@IDENTITY
/* Create contexts links to this feature */
INSERT INTO T_EDIP_LINK_CONTEXT__FEATURE (CONTEXT__FEATURE_CONTEXT_idr,CONTEXT__FEATURE_FEATURE_idr,ContextFeatureAvailability)
	SELECT @contextIDAdmin,@featureID,1

SET @featureID = NULL
/* ******** */
/* END ESDDS */
/* ******** */