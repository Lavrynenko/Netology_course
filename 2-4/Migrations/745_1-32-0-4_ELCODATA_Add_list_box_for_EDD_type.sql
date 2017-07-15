------------------------------------------------------------------------
-- MANAGE ATTRIBUTES : ADD, UPDATE AND DELETE ATTRIBUTES
--
-- @program        	All
-- @version        	1.32.0.4
-- @module        	ELCODATA
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- UPDATE ATTRIBUTES
--
-- @program        	All
-- @version        	1.32.0.4
-- @module        	ELCODATA
--
-- List of attributes updated:
--    - EDD Type                                        	(R_FIN_DS)
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Update the attribute : "EDD Type" from R_FIN_DS
-- Columns modified into InfoBase:
--         - type_search (the attribute type on search page)
--         - list_val (the list of value to select)
------------------------------------------------------------------------
-- Modify the attribute into table InfoBase
UPDATE InfoBase
    SET type_search = 'listv',
        list_val = 'SELECT choiceValue FROM T_CHOICELIST WHERE choicelist = "FINDS_EDD_Type"'
    WHERE object_value = 'FINDS_EDD_Type'
