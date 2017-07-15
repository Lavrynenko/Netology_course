/******************************************************************************************
		Create New features for FIN DS Object
*******************************************************************************************/

DECLARE @id_feature_group INT

------------------------------------------------------------------------
-- Add new feature "Create LOAD FIN-VC PIN"
------------------------------------------------------------------------

SELECT @id_feature_group = id_feature_group FROM T_FEATURE_GROUP WHERE label = 'MANAGEMENT'

IF (NOT EXISTS(  SELECT * FROM T_FEATURE WHERE label = 'Create LOAD FIN - VC PIN'))
BEGIN
	INSERT INTO T_FEATURE (label, description, idr_feature_group, linked_url, display_context, icon, where_clause)
	  VALUES ('Create LOAD FIN - VC PIN',
		  'Create LOAD FIN - VC PIN',
		  @id_feature_group,
		  'BUSINESS_OBJECTS/DS/EDD/creation/EDD_Creation_process.php?id_fin=#id_fin#',
		  ';CI/CONSULT;',
		  'puce_orange.gif',
		  'SELECT id_fin FROM R_FIN_CI, T_Elco_Matrix  WHERE id_fin=#id_fin# AND T_Elco_Matrix.ElcoMatrixPseRole=''EPC Module - VC PIN Owner''  AND T_Elco_Matrix.ElcoMatrixFinCi_idr=R_FIN_CI.id_fin'
		 )
END



------------------------------------------------------------------------
-- Add new feature "Check Out LOAD FIN - VC PIN"
------------------------------------------------------------------------

SELECT @id_feature_group = id_feature_group FROM T_FEATURE_GROUP WHERE label = 'MANAGEMENT'

IF (NOT EXISTS(  SELECT * FROM T_FEATURE WHERE label = 'Check Out LOAD FIN - VC PIN'))
BEGIN
	INSERT INTO T_FEATURE (label, description, idr_feature_group, display_order, linked_url, display_context, icon, where_clause)
	  VALUES ('Check Out LOAD FIN - VC PIN',
		  'Check Out LOAD FIN - VC PIN',
		  @id_feature_group,
		  24,
		  'BUSINESS_OBJECTS/DS/EDD/Checkin/EDD_NO_CheckIn_Form.php?id_ds=#id_ds#',
		  ';DS/CONSULT;',
		  'puce_orange.gif',
		  'SELECT id_ds FROM R_FIN_DS ,R_FIN_CI, T_Elco_Matrix WHERE id_ds=#id_ds# AND R_FIN_DS.FINDS_EDD_Type=''DATA TABLE'' AND R_FIN_DS.FINDS_EDDNO_State=''Completed'' AND FINDS_EDDNO_Flag=''Data In Work'' AND T_Elco_Matrix.ElcoMatrixPseRole=''EPC Module - VC PIN Owner'' AND R_FIN_DS.ds_type=4 AND (SVMAJ_DS IS NULL OR SVMAJ_DS <> ''CIRCE'') AND T_Elco_Matrix.ElcoMatrixFinCi_idr=R_FIN_CI.id_fin AND R_FIN_DS.idr_fin = R_FIN_CI.id_fin'
		 )
END



------------------------------------------------------------------------
-- Add new feature "Check In LOAD FIN - VC PIN"
------------------------------------------------------------------------

SELECT @id_feature_group = id_feature_group FROM T_FEATURE_GROUP WHERE label = 'MANAGEMENT'

IF (NOT EXISTS(  SELECT * FROM T_FEATURE WHERE label = 'Check In LOAD FIN - VC PIN'))
BEGIN
	INSERT INTO T_FEATURE (label, description, idr_feature_group, display_order, linked_url, display_context, icon, where_clause)
	  VALUES ('Check In LOAD FIN - VC PIN',
		  'Check In LOAD FIN - VC PIN',
		  @id_feature_group,
		  24,
		  'BUSINESS_OBJECTS/DS/EDD/Checkin/EDD_NO_CheckIn_Form.php?id_ds=#id_ds#',
		  ';DS/CONSULT;',
		  'puce_orange.gif',
		  'SELECT id_ds FROM R_FIN_DS ,R_FIN_CI, T_Elco_Matrix WHERE id_ds=#id_ds# AND R_FIN_DS.FINDS_EDD_Type=''DATA TABLE'' AND R_FIN_DS.FINDS_EDDNO_State=''Completed'' AND FINDS_EDDNO_Flag=''Data In Work'' AND T_Elco_Matrix.ElcoMatrixPseRole=''EPC Module - VC PIN Owner'' AND R_FIN_DS.ds_type=4 AND (SVMAJ_DS IS NULL OR SVMAJ_DS <> ''CIRCE'') AND T_Elco_Matrix.ElcoMatrixFinCi_idr=R_FIN_CI.id_fin AND R_FIN_DS.idr_fin = R_FIN_CI.id_fin'
		 )
