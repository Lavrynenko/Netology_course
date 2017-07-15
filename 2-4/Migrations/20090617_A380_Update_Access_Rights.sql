									-------------------------------------------------- 
									-- Update Access Right for following Attributes --
									-- TEFO High Speed Max (%)    					--
									-- TEFO High Speed Operational (%)    			--
									-- TEFO Low Speed Max (%)    					--
									-- TEFO Low Speed Operational (%)    			--
									-- LMES High Speed Max (%)    					--
									-- LMES High Speed Operational (%)    			--
									-- LMES Low Speed Max (%)						--
									-- LMES Low Speed Operational (%) 				--
									--------------------------------------------------

--Declaration
Declare @idInfobase int
Declare @idUserRoleConsult int


/************
** TEFO High Speed Max (%) **
******************/
--Init data
Select @idInfobase=id_infobase FROM infobase where object_value='TEFO_High_Speed_Max' and table_name='V_ELA'
Select @idUserRoleConsult=id_role FROM t_user_role where name_role='EPC Consult'

DELETE FROM t_permission_access_attribute 
WHERE idr_infobase=@idInfobase 
AND idr_user_role=@idUserRoleConsult


/************
** TEFO High Speed Operational (%) **
******************/
--Init data
Select @idInfobase=id_infobase FROM infobase where object_value='TEFO_HighSpeed_Operational' and table_name='V_ELA'
Select @idUserRoleConsult=id_role FROM t_user_role where name_role='EPC Consult'

DELETE FROM t_permission_access_attribute 
WHERE idr_infobase=@idInfobase 
AND idr_user_role=@idUserRoleConsult


/************
** TEFO Low Speed Max (%) **
******************/
--Init data
Select @idInfobase=id_infobase FROM infobase where object_value='TEFO_LowSpeed_max' and table_name='V_ELA'
Select @idUserRoleConsult=id_role FROM t_user_role where name_role='EPC Consult'

DELETE FROM t_permission_access_attribute 
WHERE idr_infobase=@idInfobase 
AND idr_user_role=@idUserRoleConsult


/************
** TEFO Low Speed Operational (%) **
******************/
--Init data
Select @idInfobase=id_infobase FROM infobase where object_value='TEFO_LowSpeed_Operational' and table_name='V_ELA'
Select @idUserRoleConsult=id_role FROM t_user_role where name_role='EPC Consult'

DELETE FROM t_permission_access_attribute 
WHERE idr_infobase=@idInfobase 
AND idr_user_role=@idUserRoleConsult


/************
** LMES High Speed Max (%) **
******************/
--Init data
Select @idInfobase=id_infobase FROM infobase where object_value='LMES_High_Speed_Max' and table_name='V_ELA'
Select @idUserRoleConsult=id_role FROM t_user_role where name_role='EPC Consult'

DELETE FROM t_permission_access_attribute 
WHERE idr_infobase=@idInfobase 
AND idr_user_role=@idUserRoleConsult



/************
** LMES High Speed Operational (%) **
******************/
--Init data
Select @idInfobase=id_infobase FROM infobase where object_value='LMES_HighSpeed_Operational' and table_name='V_ELA'
Select @idUserRoleConsult=id_role FROM t_user_role where name_role='EPC Consult'

DELETE FROM t_permission_access_attribute 
WHERE idr_infobase=@idInfobase 
AND idr_user_role=@idUserRoleConsult


/************
** LMES Low Speed Max (%) **
******************/
--Init data
Select @idInfobase=id_infobase FROM infobase where object_value='LMES_Low_Speed_Max' and table_name='V_ELA'
Select @idUserRoleConsult=id_role FROM t_user_role where name_role='EPC Consult'

DELETE FROM t_permission_access_attribute 
WHERE idr_infobase=@idInfobase 
AND idr_user_role=@idUserRoleConsult


/************
** LMES Low Speed Operational (%) **
******************/
--Init data
Select @idInfobase=id_infobase FROM infobase where object_value='LMES_LowSpeed_Operational' and table_name='V_ELA'
Select @idUserRoleConsult=id_role FROM t_user_role where name_role='EPC Consult'

DELETE FROM t_permission_access_attribute 
WHERE idr_infobase=@idInfobase 
AND idr_user_role=@idUserRoleConsult