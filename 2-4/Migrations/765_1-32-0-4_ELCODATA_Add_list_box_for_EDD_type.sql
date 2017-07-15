------------------------------------------------------------------------
-- MANAGE ATTRIBUTES : ADD, UPDATE AND DELETE ATTRIBUTES
--
-- @program        	A400M
-- @version        	1.32.0.4
-- @module        	ELCODATA
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- UPDATE ATTRIBUTES
--
-- @program        	A400M
-- @version        	1.32.0.4
-- @module        	ELCODATA
--
-- List of attributes updated:
--    - EDD Type                                        	(R_FIN_DS)
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Update the attribute : "EDD Type" from R_FIN_DS
------------------------------------------------------------------------
IF (NOT EXISTS( SELECT * FROM T_CHOICELIST
                    WHERE ChoiceList = 'FINDS_EDD_Type')
) BEGIN
    -- Insert data to select into T_CHOICELIST table
    INSERT INTO T_CHOICELIST
        VALUES ('FINDS_EDD_Type', 'DATA TABLE', NULL)
    INSERT INTO T_CHOICELIST
        VALUES ('FINDS_EDD_Type', 'PCD', NULL)
END
