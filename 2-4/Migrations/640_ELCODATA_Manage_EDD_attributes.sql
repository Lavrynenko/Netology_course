------------------------------------------------------------------------
-- MANAGE ATTRIBUTES : ADD, UPDATE AND DELETE ATTRIBUTES
--
-- @program		A400M
-- @version		1.33.0.3
-- @module		ELCODATA
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- UPDATE ATTRIBUTES
--
-- List of attributes updated:
--	- System View Status
--	- Nominal Power Max (W or V.A.)
--      - Default Value
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Change attribute "System View Status" display order
------------------------------------------------------------------------
UPDATE Infobase
  SET object_order = 25
  WHERE object_value = 'SVStatus'


------------------------------------------------------------------------
-- Change attribute "Nominal Power Max (W or V.A.)" display order
------------------------------------------------------------------------
UPDATE Infobase
  SET object_order = 55
  WHERE object_value = 'FINDS_NominalPowerMax'


------------------------------------------------------------------------
-- Change attribute "Default Value" display order
------------------------------------------------------------------------
UPDATE Infobase
  SET object_order = 20
  WHERE object_value = 'FINDS_SSPCDefaultValue'

