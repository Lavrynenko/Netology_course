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







