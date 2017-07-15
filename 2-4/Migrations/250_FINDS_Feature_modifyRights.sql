


/* 
@Common_User INT,  @EPC_ATA24 INT, @EPC_ATAXX INT, @EPC_Consult INT, @EPC_ModuleVC_PINOwner INT, @EPC_Super_Admin INT, 
*/

DECLARE  @EPC_ModuleVC_PINOwner  INT
DECLARE @id_feature INT

/*
SELECT @Common_User = id_role FROM T_USER_ROLE WHERE name_role='Common user'
SELECT @EPC_ATA24 = id_role FROM T_USER_ROLE WHERE name_role='EPC ATA24'
SELECT @EPC_ATAXX = id_role FROM T_USER_ROLE WHERE name_role='EPC ATAXX'
SELECT @EPC_Consult = id_role FROM T_USER_ROLE WHERE name_role='EPC Consult'
SELECT @EPC_ModuleVC_PINOwner = id_role FROM T_USER_ROLE WHERE name_role='EPC SSPM owner'
SELECT @EPC_Super_Admin = id_role FROM T_USER_ROLE WHERE name_role='EPC Super Admin'
*/
SELECT @EPC_ModuleVC_PINOwner = id_role FROM T_USER_ROLE WHERE name_role='EPC Module - VC PIN Owner'



------------------------------------------------------------------------------------------------------------------
-- Check In LOAD FIN - VC PIN
------------------------------------------------------------------------------------------------------------------

SELECT @id_feature = id_feature FROM t_feature
	WHERE label = 'Check In LOAD FIN - VC PIN'
		AND linked_url = 'BUSINESS_OBJECTS/DS/EDD/Checkin/EDD_NO_CheckIn_Form.php?id_ds=#id_ds#'
		AND display_context = ';DS/CONSULT;'

--Delete permission for 'Check In LOAD FIN - VC PIN'
DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @id_feature

--Add permission
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@id_feature, @EPC_ModuleVC_PINOwner)




------------------------------------------------------------------------------------------------------------------
-- Check Out LOAD FIN - VC PIN
------------------------------------------------------------------------------------------------------------------

SELECT @id_feature = id_feature FROM t_feature
	WHERE label = 'Check Out LOAD FIN - VC PIN'
		AND linked_url = 'BUSINESS_OBJECTS/DS/EDD/Checkin/EDD_NO_CheckIn_Form.php?id_ds=#id_ds#'
		AND display_context = ';DS/CONSULT;'

--Delete permission for 'Check Out LOAD FIN - VC PIN'
DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @id_feature

--Add permission
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@id_feature, @EPC_ModuleVC_PINOwner)


------------------------------------------------------------------------------------------------------------------
-- Create LOAD FIN - VC PIN
------------------------------------------------------------------------------------------------------------------


SELECT @id_feature = id_feature FROM t_feature
	WHERE label = 'Create LOAD FIN - VC PIN'
		AND linked_url = 'BUSINESS_OBJECTS/DS/EDD/creation/EDD_Creation_process.php?id_fin=#id_fin#'
		AND display_context = ';CI/CONSULT;'

--Delete permission for 'Create LOAD FIN - VC PIN'
DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @id_feature

--Add permission
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@id_feature, @EPC_ModuleVC_PINOwner)


------------------------------------------------------------------------------------------------------------------
-- Delete LOAD FIN - VC PIN
------------------------------------------------------------------------------------------------------------------


SELECT @id_feature = id_feature FROM t_feature
	WHERE label = 'Delete LOAD FIN - VC PIN'
		AND linked_url = 'BUSINESS_OBJECTS/DS/EDD/DELETE/EDD_Deletion_Process.php?id_ds=#id_ds#&id_fin=#id_fin#'
		AND display_context = ';DS/CONSULT;'

--Delete permission for 'Delete LOAD FIN - VC PIN'
DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @id_feature

--Add permission
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@id_feature, @EPC_ModuleVC_PINOwner)



------------------------------------------------------------------------------------------------------------------
-- Freeze LOAD FIN - VC PIN
------------------------------------------------------------------------------------------------------------------



SELECT @id_feature = id_feature FROM t_feature
	WHERE label = 'Freeze LOAD FIN - VC PIN'
		AND linked_url = 'BUSINESS_OBJECTS/DS/EDD/Freeze/EDD_NO_Freeze_Form.php?id_ds=#id_ds#'
		AND display_context = ';DS/CONSULT;'

--Delete permission for 'Check Out LOAD FIN - VC PIN'
DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @id_feature

--Add permission
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@id_feature, @EPC_ModuleVC_PINOwner)



------------------------------------------------------------------------------------------------------------------
-- Link MP to LOAD FIN - VC PIN
------------------------------------------------------------------------------------------------------------------


SELECT @id_feature = id_feature FROM t_feature
	WHERE label = 'Link MP to LOAD FIN - VC PIN'
		AND linked_url = 'BUSINESS_OBJECTS/DS/EDD/Link/Link_MP/EDD_linkMP_Form.php?id_ds=#id_ds#'
		AND display_context = ';DS/CONSULT;'

--Delete permission for 'Link MP to LOAD FIN - VC PIN'
DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @id_feature

--Add permission
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@id_feature, @EPC_ModuleVC_PINOwner)

------------------------------------------------------------------------------------------------------------------
-- Unlink MP to LOAD FIN - VC PIN
------------------------------------------------------------------------------------------------------------------

SELECT @id_feature = id_feature FROM t_feature
	WHERE label = 'Unlink MP to LOAD FIN - VC PIN'
		AND linked_url = 'BUSINESS_OBJECTS/DS/EDD/Unlink/Unlink_MP/Unlink_MP_Form.php?id_ds=#id_ds#'
		AND display_context = ';DS/CONSULT;'

--Delete permission for 'Unlink MP to LOAD FIN - VC PIN'
DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @id_feature

--Add permission
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@id_feature, @EPC_ModuleVC_PINOwner)


------------------------------------------------------------------------------------------------------------------
-- Upload LOAD FIN - VC PIN
------------------------------------------------------------------------------------------------------------------

SELECT @id_feature = id_feature FROM t_feature
	WHERE label = 'Upload LOAD FIN - VC PIN'
		AND linked_url = 'BUSINESS_OBJECTS/DS/EDD/Upload/EDD_NO_Upload_ConfirmMessage.php?id_ds=#id_ds#'
		AND display_context = ';DS/CONSULT;'

--Delete permission for 'Check Out LOAD FIN - VC PIN'
DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @id_feature

--Add permission
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@id_feature, @EPC_ModuleVC_PINOwner)


------------------------------------------------------------------------------------------------------------------
-- Validate LOAD FIN - VC PIN
------------------------------------------------------------------------------------------------------------------


SELECT @id_feature = id_feature FROM t_feature
	WHERE label = 'Validate LOAD FIN - VC PIN'
		AND linked_url = 'BUSINESS_OBJECTS/DS/EDD/Validate/EDD_NO_Validate_Form.php?id_ds=#id_ds#'
		AND display_context = ';DS/CONSULT;'

--Delete permission for 'Validate LOAD FIN - VC PIN'
DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @id_feature

--Add permission
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@id_feature, @EPC_ModuleVC_PINOwner)