END


------------------------------------------------------------------------
-- Add new feature "Check Out LOAD FIN - VC PIN"
------------------------------------------------------------------------

SELECT @id_feature_group = id_feature_group FROM T_FEATURE_GROUP WHERE label = 'MANAGEMENT'

IF (NOT EXISTS(  SELECT * FROM T_FEATURE WHERE label = 'Check Out LOAD FIN - VC PIN'))
BEGIN
	INSERT INTO T_FEATURE (label, description, idr_feature_group, display_order, linked_url, display_context, icon, where_clause)
	  VALUES ('Check Out LOAD FIN - VC PIN',
		  'Check Out LOAD FIN - VC PIN',
		  @id_feature_group,
		  23,
		  'BUSINESS_OBJECTS/DS/EDD/Checkout/EDD_NO_CheckOut_Form.php?id_ds=#id_ds#',
		  ';DS/CONSULT;',
		  'puce_orange.gif',
		  'SELECT id_ds FROM R_FIN_DS ,R_FIN_CI, T_Elco_Matrix WHERE id_ds=#id_ds# AND R_FIN_DS.FINDS_EDD_Type=''DATA TABLE'' AND R_FIN_DS.FINDS_EDDNO_State=''Completed'' AND FINDS_EDDNO_Flag=''Data OK'' AND T_Elco_Matrix.ElcoMatrixPseRole=''EPC Module - VC PIN Owner'' AND R_FIN_DS.ds_type=4 AND (SVMAJ_DS IS NULL OR SVMAJ_DS <> ''CIRCE'') AND T_Elco_Matrix.ElcoMatrixFinCi_idr=R_FIN_CI.id_fin AND R_FIN_DS.idr_fin = R_FIN_CI.id_fin'
		 )
END


------------------------------------------------------------------------
-- Add new feature "Delete LOAD FIN - VC PIN"
------------------------------------------------------------------------

SELECT @id_feature_group = id_feature_group FROM T_FEATURE_GROUP WHERE label = 'MANAGEMENT'

IF (NOT EXISTS(  SELECT * FROM T_FEATURE WHERE label = 'Delete LOAD FIN - VC PIN'))
BEGIN
	INSERT INTO T_FEATURE (label, description, idr_feature_group, display_order, linked_url, display_context, icon, where_clause)
	  VALUES ('Delete LOAD FIN - VC PIN',
		  'Delete LOAD FIN - VC PIN',
		  @id_feature_group,
		  31,
		  'BUSINESS_OBJECTS/DS/EDD/DELETE/EDD_Deletion_Process.php?id_ds=#id_ds#&id_fin=#id_fin#',
		  ';DS/CONSULT;',
		  'puce_orange.gif',
		  'SELECT id_ds FROM R_FIN_DS, T_Elco_Matrix, R_FIN_CI WHERE id_ds=#id_ds# AND R_FIN_DS.FINDS_EDD_Type=''DATA TABLE'' AND (R_FIN_DS.FINDS_EDDNO_State=''In Elaboration'') AND R_FIN_DS.fin_ds_sv is null AND T_Elco_Matrix.ElcoMatrixPseRole=''EPC Module - VC PIN Owner'' AND R_FIN_DS.ds_type=4 AND R_FIN_DS.id_ds NOT IN (SELECT idr_ds_post FROM T_IMPACTDS WHERE T_IMPACTDS.idr_ds_post = #id_ds#) AND (SVMAJ_DS IS NULL OR SVMAJ_DS <> ''CIRCE'') AND T_Elco_Matrix.ElcoMatrixFinCi_idr=R_FIN_CI.id_fin AND R_FIN_DS.idr_fin = R_FIN_CI.id_fin'
		 )
END


------------------------------------------------------------------------
-- Add new feature "Freeze LOAD FIN - VC PIN"
------------------------------------------------------------------------

SELECT @id_feature_group = id_feature_group FROM T_FEATURE_GROUP WHERE label = 'MANAGEMENT'

