-- Update infobase
-- Group Leader, for MP, CR, RFC use id!!!
-- MP Group Leader
Update
	Infobase
set
	list_val = 'SELECT user_surname+'' ''+user_first_name 
FROM T_USER
 INNER JOIN T_LINK_ROLE_USER ON T_USER.user_id = T_LINK_ROLE_USER.idr_user
 INNER JOIN T_USER_ROLE ON idr_user_role = id_role 
WHERE name_role = ''MAFU Change group leader'' 
ORDER BY user_surname' 
WHERE
	object_value like 'GrpLeaderMP'
	AND table_name like 'T_MP'

-- CR Group Leader
Update
	Infobase
set
	list_val = 'SELECT user_surname+'' ''+user_first_name 
FROM T_USER
 INNER JOIN T_LINK_ROLE_USER ON T_USER.user_id = T_LINK_ROLE_USER.idr_user
 INNER JOIN T_USER_ROLE ON idr_user_role = id_role 
WHERE name_role = ''MAFU Change group leader'' 
ORDER BY user_surname' 
WHERE
	object_value like 'cr_GrpLeaderCR'
	AND table_name like 'V_CR'

-- RFC Group Leader
Update
	Infobase
set
	list_val = 'SELECT user_surname+'' ''+user_first_name 
FROM T_USER
 INNER JOIN T_LINK_ROLE_USER ON T_USER.user_id = T_LINK_ROLE_USER.idr_user
 INNER JOIN T_USER_ROLE ON idr_user_role = id_role 
WHERE name_role = ''MAFU Change group leader'' 
ORDER BY user_surname' 
WHERE
	object_value like 'rfc_GrpLeaderCR'
	AND table_name like 'V_RFC'
	
	
-- MP Change Leader
Update
	Infobase
set
	list_val = 'SELECT user_surname+'' ''+user_first_name 
FROM T_USER
 INNER JOIN T_LINK_ROLE_USER ON T_USER.user_id = T_LINK_ROLE_USER.idr_user
 INNER JOIN T_USER_ROLE ON idr_user_role = id_role 
WHERE name_role = ''MAFU Change leader'' 
ORDER BY user_surname' 
WHERE
	object_value like 'ChgLeaderMP'
	AND table_name like 'T_MP'

-- CR Change Leader
Update
	Infobase
set
	list_val = 'SELECT user_surname+'' ''+user_first_name 
FROM T_USER
 INNER JOIN T_LINK_ROLE_USER ON T_USER.user_id = T_LINK_ROLE_USER.idr_user
 INNER JOIN T_USER_ROLE ON idr_user_role = id_role 
WHERE name_role = ''MAFU Change leader'' 
ORDER BY user_surname' 
WHERE
	object_value like 'cr_ChgLeaderCR'
	AND table_name like 'V_CR'

-- RFC Change Leader
Update
	Infobase
set
	list_val = 'SELECT user_surname+'' ''+user_first_name 
FROM T_USER
 INNER JOIN T_LINK_ROLE_USER ON T_USER.user_id = T_LINK_ROLE_USER.idr_user
 INNER JOIN T_USER_ROLE ON idr_user_role = id_role 
WHERE name_role = ''MAFU Change leader'' 
ORDER BY user_surname' 
WHERE
	object_value like 'rfc_ChgLeaderCR'
	AND table_name like 'V_RFC'
