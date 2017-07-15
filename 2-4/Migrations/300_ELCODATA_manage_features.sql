DECLARE @id_feature INT,
        @id_role__epc_ata_24 INT

SELECT @id_role__epc_ata_24 = id_role FROM T_USER_ROLE WHERE name_role = 'EPC ATA24'

SELECT @id_feature = id_feature FROM T_FEATURE WHERE label = 'Edit Truth Table Inputs'

IF (EXISTS(
  SELECT * FROM T_LINK_FEATURE_USER_ROLE
    WHERE idr_feature = @id_feature
    AND idr_user_role = @id_role__epc_ata_24
  )
)
BEGIN
  delete from T_LINK_FEATURE_USER_ROLE where idr_feature = @id_feature AND idr_user_role = @id_role__epc_ata_24
END



