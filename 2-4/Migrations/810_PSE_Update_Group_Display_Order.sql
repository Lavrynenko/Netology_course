------------------------------------------------------------------------
-- UPDATE THE "display_order" COLUMN FOR SEVERAL GROUP DECLARED
--  ON TABLE T_ATTR_GROUP
--
-- @program     All
-- @version     1.33
-- @module      PSE_Application
--
----------------------------------------------------------------------

IF EXISTS (    SELECT * FROM dbo.sysobjects
                WHERE id = object_id(N'[dbo].[sp_Update_object_order_group]')
                AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[sp_Update_object_order_group]
GO

CREATE PROCEDURE sp_Update_object_order_group
    @label_restriction    VARCHAR(80),
    @table_restriction    VARCHAR(80),
    @counter              INT
AS

    -- Declare Cursor columns variables
    DECLARE @id_group INT

    -- Declare counter variables
    DECLARE @final_object_order INT

    -- Declare Cursor
    DECLARE Cursor_object_order CURSOR
    FOR
        SELECT G.id_attr_group
            FROM T_ATTR_GROUP G, T_OBJECT O, T_LINK_ATTRGROUP_OBJECT L
            WHERE G.id_attr_group = L.idr_attr_group
            AND O.id_object = L.idr_object
            AND O.label = @label_restriction
            AND O.table_primary_key = @table_restriction
            ORDER BY G.display_order, G.label

    -- Open Cursor
    OPEN Cursor_object_order

    -- Read the first cursor line
    FETCH Cursor_object_order INTO @id_group
    SET @final_object_order = @counter

    -- Treatment loop
    WHILE @@fetch_Status = 0
    BEGIN
        -- Treatment
        UPDATE T_ATTR_GROUP
            SET display_order = @final_object_order
            WHERE id_attr_group = @id_group

        SET @final_object_order = @final_object_order + @counter

        -- Read the following line
        FETCH Cursor_object_order INTO @id_group
    END

    -- Close Cursor
    CLOSE Cursor_object_order

    -- Deallocate cursor from memory
    DEALLOCATE Cursor_object_order

GO


-- Execute the procedure for the following tables
EXEC sp_Update_object_order_group 'FIN DS', 'R_FIN_DS', 10

-- Drop the procedure after utilisation
DROP PROCEDURE [dbo].[sp_Update_object_order_group]