DECLARE @idFeature VARCHAR(255)
DECLARE @idRole VARCHAR(255)


--  Common User
SET @idRole = ''

SELECT 
	@idRole = id_role 
FROM 
	T_USER_ROLE 
WHERE 
	name_role = 'Common User'

---------------------------------------------
-- Add rights on feature "Export in .csv file"
---------------------------------------------


--Feature :		
SET @idFeature = ''

SELECT 
	@idFeature = id_feature 
FROM 
	T_FEATURE 
WHERE 
	label = 'Export in .csv file' 
	AND display_context = ';SEARCH/RESULT;'


IF ( @idFeature <> '')

BEGIN

	DELETE FROM T_LINK_FEATURE_USER_ROLE 
	WHERE idr_feature = @idFeature AND idr_user_role = @idRole

	INSERT INTO T_LINK_FEATURE_USER_ROLE 
	(idr_feature,idr_user_role) VALUES (@idFeature, @idRole)

END


---------------------------------------------
-- Add rights on feature "Export in .xls file"
---------------------------------------------


--Feature :		
SET @idFeature = ''

SELECT 
	@idFeature = id_feature 
FROM 
	T_FEATURE 
WHERE 
	label = 'Export in .xls file' 
	AND display_context = ';SEARCH/RESULT;'


IF ( @idFeature <> '')

BEGIN

	DELETE FROM T_LINK_FEATURE_USER_ROLE 
	WHERE idr_feature = @idFeature AND idr_user_role = @idRole

	INSERT INTO T_LINK_FEATURE_USER_ROLE 
	(idr_feature,idr_user_role) VALUES (@idFeature, @idRole)

END


---------------------------------------------
-- Add rights on feature "History"
---------------------------------------------


--Feature :		
SET @idFeature = ''

SELECT 
	@idFeature = id_feature 
FROM 
	T_FEATURE 
WHERE 
	label = 'History' 
	AND display_context = ';DS/CONSULT;'


IF ( @idFeature <> '')

BEGIN

	DELETE FROM T_LINK_FEATURE_USER_ROLE 
	WHERE idr_feature = @idFeature AND idr_user_role = @idRole

	INSERT INTO T_LINK_FEATURE_USER_ROLE 
	(idr_feature,idr_user_role) VALUES (@idFeature, @idRole)

END

---------------------------------------------
-- Add rights on feature "History"
---------------------------------------------


--Feature :		
SET @idFeature = ''

SELECT 
	@idFeature = id_feature 
FROM 
	T_FEATURE 
WHERE 
	label = 'History' 
	AND display_context = ';SUPPLIER/CONSULT;'


IF ( @idFeature <> '')

BEGIN

	DELETE FROM T_LINK_FEATURE_USER_ROLE 
	WHERE idr_feature = @idFeature AND idr_user_role = @idRole

	INSERT INTO T_LINK_FEATURE_USER_ROLE 
	(idr_feature,idr_user_role) VALUES (@idFeature, @idRole)

END


---------------------------------------------
-- Add rights on feature "History"
---------------------------------------------


--Feature :		
SET @idFeature = ''

SELECT 
	@idFeature = id_feature 
FROM 
	T_FEATURE 
WHERE 
	label = 'History' 
	AND display_context = ';EQPT/CONSULT;'


IF ( @idFeature <> '')

BEGIN

	DELETE FROM T_LINK_FEATURE_USER_ROLE 
	WHERE idr_feature = @idFeature AND idr_user_role = @idRole

	INSERT INTO T_LINK_FEATURE_USER_ROLE 
	(idr_feature,idr_user_role) VALUES (@idFeature, @idRole)
END


---------------------------------------------
-- Add rights on feature "Init Password"
---------------------------------------------


--Feature :		
SET @idFeature = ''

SELECT 
	@idFeature = id_feature 
FROM 
	T_FEATURE 
WHERE 
	label = 'Init Password' 
	AND display_context = ';USER/CONSULT;'


IF ( @idFeature <> '')

