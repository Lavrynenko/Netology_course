------------------------------------------------------------------------
-- Grant access to attributes 
------------------------------------------------------------------------
DECLARE @id_role_common INT
SELECT @id_role_common = id_role FROM T_USER_ROLE WHERE name_role = 'Common User'


DECLARE @id_attr INT
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------
-- EquipFTIType   
------------------------------------------------------------------------------------------------------------------

SELECT @id_attr = id_infobase FROM InfoBase WHERE object_value = 'EquipFTIType' AND table_name = 'R_equipment'


-- common user
IF EXISTS (SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role = @id_role_common  and idr_infobase = @id_attr  )
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE SET read_mode = 1 WHERE idr_user_role = @id_role_common  and idr_infobase = @id_attr
ELSE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE SELECT @id_role_common, @id_attr, '1', '0', '0'



