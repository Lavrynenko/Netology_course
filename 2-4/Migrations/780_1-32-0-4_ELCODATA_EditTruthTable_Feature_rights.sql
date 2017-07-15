------------------------------------------------------------------------
-- Make feature "Edit Truth Table inputs" available for ATA XX only
------------------------------------------------------------------------

DECLARE @idFeature INT
DECLARE @idRole INT

SET @idFeature = ''

SELECT
	@idFeature = id_feature
FROM
	T_FEATURE
WHERE
	label = 'Edit Truth Table inputs'
	AND display_context LIKE '%;DS/TRUTH_TABLE;%'


-- EPC ATAXX
SET @idRole = ''

SELECT
	@idRole = id_role
FROM
	T_USER_ROLE
WHERE
	name_role = 'EPC ATAXX'

DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @idFeature

INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@idFeature, @idRole)

