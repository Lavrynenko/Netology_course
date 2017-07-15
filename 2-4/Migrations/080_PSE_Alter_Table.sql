------------------------------------------------------------------------
-- MANAGE ATTRIBUTES : ADD, UPDATE AND DELETE ATTRIBUTES
--
-- @program		ALL
-- @version		2.0
-- @module		ELCODATA
--
---------------------------------------------------------------------

------------------------------------------------------------------------
-- ALTER TABLE ADD COLUMN
--
-- List of columns added:

--	changeChoicelist          (InfoBase)


------------------------------------------------------------------------

-- Add new column  'changeChoicelist' on table "InfoBase"

IF (NOT EXISTS( SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'InfoBase' AND COLUMN_NAME = 'changeChoicelist'))
BEGIN
  ALTER TABLE InfoBase  ADD changeChoicelist [bit] NOT NULL DEFAULT (0) 
END


