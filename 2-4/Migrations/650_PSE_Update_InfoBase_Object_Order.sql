------------------------------------------------------------------------
-- UPDATE THE "object_order" COLUMN FOR SEVERAL ATTRIBUTES DECLARED ON TABLE InfoBase
--
-- @program         A400M
-- @version         1.33.0.3
-- @module          PSE
--
----------------------------------------------------------------------

-- Execute the procedure for the following tables
EXEC sp_Update_object_order 'R_FIN_DS', 10

-- Drop the procedure after utilisation
DROP PROCEDURE [dbo].[sp_Update_object_order]

