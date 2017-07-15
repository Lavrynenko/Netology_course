------------------------------------------------------------------------
-- MANAGE ATTRIBUTES : ADD, UPDATE AND DELETE ATTRIBUTES
--
-- @program			All
-- @version			1.32.1
-- @module			ELCODATA
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- ADD ATTRIBUTES
--
-- @program			All
-- @version			1.32.1
-- @module			ELCODATA
--
-- List of attributes updated:
--    - PDMI on Battery                             (R_FIN_DS)
--    - TR Loss Load Group                     		(R_FIN_DS)
------------------------------------------------------------------------

------------------------------------------------------------------------
-- Add the attribute : "PDMI on Battery" from R_FIN_DS

-- New ROW added into InfoBase:

------------------------------------------------------------------------

IF (NOT EXISTS( SELECT * FROM InfoBase
                    WHERE object_value = 'pdmi_on_battery' and table_name='R_FIN_DS' )
	) BEGIN

		INSERT INTO InfoBase ( object_name, object_value, table_name, type_search, type_edit, type_val, list_val  )
		SELECT
			   'PDMI on Battery',
			   'pdmi_on_battery',
			   'R_FIN_DS',
			   'listv',
			   'listv',
			   'text',
			   'Yes;No'
	 END


IF( NOT EXISTS (
		SELECT * FROM syscolumns
		WHERE syscolumns.id = (	SELECT sysobjects.id from sysobjects WHERE name = 'R_FIN_DS' )
		 AND syscolumns.name = 'pdmi_on_battery'
		)
  )
	BEGIN
		ALTER TABLE dbo.R_FIN_DS ADD pdmi_on_battery varchar(8000) NULL
	END



------------------------------------------------------------------------
-- Add the attribute : "TR Loss Load Group" from R_FIN_DS

-- New ROW added into InfoBase:

------------------------------------------------------------------------

IF (NOT EXISTS( SELECT * FROM InfoBase
                    WHERE object_value = 'TR_loss_load_group' and table_name='R_FIN_DS' )
	) BEGIN

		INSERT INTO InfoBase ( object_name, object_value, table_name, type_search, type_edit, type_val, list_val  )
		SELECT
			   'TR Loss Load Group',
			   'TR_loss_load_group',
			   'R_FIN_DS',
			   'listv',
			   'listv',
			   'text',
			   'Yes;No'
	 END


IF( NOT EXISTS (
		SELECT * FROM syscolumns
		WHERE syscolumns.id = (	SELECT sysobjects.id from sysobjects WHERE name = 'R_FIN_DS' )
		 AND syscolumns.name = 'TR_loss_load_group'
		)
  )
	BEGIN
		ALTER TABLE dbo.R_FIN_DS ADD TR_loss_load_group varchar(8000) NULL
	END