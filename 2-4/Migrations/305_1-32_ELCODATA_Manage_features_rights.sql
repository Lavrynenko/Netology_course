------------------------------------------------------------------------
-- GRANT RIGHTS ACCESS TO FEATURES
-- 
-- @program		All
-- @version		1.32
-- @module		ELCODATA
--
-- List of features updated:
--	- Delete EDD at MG0				(EPC ATAXX and EPC ATA24)
------------------------------------------------------------------------

------------------------------------------------------------------------
-- Grant rights to the feature "Delete EDD at MG0" for role EPC ATAXX
------------------------------------------------------------------------
DECLARE @id_feature INT, @id_user_role INT
SELECT @id_feature = id_feature FROM T_FEATURE
	WHERE label = 'Delete EDD at MG0'
SELECT @id_user_role = id_role FROM T_USER_ROLE
	WHERE name_role = 'EPC ATAXX'
IF (NOT EXISTS( SELECT * FROM T_LINK_FEATURE_USER_ROLE
					WHERE idr_feature = @id_feature
					AND idr_user_role = @id_user_role))
BEGIN
	INSERT INTO T_LINK_FEATURE_USER_ROLE
		SELECT @id_feature, @id_user_role
END

------------------------------------------------------------------------
-- Grant rights to the feature "Delete EDD at MG0" for role EPC ATA24
------------------------------------------------------------------------
SELECT @id_user_role = id_role FROM T_USER_ROLE
	WHERE name_role = 'EPC ATA24'
IF (NOT EXISTS( SELECT * FROM T_LINK_FEATURE_USER_ROLE
					WHERE idr_feature = @id_feature
					AND idr_user_role = @id_user_role))
BEGIN
	INSERT INTO T_LINK_FEATURE_USER_ROLE
		SELECT @id_feature, @id_user_role
END

