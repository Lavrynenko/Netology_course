UPDATE
	T_FEATURE
SET
	T_FEATURE.label = 'Impact PDT or CoE'
WHERE
	T_FEATURE.label = 'Impact ACMT or CoE'
	AND T_FEATURE.linked_url = 'BUSINESS_OBJECTS/MP/update/MP_Update_ACMTinvolvement_Form.php?deliv=IT&id_mp=#id_mp#'
	
-- Update Edit TRS inv. teams -- MP
UPDATE
	T_FEATURE
SET
	T_FEATURE.linked_url = '/BUSINESS_OBJECTS/MP/update/MP_Update_IT_Form.php?deliv=Sub-TRS%20of%20MP&id_mp=#id_mp#'
WHERE
	T_FEATURE.label = 'Edit TRS inv. teams'
	AND T_FEATURE.linked_url = '/BUSINESS_OBJECTS/MP/update/MP_Update_IT_Form.php?deliv=Deliverable%20TRS&id_mp=#id_mp#'

-- Update Edit TRS inv. teams -- CR
UPDATE
	T_FEATURE
SET
	T_FEATURE.linked_url = '/BUSINESS_OBJECTS/CR/Update/CR_Update_IT_Form.php?deliv=Sub-TRS%20of%20RFC&id_cr=#id_cr#'
WHERE
	T_FEATURE.label = 'Edit ES inv. teams'
	AND T_FEATURE.linked_url = '/BUSINESS_OBJECTS/CR/Update/CR_Update_IT_Form.php?deliv=Deliverable%20ES&id_cr=#id_cr#'
	
-- Update Edit TRS inv. teams -- RFC
UPDATE
	T_FEATURE
SET
	T_FEATURE.linked_url = '/BUSINESS_OBJECTS/RFC/Update/RFC_Update_IT_Form.php?deliv=Sub-TRS%20of%20RFC&id_rfc=#id_rfc#'
WHERE
	T_FEATURE.label = 'Edit TRS of RFC inv. teams'
	AND T_FEATURE.linked_url = '/BUSINESS_OBJECTS/RFC/Update/RFC_Update_IT_Form.php?deliv=TRS%20of%20RFC&id_rfc=#id_rfc#'
	
	
	