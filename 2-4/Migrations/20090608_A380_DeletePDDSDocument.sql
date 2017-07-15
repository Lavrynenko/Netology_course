--------------------------------------------------------------------
-- Remove the document "TLEAN_24264_test.doc" from "General Comment" which is under the PD CI Reference : "MGL38391003" and the PD DS reference : "38F00"
--------------------------------------------------------------------

UPDATE T_QUALITY_CHECK
SET QC_GeneralComment = NULL
WHERE QUALITY_CHECK_id IN (SELECT T_QUALITY_CHECK.QUALITY_CHECK_id
			   FROM T_QUALITY_CHECK INNER JOIN
			                      T_PDDS ON T_QUALITY_CHECK.pdds_idr = T_PDDS.id_pdds INNER JOIN
			                      T_PDCI ON T_PDDS.idr_pdci = T_PDCI.id_pdci
			   WHERE (T_PDDS.pdds_reference = '38F00') AND (T_PDCI.pdci_reference = 'MGL38391003')
			   AND  T_QUALITY_CHECK.QC_GeneralComment = 'TLEAN_24264_test.doc')