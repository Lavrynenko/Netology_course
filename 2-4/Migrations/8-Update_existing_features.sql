
------------------------------------------------------------------------
-- MANAGE ATTRIBUTES 
-- 
-- @program		A400M
-- @version		5.0
-- @module		ESDCR
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Update ValueList: Update existing features
------------------------------------------------------------------------


UPDATE T_EDIP_FEATURE 
SET
FeatureLabel = 'Batch change state PD' WHERE FeatureLabel = 'Batch change state PDDS';

UPDATE T_EDIP_FEATURE 
SET
FeatureLabel = 'Batch change state WD' WHERE FeatureLabel = 'Batch change state WDDS';

UPDATE T_EDIP_FEATURE 
SET
FeatureLabel = 'Batch request validation PD' WHERE FeatureLabel = 'Batch request validation PDDS';

UPDATE T_EDIP_FEATURE 
SET
FeatureLabel = 'Batch request validation WD' WHERE FeatureLabel = 'Batch request validation WDDS';







------------------------------------------------------------------------
-- MANAGE ATTRIBUTES 
-- 
-- @program		A400M
-- @version		5.0
-- @module		ESDCR
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Update ValueList: Update existing features
------------------------------------------------------------------------


UPDATE T_EDIP_FEATURE 
SET
FeatureLabel = 'Review PD (SRC)' WHERE FeatureLabel = 'Review PDDS (SRC)';

UPDATE T_EDIP_FEATURE 
SET
FeatureLabel = 'Batch Review PD (SRC)' WHERE FeatureLabel = 'Batch Review PDDS (SRC)';






------------------------------------------------------------------------
-- MANAGE ATTRIBUTES 
-- 
-- @program		A400M
-- @version		5.0
-- @module		ESDCR
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Update ValueList: Update existing features
------------------------------------------------------------------------


UPDATE T_EDIP_FEATURE 
SET
FeatureLabel = 'Review PD (SR)' WHERE FeatureLabel = 'Review PDDS (SR)';

UPDATE T_EDIP_FEATURE 
SET
FeatureLabel = 'Batch Review PD (SR)' WHERE FeatureLabel = 'Batch Review PDDS (SR)';






------------------------------------------------------------------------
-- MANAGE ATTRIBUTES 
-- 
-- @program		A400M
-- @version		5.0
-- @module		ESDCR
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Update ValueList: Update existing features
------------------------------------------------------------------------


UPDATE T_EDIP_FEATURE 
SET
FeatureLabel = 'Review BD (SM)' WHERE FeatureLabel = 'Review BDDS (SM)';

UPDATE T_EDIP_FEATURE 
SET
FeatureLabel = 'Review FD (SM)' WHERE FeatureLabel = 'Review FDDS (SM)';






------------------------------------------------------------------------
-- MANAGE ATTRIBUTES 
-- 
-- @program		A400M
-- @version		5.0
-- @module		ESDCR
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Update ValueList: Update existing features
------------------------------------------------------------------------


UPDATE T_EDIP_FEATURE 
SET
FeatureLabel = 'Request Approval BD' WHERE FeatureLabel = 'Review BDDS (SR)';

UPDATE T_EDIP_FEATURE 
SET
FeatureLabel = 'Request Approval FD' WHERE FeatureLabel = 'Review FDDS (SR)';







------------------------------------------------------------------------
-- MANAGE ATTRIBUTES 
-- 
-- @program		A400M
-- @version		5.0
-- @module		ESDCR
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Update ValueList: Feature’s order
------------------------------------------------------------------------


UPDATE T_EDIP_FEATURE 
SET 
FEATUREORDER = 100 WHERE FEATURELABEL = 'Batch change state PD';

UPDATE T_EDIP_FEATURE 
SET 
FEATUREORDER = 101 WHERE FEATURELABEL = 'Batch change state WD';

UPDATE T_EDIP_FEATURE 
SET 
FEATUREORDER = 102 WHERE FEATURELABEL = 'Batch request validation PD';

UPDATE T_EDIP_FEATURE 
SET 
FEATUREORDER = 103 WHERE FEATURELABEL = 'Batch request validation WD';

UPDATE T_EDIP_FEATURE 
SET 
FEATUREORDER = 104 WHERE FEATURELABEL = 'Batch Request Approval PD';

UPDATE T_EDIP_FEATURE 
SET 
FEATUREORDER = 105 WHERE FEATURELABEL = 'Batch Request Approval WD';

UPDATE T_EDIP_FEATURE 
SET 
FEATUREORDER = 106 WHERE FEATURELABEL = 'Batch Review PD (APP)';

UPDATE T_EDIP_FEATURE 
SET 
FEATUREORDER = 107 WHERE FEATURELABEL = 'Batch review WD';
  
