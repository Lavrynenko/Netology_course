									--------------------------------------------- 
									-- Update Access Right for Route Attribute --
									---------------------------------------------

--Declaration
Declare @idInfobase int
Declare @idUserRoleXX int
Declare @idUserRole24 int

--Init data
Select @idInfobase=id_infobase FROM infobase where object_value='FINDS_Route' and table_name='R_FIN_DS'
Select @idUserRoleXX=id_role FROM t_user_role where name_role='EPC ATAXX'
Select @idUserRole24=id_role FROM t_user_role where name_role='EPC ATA24'

--Update Access Right
UPDATE t_permission_access_attribute 
SET read_mode=1, write_mode=1 
WHERE idr_infobase=@idInfobase
AND idr_user_role=@idUserRoleXX

INSERT INTO t_permission_access_attribute (idr_user_role,idr_infobase,read_mode,write_mode,fast_search)
VALUES (@idUserRole24,@idInfobase,1,0,0)