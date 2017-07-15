------------------------------------------------------------------------
-- MANAGE RIGHT ACCESS ON ATTRIBUTES : GRANT AND REMOVE ACCESS TO ATTRIBUTES
--
-- @program		A350
-- @version		1.32.1
-- @module		ELCODATA
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- GRANT RIGHTS ACCESS TO ATTRIBUTES
-- List of attributes updated:

--	- AFD Option  				(EPC Consult, EPC ATAXX, EPC ATA24)
--	- PDMI On Battery  			(EPC Consult, EPC ATAXX, EPC ATA24)
--	- Intelligent Protection  	(EPC ATA24)
--	- GFI option  				(EPC ATA24)
--	- GFI trip current (mA)		(EPC ATA24)
--	- Direct Signal Name		(EPC ATA24)
--	- Direct Line Name			(EPC ATA24)
--	- ICD Treatment Number		(EPC ATA24)
--	- TR Loss Load Group		(EPC Consult, EPC ATAXX, EPC ATA24)

------------------------------------------------------------------------

DECLARE @id_role_consult INT, @id_role_ataxx INT, @id_role_ata24 INT, @id_attr INT


SELECT @id_role_consult = id_role FROM T_USER_ROLE WHERE name_role = 'EPC Consult'
SELECT @id_role_ataxx = id_role FROM T_USER_ROLE WHERE name_role = 'EPC ATAXX'
SELECT @id_role_ata24 = id_role FROM T_USER_ROLE WHERE name_role = 'EPC ATA24'



------------------------------------------------------------------------
-- Grant access to  attribute "AFD option"
------------------------------------------------------------------------

SELECT @id_attr = id_infobase FROM InfoBase WHERE object_value = 'RCCB_AFD_Option' AND table_name = 'R_FIN_DS'

UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET read_mode = '1',
		write_mode = '0',
		fast_search = '0'
	WHERE idr_user_role = @id_role_ataxx
	AND idr_infobase = @id_attr

UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET read_mode = '1',
		write_mode = '1',
		fast_search = '0'
	WHERE idr_user_role = @id_role_ata24
	AND idr_infobase = @id_attr



------------------------------------------------------------------------
-- Grant access to new attribute "PDMI On Battery"
------------------------------------------------------------------------

SELECT @id_attr = id_infobase FROM InfoBase WHERE object_value = 'pdmi_on_battery' AND table_name = 'R_FIN_DS'

IF (NOT EXISTS(	SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE
					WHERE idr_user_role = @id_role_consult
					AND idr_infobase = @id_attr
					)
)

	 BEGIN
		INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
			SELECT @id_role_consult, @id_attr, '1', '0', '0'
	 END


IF (NOT EXISTS(	SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE
					WHERE idr_user_role = @id_role_ataxx
					AND idr_infobase = @id_attr
					)
)

 BEGIN
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		SELECT @id_role_ataxx, @id_attr, '1', '1', '0'
 END


IF (NOT EXISTS(	SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE
					WHERE idr_user_role = @id_role_ata24
					AND idr_infobase = @id_attr
					)
)

 BEGIN
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		SELECT @id_role_ata24, @id_attr, '1', '1', '0'
 END



------------------------------------------------------------------------
-- Grant access to attribute "Intelligent Protection"
------------------------------------------------------------------------

SELECT @id_attr = id_infobase FROM InfoBase WHERE object_value = 'intelligent_GFI_option' AND table_name = 'R_FIN_DS'

IF (NOT EXISTS(	SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE
					WHERE idr_user_role = @id_role_ata24
					AND idr_infobase = @id_attr
					)
)

 BEGIN
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		SELECT @id_role_ata24, @id_attr, '1', '0', '0'
 END



------------------------------------------------------------------------
-- Grant access to attribute "GFI option"
------------------------------------------------------------------------

SELECT @id_attr = id_infobase FROM InfoBase WHERE object_value = 'GFIEnabled' AND table_name = 'R_FIN_DS'

IF (NOT EXISTS(	SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE
					WHERE idr_user_role = @id_role_ata24
					AND idr_infobase = @id_attr
					)
)

 BEGIN
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		SELECT @id_role_ata24, @id_attr, '1', '0', '0'
 END



------------------------------------------------------------------------
-- Grant access to attribute "GFI trip current (mA)"
------------------------------------------------------------------------

SELECT @id_attr = id_infobase FROM InfoBase WHERE object_value = 'GFITripCurrent' AND table_name = 'R_FIN_DS'

IF (NOT EXISTS(	SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE
					WHERE idr_user_role = @id_role_ata24
					AND idr_infobase = @id_attr
					)
)

 BEGIN
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		SELECT @id_role_ata24, @id_attr, '1', '0', '0'
 END



------------------------------------------------------------------------
-- Grant access to attribute "Direct Signal Name"
------------------------------------------------------------------------

SELECT @id_attr = id_infobase FROM InfoBase WHERE object_value = 'FINDS_CommandSignal' AND table_name = 'R_FIN_DS'

IF (NOT EXISTS(	SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE
					WHERE idr_user_role = @id_role_ata24
					AND idr_infobase = @id_attr
					)
)

 BEGIN
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		SELECT @id_role_ata24, @id_attr, '1', '0', '0'
 END




------------------------------------------------------------------------
-- Grant access to attribute "Direct Line Name"
------------------------------------------------------------------------

SELECT @id_attr = id_infobase FROM InfoBase WHERE object_value = 'FINDS_CommandLine' AND table_name = 'R_FIN_DS'

IF (NOT EXISTS(	SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE
					WHERE idr_user_role = @id_role_ata24
					AND idr_infobase = @id_attr
					)
)

 BEGIN
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		SELECT @id_role_ata24, @id_attr, '1', '0', '0'
 END



------------------------------------------------------------------------
-- Grant access to attribute "ICD treatment number"
------------------------------------------------------------------------

SELECT @id_attr = id_infobase FROM InfoBase WHERE object_value = 'ICDTreatmentNumber' AND table_name = 'R_FIN_DS'

IF (NOT EXISTS(	SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE
					WHERE idr_user_role = @id_role_ata24
					AND idr_infobase = @id_attr
					)
)

 BEGIN
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		SELECT @id_role_ata24, @id_attr, '1', '0', '0'
 END



------------------------------------------------------------------------
-- Grant access to new attribute "TR Loss Load Group"
------------------------------------------------------------------------

SELECT @id_attr = id_infobase FROM InfoBase WHERE object_value = 'TR_loss_load_group' AND table_name = 'R_FIN_DS'

IF (NOT EXISTS(	SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE
					WHERE idr_user_role = @id_role_consult
					AND idr_infobase = @id_attr
					)
)

	 BEGIN
		INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
			SELECT @id_role_consult, @id_attr, '1', '0', '0'
	 END


IF (NOT EXISTS(	SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE
					WHERE idr_user_role = @id_role_ataxx
					AND idr_infobase = @id_attr
					)
)

 BEGIN
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		SELECT @id_role_ataxx, @id_attr, '1', '0', '0'
 END


IF (NOT EXISTS(	SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE
					WHERE idr_user_role = @id_role_ata24
					AND idr_infobase = @id_attr
					)
)

 BEGIN
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		SELECT @id_role_ata24, @id_attr, '1', '1', '0'
 END
