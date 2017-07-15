DECLARE @id_feature as INTEGER
DECLARE @id_user_role as INTEGER
------------------------------------------------------------------------
-- Grant rights to the feature "Link FIN CI P/CD" for role EPC ATA24
------------------------------------------------------------------------

SELECT @id_feature = id_feature FROM T_FEATURE
	WHERE label = 'Link FIN CI P/CD'
SELECT @id_user_role = id_role FROM T_USER_ROLE
	WHERE name_role = 'EPC ATA24'
IF (NOT EXISTS( SELECT * FROM T_LINK_FEATURE_USER_ROLE
					WHERE idr_feature = @id_feature
					AND idr_user_role = @id_user_role))
BEGIN
	INSERT INTO T_LINK_FEATURE_USER_ROLE
		SELECT @id_feature, @id_user_role
END

------------------------------------------------------------------------
-- Grant rights to the feature "Unlink FIN CI P/CD" for role EPC ATA24
------------------------------------------------------------------------
SELECT @id_feature = id_feature FROM T_FEATURE
	WHERE label = 'Unlink FIN CI P/CD'
IF (NOT EXISTS( SELECT * FROM T_LINK_FEATURE_USER_ROLE
					WHERE idr_feature = @id_feature
					AND idr_user_role = @id_user_role))
BEGIN
	INSERT INTO T_LINK_FEATURE_USER_ROLE
		SELECT @id_feature, @id_user_role
END