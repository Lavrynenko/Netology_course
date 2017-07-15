------------------------------------------------------------------------
-- update T_DBActions
------------------------------------------------------------------------

-- report HW Groups consistency per MSN
UPDATE T_DBActions
SET command = '--retrieve data
SELECT DISTINCT 
	T_MSN.MSN,
	R_FIN_CI.FinCiHWGroup,
	R_FIN_CI.FIN,
	R_FIN_CI.functionnalDesignation,
	R_FIN_CI.fincategory,
	PN,
	Equipment_SeriesNumber,
	CMS,
	R_FIN_LINK.id_fin_link AS HW,
	R_FIN_LINK.idr_fin_link AS SW
INTO
	#@report
FROM
	R_FIN_CI
	JOIN R_FIN_LINK ON R_FIN_CI.id_fin = R_FIN_LINK.id_fin_link
	JOIN R_FIN_DS ON R_FIN_DS.idr_fin = R_FIN_CI.id_fin
	JOIN T_MSN ON ISNULL(CHARINDEX(''-''+CONVERT(VARCHAR,T_MSN.MSN)+''-'',R_FIN_DS.dseffectivity),''0'') <> ''0''
	JOIN T_IMPACTDS ON R_FIN_DS.id_ds = T_IMPACTDS.idr_ds_post
	JOIN R_Equipment ON R_FIN_DS.idr_equip = R_Equipment.id_equip
WHERE
	SystemViewStatus = ''RELEASED''
	AND R_FIN_LINK.link_type = ''HOST''
	AND ISNULL(R_FIN_CI.FinCiHWGroup,'''') <> ''''
	AND idr_ds_post NOT IN (
		SELECT
			idr_ds_pre
		FROM
			T_IMPACTDS)

--Select inconsistent PN-CMS 
SELECT DISTINCT
	T1.MSN,
	T1.FinCiHWGroup
INTO
	#@InconsistentPNCMS
FROM
	#@report T1
	JOIN #@report T2 ON T1.MSN = T2.MSN 
		AND T1.FinCiHWGroup = T2.FinCiHWGroup 
		AND T1.PN + T1.CMS <> T2.PN + T2.CMS

--Count SW
SELECT DISTINCT
		MSN,
		FinCiHWGroup,
		HW,
		COUNT(SW) AS SWnb
INTO
	#@CountSW
FROM
	#@report 
GROUP BY
	MSN,
	FinCiHWGroup,
	HW


--Inconsistent number of SW
SELECT DISTINCT
	MSN,
	FinCiHWGroup
INTO
	#@InconsistentSWnb
FROM 
	#@CountSW 
GROUP BY
	MSN,
	FinCiHWGroup
HAVING
	MAX(SWnb) <> MIN(SWnb)



--set GAP1 and GAP2
SELECT DISTINCT
	R.MSN AS [MSN],
	R.FinCiHWGroup AS [HW Group],
	R.FIN AS [HW FINCI],
	R.functionnalDesignation AS [HW FINCI Functional designation],
	R.fincategory AS [HW FIN CATEGORY],
	R.PN AS [HW PNR],
	R.Equipment_SeriesNumber AS [HW Series NUMBER],
	R.CMS AS [HW CMS],
	SWnb.SWnb AS [Nb of hosted SW],
	CASE ISNULL(I.MSN,'''') WHEN '''' THEN ''OK'' ELSE ''PNR Inconsistency'' END AS GAP,
	CASE ISNULL(I2.MSN,'''') WHEN '''' THEN ''OK'' ELSE ''Inconsistent number of SW'' END AS GAP2
FROM
	#@report R
	JOIN #@CountSW SWnb ON R.MSN = SWnb.MSN 
		AND R.FinCiHWGroup = SWnb.FinCiHWGroup
	LEFT JOIN #@InconsistentPNCMS I ON R.MSN = I.MSN 
		AND R.FinCiHWGroup = I.FinCiHWGroup
	LEFT JOIN #@InconsistentSWnb I2 ON R.MSN = I2.MSN 
		AND R.FinCiHWGroup = I2.FinCiHWGroup
ORDER BY
	R.FinCiHWGroup,
	R.FIN,
	R.PN'
WHERE (label LIKE 'HW Groups consistency per MSN');

