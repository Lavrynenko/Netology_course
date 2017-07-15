------------------------------------------------------------------------
-- UPDATE THE "object_order" COLUMN FOR SEVERAL ATTRIBUTES DECLARED ON TABLE InfoBase
--
-- @program        All
-- @version        1.32
-- @module        PSE_Application
--
----------------------------------------------------------------------

IF EXISTS (    SELECT * FROM dbo.sysobjects
                WHERE id = object_id(N'[dbo].[sp_Update_object_order]')
                AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[sp_Update_object_order]
GO

CREATE PROCEDURE sp_Update_object_order
    @table_restriction    VARCHAR(80),
    @counter              INT
AS

    -- Declare Cursor columns variables
    DECLARE @id_infobase INT, @idr_group INT

    -- Declare counter variables
    DECLARE @old_idr_group INT, @final_object_order INT

    -- Declare Cursor
    DECLARE Cursor_object_order CURSOR
    FOR
        SELECT IB.id_infobase, IB.idr_group
            FROM InfoBase IB, T_ATTR_GROUP AG
            WHERE IB.idr_group = AG.id_attr_group
            AND table_name = @table_restriction
            ORDER BY IB.idr_group, IB.object_order

    -- Open Cursor
    OPEN Cursor_object_order

    -- Read the first cursor line
    FETCH Cursor_object_order INTO @id_infobase, @idr_group
    SET @old_idr_group = -1
    SET @final_object_order = @counter

    -- Treatment loop
    WHILE @@fetch_Status = 0
    BEGIN
        -- Treatment
        IF (@old_idr_group >= 0) AND (@old_idr_group = @idr_group)
        BEGIN
            UPDATE InfoBase
                SET object_order = @final_object_order
                WHERE id_InfoBase = @id_infobase
            SET @final_object_order = @final_object_order + @counter
        END
        ELSE
        BEGIN
            SET @final_object_order = @counter
            UPDATE InfoBase
                SET object_order = @final_object_order
                WHERE id_InfoBase = @id_infobase
            SET @final_object_order = @final_object_order + @counter
            SET @old_idr_group = @idr_group
        END

        -- Read the following line
        FETCH Cursor_object_order INTO @id_infobase, @idr_group
    END

    -- Close Cursor
    CLOSE Cursor_object_order

    -- Deallocate cursor from memory
    DEALLOCATE Cursor_object_order

GO


-- Execute the procedure for the following tables
EXEC sp_Update_object_order 'R_FIN_DS', 10
EXEC sp_Update_object_order 'V_ELA', 10

-- Drop the procedure after utilisation
DROP PROCEDURE [dbo].[sp_Update_object_order]