IF (NOT EXISTS(  SELECT * FROM T_FEATURE WHERE label = 'Freeze LOAD FIN - VC PIN'))
BEGIN
	INSERT INTO T_FEATURE (label, description, idr_feature_group, display_order, linked_url, display_context, icon, where_clause)
	  VALUES ('Freeze LOAD FIN - VC PIN',
		  'Freeze LOAD FIN - VC PIN',
		  @id_feature_group,
		  25,
		  'BUSINESS_OBJECTS/DS/EDD/Freeze/EDD_NO_Freeze_Form.php?id_ds=#id_ds#',
		  ';DS/CONSULT;',
		  'puce_orange.gif',
		  'SELECT id_ds FROM R_FIN_DS ,R_FIN_CI, T_Elco_Matrix WHERE id_ds=#id_ds# AND R_FIN_DS.FINDS_EDD_Type=''DATA TABLE'' AND R_FIN_DS.FINDS_EDDNO_State=''Completed'' AND FINDS_EDDNO_Flag=''Data OK''      AND T_Elco_Matrix.ElcoMatrixPseRole=''EPC Module - VC PIN Owner'' AND R_FIN_DS.ds_type=4 AND (SVMAJ_DS IS NULL OR SVMAJ_DS <> ''CIRCE'') AND T_Elco_Matrix.ElcoMatrixFinCi_idr = R_FIN_CI.id_fin AND R_FIN_DS.idr_fin = R_FIN_CI.id_fin'
		 )
END



------------------------------------------------------------------------
-- Add new feature "Link MP to LOAD FIN - VC PIN"
------------------------------------------------------------------------

SELECT @id_feature_group = id_feature_group FROM T_FEATURE_GROUP WHERE label = 'MANAGEMENT'

IF (NOT EXISTS(  SELECT * FROM T_FEATURE WHERE label = 'Link MP to LOAD FIN - VC PIN'))
BEGIN
	INSERT INTO T_FEATURE (label, description, idr_feature_group, display_order, linked_url, display_context, icon, where_clause)
	  VALUES ('Link MP to LOAD FIN - VC PIN',
		  'Link MP to LOAD FIN - VC PIN',
		  @id_feature_group,
		  11,
		  'BUSINESS_OBJECTS/DS/EDD/Link/Link_MP/EDD_linkMP_Form.php?id_ds=#id_ds#',
		  ';DS/CONSULT;',
		  'puce_orange.gif',
		  'SELECT id_ds FROM R_FIN_DS ,R_FIN_CI, T_Elco_Matrix WHERE id_ds=#id_ds# AND R_FIN_DS.fin_ds_sv IS NULL AND R_FIN_DS.FINDS_EDDNO_State=''In Elaboration'' AND R_FIN_DS.id_ds NOT IN (SELECT T_IMPACTDS.idr_ds_post FROM T_IMPACTDS WHERE T_IMPACTDS.idr_ds_post = #id_ds#) AND R_FIN_DS.FINDS_EDD_Type=''DATA TABLE'' AND T_Elco_Matrix.ElcoMatrixPseRole=''EPC Module - VC PIN Owner'' AND R_FIN_DS.ds_type=4 AND (SVMAJ_DS IS NULL OR SVMAJ_DS <> ''CIRCE'') AND T_Elco_Matrix.ElcoMatrixFinCi_idr=R_FIN_CI.id_fin AND R_FIN_DS.idr_fin = R_FIN_CI.id_fin'
		 )
END



------------------------------------------------------------------------
-- Add new feature "Unlink MP to LOAD FIN - VC PIN"
------------------------------------------------------------------------

SELECT @id_feature_group = id_feature_group FROM T_FEATURE_GROUP WHERE label = 'MANAGEMENT'

IF (NOT EXISTS(  SELECT * FROM T_FEATURE WHERE label = 'Unlink MP to LOAD FIN - VC PIN'))
BEGIN
	INSERT INTO T_FEATURE (label, description, idr_feature_group, display_order, linked_url, display_context, icon, where_clause)
	  VALUES ('Unlink MP to LOAD FIN - VC PIN',
		  'Unlink MP to LOAD FIN - VC PIN',
		  @id_feature_group,
		  16,
		  'BUSINESS_OBJECTS/DS/EDD/Unlink/Unlink_MP/Unlink_MP_Form.php?id_ds=#id_ds#',
		  ';DS/CONSULT;',
		  'puce_orange.gif',
		  'SELECT id_ds FROM R_FIN_DS ,R_FIN_CI, T_Elco_Matrix WHERE id_ds=#id_ds# AND R_FIN_DS.fin_ds_sv IS NULL AND R_FIN_DS.FINDS_EDDNO_State=''In Elaboration'' AND R_FIN_DS.id_ds IN (SELECT T_IMPACTDS.idr_ds_post FROM T_IMPACTDS WHERE T_IMPACTDS.idr_ds_post = #id_ds#) AND R_FIN_DS.FINDS_EDD_Type=''DATA TABLE'' AND T_Elco_Matrix.ElcoMatrixPseRole = ''EPC Module - VC PIN Owner'' AND R_FIN_DS.ds_type=4 AND (SVMAJ_DS IS NULL OR SVMAJ_DS <> ''CIRCE'') AND T_Elco_Matrix.ElcoMatrixFinCi_idr=R_FIN_CI.id_fin AND R_FIN_DS.idr_fin = R_FIN_CI.id_fin'
		 )
