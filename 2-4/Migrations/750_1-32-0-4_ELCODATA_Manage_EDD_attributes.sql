------------------------------------------------------------------------
-- MANAGE ATTRIBUTES : ADD, UPDATE AND DELETE ATTRIBUTES
--
-- @program        All
-- @version        1.32.0.4
-- @module        ELCODATA
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- UPDATE ATTRIBUTES
--
-- @program        A350
-- @version        1.32.0.4
-- @module        ELCODATA
--
-- List of attributes updated:
--    - AC/DC type                                      	(R_FIN_DS)
--    - Phase type                                          (R_FIN_DS)
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Update the attributes : "TypePhase" and "TypeACDC from R_FIN_DS
-- Columns modified into InfoBase:
--         - mandatory
------------------------------------------------------------------------
UPDATE Infobase
	SET mandatory = '1'
	WHERE object_value IN ('TypePhase','TypeACDC')
