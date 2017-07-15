--------------------------------------------------------------------------------
-- MANAGE ELCODATA FEATURES (ADD, UPDATE, DELETE)
--
-- @program		A400M
-- @version		1.33.0.3
-- @module		ELCODATA
--
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- Update several attribute
--
-- List of features updated:
--      - Unlink FIN CI P/CD
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- Update the feature Unlink FIN CI P/CD
--------------------------------------------------------------------------------

-- set the group into several groups
UPDATE T_FEATURE
  SET where_clause = '
    SELECT id_fin
      FROM R_FIN_CI
      WHERE FINCategory = ''LOAD GROUP''
      AND id_fin IN (SELECT id_fin_link FROM R_FIN_LINK)
      AND id_fin = #id_fin#
      GROUP BY id_fin
      HAVING (
        SELECT COUNT(id_ds)
          FROM R_FIN_DS
          WHERE ds_type=''4''
          AND FINDS_EDD_Type=''LOAD''
          AND EDD_Load_State <> ''In elaboration''
          AND idr_fin = #id_fin#)=0
  '
  WHERE label = 'Unlink FIN CI P/CD'

