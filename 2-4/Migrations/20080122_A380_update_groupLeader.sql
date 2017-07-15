-- Update infobase
-- Group Leader, for MP, CR, RFC use id!!!
-- MP Group Leader
Update Infobase set list_val = 'SELECT user_surname + '' '' + user_first_name 
FROM T_USER
 INNER JOIN T_LINK_ROLE_USER ON T_USER.user_id = T_LINK_ROLE_USER.idr_user
 INNER JOIN T_USER_ROLE ON idr_user_role = id_role 
WHERE name_role = ''MAFU Group Leader'' 
ORDER BY user_surname' 
WHERE object_value like 'GrpLeaderMP' AND table_name like 'T_MP'
-- CR Group Leader
Update Infobase set list_val = 'SELECT user_surname + '' '' + user_first_name 
FROM T_USER
 INNER JOIN T_LINK_ROLE_USER ON T_USER.user_id = T_LINK_ROLE_USER.idr_user
 INNER JOIN T_USER_ROLE ON idr_user_role = id_role 
WHERE name_role = ''MAFU Group Leader'' 
ORDER BY user_surname' 
WHERE object_value like 'cr_GrpLeaderCR' AND table_name like 'V_CR'
-- RFC Group Leader
Update Infobase set list_val = 'SELECT user_surname + '' '' + user_first_name 
FROM T_USER
 INNER JOIN T_LINK_ROLE_USER ON T_USER.user_id = T_LINK_ROLE_USER.idr_user
 INNER JOIN T_USER_ROLE ON idr_user_role = id_role 
WHERE name_role = ''MAFU Group Leader'' 
ORDER BY user_surname' 
WHERE object_value like 'rfc_GrpLeaderCR' AND table_name like 'V_RFC'
/*
-- Update MOD
Update T_MOD set MODgroupLeader = 'PECOSTE Jean-Louis' WHERE MODgroupLeader = 'PRIVE Eric'

-- Update MP
Update T_MP set GrpLeaderMP = 'PECOSTE Jean-Louis' WHERE GrpLeaderMP = 'PRIVE Eric'

-- Update CR
Update V_CR set cr_GrpLeaderCR = 'PECOSTE Jean-Louis' WHERE cr_GrpLeaderCR = 'PRIVE Eric'

-- Update RFC
Update V_RFC set rfc_GrpLeaderCR = 'PECOSTE Jean-Louis' WHERE rfc_GrpLeaderCR = 'PRIVE Eric'
*/