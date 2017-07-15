--------------------------------------------------------------------------------
-- UPDATE FEATURES
--
-- @program		A350
-- @version		1.33
-- @module		ELCODATA
--
-- List of features updated:
--	- Download ATA XX attributes
--	- Update EDD P/CD from Excel        ( => Update EDD from Excel)
--      - Edit ELA
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- Requirements :   DD-350-EDDLOADfeat-220
-- Description : Redefine the "Download ATA XX attributes" feature where clause
--   to integrate it on "EDD LOAD" interface
--------------------------------------------------------------------------------
UPDATE T_FEATURE
    SET where_clause = 'SELECT id_ds
                            FROM R_FIN_DS
                            WHERE id_ds = #id_ds#
                            AND ds_type = 4
                            AND (MG < 3 OR MG IS NULL)
                            AND FINDS_EDD_Type IN (''PCD'',''LOAD'')'
    WHERE label = 'Download ATA XX attributes'


--------------------------------------------------------------------------------
-- Requirements :   DD-A350-EDDLOADfeat-230
-- Description : Redefine the "Update EDD P/CD from Excel" feature name and
--   where clause to integrate it on "EDD LOAD" interface but only if the
--   state <> "Validated"
--------------------------------------------------------------------------------
UPDATE T_FEATURE
    SET label           = 'Update EDD from Excel',
        description     = 'Update EDD from Excel',
        where_clause    = 'SELECT id_ds
                            FROM R_FIN_DS
                            WHERE id_ds = #id_ds#
                            AND ds_type = 4
                            AND (
                                    (
                                        (MG < 3 OR MG IS NULL)
                                        AND FINDS_EDD_Type = ''PCD''
                                    )
                                    OR
                                    (
                                        EDD_Load_State <> ''Validated''
                                        AND FINDS_EDD_Type = ''LOAD''
                                    )
                                )'
    WHERE label = 'Update EDD P/CD from Excel'


------------------------------------------------------------------------
-- Redefine "where clause" access to feature "Edit ELA"
------------------------------------------------------------------------
UPDATE T_FEATURE
  SET description = NULL,
      where_clause = '
        SELECT id_ds
          FROM R_FIN_DS
          WHERE id_ds = #id_ELA#'
  WHERE label = 'Edit ELA'

