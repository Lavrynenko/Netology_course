------------------------------------------------------------------------
-- MANAGE FEATURES : ADD, UPDATE AND DELETE FEATURES
-- 
-- @program		A400M
-- @version		1.32
-- @module		ELCODATA
--
-- UPDATE FEATURES
--
-- List of features updated:
--	- EDD Unlink MP
--	- EDD Link MP
------------------------------------------------------------------------

------------------------------------------------------------------------
-- Redefine "where clause" access to feature "EDD Link MP"
------------------------------------------------------------------------
UPDATE T_FEATURE
	SET where_clause = 'SELECT DS.id_ds FROM R_FIN_DS DS
WHERE DS.id_ds = #id_ds#
	AND DS.FINDS_EDD_Type = ''PCD''
	AND DS.ds_type = ''4''
	AND idr_fin IS NOT NULL
	AND DS.fin_ds_sv IS NULL
	AND (DS.MG<2 OR DS.MG IS NULL)
	AND (DS.SVMAJ_DS IS NULL OR DS.SVMAJ_DS <> ''CIRCE'')'
	WHERE label = 'EDD Link MP';
