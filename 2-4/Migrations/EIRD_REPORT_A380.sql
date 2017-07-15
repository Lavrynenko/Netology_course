-----------------------------------------------------------
-- EIRD Report V1.0
-----------------------------------------------------------

-- Create EIRD Report Procedure

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'sp_EIRD_Report' AND type = 'P')
   DROP PROCEDURE sp_EIRD_Report
GO

CREATE PROCEDURE dbo.sp_EIRD_Report (
	@Linked_Server VARCHAR(8000) = 'None',
	@MSN VARCHAR(8000) = ''
) AS

BEGIN
	
	DECLARE
		@SQL VARCHAR(8000)
	
	SET @SQL = '
SELECT
	*
FROM
	OPENQUERY(' + @Linked_Server + ', ''
SELECT
	m.MSN [MSN],
	f.FIN [FIN-CI Name],
	f.FLIGHTESTINSTALL [FIN-CI Flight Test Installation],
	f.FUNCTIONALDESIGNATION [FIN-CI Functional Designation],
	f.BNAME [FIN-CI PSV Reference],
	f.FINCategory [FIN-CI Category],
	f.Status [FIN-CI Status],
	m.ATA [SUBATA-DS Name],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN sd.BWTPARTNUMBER ELSE s.BWTPARTNUMBER END [FIN-DS Name],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN sd.BCATEGORY ELSE s.BCATEGORY END [FIN-DS Category],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN sd.PURCHASEQTY ELSE s.PURCHASEQTY END [FIN-DS Purchase Quantity],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN sd.SKETCH ELSE s.SKETCH END [FIN-DS CA],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN sd.INSTRPROCEDURE ELSE s.INSTRPROCEDURE END [FIN-DS Installation Section],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN sd.AIRRECORDED ELSE s.AIRRECORDED END [FIN-DS AIR Recorded],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN sd.STATESTATE ELSE s.STATESTATE END [FIN-DS State],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN sd.LASTDEVEFFECTIVITY ELSE g.RANGE END [FIN-DS Effectivity],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN zd.UNIQUEID ELSE z.UNIQUEID END [FIN-DS Installation Zone],
	a.MPNUMBER [MP],
	REPLACE(REPLACE(REPLACE(a.MPTITLE, '''';'''', ''''''''), CHAR(13), '''' ''''), CHAR(10), '''''''') [MP Title],
	a.MODNUMBER [MOD],
	REPLACE(REPLACE(REPLACE(a.MODTITLE, '''';'''', ''''''''), CHAR(13), '''' ''''), CHAR(10), '''''''') [MOD Title],
	rm.MODNUMBER + ''''/'''' + rm.MPNUMBER [CIN origin of Requirement],
	CONVERT(TEXT, k.STACKING) [REQUIREMENT Stacking],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.PARTNUMBER ELSE e.PARTNUMBER END [NSEDB PN],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.CMS ELSE e.CMS END [NSEDB CMS],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.MODELREQUIRED ELSE e.MODELREQUIRED END [NSEDB Model Required ?],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.STATESTATE ELSE e.STATESTATE END [NSEDB State],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.FSCM ELSE e.FSCM END [NSEDB FSCM],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN ed.EQUIPMENTDESIGNATION ELSE e.EQUIPMENTDESIGNATION END [NSEDB Supplier Technological Designation],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN qd.COUNTERREF ELSE q.COUNTERREF END [Counter Reference],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN qd.INVARIANTREF ELSE q.INVARIANTREF END [Invariant Maturity],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN qd.EQUIPMENTMODDESC ELSE q.EQUIPMENTMODDESC END [Equipment Model Description],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN qd.MODELMANAGER ELSE q.MODELMANAGER END [Equipment Model Manager],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN qd.MODELREF ELSE q.MODELREF END [Model Reference (DS)],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN qd.STATESTATE ELSE q.STATESTATE END [State],
	CASE WHEN sd.BWTPARTNUMBER IS NOT NULL THEN qd.MODELMATURITY ELSE q.MODELMATURITY END [Model Maturity],
	m.[FIN-CI Definition Resp. NatCo] [FIN-CI Definition Resp. NatCo],
	m.[FIN-CI Provisioning Site] [FIN-CI Provisioning Site],
	m.[FIN-CI Installation Site] [FIN-CI Installation Site],
	m.[FIN-CI OBS] [FIN-CI OBS],
	m.[FIN-CI Design Focal Point] [FIN-CI Design Focal Point],
	m.[FIN-CI Installation Design Resp] [FIN-CI Installation Design Resp]
FROM
	tmp_MSNDefinition m
	JOIN tmpsv_FIN f ON f.BIDA2A2 = m.[FIN-CI BIDA2A2]
	LEFT JOIN tmpsv_DS s ON
		s.BIDA2A2 = m.[Serial FIN-DS BIDA2A2]
		AND s.STATESTATE <> ''''WIP''''
	LEFT JOIN tmpsv_PN e ON e.BIDA2A2 = s.IDPN
	LEFT JOIN tmpsv_EQUIPMENTMODEL q ON q.IDA2A2 = e.IDMODEL
	LEFT JOIN tmpsv_LOCATION z ON z.IDA2A2 = s.ZONE
	LEFT JOIN tmpsv_DSMSNRANGE g ON g.BIDA2A2 = m.[Serial FIN-DS BIDA2A2]
	LEFT JOIN tmpsv_STACKCONC k ON k.IDA2A2 = m.[Serial DS REQUIREMENT IDA2A2]
	LEFT JOIN tmpsv_ACEREQUIREMENT rk ON rk.IDA2A2 = m.[Serial DS REQUIREMENT IDA2A2]
	LEFT JOIN tmpsv_ACECIN rm ON rm.IDA2A2 = rk.IDA3A4
	LEFT JOIN tmpsv_ACECIN a ON a.IDA2A2 = m.[CIN IDA2A2]
	LEFT JOIN tmpsv_DS sd ON sd.BIDA2A2 = m.[Development FIN-DS BIDA2A2]
	LEFT JOIN tmpsv_PN ed ON ed.BIDA2A2 = sd.IDPN
	LEFT JOIN tmpsv_EQUIPMENTMODEL qd ON qd.IDA2A2 = ed.IDMODEL
	LEFT JOIN tmpsv_LOCATION zd ON zd.IDA2A2 = sd.ZONE
WHERE
	(
		s.BWTPARTNUMBER IS NOT NULL
		OR sd.BWTPARTNUMBER IS NOT NULL
	)
	' +
	CASE
		WHEN @MSN = '' THEN 'AND 1 = 0'
		ELSE 'AND m.MSN = ' + @MSN + '
	'
	END +
	''')'
	
	EXECUTE(@SQL)
	
END
GO


-- Ini parameters

DECLARE
	@r VARCHAR(8000),
	@g VARCHAR(8000),
	@p VARCHAR(8000),
	@v VARCHAR(8000),
	@Remote_Name VARCHAR(8000),
	@Remote_Database VARCHAR(8000),
	@Remote_UserName VARCHAR(8000),
	@Remote_Password VARCHAR(8000)

SET @g = ''
SET @p = ''
SET @v = ''

CREATE TABLE #@TMP
(
	PARAM VARCHAR(8000)
)

BULK INSERT #@TMP
   FROM 'E:\Inetpub\ftproot\CNFG\PSS_A380.ini'

CREATE TABLE #@INIPARAM
(
	IniGroup VARCHAR(8000),
	IniParam VARCHAR(8000),
	IniValue VARCHAR(8000),
)

DECLARE db_cursor CURSOR FOR
	SELECT * FROM #@TMP WHERE LEFT(PARAM, 1) <> ';'
BEGIN
	OPEN db_cursor
	FETCH NEXT FROM db_cursor INTO @r
	WHILE (@@FETCH_STATUS <> -1)
	BEGIN
		IF @r LIKE '[[]%]'
			SET @g = @r
		ELSE
		BEGIN
			SET @p = SUBSTRING(@r, 1, CHARINDEX('=', @r) - 1)
			SET @v = SUBSTRING(@r, CHARINDEX('=', @r) + 1, LEN(@r) - CHARINDEX('=', @r))
			INSERT INTO #@INIPARAM VALUES (@g, @p, @v)
		END
		FETCH NEXT FROM db_cursor INTO @r
	END
END
CLOSE db_cursor
DEALLOCATE db_cursor

SELECT @Remote_Name = IniValue FROM #@INIPARAM WHERE IniGroup = '[PSS Server]' AND IniParam = 'Name'
SELECT @Remote_Database = IniValue FROM #@INIPARAM WHERE IniGroup = '[PSS Server]' AND IniParam = 'Database'
SELECT @Remote_UserName = IniValue FROM #@INIPARAM WHERE IniGroup = '[PSS Server]' AND IniParam = 'UserName'
SELECT @Remote_Password = IniValue FROM #@INIPARAM WHERE IniGroup = '[PSS Server]' AND IniParam = 'Password'


-- Linked servers

IF (SELECT COUNT(*) FROM MASTER.DBO.SYSSERVERS WHERE SRVNAME = @Remote_Database) > 0
	EXEC sp_dropserver @Remote_Database, 'droplogins'

EXEC sp_addlinkedserver @Remote_Database, '', 'SQLOLEDB', @Remote_Name, '', '', @Remote_Database
EXEC sp_addlinkedsrvlogin @Remote_Database, 'false', NULL, @Remote_UserName, @Remote_Password


-- Global MSN definition Report creation in PSE

IF (SELECT REPORT_GROUP_id FROM T_REPORT_GROUP WHERE REPORT_GROUP_LABEL = 'EYDL') IS NULL
	INSERT INTO [T_REPORT_GROUP]
	(
		[REPORT_GROUP_LABEL]
	)
	VALUES
	(
		'EYDL'
	)

DECLARE
	@AttGroup INT

SELECT @AttGroup = REPORT_GROUP_id FROM T_REPORT_GROUP WHERE REPORT_GROUP_LABEL = 'EYDL'

DELETE T_DBActions WHERE label = 'EIRD Report'

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
	'EIRD Report',
	'sp_EIRD_Report ' + @Remote_Database + ',#1#',
	'- List of equipment models per MSN',
	NULL,
	'MSN :#1#',
	'List of equipment models per MSN',
	NULL,
	@AttGroup
)

DROP TABLE #@TMP
DROP TABLE #@INIPARAM