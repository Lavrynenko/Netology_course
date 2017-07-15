

DECLARE @id_feature INT,
        @id_role__epc_consult INT

SELECT @id_role__epc_consult = id_role FROM T_USER_ROLE WHERE name_role = 'EPC Consult'


--------------------------------------------------------------------------------
-- Grant rights to the feature "print edd" for role EPC consult
--------------------------------------------------------------------------------
SELECT @id_feature = id_feature FROM T_FEATURE WHERE label = 'Print EDD'

DELETE
  FROM T_LINK_FEATURE_USER_ROLE
  WHERE idr_feature = @id_feature
  AND idr_user_role = @id_role__epc_consult

INSERT INTO T_LINK_FEATURE_USER_ROLE (
										idr_feature,
										idr_user_role
									)
VALUES (@id_feature, @id_role__epc_consult)

