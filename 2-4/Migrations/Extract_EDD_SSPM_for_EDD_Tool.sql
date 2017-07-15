/**********************************************/
/* REPORT : "Extract EDD SSPM for EDD Tool" */
/**********************************************/

IF (NOT EXISTS (SELECT * FROM T_REPORT_GROUP WHERE report_group_label = 'ELCODATA'))
BEGIN
	INSERT INTO T_REPORT_GROUP (report_group_label) SELECT 'ELCODATA'
END

DELETE FROM T_DBActions WHERE label = 'Extract EDD SSPM for EDD Tool';

INSERT INTO T_DBActions (label, command, comments, template_page, parameters, report_commentary, mandatory_fields, report_group_idr) 
	SELECT 'Extract EDD SSPM for EDD Tool', 
	'SELECT     
		T_ELCODATA_MATRIX_VALUE.ElcoMatrixValue_id, 
		T_ELCODATA_MATRIX_VALUE.ElcoMatrixValueValue, 
        T_ELCODATA_MATRIX_VALUE.ElcoMatrixValueFinDs_idr, 
        T_ELCODATA_MATRIX_VALUE.ElcoMatrixValueModel_idr, 
        T_ELCODATA_MATRIX_VALUE.ElcoMatrixValueDim1Value, 
        T_ELCODATA_MATRIX_VALUE.ElcoMatrixValueDim2Value, 
        T_ELCODATA_MATRIX_VALUE.ElcoMatrixValueDim3Value, 
        R_FIN_DS.EDDReference, 
        R_FIN_DS.DSEffectivity, 
        R_FIN_DS.FINDS_EDD_Type, 
        R_FIN_CI.id_fin, 
        R_FIN_CI.FIN, 
        R_FIN_CI.FunctionnalDesignation, 
        T_ELCO_MATRIX.ElcoMatrixEddNoRefRootPart,
        CASE 
        	WHEN T_ELCODATA_MATRIX_VALUE.ElcoMatrixValueDim1Value=''SSPM_Column_Table'' THEN 1
        	WHEN T_ELCODATA_MATRIX_VALUE.ElcoMatrixValueDim1Value=''SSPM_SubBusbar_Table'' THEN 2
        	WHEN T_ELCODATA_MATRIX_VALUE.ElcoMatrixValueDim1Value=''SSPM_PED_CTL_Table'' THEN 3
        	ELSE 99
        END as orderdim1
FROM         T_ELCODATA_MATRIX_VALUE INNER JOIN
                      R_FIN_DS ON T_ELCODATA_MATRIX_VALUE.ElcoMatrixValueFinDs_idr = R_FIN_DS.id_ds INNER JOIN
                      R_FIN_CI ON R_FIN_DS.idr_fin = R_FIN_CI.id_fin INNER JOIN
                      T_ELCO_MATRIX ON R_FIN_CI.id_fin = T_ELCO_MATRIX.ElcoMatrixFinCi_idr
WHERE     (R_FIN_DS.FINDS_EDD_Type = ''DATA TABLE'') AND (T_ELCO_MATRIX.ElcoMatrixEddNoRefRootPart = ''SSPM'')
ORDER BY T_ELCODATA_MATRIX_VALUE.ElcoMatrixValueFinDs_idr, orderdim1, T_ELCODATA_MATRIX_VALUE.ElcoMatrixValueDim2Value,
                      T_ELCODATA_MATRIX_VALUE.ElcoMatrixValueDim3Value', 
	'Report for EDD Tool', 
	'Extract_EDD_for_EDD_Tool.php', 
	NULL, NULL, NULL, 
	report_group_id
FROM T_REPORT_GROUP
WHERE report_group_label = 'ELCODATA';
