--------------------------------------------------------------------------------
-- MANAGE EDD ATTRIBUTES PERMISSION ACCESS
--
-- @program		A400M
-- @version		1.33.0.3
-- @module		ELCODATA
--
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- Remove EPC Administrator access to the following "EDD Load State" attribute
--------------------------------------------------------------------------------
DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE
  WHERE idr_user_role IN (
    SELECT id_role
      FROM T_USER_ROLE
      WHERE name_role = 'EPC Administrator'
  )
  AND idr_infobase = (
    SELECT id_infobase
      FROM InfoBase
      WHERE object_value = 'EDD_Load_State'
  )

