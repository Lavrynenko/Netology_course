delete from t_user_role
insert into t_user_role (name_role) values ('Administrator')
insert into t_user_role (name_role) values ('Common User')

delete from t_user
delete from T_SEARCH_PROFIL
insert into t_user (
	user_logon ,
	user_pass ,
	user_first_name ,
	user_surname )
values ('$','30ea0a768cc9d95255e241efe585e23a','Didier','HARD')
INSERT INTO T_SEARCH_PROFIL (label,idr_user) VALUES ('LAST_SEARCH',@@IDENTITY)


insert into t_user (
	user_logon ,
	user_pass ,
	user_first_name ,
	user_surname )
values ('common','30ea0a768cc9d95255e241efe585e23a','Common','USER')
INSERT INTO T_SEARCH_PROFIL (label,idr_user) VALUES ('LAST_SEARCH',@@IDENTITY)


delete from T_LINK_ROLE_USER
insert into T_LINK_ROLE_USER
select user_id, id_role
from t_user,t_user_role
where user_logon='common'
and name_role='Common User'

insert into T_LINK_ROLE_USER
select user_id, id_role
from t_user,t_user_role
where user_logon='$'
and name_role='Administrator'

delete from T_PERMISSION_ACCESS_ATTRIBUTE
insert into  T_PERMISSION_ACCESS_ATTRIBUTE
select 
	id_role,
	id_infobase,
	'1',
	'1'
from infobase,
	t_user_role
where
	name_role='Administrator'
    and table_name='R_ATA'


insert into  T_PERMISSION_ACCESS_ATTRIBUTE
select 
	id_role,
	id_infobase,
	'1',
	'0'
from infobase,
	t_user_role
where
	name_role='Common user'
    and table_name='R_ATA'


delete from T_LINK_FEATURE_USER_ROLE
insert into T_LINK_FEATURE_USER_ROLE
select
	id_feature,
	id_role
from
	t_feature,
	t_user_role
where
	(name_role='Administrator')
    and (t_feature.linked_url IN ('USER/delete/USER_Delete_Form.php?id_user=#id_user#',
'USER/update/USER_Update_Form.php?id_user=#id_user#',
'TOOL_OBJECTS/ROLE/UPDATE/ROLE_Update_Form.php?id_role=#id_role#',
'TOOL_OBJECTS/SEARCH/EDIT/SEARCH_Edit_Form.php?profil_label=LAST_SEARCH¤t_page=#current_page#&renamed_order_attr=#renamed_order_attr#&sort_direction=#sort_direction#',
'TOOL_OBJECTS/SEARCH/export/SEARCH_export.php?type_export=exel&profil_label=#profil_label#',
'TOOL_OBJECTS/SEARCH/export/Bat_export.php?filename=PD.bat',
'USER/update/USER_initPass_Process.php?id_user=#id_user#',
'TOOL_OBJECTS/SEARCH/DISPLAYRESULT/SEARCH_DisplayResult_Form.php?profil_label=LAST_SEARCH',
'TOOL_OBJECTS/SEARCH/open/SEARCH_Open_Form.php',
'TOOL_OBJECTS/ROLE/ROLE_index.php',
'/USER/USER_index.php',
'TOOL_OBJECTS/ROLE/create/ROLE_Create_Form.php',
'Reports_templates/RT_display.php',
'TOOL_OBJECTS/SEARCH/creation/SEARCH_Creation_Form.php',
'TOOL_OBJECTS/SEARCH/DESIGN/SEARCH_Design_Form.php'
) or t_feature.label='Home')

insert into T_LINK_FEATURE_USER_ROLE
select
	id_feature,
	id_role
from
	t_feature,
	t_user_role
where
	(name_role='Common user')
    and (t_feature.linked_url IN ('TOOL_OBJECTS/SEARCH/export/SEARCH_export.php?type_export=exel&profil_label=#profil_label#',
'TOOL_OBJECTS/SEARCH/export/Bat_export.php?filename=PD.bat',
'TOOL_OBJECTS/SEARCH/DISPLAYRESULT/SEARCH_DisplayResult_Form.php?profil_label=LAST_SEARCH',
'TOOL_OBJECTS/SEARCH/open/SEARCH_Open_Form.php',
'Reports_templates/RT_display.php',
'TOOL_OBJECTS/SEARCH/creation/SEARCH_Creation_Form.php',
'TOOL_OBJECTS/SEARCH/DESIGN/SEARCH_Design_Form.php'
) or t_feature.label='Home')
    

