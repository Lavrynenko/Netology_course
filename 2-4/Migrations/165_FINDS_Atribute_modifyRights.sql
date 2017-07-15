--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- ICD Treatment Number  -------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------
-- Grant access to ICDTreatmentNumberTxt attributes 
------------------------------------------------------------------------

DECLARE @id_role_consult INT, @id_role_ataxx INT, @id_role_ata24 INT
SELECT @id_role_consult = id_role FROM T_USER_ROLE WHERE name_role = 'EPC Consult'
SELECT @id_role_ataxx = id_role FROM T_USER_ROLE WHERE name_role = 'EPC ATAXX'
SELECT @id_role_ata24 = id_role FROM T_USER_ROLE WHERE name_role = 'EPC ATA24'

DECLARE @id_attr INT
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------
-- ICDTreatmentNumber - Delete Rights
------------------------------------------------------------------------------------------------------------------

SELECT @id_attr = id_infobase FROM InfoBase WHERE object_value = 'ICDTreatmentNumber' AND table_name = 'R_FIN_DS'

DELETE FROM  T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_infobase = @id_attr


------------------------------------------------------------------------------------------------------------------
-- ICDTreatmentNumberTxt - Grant Rights
------------------------------------------------------------------------------------------------------------------

SELECT @id_attr = id_infobase FROM InfoBase WHERE object_value = 'ICDTreatmentNumberTxt' AND table_name = 'R_FIN_DS'


INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE SELECT @id_role_ata24, @id_attr, '1', '1', '0'

INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE SELECT @id_role_ataxx, @id_attr, '1', '1', '0'

INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE SELECT @id_role_consult, @id_attr, '1', '0', '0'

