------------------------------------------------------------------------
-- MANAGE ATTRIBUTES : ADD, UPDATE AND DELETE ATTRIBUTES
--
-- @program        	A350
-- @version        	1.32.0.4
-- @module        	ELCODATA
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- UPDATE ATTRIBUTES
--
-- @program        	A350
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
IF (NOT EXISTS( SELECT * FROM T_CHOICELIST
                    WHERE ChoiceList = 'FINDS_EDD_Type')
) BEGIN
    -- Insert data to select into T_CHOICELIST table
    INSERT INTO T_CHOICELIST
        VALUES ('FINDS_EDD_Type', 'DATA TABLE', NULL)
    INSERT INTO T_CHOICELIST
        VALUES ('FINDS_EDD_Type', 'LOAD', NULL)
    INSERT INTO T_CHOICELIST
        VALUES ('FINDS_EDD_Type', 'PCD', NULL)
    INSERT INTO T_CHOICELIST
        VALUES ('FINDS_EDD_Type', 'Uninstall', NULL)
END
