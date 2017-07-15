------------------------------------------------------------------------
-- MANAGE FEATURES : ADD, UPDATE AND DELETE FEATURES
-- 
-- @program		A400M
-- @version		1.32.0.2
-- @module		ELCODATA
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Redefine "where clause" access to feature "Delete EDD at MG0"
------------------------------------------------------------------------
UPDATE T_FEATURE
	SET where_clause = 'SELECT DS.id_ds
FROM R_FIN_DS DS
WHERE id_ds = #id_ds#
AND (DS.MG=0 OR DS.MG IS NULL)
AND DS.fin_ds_sv IS NULL
AND DS.id_ds NOT IN (SELECT IMPACTDS.idr_ds_pre FROM T_IMPACTDS IMPACTDS)	
AND (DS.SVMAJ_DS IS NULL OR DS.SVMAJ_DS <> ''CIRCE'') 
AND DS.FINDS_EDD_Type = ''PCD''
AND DS.ds_type = ''4'''
	WHERE label = 'Delete EDD at MG0'


------------------------------------------------------------------------
-- Redefine "where clause" access to feature "EDD Link MP"
------------------------------------------------------------------------
UPDATE T_FEATURE
	SET where_clause = 'SELECT DS.id_ds
FROM R_FIN_DS DS
WHERE DS.id_ds = #id_ds#
AND DS.fin_ds_sv IS NULL
AND (DS.MG<2 OR DS.MG IS NULL)
AND (DS.SVMAJ_DS IS NULL OR DS.SVMAJ_DS <> ''CIRCE'') 
AND DS.FINDS_EDD_Type = ''PCD''
AND DS.ds_type = ''4'''
	WHERE label = 'EDD Link MP'

------------------------------------------------------------------------
-- Redefine "where clause" access to feature "Delete EDD"
------------------------------------------------------------------------
UPDATE T_FEATURE
SET where_clause = 'SELECT id_ds
FROM R_FIN_DS
WHERE (id_ds = #id_ds#) AND
	(ds_type = 4) AND
	(FINDS_EDD_Type IN (''PCD'')) AND
	(MG < 2) AND
	(fin_ds_sv IS NULL) AND
	(SVMAJ_DS IS NULL OR SVMAJ_DS != ''CIRCE'') AND
	(id_ds NOT IN (SELECT idr_ds_pre FROM T_IMPACTDS))'
WHERE label = 'Delete EDD'

------------------------------------------------------------------------
-- Redefine "where clause" access to feature "EDD Unlink FIN CI"
------------------------------------------------------------------------
UPDATE T_FEATURE
	SET where_clause = 'SELECT DS.id_ds
FROM R_FIN_DS DS
INNER JOIN R_FIN_CI CI ON CI.id_fin = DS.idr_fin
WHERE DS.id_ds = #id_ds#           
AND DS.id_ds NOT IN (SELECT I.idr_ds_post FROM T_IMPACTDS I)
AND DS.fin_ds_sv IS NULL
AND ((DS.SVMAJ_DS IS NULL OR DS.SVMAJ_DS <> ''CIRCE'') AND (CI.SVMAJ_CI IS NULL OR CI.SVMAJ_CI <> ''CIRCE''))
AND DS.FINDS_EDD_Type = ''PCD''
AND DS.ds_type = ''4'''
	WHERE label = 'EDD Unlink FIN CI'
