-- ******************************************************************************
-- Name : 310_1-26_ELCODATA_Rights_on_features.sql
-- Date : 13/08/2008
-- ******************************************************************************

DECLARE @idFeature VARCHAR(255)
DECLARE @idRole VARCHAR(255)

-------------------------------------------------------------------
-- Add rights on feature "Downgrade to lower MG" for "EPC ATAXX" --
-------------------------------------------------------------------

SET @idFeature = ''

SELECT 
	@idFeature = id_feature 
FROM 
	T_FEATURE 
WHERE 
	label = 'Downgrade to lower MG' 
	AND display_context LIKE '%;DS/CONSULT;%'


SET @idRole = ''

SELECT 
	@idRole = id_role 
FROM 
	T_USER_ROLE 
WHERE 
	name_role = 'EPC ATAXX'


if not exists (SELECT * FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @idFeature AND idr_user_role = @idRole) 
BEGIN 
	INSERT INTO 
		T_LINK_FEATURE_USER_ROLE 
	VALUES 
		(@idFeature, @idRole)
END
