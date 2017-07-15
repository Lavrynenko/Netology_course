DECLARE @Administrator INT,
		@ATAXX_user INT,
		@ATA24_user INT,
		@id_feature INT,
		@EPC_consult INT
		
SELECT @Administrator = id_role
FROM T_USER_ROLE
WHERE	name_role='EPC Administrator'



-------------------------- Rights feature Add into choice list

SELECT @id_feature = id_feature
FROM t_feature
WHERE label = 'Add values into choice list'
AND linked_url = 'BUSINESS_OBJECTS/CHOICE_LIST/Update_list_value_form.php'
AND display_context = ';HOME;'

--Add permission
DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @id_feature
--Administrator
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@id_feature, @Administrator)

-------------------------- Rights feature Downgrade after MG3
SELECT @id_feature = id_feature
FROM t_feature
WHERE label = 'Downgrade EDD MG3'

--delete all old roles
DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @id_feature
--Administrator
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@id_feature, @Administrator)





SELECT @ATAXX_user = id_role
FROM T_USER_ROLE
WHERE	name_role='EPC ATAXX'

-------------------------- Rights feature Save as new EDD

SELECT @id_feature = id_feature
FROM t_feature
WHERE label = 'Save as new EDD'
AND linked_url = '/BUSINESS_OBJECTS/DS/EDD/Duplicate/TRUTH_TABLE/EDD_DuplicateAsNew_Form.php?id_ds=#id_ds#'

--Add permission
DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @id_feature
--ATA24
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@id_feature, @ATAXX_user)


------------------Rights feature Copy from another edd
SELECT @ATAXX_user = id_role
FROM T_USER_ROLE
WHERE	name_role='EPC ATAXX'

SELECT @ATA24_user = id_role
FROM T_USER_ROLE
WHERE	name_role='EPC ATA24'

SELECT @id_feature = id_feature
FROM t_feature
WHERE label = 'Copy from another EDD'

--delete all old roles
DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @id_feature
--ATA24 && ATAXX
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@id_feature, @ATAXX_user)
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@id_feature, @ATA24_user)



SELECT @EPC_consult = id_role
FROM T_USER_ROLE
WHERE	name_role='EPC Consult'

SELECT @id_feature = id_feature
FROM t_feature
WHERE label = 'ELA'

INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@id_feature, @EPC_Consult)
