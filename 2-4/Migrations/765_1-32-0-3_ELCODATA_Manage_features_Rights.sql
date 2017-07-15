------------------------------------------------------------------------
-- update rights on features
------------------------------------------------------------------------
DECLARE @idFeature INT
DECLARE @idRole INT

-----------------------------------------------------------------------
-- Add rights on feature "Smart Edit" for "EPC ATAXX" --
-----------------------------------------------------------------------

SET @idFeature = ''

SELECT
	@idFeature = id_feature
FROM
	T_FEATURE
WHERE
	label = 'Smart Edit'
	AND display_context LIKE '%;CI/CONSULT;%'


-- EPC ATAXX
SET @idRole = ''

SELECT
	@idRole = id_role
FROM
	T_USER_ROLE
WHERE
	name_role = 'EPC ATAXX'

DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @idFeature AND idr_user_role = @idRole

INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@idFeature, @idRole)

-----------------------------------------------------------------------
-- Add rights on feature "Smart Edit" for "EPC ATA24" --
-----------------------------------------------------------------------

SET @idFeature = ''

SELECT
	@idFeature = id_feature
FROM
	T_FEATURE
WHERE
	label = 'Smart Edit'
	AND display_context LIKE '%;CI/CONSULT;%'


-- EPC ATAXX
SET @idRole = ''

SELECT
	@idRole = id_role
FROM
	T_USER_ROLE
WHERE
	name_role = 'EPC ATA24'

DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @idFeature AND idr_user_role = @idRole

INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@idFeature, @idRole)

-----------------------------------------------------------------------
-- Add rights on feature "History" for "EPC ATAXX" --
-----------------------------------------------------------------------

SET @idFeature = ''

SELECT
	@idFeature = id_feature
FROM
	T_FEATURE
WHERE
	label = 'History'
	AND display_context LIKE '%;CI/CONSULT;%'


-- EPC ATAXX
SET @idRole = ''

SELECT
	@idRole = id_role
FROM
	T_USER_ROLE
WHERE
	name_role = 'EPC ATAXX'

DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @idFeature AND idr_user_role = @idRole

INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@idFeature, @idRole)

-----------------------------------------------------------------------
-- Add rights on feature "History" for "EPC ATA24" --
-----------------------------------------------------------------------

SET @idFeature = ''

SELECT
	@idFeature = id_feature
FROM
	T_FEATURE
WHERE
	label = 'History'
	AND display_context LIKE '%;CI/CONSULT;%'


-- EPC ATAXX
SET @idRole = ''

SELECT
	@idRole = id_role
FROM
	T_USER_ROLE
WHERE
	name_role = 'EPC ATA24'

DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @idFeature AND idr_user_role = @idRole

INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@idFeature, @idRole)


