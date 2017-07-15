------------------------------------------------------------------------
-- MANAGE ATTRIBUTES MG
--
-- @program		A350
-- @version		1.32.0.4
-- @module		ELCODATA
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- UPDATE MG
-- List of attributes updated:
--	- AC/DC Type
--  - PIN Allocation - Power Output Connector Neutral
------------------------------------------------------------------------

------------------------------------------------------------------------
-- Update MG table on "AC/DC Type"
------------------------------------------------------------------------
UPDATE T_MG
	SET ML = 0
	WHERE Object_name = 'AC/DC Type'
	AND PCType = 'CBP'


UPDATE T_MG
	SET Object_name = 'PIN Allocation - Power Output Connector Neutral'
	WHERE Object_name = 'PIN Allocation û Power Output Connector Neutral'