BEGIN

	DELETE FROM T_LINK_FEATURE_USER_ROLE 
	WHERE idr_feature = @idFeature AND idr_user_role = @idRole

	INSERT INTO T_LINK_FEATURE_USER_ROLE 
	(idr_feature,idr_user_role) VALUES (@idFeature, @idRole)

END


---------------------------------------------
-- Add rights on feature "Last Search"
---------------------------------------------


--Feature :		
SET @idFeature = ''

SELECT 
	@idFeature = id_feature 
FROM 
	T_FEATURE 
WHERE 
	label = 'Last Search' 
	AND display_context is null


IF ( @idFeature <> '')

BEGIN

	DELETE FROM T_LINK_FEATURE_USER_ROLE 
	WHERE idr_feature = @idFeature AND idr_user_role = @idRole

	INSERT INTO T_LINK_FEATURE_USER_ROLE 
	(idr_feature,idr_user_role) VALUES (@idFeature, @idRole)

END


---------------------------------------------
-- Add rights on feature "Load Saved Profile"
---------------------------------------------


--Feature :		
SET @idFeature = ''

SELECT 
	@idFeature = id_feature 
FROM 
	T_FEATURE 
WHERE 
	label = 'Load Saved Profile' 
	AND display_context is null


IF ( @idFeature <> '')

BEGIN

	DELETE FROM T_LINK_FEATURE_USER_ROLE 
	WHERE idr_feature = @idFeature AND idr_user_role = @idRole

	INSERT INTO T_LINK_FEATURE_USER_ROLE 
	(idr_feature,idr_user_role) VALUES (@idFeature, @idRole)

END


---------------------------------------------
-- Add rights on feature "Report SI"
---------------------------------------------


--Feature :		
SET @idFeature = ''

SELECT 
	@idFeature = id_feature 
FROM 
	T_FEATURE 
WHERE 
	label = 'Report SI'
	AND display_context = ';DS/CONSULT;'


IF ( @idFeature <> '')

BEGIN

	DELETE FROM T_LINK_FEATURE_USER_ROLE 
	WHERE idr_feature = @idFeature AND idr_user_role = @idRole

	INSERT INTO T_LINK_FEATURE_USER_ROLE 
	(idr_feature,idr_user_role) VALUES (@idFeature, @idRole)

END


---------------------------------------------
-- Add rights on feature "Reports"
---------------------------------------------


--Feature :		
SET @idFeature = ''

SELECT 
	@idFeature = id_feature 
FROM 
	T_FEATURE 
WHERE 
	label = 'Reports'
	AND display_context is null


IF ( @idFeature <> '')

BEGIN

	DELETE FROM T_LINK_FEATURE_USER_ROLE 
	WHERE idr_feature = @idFeature AND idr_user_role = @idRole

	INSERT INTO T_LINK_FEATURE_USER_ROLE 
	(idr_feature,idr_user_role) VALUES (@idFeature, @idRole)

END


---------------------------------------------
-- Add rights on feature "Save Search"
---------------------------------------------


--Feature :		
SET @idFeature = ''

SELECT 
	@idFeature = id_feature 
FROM 
	T_FEATURE 
WHERE 
	label = 'Save Search' 
	AND display_context = ';SEARCH/RESULT;'


IF ( @idFeature <> '')

BEGIN

	DELETE FROM T_LINK_FEATURE_USER_ROLE 
	WHERE idr_feature = @idFeature AND idr_user_role = @idRole

	INSERT INTO T_LINK_FEATURE_USER_ROLE 
	(idr_feature,idr_user_role) VALUES (@idFeature, @idRole)

END


---------------------------------------------
-- Add rights on feature "Search"
---------------------------------------------


--Feature :		
SET @idFeature = ''

SELECT 
	@idFeature = id_feature 
FROM 
	T_FEATURE 
WHERE 
	label = 'Search' 
	AND display_context is null


IF ( @idFeature <> '')

BEGIN

	DELETE FROM T_LINK_FEATURE_USER_ROLE 
	WHERE idr_feature = @idFeature AND idr_user_role = @idRole

	INSERT INTO T_LINK_FEATURE_USER_ROLE 
	(idr_feature,idr_user_role) VALUES (@idFeature, @idRole)

END

