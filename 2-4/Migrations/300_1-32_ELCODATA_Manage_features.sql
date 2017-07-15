------------------------------------------------------------------------
-- MANAGE FEATURES : ADD, UPDATE AND DELETE FEATURES
--
-- @program		All
-- @version		1.32
-- @module		ELCODATA
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- UPDATE FEATURES
--
-- List of features updated:
--	- Create EDD
--
--	- Update several features to make uniform the process to update EDD status
--		* Upgrade to upper MG
--		* Downgrade to lower MG
--		* Validate DATA TABLE
--		* Downgrade DATA TABLE
--		* Downgrade EDD MG3
------------------------------------------------------------------------

------------------------------------------------------------------------
-- Rename the feature name "Create EDD" to "Create EDD P/CD"
------------------------------------------------------------------------
UPDATE T_FEATURE
	SET label = 'Create EDD P/CD'
	WHERE label = 'Create EDD'

------------------------------------------------------------------------
-- Update of linked_url column to allow the new management of EDD Status (MG, EDD Load State, EDD NO State)
------------------------------------------------------------------------
UPDATE T_FEATURE
	SET linked_url = '/BUSINESS_OBJECTS/DS/EDD/Update/EDD_Update_Status_Process.php?id_ds=#id_ds#&update_type=upgrade'
	WHERE label = 'Upgrade to upper MG'
UPDATE T_FEATURE
	SET linked_url = '/BUSINESS_OBJECTS/DS/EDD/Update/EDD_Update_Status_Process.php?id_ds=#id_ds#&update_type=downgrade'
	WHERE label = 'Downgrade to lower MG'
UPDATE T_FEATURE
	SET linked_url = '/BUSINESS_OBJECTS/DS/EDD/Update/EDD_Update_Status_Process.php?id_ds=#id_ds#&update_type=upgrade'
	WHERE label = 'Validate DATA TABLE'
UPDATE T_FEATURE
	SET linked_url = '/BUSINESS_OBJECTS/DS/EDD/Update/EDD_Update_Status_Process.php?id_ds=#id_ds#&update_type=downgrade'
	WHERE label = 'Downgrade DATA TABLE'
UPDATE T_FEATURE
	SET linked_url = '/BUSINESS_OBJECTS/DS/EDD/Update/EDD_Update_Status_Process.php?id_ds=#id_ds#&update_type=downgrade'
	WHERE label = 'Downgrade EDD MG3'
