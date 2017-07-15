									--------------------------------------------- 
									-- Update Access Right for Route Attribute --
									---------------------------------------------

--Declaration
Declare @idInfobase int
Declare @idUserRoleXX int
Declare @idUserRole24 int

--Init data
Select @idInfobase=id_infobase FROM infobase where object_value='TripCurve' and table_name='R_FIN_DS'
Select @idUserRoleXX=id_role FROM t_user_role where name_role='EPC ATAXX'
Select @idUserRole24=id_role FROM t_user_role where name_role='EPC ATA24'

--Update Access Right
UPDATE t_permission_access_attribute 
SET read_mode=1, write_mode=1 
WHERE idr_infobase=@idInfobase
AND idr_user_role=@idUserRole24

UPDATE t_permission_access_attribute 
SET read_mode=1, write_mode=1
WHERE idr_infobase=@idInfobase
AND idr_user_role=@idUserRoleXX