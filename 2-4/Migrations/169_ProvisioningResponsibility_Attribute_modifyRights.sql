------------------------------------------------------------------------
-- Grant access to all attributes 
------------------------------------------------------------------------

DECLARE @id_role_common_finsi_user INT
SELECT @id_role_common_finsi_user = id_role FROM T_USER_ROLE WHERE name_role = 'Common FINSI user'


DECLARE @id_role_common INT
SELECT @id_role_common = id_role FROM T_USER_ROLE WHERE name_role = 'Common User'


DECLARE @id_role_consult INT, @id_role_industrial INT 
SELECT @id_role_consult = id_role FROM T_USER_ROLE WHERE name_role = 'EPC Consult'
SELECT @id_role_industrial = id_role FROM T_USER_ROLE WHERE name_role = 'Industrial'



DECLARE @id_attr INT

------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------
-- prov_name
------------------------------------------------------------------------------------------------------------------
SELECT @id_attr = id_infobase FROM InfoBase WHERE object_value = 'prov_name' AND table_name = 'V_Provisioning_responsibility'

-- Common FINSI user		
IF EXISTS (SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role =  @id_role_common_finsi_user and idr_infobase = @id_attr  )
	DELETE FROM  T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role =  @id_role_common_finsi_user and idr_infobase = @id_attr


-- common user
IF EXISTS (SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role =  @id_role_common and idr_infobase = @id_attr  )
	DELETE FROM  T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role = @id_role_common  and idr_infobase = @id_attr


-- EPC Consult
IF EXISTS (SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role = @id_role_consult  and idr_infobase = @id_attr  )
	DELETE FROM  T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role = @id_role_consult  and idr_infobase = @id_attr


-- Industrial		
IF EXISTS (SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role = @id_role_industrial and idr_infobase = @id_attr  )
	DELETE FROM  T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role =@id_role_industrial  and idr_infobase = @id_attr


------------------------------------------------------------------------------------------------------------------
-- prov_reasonforchange
------------------------------------------------------------------------------------------------------------------
SELECT @id_attr = id_infobase FROM InfoBase WHERE object_value = 'prov_reasonforchange' AND table_name = 'V_Provisioning_responsibility'

-- Common FINSI user		
IF EXISTS (SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role =  @id_role_common_finsi_user and idr_infobase = @id_attr  )
	DELETE FROM  T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role =  @id_role_common_finsi_user and idr_infobase = @id_attr


-- common user
IF EXISTS (SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role =  @id_role_common and idr_infobase = @id_attr  )
	DELETE FROM  T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role =  @id_role_common and idr_infobase = @id_attr


-- EPC Consult
IF EXISTS (SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role =  @id_role_consult and idr_infobase = @id_attr  )
	DELETE FROM  T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role =  @id_role_consult and idr_infobase = @id_attr


-- Industrial		
IF EXISTS (SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role = @id_role_industrial and idr_infobase = @id_attr  )
	DELETE FROM  T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role =@id_role_industrial  and idr_infobase = @id_attr




