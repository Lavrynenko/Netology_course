------------------------------------------------------------------------
-- UPDATE FEATURES
--
-- @program		ALL
-- @version		2.0
-- @module		ELCODATA
--
-- List of features deleted:
--      - Export PRS 
--      - Export IES
--      - Generate Prerequisite file
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Delete feature "Export PRS" 
------------------------------------------------------------------------
DELETE
  FROM T_LINK_FEATURE_USER_ROLE
  WHERE idr_feature = (
    SELECT id_feature FROM T_FEATURE WHERE label = 'Export PRS'
     
  )

DELETE FROM T_FEATURE   WHERE label = 'Export PRS'


------------------------------------------------------------------------
-- Delete feature "Export IES" 
------------------------------------------------------------------------
DELETE
  FROM T_LINK_FEATURE_USER_ROLE
  WHERE idr_feature = (
    SELECT id_feature FROM T_FEATURE WHERE label = 'Export IES'
     
  )

DELETE FROM T_FEATURE   WHERE label = 'Export IES'


------------------------------------------------------------------------
-- Delete feature "Generate prerequisite file" 
------------------------------------------------------------------------
DELETE
  FROM T_LINK_FEATURE_USER_ROLE
  WHERE idr_feature = (
    SELECT id_feature FROM T_FEATURE WHERE label = 'Generate prerequisite file'
     
  )

DELETE FROM T_FEATURE   WHERE label = 'Generate prerequisite file'
 