------------------------------------------------------------------------
-- Grant access to all attributes 
------------------------------------------------------------------------

DECLARE @id_role_admin INT
SELECT @id_role_admin = id_role FROM T_USER_ROLE WHERE name_role = 'Administrator'


DECLARE @id_role_common INT
SELECT @id_role_common = id_role FROM T_USER_ROLE WHERE name_role = 'Common User'


DECLARE @id_attr INT

------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------
-- ASSFINCI_name 
------------------------------------------------------------------------------------------------------------------
SELECT @id_attr = id_infobase FROM InfoBase WHERE object_value = 'ASSFINCI_name' AND table_name = 'V_ASS_SUB_FIN_CI'



-- Administrator		
IF EXISTS (SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role = @id_role_admin  and idr_infobase = @id_attr  )
	DELETE FROM  T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role =  @id_role_admin and idr_infobase = @id_attr


INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE SELECT @id_role_admin, @id_attr, '1', '0', '0'

-- common user
IF EXISTS (SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role = @id_role_common  and idr_infobase = @id_attr  )
	DELETE FROM  T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role =  @id_role_common and idr_infobase = @id_attr


INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE SELECT @id_role_common, @id_attr, '1', '0', '0'










