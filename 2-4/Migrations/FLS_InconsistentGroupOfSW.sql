--
-- T_REPORT_GROUP Update
--
if (not exists (SELECT *
		FROM t_report_group
		WHERE report_group_label='FLS'))
begin
	INSERT INTO t_report_group (report_group_label)
	SELECT 'FLS'
end


--
-- T_DBACTIONS Update
--
DELETE FROM T_DBActions WHERE label='SW Groups consistency per MSN' or label = 'Inconsistent group of SW'
INSERT INTO t_dbactions 
(label, command, comments, report_group_idr, parameters)
SELECT
	'SW Groups consistency per MSN',
	'
--retrieve data
SELECT DISTINCT 
	T_MSN.MSN AS [MSN],
	R_FIN_CI.FinCiSWGroup AS [SW Group],
	R_FIN_CI.FIN AS [SW FIN CI],
	R_FIN_CI.functionnalDesignation AS [SW FIN CI Functional Designation],
	R_FIN_CI.fincategory AS [SW FIN CI CATEGORY],
	FinCiSWType AS [SW type],
	PN AS [PN],
	CMS AS [CMS]
INTO
	#@report
FROM
	R_FIN_CI 
	JOIN R_FIN_DS ON R_FIN_DS.idr_fin = R_FIN_CI.id_fin
	JOIN T_MSN ON ISNULL(CHARINDEX(''-''+CONVERT(VARCHAR,T_MSN.MSN)+''-'',R_FIN_DS.dseffectivity),''0'') <> ''0''
	JOIN T_IMPACTDS ON R_FIN_DS.id_ds = T_IMPACTDS.idr_ds_post
	JOIN R_Equipment ON R_FIN_DS.idr_equip = R_Equipment.id_equip
WHERE
	SystemViewStatus = ''RELEASED''
	AND R_FIN_CI.fincategory IN (''LRU LOADABLE SOFTWARE'',''GENERIC SW'',''CUSTOMER SW'',''FIN SW SPP'',''LRU SW IN A SUBCONTRACTED CA'')
	AND ISNULL(R_FIN_CI.FinCiSWGroup,'''') <> ''''
	AND idr_ds_post NOT IN (
		SELECT
			idr_ds_pre
		FROM
			T_IMPACTDS)

--select inconsistent PN-CMS 
SELECT DISTINCT
	T1.MSN,
	T1.FinCiSWGroup
INTO
	#@InconsistentPNCMS
FROM
	#@report T1
	JOIN #@report T2 ON T1.MSN = T2.MSN 
		AND T1.FinCiSWGroup = T2.FinCiSWGroup 
		AND T1.PN + T1.CMS <> T2.PN + T2.CMS

--select inconsistent Type
SELECT DISTINCT
	T1.MSN,
	T1.FinCiSWGroup
INTO
	#@InconsistentTYPE
FROM	
	#@report T1
	JOIN #@report T2 ON T1.MSN = T2.MSN 
		AND T1.FinCiSWGroup = T2.FinCiSWGroup 
		AND T1.FinCiSWType <> T2.FinCiSWType

--set GAP1 and GAP2
SELECT
	R.*,
	CASE ISNULL(I.MSN,'''') WHEN '''' THEN ''OK'' ELSE ''PNR Inconsistency'' END AS GAP,
	CASE ISNULL(I2.MSN,'''') WHEN '''' THEN ''OK'' ELSE ''SW Type Inconsistency'' END AS GAP2
FROM
	#@report R
	LEFT JOIN #@InconsistentPNCMS I ON R.MSN = I.MSN 
		AND R.FinCiSWGroup = I.FinCiSWGroup
	LEFT JOIN #@InconsistentTYPE I2 ON R.MSN = I2.MSN 
		AND R.FinCiSWGroup = I2.FinCiSWGroup
ORDER BY R.MSN
	',
	'- SW Groups consistency per MSN',
	report_group_id,
	''
FROM
	t_report_group
WHERE
	report_group_label='FLS'



