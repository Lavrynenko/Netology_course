
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
FeatureLabel = 'Review PD (APP)' WHERE FeatureLabel = 'Review PDDS (CC)';

UPDATE T_EDIP_FEATURE 
SET
FeatureLabel = 'Review WD' WHERE FeatureLabel = 'Review WDDS';

UPDATE T_EDIP_FEATURE 
SET
FeatureLabel = 'Batch Review PD (APP)' WHERE FeatureLabel = 'Batch Review PDDS (CC)';

UPDATE T_EDIP_FEATURE 
SET
FeatureLabel = 'Batch Review WD' WHERE FeatureLabel = 'Batch Review WDDS';




