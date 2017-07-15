------------------------------------------------------------------------
-- UPDATE FEATURES
--
-- @program		All
-- @version		1.32.0.4
-- @module		ELCODATA
--
-- List of features updated:
--	- Delete DATA TABLE after validation
--	- Delete DATA TABLE
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Redefine "where clause" access to feature "Delete DATA TABLE after validation"
------------------------------------------------------------------------
UPDATE T_FEATURE
	SET where_clause = 'SELECT id_ds
							FROM R_FIN_DS, R_FIN_CI, T_Elco_Matrix
							WHERE id_ds=#id_ds#
							AND R_FIN_DS.FINDS_EDD_Type=''DATA TABLE''
							AND (R_FIN_DS.FINDS_EDDNO_State=''Validated''
							OR R_FIN_DS.FINDS_EDDNO_State=''Completed''
							OR R_FIN_DS.FINDS_EDDNO_State=''Frozen'')
							AND R_FIN_DS.ds_type=4
							AND R_FIN_DS.id_ds NOT IN (SELECT idr_ds_pre FROM T_IMPACTDS WHERE T_IMPACTDS.idr_ds_pre = #id_ds#)
							AND T_Elco_Matrix.ElcoMatrixFinCi_idr=R_FIN_CI.id_fin'
	WHERE label = 'Delete DATA TABLE after validation'



------------------------------------------------------------------------
-- Redefine "where clause" access to feature "Delete DATA TABLE"
------------------------------------------------------------------------
UPDATE T_FEATURE
	SET where_clause = 'SELECT id_ds
							FROM R_FIN_DS, T_Elco_Matrix, R_FIN_CI
							WHERE id_ds=#id_ds#
							AND R_FIN_DS.FINDS_EDD_Type=''DATA TABLE''
							AND (R_FIN_DS.FINDS_EDDNO_State=''In Elaboration'')
							AND R_FIN_DS.fin_ds_sv is null
							AND T_Elco_Matrix.ElcoMatrixPseRole=''EPC ATA24''
							AND R_FIN_DS.ds_type=4
							AND R_FIN_DS.id_ds NOT IN (SELECT idr_ds_pre FROM T_IMPACTDS WHERE T_IMPACTDS.idr_ds_pre = #id_ds#)
							AND (SVMAJ_DS IS NULL OR SVMAJ_DS <> ''CIRCE'')
							AND T_Elco_Matrix.ElcoMatrixFinCi_idr=R_FIN_CI.id_fin
							AND R_FIN_DS.idr_fin = R_FIN_CI.id_fin'
	WHERE label = 'Delete DATA TABLE'