END




------------------------------------------------------------------------
-- Add new feature "Upload LOAD FIN - VC PIN"
------------------------------------------------------------------------

SELECT @id_feature_group = id_feature_group FROM T_FEATURE_GROUP WHERE label = 'MANAGEMENT'

IF (NOT EXISTS(  SELECT * FROM T_FEATURE WHERE label = 'Upload LOAD FIN - VC PIN'))
BEGIN
	INSERT INTO T_FEATURE (label, description, idr_feature_group, display_order, linked_url, display_context, icon, where_clause)
	  VALUES ('Upload LOAD FIN - VC PIN',
		  'Upload LOAD FIN - VC PIN',
		  @id_feature_group,
		  6,
		  'BUSINESS_OBJECTS/DS/EDD/Upload/EDD_NO_Upload_ConfirmMessage.php?id_ds=#id_ds#',
		  ';DS/CONSULT;',
		  'puce_orange.gif',
		  'SELECT id_ds FROM R_FIN_DS ,R_FIN_CI, T_Elco_Matrix WHERE id_ds=#id_ds# AND R_FIN_DS.FINDS_EDD_Type=''DATA TABLE'' AND (R_FIN_DS.FINDS_EDDNO_State=''In Elaboration'' OR (R_FIN_DS.FINDS_EDDNO_State=''Completed'' AND FINDS_EDDNO_Flag=''Data In Work''))       AND T_Elco_Matrix.ElcoMatrixPseRole=''EPC Module - VC PIN Owner'' AND R_FIN_DS.ds_type=4 AND (SVMAJ_DS IS NULL OR SVMAJ_DS <> ''CIRCE'') AND T_Elco_Matrix.ElcoMatrixFinCi_idr=R_FIN_CI.id_fin AND R_FIN_DS.idr_fin = R_FIN_CI.id_fin'
		 )
END




------------------------------------------------------------------------
-- Add new feature "Validate LOAD FIN - VC PIN"
------------------------------------------------------------------------

SELECT @id_feature_group = id_feature_group FROM T_FEATURE_GROUP WHERE label = 'MANAGEMENT'

IF (NOT EXISTS(  SELECT * FROM T_FEATURE WHERE label = 'Validate LOAD FIN - VC PIN'))
BEGIN
	INSERT INTO T_FEATURE (label, description, idr_feature_group, display_order, linked_url, display_context, icon, where_clause)
	  VALUES ('Validate LOAD FIN - VC PIN',
		  'Validate LOAD FIN - VC PIN',
		  @id_feature_group,
		  21,
		  'BUSINESS_OBJECTS/DS/EDD/Validate/EDD_NO_Validate_Form.php?id_ds=#id_ds#',
		  ';DS/CONSULT;',
		  'puce_orange.gif',
		  'SELECT id_ds FROM R_FIN_DS ,R_FIN_CI, T_Elco_Matrix WHERE id_ds=#id_ds# AND R_FIN_DS.FINDS_EDD_Type=''DATA TABLE'' AND R_FIN_DS.FINDS_EDDNO_State=''In Elaboration'' AND T_Elco_Matrix.ElcoMatrixPseRole=''EPC Module - VC PIN Owner'' AND R_FIN_DS.id_ds IN (SELECT idr_ds_post FROM T_IMPACTDS WHERE T_IMPACTDS.idr_ds_post = #id_ds#) AND FINDS_EDDNO_Xls_File_Status=''Complete'' AND R_FIN_DS.ds_type=4 AND (SVMAJ_DS IS NULL OR SVMAJ_DS <> ''CIRCE'') AND T_Elco_Matrix.ElcoMatrixFinCi_idr=R_FIN_CI.id_fin AND R_FIN_DS.idr_fin = R_FIN_CI.id_fin'
		 )
END

















