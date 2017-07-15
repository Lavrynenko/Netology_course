------------------------------------------------------------------------
-- MANAGE ATTRIBUTES : ADD, UPDATE AND DELETE ATTRIBUTES
--
-- @program		All
-- @version		1.33.0.3
-- @module		ELCODATA
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Add the new attribute DiscreteNumber on the table "T_SSPC_VL"
------------------------------------------------------------------------
IF (NOT EXISTS( SELECT column_name
			FROM information_schema.columns
			WHERE table_name = 'T_SSPC_VL'
			AND column_name = 'SSPC_VL_DiscreteNumber')
)
BEGIN
	ALTER TABLE T_SSPC_VL
		ADD SSPC_VL_DiscreteNumber VARCHAR(50)
END
