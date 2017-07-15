-----------------------
-- Report ADAP LO
-----------------------

-- Drop sp_ADAP_LO Procedure

IF exists (SELECT id FROM sysobjects WHERE id = object_id(N'[dbo].[sp_ADAP_LO]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[sp_ADAP_LO]
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

DELETE T_DBActions WHERE label = 'ADAP LO'

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
	'ADAP LO',
	'SELECT 
		ADAP.ADAPLONUMBER, 
		ADAP.ADAPLOLEGACYNUMBER, 
		ADAP.NATCO, 
		ADAP.EFFTYPE, 
		ADAP.STDCODE, 
		ADAP.VERSIONCODE,
		ADAP.RANGEFROM, 
		ADAP.RANGETO 
	FROM
		OPENQUERY(R_PSSSI_A380,
			''
				SELECT 
					lo.ADAPLONUMBER, 
					lo.ADAPLOLEGACYNUMBER, 
					lo.NATCO, 
					eff.EFFTYPE, 
					eff.STDCODE, 
					eff.VERSIONCODE, 
					eff.RANGEFROM, 
					eff.RANGETO
				FROM 
					O_ADAPLO lo, 
					O_IXOFFEFF eff
				WHERE 
					lo.ADAPLONUMBER = eff.LONUMBER 
					AND lo.ADAPLOLEGACYNUMBER = eff.LOLEGACYNUMBER
					AND (NVL(lo.ADAPLONUMBER, '''''''') LIKE ''''#ADAPLONUMBER#'''' OR ''''1#ADAPLONUMBER#'''' = ''''1'''')
					AND (NVL(lo.ADAPLOLEGACYNUMBER, '''''''') LIKE ''''#ADAPLOLEGACYNUMBER#'''' OR ''''1#ADAPLOLEGACYNUMBER#'''' = ''''1'''')
					AND (NVL(lo.NATCO, '''''''') LIKE ''''#NATCO#'''' OR ''''1#NATCO#'''' = ''''1'''')
					AND (NVL(eff.EFFTYPE, '''''''') LIKE ''''#EFFTYPE#'''' OR ''''1#EFFTYPE#'''' = ''''1'''')
					AND (NVL(eff.STDCODE, '''''''') LIKE ''''#STDCODE#'''' OR ''''1#STDCODE#'''' = ''''1'''')
					AND (NVL(eff.VERSIONCODE, '''''''') LIKE ''''#VERSIONCODE#'''' OR ''''1#VERSIONCODE#'''' = ''''1'''')
				ORDER BY
					ADAPLONUMBER, 
					ADAPLOLEGACYNUMBER, 
					RANGEFROM, 
					RANGETO
			'') ADAP',
	'- CSV format',
	'export_csv.php',
	'ADAP LO NUMBER :#ADAPLONUMBER#;ADAP LO LEGACY NUMBER :#ADAPLOLEGACYNUMBER#;NATCO :#&NATCO:select distinct BCONFIGSET from tmpsv_FIN order by BCONFIGSET#;EFF. TYPE :#EFFTYPE#;STD CODE :#STDCODE#;VERSION CODE :#VERSIONCODE#',
	NULL,
	NULL,
	@AttGroup
)
