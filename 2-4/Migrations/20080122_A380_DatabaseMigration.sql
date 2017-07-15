-- Update SVMAJ flags for CI, DS, PN and Responsibility
UPDATE R_FIN_CI SET
	SVMAJ_CI = 'PSEQ'
FROM
	R_FIN_CI
	JOIN OPENQUERY(PSS_A380,'SELECT BWTPARTNUMBER FROM tmpsv_FIN') AS FIN ON FIN.BWTPARTNUMBER = R_FIN_CI.fin_ci_sv

UPDATE R_FIN_DS SET
	SVMAJ_DS = 'PSEQ'
FROM
	R_FIN_DS
	JOIN R_FIN_CI ON R_FIN_CI.id_fin = R_FIN_DS.idr_fin
WHERE
	SVMAJ_CI = 'PSEQ'
	AND ds_type IN (0, 1)

UPDATE R_FIN_DS SET
	SVMAJ_DS = 'PSEQ'
FROM
	R_FIN_DS
WHERE
	ds_type = 4
	AND fin_ds_sv IS NOT NULL
	
UPDATE R_EQUIPMENT SET
	SVMAJ_EQT = 'PSEQ'
FROM
	R_EQUIPMENT
	JOIN OPENQUERY(PSS_A380,'SELECT CMS FROM tmpsv_PN') AS PN ON PN.CMS = R_EQUIPMENT.CMS

UPDATE R_EQUIPMENT SET
	SVMAJ_EQT = 'PSEQ'
FROM
	R_EQUIPMENT
	JOIN OPENQUERY(PSS_A380,'SELECT BNAME FROM tmpsv_STANDARDPART') AS STANDARD_PART ON STANDARD_PART.BNAME = R_EQUIPMENT.CMS

UPDATE T_Responsibility SET
	SVMAJ_Resp = 'PSEQ'
FROM
	T_Responsibility
	JOIN R_FIN_CI ON R_FIN_CI.id_fin = T_Responsibility.idr_fin
WHERE
	SVMAJ_CI = 'PSEQ'

UPDATE R_FIN_CI SET
	SVMAJ_CI = 'CIRCE'
FROM
	R_FIN_CI
	JOIN TMP_CIRCEDEFINITION ON RTRIM(LTRIM(TMP_CIRCEDEFINITION.Col001)) = R_FIN_CI.FIN

UPDATE R_FIN_DS SET
	SVMAJ_DS = 'CIRCE'
FROM
	R_FIN_DS
	JOIN R_FIN_CI ON R_FIN_CI.id_fin = R_FIN_DS.idr_fin
WHERE
	SVMAJ_CI = 'CIRCE'

UPDATE R_EQUIPMENT SET
	SVMAJ_EQT = 'CIRCE'
FROM
	R_EQUIPMENT
	JOIN TMP_CIRCEDEFINITION ON TMP_CIRCEDEFINITION.Col007 = R_EQUIPMENT.CMS

-- Specific case 22QC
UPDATE
	r_fin_ds
	SET SVMAJ_DS = 'PSEQ'
FROM
	r_fin_ds
	JOIN OPENQUERY(PSS_A380,'SELECT BWTPARTNUMBER, STATESTATE FROM tmpsv_ds WHERE STATESTATE IN (''HELD'', ''RELEASED'', ''WIP'')') AS DS ON bwtpartnumber = fin_ds_sv
WHERE
	ISNULL(r_fin_ds.svmaj_ds, '') <> 'PSEQ'

