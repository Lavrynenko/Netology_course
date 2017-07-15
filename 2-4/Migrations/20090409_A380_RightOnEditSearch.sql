DECLARE @idFeature VARCHAR(255)
DECLARE @idRole VARCHAR(255)

-----------------------------------------------------------------------

-----------------------------------------------------------------------

SET @idFeature = ''

SELECT 
	@idFeature = id_feature 
FROM 
	T_FEATURE 
WHERE 
	label='Edit Search'

DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @idFeature


SET @idRole = ''

SELECT 
	@idRole = id_role 
FROM 
	T_USER_ROLE 
WHERE 
	name_role = 'Administrator'

 
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@idFeature, @idRole)

SELECT 
	@idRole = id_role 
FROM 
	T_USER_ROLE 
WHERE 
	name_role = 'PD_Search_Edit'

 
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@idFeature, @idRole)

SELECT 
	@idRole = id_role 
FROM 
	T_USER_ROLE 
WHERE 
	name_role = 'MAFU Chief BNDYOCS'

 
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@idFeature, @idRole)

SELECT 
	@idRole = id_role 
FROM 
	T_USER_ROLE 
WHERE 
	name_role = 'MAFU BNDYE'

 
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@idFeature, @idRole)

SELECT 
	@idRole = id_role 
FROM 
	T_USER_ROLE 
WHERE 
	name_role = 'MAFU Group Leader'

 
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@idFeature, @idRole)

SELECT 
	@idRole = id_role 
FROM 
	T_USER_ROLE 
WHERE 
	name_role = 'MAFU Edit Search'

 
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@idFeature, @idRole)


DELETE FROM
	t_link_role_user
WHERE
	idr_user IN (select user_id from t_user where user_first_name='Leigh-Ann' and user_surname='MACLEAN')
	AND idr_user_role IN (select id_role from t_user_role where name_role='EPC ATAXX')

DELETE FROM
	t_link_role_user
WHERE
	idr_user IN (select user_id from t_user where user_first_name='Alistair' and user_surname='CLEAVE')
	AND idr_user_role IN (select id_role from t_user_role where name_role='EPC ATAXX')


DELETE FROM
	t_link_role_user
WHERE
	idr_user IN (select user_id from t_user where user_first_name='Eric' and user_surname='PRIVE')


DELETE FROM
	T_SEARCH_PROFIL
WHERE
	idr_user IN (select user_id from t_user where user_first_name='Eric' and user_surname='PRIVE')
	
	
DELETE FROM t_user where user_first_name='Eric' and user_surname='PRIVE'

	
DELETE FROM
	t_link_role_user
WHERE
	idr_user IN (select user_id from t_user where user_first_name='Nicolas' and user_surname='LARCHE')


DELETE FROM
	T_SEARCH_PROFIL
WHERE
	idr_user IN (select user_id from t_user where user_first_name='Nicolas' and user_surname='LARCHE')
	
DELETE FROM t_user where user_first_name='Nicolas' and user_surname='LARCHE'




