------------------------------
-- Report ADAP CI-LO-DS
------------------------------

-- Drop sp_ADAP_CI_LO_DS Procedure

IF exists (SELECT id FROM sysobjects WHERE id = object_id(N'[dbo].[sp_ADAP_CI_LO_DS]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[sp_ADAP_CI_LO_DS]
GO


-- Create group if it does not exist

IF (SELECT REPORT_GROUP_id FROM T_REPORT_GROUP WHERE REPORT_GROUP_LABEL = 'PRIMES SSI Reports') IS NULL
	INSERT INTO [T_REPORT_GROUP] (
		[REPORT_GROUP_LABEL]
	)
	VALUES (
		'PRIMES SSI Reports'
	)

DECLARE
	@AttGroup INT

SELECT @AttGroup = REPORT_GROUP_id FROM T_REPORT_GROUP WHERE REPORT_GROUP_LABEL = 'PRIMES SSI Reports'


-- Add report

DELETE T_DBActions WHERE label = 'ADAP CI-LO-DS'

INSERT INTO [T_DBActions]
(
	[label],
	[command],
	[comments],
	[template_page],
	[parameters],
	[report_commentary],
	[mandatory_fields],
	[report_group_idr]
)
VALUES
(
	'ADAP CI-LO-DS',
	'SELECT 
		ADAP.CI, 
		ADAP.LO, 
		ADAP.DSNUMBER, 
		ADAP.DSSUFFIXE, 
		ADAP.DS_ISSUE, 
		ADAP.DS_STATE, 
		ADAP.DSTitle,
		ADAP.MANUFACTURINGRESPONSIBLE, 
		ADAP.DORESPONSIBLE,
		ADAP.RANGEFROM, 
		ADAP.RANGETO 
	FROM
		OPENQUERY(R_PSSSI_A380,
			''
				SELECT 
					cilo.A_ADAPCILEGACYNUMBER CI, 
					SUBSTR(cilo.B_ADAPLOLEGACYNUMBER,15,17) LO, 
					SUBSTR(lods.B_ADAPDSNUMBER,1,9) DSNUMBER, 
					SUBSTR(lods.B_ADAPDSNUMBER,10,12) DSSUFFIXE, 
					ds.ADAPDSISSUEINDEX DS_ISSUE, 
					ds.STATE DS_STATE, 
					ds.DOMESTICTITLE DSTitle,
					ci.MANUFACTURINGRESPONSIBLE, 
					ci.DORESPONSIBLE,
					eff.RANGEFROM, 
					eff.RANGETO,
					ci.NATCO NATCO
				FROM 
					L_ADAPCI_ADAPLO cilo, 
					L_ADAPLO_ADAPDS lods, 
					O_ADAPCI ci, 
					O_ADAPDS ds, 
					O_IXOFFEFF eff 
				WHERE 
					cilo.B_ADAPLONUMBER = lods.A_ADAPLONUMBER
					AND cilo.B_ADAPLOLEGACYNUMBER = lods.A_ADAPLOLEGACYNUMBER
					AND cilo.A_ADAPCINUMBER = ci.ADAPCINUMBER and cilo.A_ADAPCILEGACYNUMBER = ci.ADAPCILEGACYNUMBER
					AND lods.B_ADAPDSNUMBER = ds.ADAPDSNUMBER
					AND cilo.B_ADAPLONUMBER=eff.LONUMBER and cilo.B_ADAPLOLEGACYNUMBER=eff.LOLEGACYNUMBER
			 		AND (NVL(cilo.A_ADAPCILEGACYNUMBER, '''''''') LIKE ''''#CI#'''' OR ''''1#CI#'''' = ''''1'''')
					AND (NVL(ci.NATCO, '''''''') LIKE ''''#NATCO#'''' OR ''''1#NATCO#'''' = ''''1'''')
					AND (substr(NVL(cilo.B_ADAPLOLEGACYNUMBER, ''''''''), 15, 17) LIKE ''''#LO#'''' OR ''''1#LO#'''' = ''''1'''')
					AND (SUBSTR(NVL(lods.B_ADAPDSNUMBER, ''''''''), 1, 9) LIKE ''''#DSNUMBER#'''' OR ''''1#DSNUMBER#'''' = ''''1'''')
					AND (SUBSTR(NVL(lods.B_ADAPDSNUMBER, ''''''''), 10, 12) LIKE ''''#DSSUFFIXE#'''' OR ''''1#DSSUFFIXE#'''' = ''''1'''')
					AND (NVL(ds.ADAPDSISSUEINDEX, '''''''') LIKE ''''#DS_ISSUE#'''' OR ''''1#DS_ISSUE#'''' = ''''1'''')
					AND (NVL(ds.STATE, '''''''') LIKE ''''#DS_STATE#'''' OR ''''1#DS_STATE#'''' = ''''1'''')
					AND (NVL(ds.DOMESTICTITLE, '''''''') LIKE ''''#DSTitle#'''' OR ''''1#DSTitle#'''' = ''''1'''')
					AND (NVL(ci.MANUFACTURINGRESPONSIBLE, '''''''') LIKE ''''#MANUFACTURINGRESPONSIBLE#'''' OR ''''1#MANUFACTURINGRESPONSIBLE#'''' = ''''1'''')
					AND (NVL(ci.DORESPONSIBLE, '''''''') LIKE ''''#DORESPONSIBLE#'''' OR ''''1#DORESPONSIBLE#'''' = ''''1'''')
				ORDER BY
					cilo.A_ADAPCILEGACYNUMBER, 
					SUBSTR(lods.B_ADAPDSNUMBER,1,9), 
					SUBSTR(lods.B_ADAPDSNUMBER,10,12), 
					ds.ADAPDSISSUEINDEX, 
					ds.STATE, 
					eff.RANGEFROM
			'') ADAP',
	'- CSV format',
	'export_csv.php',
	'ADAP CI :#CI#;NATCO :#&NATCO:select distinct BCONFIGSET from tmpsv_FIN order by BCONFIGSET#;Domestic title :#DOMESTICTITLE#;LO :#@LO#;DSNUMBER : #DSNUMBER#;DSSUFFIXE :#DSSUFFIXE#;DS_ISSUE :#DS_ISSUE#;DS_STATE :#DS_STATE#;DSTitle :#DSTitle#;MANUFACTURINGRESPONSIBLE :#MANUFACTURINGRESPONSIBLE#;DORESPONSIBLE :#DORESPONSIBLE#',
	NULL,
	NULL,
	@AttGroup
)
