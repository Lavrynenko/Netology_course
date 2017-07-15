-- Rights attributes Fast Search

UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
SET fast_search = '0'
WHERE idr_user_role IN (SELECT id_role FROM T_USER_ROLE WHERE name_role = 'EPC Consult')

-- Attribute MSN
UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = '1'
	WHERE idr_infobase IN (SELECT id_infobase FROM INFOBASE WHERE object_value = 'MSN' AND table_name = 'T_MSN')
	AND idr_user_role IN (SELECT id_role FROM T_USER_ROLE WHERE name_role = 'EPC Consult')


-- Attribute ATA
UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = '1'
	WHERE idr_infobase IN (SELECT id_infobase FROM INFOBASE WHERE object_value = 'ATACode' AND table_name = 'R_ATA')
	AND idr_user_role IN (SELECT id_role FROM T_USER_ROLE WHERE name_role = 'EPC Consult')


-- Attribute FIN Name
UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = '1'
	WHERE idr_infobase IN (SELECT id_infobase FROM INFOBASE WHERE object_value = 'FIN' AND table_name = 'R_FIN_CI')
	AND idr_user_role IN (SELECT id_role FROM T_USER_ROLE WHERE name_role = 'EPC Consult')


-- Attribute Functional Designation
UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = '1'
	WHERE idr_infobase IN (SELECT id_infobase FROM INFOBASE WHERE object_value = 'FunctionnalDesignation' AND table_name = 'R_FIN_CI')
	AND idr_user_role IN (SELECT id_role FROM T_USER_ROLE WHERE name_role = 'EPC Consult')


-- Attribute EDD Reference
UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = '1'
	WHERE idr_infobase IN (SELECT id_infobase FROM INFOBASE WHERE object_value = 'EDDReference' AND table_name = 'R_FIN_DS')
	AND idr_user_role IN (SELECT id_role FROM T_USER_ROLE WHERE name_role = 'EPC Consult')


-- Attribute Power Center (EDD Power Center)
UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = '1'
	WHERE idr_infobase IN (SELECT id_infobase FROM INFOBASE WHERE object_value = 'Panel' AND table_name = 'R_FIN_DS')
	AND idr_user_role IN (SELECT id_role FROM T_USER_ROLE WHERE name_role = 'EPC Consult')


-- Attribute CR Reference
if(
  NOT exists (SELECT * 
		FROM T_PERMISSION_ACCESS_ATTRIBUTE 
		WHERE idr_infobase IN (SELECT id_infobase FROM INFOBASE WHERE object_value = 'cr_RequestReference' AND table_name = 'V_CR')
		AND idr_user_role IN (SELECT id_role FROM T_USER_ROLE WHERE name_role = 'EPC Consult')))

BEGIN
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE (idr_user_role, idr_infobase, read_mode, write_mode, fast_search)
		SELECT 
			(SELECT id_role FROM T_USER_ROLE WHERE name_role = 'EPC Consult'),
			(SELECT id_infobase FROM INFOBASE WHERE object_value = 'cr_RequestReference' AND table_name = 'V_CR'),
			('1'),
			('0'),
			('1')
END
			
ELSE
BEGIN
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
		SET fast_search = '1'
		WHERE idr_infobase IN (SELECT id_infobase FROM INFOBASE WHERE object_value = 'cr_RequestReference' AND table_name = 'V_CR')
		AND idr_user_role IN (SELECT id_role FROM T_USER_ROLE WHERE name_role = 'EPC Consult')
END		


-- Attribute MP
UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = '1'
	WHERE idr_infobase IN (SELECT id_infobase FROM INFOBASE WHERE object_value = 'MPReference' AND table_name = 'T_MP')
	AND idr_user_role IN (SELECT id_role FROM T_USER_ROLE WHERE name_role = 'EPC Consult')


-- Attribute MOD
UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = '1'
	WHERE idr_infobase IN (SELECT id_infobase FROM INFOBASE WHERE object_value = 'MODReference' AND table_name = 'T_MOD')
	AND idr_user_role IN (SELECT id_role FROM T_USER_ROLE WHERE name_role = 'EPC Consult')


-- Attribute Part Number
UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = '1'
	WHERE idr_infobase IN (SELECT id_infobase FROM INFOBASE WHERE object_value = 'PN' AND table_name = 'R_Equipment')
	AND idr_user_role IN (SELECT id_role FROM T_USER_ROLE WHERE name_role = 'EPC Consult')


-- Attribute Maturity Gate
UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = '1'
	WHERE idr_infobase IN (SELECT id_infobase FROM INFOBASE WHERE object_value = 'MG' AND table_name = 'R_FIN_DS')
	AND idr_user_role IN (SELECT id_role FROM T_USER_ROLE WHERE name_role = 'EPC Consult')


