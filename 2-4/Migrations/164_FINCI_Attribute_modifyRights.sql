------------------------------------------------------------------------
-- Grant access to all attributes 
------------------------------------------------------------------------


DECLARE @id_role_mafuCMCL INT
SELECT @id_role_mafuCMCL = id_role FROM T_USER_ROLE WHERE name_role = 'MAFU CM Change Leader'

DECLARE @id_attr INT

------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------
-- FINCI_Sensitive
------------------------------------------------------------------------------------------------------------------

SELECT @id_attr = id_infobase FROM InfoBase WHERE object_value = 'FINCI_Sensitive' AND table_name = 'R_FIN_CI'

-- MAFU CM Change Leader				
IF EXISTS (SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role = @id_role_mafuCMCL  and idr_infobase = @id_attr  )
	DELETE FROM  T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role = @id_role_mafuCMCL  and idr_infobase = @id_attr


------------------------------------------------------------------------------------------------------------------
-- FINCI_ParameterLocalName
------------------------------------------------------------------------------------------------------------------

SELECT @id_attr = id_infobase FROM InfoBase WHERE object_value = 'FINCI_ParameterLocalName' AND table_name = 'R_FIN_CI'

-- MAFU CM Change Leader				
IF EXISTS (SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role = @id_role_mafuCMCL  and idr_infobase = @id_attr  )
	DELETE FROM  T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role = @id_role_mafuCMCL  and idr_infobase = @id_attr



------------------------------------------------------------------------------------------------------------------
-- FINCI_429InputBusName 
------------------------------------------------------------------------------------------------------------------

SELECT @id_attr = id_infobase FROM InfoBase WHERE object_value = 'FINCI_429InputBusName ' AND table_name = 'R_FIN_CI'

-- MAFU CM Change Leader				
IF EXISTS (SELECT * FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role = @id_role_mafuCMCL  and idr_infobase = @id_attr  )
	DELETE FROM  T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_user_role =  @id_role_mafuCMCL and idr_infobase = @id_attr




