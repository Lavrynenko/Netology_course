-- Variable
declare @idr_user_role as int
declare @idr_infobase as int
---------------------------
-- update SADM SIRD Manager : add write mode for SIRD Natco
---------------------------
select 
			@idr_user_role = t_permission_access_attribute.idr_user_role,
			@idr_infobase = t_permission_access_attribute.idr_infobase
		from 
			t_permission_access_attribute,
			infobase,
			t_user_role
		where 
			t_user_role.name_role = 'SADM SIRD Manager'
			AND infobase.object_value = 'SIRDNatco'
			AND infobase.id_infobase = t_permission_access_attribute.idr_infobase
			AND t_user_role.id_role = t_permission_access_attribute.idr_user_role

update 
	t_permission_access_attribute 
set 
	write_mode = '1' 
where 
	t_permission_access_attribute.idr_user_role = @idr_user_role 
	AND t_permission_access_attribute.idr_infobase = @idr_infobase

---------------------------
-- update SADM SWRD Manager : add write mode for SWRD Natco
---------------------------
select 
			@idr_user_role = t_permission_access_attribute.idr_user_role,
			@idr_infobase = t_permission_access_attribute.idr_infobase
		from 
			t_permission_access_attribute,
			infobase,
			t_user_role
		where 
			t_user_role.name_role = 'SADM SWRD Manager'
			AND infobase.object_value = 'SWRDNatco'
			AND infobase.id_infobase = t_permission_access_attribute.idr_infobase
			AND t_user_role.id_role = t_permission_access_attribute.idr_user_role

update 
	t_permission_access_attribute 
set 
	write_mode = '1' 
where 
	t_permission_access_attribute.idr_user_role = @idr_user_role 
	AND t_permission_access_attribute.idr_infobase = @idr_infobase
