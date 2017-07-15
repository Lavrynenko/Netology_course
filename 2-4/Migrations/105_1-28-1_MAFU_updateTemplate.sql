UPDATE T_TEMPLATE
SET
	template_SQL = 'SELECT CONVERT(VARCHAR, delta1Reference) + ''##DELTA 1#delta1Reference#'' + CONVERT(VARCHAR, id_delta1) AS [Weekly Status], delta1FirstApp AS [First Apllication], analysisCode AS [Analysis Code],catClassification AS [Category Classification],removalDateFText AS [Forecast Date for removal],removalDateAText AS [Achieved Date for removal] FROM T_DELTA1_FOLLOWUP WHERE idr_mp = #id_mp# ORDER BY id_delta1'
WHERE
	template_label = 'MP_DELTA1'