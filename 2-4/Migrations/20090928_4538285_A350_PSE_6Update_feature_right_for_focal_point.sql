DECLARE @idFeature VARCHAR(255)
DECLARE @idRole VARCHAR(255)

--  Create User 
IF ( NOT ( EXISTS (
	SELECT
		* 
	FROM
		T_USER_ROLE 
	WHERE 
		name_role = 'FLS Focal Point'
)))

BEGIN

	INSERT INTO	T_USER_ROLE
	(name_role) VALUES ('FLS Focal Point')

END


--  Common User
SET @idRole = ''

SELECT 
	@idRole = id_role 
FROM 
	T_USER_ROLE 
WHERE 
	name_role = 'FLS Focal Point'


---------------------------------------------
-- Add rights on feature "Edit"
---------------------------------------------


--Feature :		
SET @idFeature = ''

SELECT 
	@idFeature = id_feature 
FROM 
	T_FEATURE 
WHERE 
	label = 'Edit' 
	AND display_context = ';CI/CONSULT;'


IF ( @idFeature <> '')

BEGIN

	DELETE FROM T_LINK_FEATURE_USER_ROLE 
	WHERE idr_feature = @idFeature AND idr_user_role = @idRole

	INSERT INTO T_LINK_FEATURE_USER_ROLE 
	(idr_feature,idr_user_role) VALUES (@idFeature, @idRole)

END

