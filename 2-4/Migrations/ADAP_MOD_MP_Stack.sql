-----------------------------------
-- Report ADAP MOD/MP Stack
-----------------------------------

-- Drop sp_ADAP_MODMP Procedure

IF exists (SELECT id FROM sysobjects WHERE id = object_id(N'[dbo].[sp_ADAP_MODMP]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[sp_ADAP_MODMP]
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

DELETE T_DBActions WHERE label = 'ADAP MOD/MP Stack'

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
	'ADAP MOD/MP Stack',
	'SELECT 
		ADAP.CI, 
		ADAP.LO, 
		CAST(ADAP.CINSTACKING as text)
	FROM
		OPENQUERY(R_PSSSI_A380,
			''
				
				SELECT 
					SUBSTR(req.REQUIREMENTID,1,12) CI, 
					SUBSTR(req.LOLEGACYNUMBERORIGIN,13,16) LO, 
					req.CINSTACKING
				FROM 
					O_IXREQUIR req
				WHERE
					(SUBSTR(NVL(req.REQUIREMENTID, ''''''''), 1, 9) LIKE ''''#REQUIREMENTID#'''' OR ''''1#REQUIREMENTID#'''' = ''''1'''')
					AND (SUBSTR(NVL(req.LOLEGACYNUMBERORIGIN, ''''''''), 10, 12) LIKE ''''#LOLEGACYNUMBERORIGIN#'''' OR ''''1#LOLEGACYNUMBERORIGIN#'''' = ''''1'''')
					AND (NVL(req.CINSTACKING, '''''''') LIKE ''''#CINSTACKING#'''' OR ''''1#CINSTACKING#'''' = ''''1'''')
				ORDER BY
					CI, 
					LO, 
					CINSTACKING
			'') ADAP',
	'- CSV format',
	'export_csv.php',
	'REQUIREMENT ID :#REQUIREMENTID#;LO LEGACY NUMBERORIGIN#LOLEGACYNUMBERORIGIN#;CIN STACKING :#CINSTACKING#',
	NULL,
	NULL,
	@AttGroup
)
