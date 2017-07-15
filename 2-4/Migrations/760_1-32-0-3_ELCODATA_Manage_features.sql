------------------------------------------------------------------------
-- update features of FLS, to make them use T_CHOICELIST
------------------------------------------------------------------------
UPDATE T_FEATURE SET where_clause = 'SELECT	id_fin FROM	R_FIN_CI WHERE	
	(SVMAJ_CI IS NULL 	
	OR 	SVMAJ_CI <> ''FIN-SI Loader'') 	
	AND
	(FLSdataValidated IS NULL 
	OR FLSdataValidated <> ''Yes'')
	AND fincategory IN (SELECT ChoiceValue FROM T_CHOICELIST WHERE ChoiceList = ''FLS Category'')
	AND id_fin = #id_fin#'
WHERE label = 'Validate FLS Data' AND display_context = ';CI/CONSULT;'

UPDATE T_FEATURE SET where_clause = 'SELECT	id_fin FROM	R_FIN_CI WHERE	
	(SVMAJ_CI IS NULL 	
	OR 	SVMAJ_CI <> ''FIN-SI Loader'') 	
	AND FLSdataValidated = ''Yes''
	AND fincategory IN (SELECT ChoiceValue FROM T_CHOICELIST WHERE ChoiceList = ''FLS Category'')
	AND id_fin = #id_fin#'
WHERE label = 'Un-validate FLS Data' AND display_context = ';CI/CONSULT;'

UPDATE T_FEATURE SET where_clause = 'SELECT	id_fin FROM	R_FIN_CI WHERE	
	(SVMAJ_CI IS NULL 	
	OR 	SVMAJ_CI <> ''FIN-SI Loader'') 	
	AND
	(FLSdataValidated IS NULL 
	OR FLSdataValidated <> ''Yes'')
	AND fincategory IN (SELECT ChoiceValue FROM T_CHOICELIST WHERE ChoiceList = ''FLS Category'')
	AND 
	(FinCiReloadingConditionTag IS NULL 
	OR FinCiReloadingConditionTag <> ''No'')
	AND id_fin = #id_fin#'
WHERE label = 'List of FLS to reload' AND display_context = ';CI/CONSULT;'