--  IMPACT DELETION
DELETE T_IMPACTDS
FROM
	T_IMPACTDS
	JOIN (
		SELECT DISTINCT
			ISNULL(PREDS.id_ds, 0) idr_ds_pre,
			ISNULL(POSTDS.id_ds, 0) idr_ds_post,
			ISNULL(T_MP.id_mp, 0) idr_mp
		FROM
			tmpsv_IMPACTDS
			LEFT JOIN tmpsv_DS PRE ON PRE.BIDA2A2 = tmpsv_IMPACTDS.IDA3C4
			LEFT JOIN R_FIN_DS PREDS ON PREDS.fin_ds_sv = PRE.BWTPARTNUMBER
			LEFT JOIN tmpsv_DS POST ON POST.BIDA2A2 = tmpsv_IMPACTDS.IDA3A4
			LEFT JOIN R_FIN_DS POSTDS ON POSTDS.fin_ds_sv = POST.BWTPARTNUMBER
			LEFT JOIN tmpsv_PRIMESMP ON tmpsv_PRIMESMP.IDA2A2 = tmpsv_IMPACTDS.IDA3B4
			LEFT JOIN T_MP ON T_MP.MPReference = tmpsv_PRIMESMP.MPNUMBER
		WHERE
			tmpsv_impactds.IMPACTTYPE <> 'TBD'
			AND POSTDS.id_ds IS NOT NULL
	) DOUBLEIMPACT ON
		DOUBLEIMPACT.idr_ds_pre = T_IMPACTDS.idr_ds_pre
		AND DOUBLEIMPACT.idr_ds_post = T_IMPACTDS.idr_ds_post
		AND DOUBLEIMPACT.idr_mp = T_IMPACTDS.idr_mp

--	
-- New columns in IMPACTDS
--
DECLARE
	@Table_Name VARCHAR(50),
	@Attribute VARCHAR(50)
	
-- Insert new T_IMPACTDS attribute ImpactMaturity if not exists
SET @Table_Name = 'T_IMPACTDS'
SET @Attribute = 'ImpactMaturity'
IF (NOT exists (
	SELECT * FROM syscolumns WHERE
		syscolumns.id = (SELECT sysobjects.id FROM sysobjects WHERE name = @Table_Name) AND
		syscolumns.name = @Attribute
	)
) BEGIN
	exec ('ALTER TABLE '+@Table_Name+' ADD '+@Attribute+' varchar(200)')	-- varchar(X) to be updated
END

-- Insert new T_IMPACTDS attribute ICYCode if not exists
SET @Table_Name = 'T_IMPACTDS'
SET @Attribute = 'ICYCode'
IF (NOT exists (
	SELECT * FROM syscolumns WHERE
		syscolumns.id = (SELECT sysobjects.id FROM sysobjects WHERE name = @Table_Name) AND
		syscolumns.name = @Attribute
	)
) BEGIN
	exec ('ALTER TABLE '+@Table_Name+' ADD '+@Attribute+' varchar(3)')	-- varchar(X) to be updated
END

-- Insert new T_IMPACTDS attribute ICYCondition if not exists
SET @Table_Name = 'T_IMPACTDS'
SET @Attribute = 'ICYCondition'
IF (NOT exists (
	SELECT * FROM syscolumns WHERE
		syscolumns.id = (SELECT sysobjects.id FROM sysobjects WHERE name = @Table_Name) AND
		syscolumns.name = @Attribute
	)
) BEGIN
	exec ('ALTER TABLE '+@Table_Name+' ADD '+@Attribute+' varchar(1000)')	-- varchar(X) to be updated
END
GO

--
-- Create business table T_REQUIREMENT
--
DECLARE
 @Table_Name VARCHAR(50)
SET @Table_Name = 'T_REQUIREMENT'
IF (NOT exists (SELECT sysobjects.id FROM sysobjects WHERE NAME = @Table_Name)) BEGIN
	EXEC('CREATE TABLE ' + @Table_Name + ' (
		REQ_id INT IDENTITY (1, 1) NOT NULL,
 		ReqName VARCHAR(50) NOT NULL,
 		ReqEffRange VARCHAR(8000) NULL,
 		ReqCinStacking VARCHAR(8000) NULL,
  		ReqState VARCHAR(50) NULL,
  		REQ_CIN_idr INT NULL,
  		REQ_CI_idr INT NULL,
  		REQ_DS_idr INT NULL,
  		REQ_REQ_idr INT NULL,
  		ReqCreationDate DATETIME NULL,
  		ReqUpdateDate DATETIME NULL,
  		SVMAJ_Req VARCHAR(50),
  		ReqDataOrigin VARCHAR(50)
	) ON [PRIMARY]')
END
GO

