------------------------------------------------------------------------
-- UPDATE FEATURES
--
-- @program		ALL
-- @version		2.0
-- @module		PSE
--
-- List of features deleted:
--      - Update Features linked_url starting by '/' 
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Update Features linked_url starting by '/' 
-- Replace '/url' by 'url'
------------------------------------------------------------------------

UPDATE T_FEATURE SET linked_url = SUBSTRING(linked_url,2,40000) WHERE SUBSTRING(linked_url,1,1)='/'
