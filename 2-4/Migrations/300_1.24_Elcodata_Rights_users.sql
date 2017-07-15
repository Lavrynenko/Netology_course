DECLARE @Administrator INT,
	@id_feature INT

SELECT @Administrator = id_role
FROM T_USER_ROLE
WHERE	name_role='EPC Administrator'


-------------------------- Rights feature EDD Update MG

SELECT @id_feature = id_feature
FROM t_feature
WHERE label = 'Batch upgrade MG'
AND linked_url = 'BUSINESS_OBJECTS/DS/EDD/MG/EDD_Update_MG3_Form.php'
AND display_context = ';HOME;'

--Add permission
DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @id_feature
--Administrator
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@id_feature, @Administrator)