-- fin_ci_sv and fin_ds_sv updating for CIRCE data
-- Name format
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[FORMATNAME]'))
DROP FUNCTION [FORMATNAME]
GO
CREATE FUNCTION dbo.FORMATNAME(@PROGRAMLETTER VARCHAR(5),@NAME VARCHAR(20),@REFERENCE VARCHAR(10))
RETURNS VARCHAR(20) AS
BEGIN
	DECLARE @CPT INT
	DECLARE @LETTER CHAR(1)
	DECLARE @RETURN VARCHAR(20)
	SET @CPT = 1
	SET @LETTER = SUBSTRING(@NAME,@CPT,1)
	
	WHILE ISNUMERIC(@LETTER) = 1
	BEGIN
		SET @CPT = @CPT + 1
		SET @LETTER = SUBSTRING(@NAME,@CPT,1)
	END
	
	SET @RETURN = @PROGRAMLETTER + REPLICATE(' ',4-(@CPT-1)) + SUBSTRING(@NAME,1,@CPT-1) + SUBSTRING(@NAME,@CPT,LEN(@NAME)) + REPLICATE(' ',9-LEN(SUBSTRING(@NAME,@CPT,LEN(@NAME)))) + @REFERENCE

RETURN
	@RETURN
END
GO
DECLARE
	@PROGRAMLETTER VARCHAR(5)
SET @PROGRAMLETTER = 'L'
UPDATE
	R_FIN_CI
	SET fin_ci_sv = dbo.FORMATNAME(@PROGRAMLETTER, FIN, '')
WHERE
	SVMAJ_CI = 'CIRCE'
	AND fin_ci_sv IS NULL
UPDATE
	R_FIN_DS
	SET fin_ds_sv = dbo.FORMATNAME(@PROGRAMLETTER, R_FIN_CI.FIN, '-' + RIGHT(R_FIN_DS.DS_SI_Reference,3))
FROM
	R_FIN_DS
JOIN R_FIN_CI ON R_FIN_CI.id_fin = R_FIN_DS.idr_fin
WHERE
	SVMAJ_DS = 'CIRCE'
	AND fin_ds_sv IS NULL
	
-- DELETE: FIN without origin
DELETE
	R_FIN_CI
FROM
	R_FIN_CI
WHERE
	SVMAJ_CI IS NULL

-- DELETE: DS without FIN but not type 4
DELETE
	R_FIN_DS
FROM
	R_FIN_DS
LEFT JOIN R_FIN_CI ON R_FIN_CI.id_fin = R_FIN_DS.idr_fin
WHERE
	R_FIN_CI.id_fin IS NULL
	AND ISNULL(ds_type, '') <> 4

-- DELETE: DS without origin but not type 4
DELETE
	R_FIN_DS
FROM
	R_FIN_DS
WHERE
	SVMAJ_DS IS NULL
	AND ISNULL(ds_type, '') <> 4

-- DELETE: DS type 2
DELETE
	R_FIN_DS
FROM
	R_FIN_DS
WHERE
	ds_type = 2

-- DELETE: PN without DS
DELETE
	R_EQUIPMENT
FROM
	R_EQUIPMENT
LEFT JOIN R_FIN_DS ON R_FIN_DS.idr_equip = R_EQUIPMENT.id_equip
WHERE
	R_FIN_DS.idr_equip IS NULL

-- DELETE: ATA doubloon
DELETE
	a1
FROM
	r_ata a1
JOIN r_ata a2 ON a2.ATACode = a1.ATACode AND a1.id_ata <> a2.id_ata
LEFT JOIN R_FIN_CI ON R_FIN_CI.idr_ata = a1.id_ATA
LEFT JOIN T_MP ON T_MP.idr_ata = a1.id_ATA
LEFT JOIN T_PDCI ON T_PDCI.pdci_idr_ata = a1.id_ATA
WHERE
	R_FIN_CI.idr_ata IS NULL
	AND T_MP.idr_ata IS NULL
	AND T_PDCI.pdci_idr_ata IS NULL

-- DELETE: Supplier doubloon
DELETE
	a1
FROM
	r_supplier a1
JOIN r_supplier a2 ON a2.SupFSCM = a1.SupFSCM AND a1.id_supplier <> a2.id_supplier
LEFT JOIN R_EQUIPMENT ON R_EQUIPMENT.idr_supplier = a1.id_supplier
WHERE
	R_EQUIPMENT.idr_supplier IS NULL