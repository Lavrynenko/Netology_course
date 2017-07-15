/******************************************************************************************
		Update features for FIN DS Object
*******************************************************************************************/

------------------------------------------------------------------------
-- Update feature "Check Out LOAD FIN - VC PIN"
------------------------------------------------------------------------


IF (EXISTS(  SELECT * FROM T_FEATURE WHERE label = 'Check Out LOAD FIN - VC PIN'))
BEGIN
	UPDATE T_FEATURE 
		SET where_clause = 'SELECT id_ds FROM R_FIN_DS ,R_FIN_CI, T_Elco_Matrix WHERE id_ds=#id_ds# AND R_FIN_DS.FINDS_EDD_Type=''DATA TABLE'' AND R_FIN_DS.FINDS_EDDNO_State=''Completed'' AND FINDS_EDDNO_Flag=''Data OK'' AND T_Elco_Matrix.ElcoMatrixPseRole=''EPC Module - VC PIN Owner'' AND R_FIN_DS.ds_type=4 AND (SVMAJ_DS IS NULL OR SVMAJ_DS <> ''CIRCE'') AND T_Elco_Matrix.ElcoMatrixFinCi_idr=R_FIN_CI.id_fin AND R_FIN_DS.idr_fin = R_FIN_CI.id_fin',
			linked_url = 'BUSINESS_OBJECTS/DS/EDD/Checkout/EDD_NO_CheckOut_Form.php?id_ds=#id_ds#'
		WHERE label = 'Check Out LOAD FIN - VC PIN' 
END
