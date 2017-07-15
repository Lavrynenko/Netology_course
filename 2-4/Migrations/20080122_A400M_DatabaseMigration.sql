-- ========================================================================
-- 3 FINs CIRCE to be created as Deleted in System View
-- 5FA1	C/B-SSA1 SPLY 115VAC	3414
-- 7PH  C/B-EMER CONFIG RESET	2462
-- 1XT1	C/B-VFG1 DISC		2421
-- ========================================================================

-- 5FA1
set @id_ata = (select id_ata from r_ata where atacode='3414')
insert into r_fin_ci 
(FIN,SVMAJ_CI,idr_ata,functionnaldesignation) 
values ('5FA1','CIRCE',@id_ata,'C/B-SSA1 SPLY 115VAC')

-- 7PH
set @id_ata = (select id_ata from r_ata where atacode='2462')
insert into r_fin_ci 
(FIN,SVMAJ_CI,idr_ata,functionnaldesignation) 
values ('7PH','CIRCE',@id_ata,'C/B-EMER CONFIG RESET')

-- 1XT1
set @id_ata = (select id_ata from r_ata where atacode='2421')
insert into r_fin_ci 
(FIN,SVMAJ_CI,idr_ata,functionnaldesignation) 
values ('1XT1','CIRCE',@id_ata,'C/B-VFG1 DISC')

--ROLLBACK TRANSACTION WorkStart

-- ========================================================================
-- Fix FIN ORIGIN for CIRCE FINs
-- ========================================================================
update r_fin_ci
set svmaj_ci='CIRCE'
where 0=0
and svmaj_ci is null
and FIN in (
'10KS',
'11KF',
'12EH',
'12KF',
'12KS',
'13KS',
'14KF',
'14KS',
'15EH',
'15KF',
'15KS',
'17KS',
'18EH',
'18KS',
'19KS',
'1AN',
'20KS',
'22KS',
'23KS',
'24KS',
'25KS',
'29KS',
'2KD',
'30KS',
'3EH',
'3KC',
'43KS',
'44KS',
'45KS',
'46KS',
'47KS',
'48KS',
'49KS',
'4KC',
'50KS',
'5AQ',
'5KC',
'5KF',
'6EH',
'6KC',
'6KF',
'7KS',
'8KF',
'8KS',
'9EH',
'9KF',
'9KS',
'10RZ',
'4QE1',
'7RX',
'24GF1',
'24GF2',
'67GA',
'10CY',
'11CT',
'11CY',
'4CH',
'6CH',
'6CR',
'7CR',
'8CR',
'9CR',
'9CT',
'3CJ',
'10JB1',
'10JB2',
'11JB1',
'11JB2',
'11JY1',
'11JY2',
'13JY1',
'13JY2',
'14JY1',
'14JY2',
'17JY',
'9JB1',
'9JB2',
'19WD',
'2WE',
'3WE',
'6WE',
'9WE',
'2RB',
'5RK',
'7RL',
'27RA1',
'27RA2',
'27RA3',
'27RA5',
'27RA7',
'42RT',
'11FA1',
'5FA1',
'6FA1',
'6FA2',
'7FA',
'5RS',
'5SA',
'13TU',
'15TU',
'1KD',
'31TF',
'21TF',
'61TF',
'11TG',
'13TG',
'15TG',
'10VM',
'11VM',
'1VM',
'2VM',
'3VM',
'4VM',
'5VM',
'6VM',
'7VM',
'8VM',
'10XC',
'11XC',
'12XC',
'13XC',
'14XC',
'15XC',
'1XC',
'23PH',
'24PH',
'25PH',
'26PH',
'27PH',
'28PH',
'29PH',
'2PC',
'2XC',
'30PH',
'31PH',
'32PH',
'33PH',
'34PH',
'35PH',
'35XH',
'36PH',
'36XH',
'37PH',
'37XH',
'38PH',
'38XH',
'39PH',
'39XH',
'3XH',
'40PH',
'41PH',
'42PH',
'42XC',
'43XC',
'44PH',
'4PC',
'4XC',
'5PC',
'5PH',
'14QL1',
'14QL2',
'14QL3',
'14QL4',
'17QL1',
'17QL2',
'18QL1',
'18QL2',
'22QL1',
'22QL2',
'2TN',
'1PV',
'1XT1',
'1XT2',
'1XT3',
'1XT4',
'2PE1',
'2XU1',
'2XU2',
'2XU3',
'2XU4',
'3XS',
'6XE',
'7XE',
'1HZ',
'1WF',
'3WF',
'1HS',
'1LP',
'9RZ',
'2QF',
'1QE1',
'1QE2',
'1QE3',
'1QE4',
'1QG1',
'1QG2',
'1QG3',
'1QG4',
'1QM',
'2QM',
'3QM',
'1QV',
'2QV',
'7AJ1',
'7AJ2',
'5QU',
'6PA',
'9RI',
'27RA6',
'24QU',
'27RA8',
'27RA9',
'24QL1',
'24QL2',
'24QL3',
'24QL4',
'5PH',
'1HL1',
'1HL2',
'8HH',
'2CA',
'2PE2',
'2XD',
'1CV',
'19QA',
'8AQ',
'1QC',
'11WT',
'6WT',
'5WK',
'6WK',
'7WK',
'8WK',
'5WT',
'2GE',
'4GZ',
'5WL1',
'2FC',
'4FC',
'7FC',
'3FP2',
'3FP1',
'1WR',
'2HT',
'1HT',
'5WR',
'6WR',
'7WR',
'8WR',
'9WR',
'10WR',
'26HA',
'27HA',
'2HV',
'11TH',
'13TH',
'15TH',
'17TH',
'3QC',
'20QA',
'22QA',
'8WT',
'9WT',
'7WT',
'10WT',
'12WT',
'1LE',
'2LP',
'3CA',
'1WH',
'4HH',
'5CR',
'4CR',
'4CT',
'4CY',
'9CE',
'17CY',
'23CE',
'22CE',
'7CE',
'6CE',
'22GF',
'21XZ',
'27RA4',
'2FP1',
'2FP2',
'3FP3',
'2FP3',
'21QA',
'5WL2',
'5WL3',
'5WL4',
'1MY',
'2PE3',
'6PC',
'3GE',
'3GZ',
'14TU',
'3HT',
'59GA',
'31CE',
'33CE',
'7GC',
'69GA',
'71GA',
'4WR',
'3WR',
'2WR',
'30PC',
'4FP1',
'4FP2',
'34QA',
'1HQ',
'57GA',
'56GA',
'73GA',
'3SD',
'1QA2',
'1QA3',
'2QA2',
'2QA3')

-- Update SVMAJ flags for CI, DS, PN and Responsibility
UPDATE R_FIN_CI SET
	SVMAJ_CI = 'PSEQ'
FROM
	R_FIN_CI
	--JOIN OPENQUERY(PSS_A400M,'SELECT BWTPARTNUMBER FROM tmpsv_FIN') AS FIN ON FIN.BWTPARTNUMBER = R_FIN_CI.fin_ci_sv
	JOIN tmpsv_FIN FIN ON FIN.BWTPARTNUMBER = R_FIN_CI.fin_ci_sv

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
	--JOIN OPENQUERY(PSS_A400M,'SELECT CMS FROM tmpsv_PN') AS PN ON PN.CMS = R_EQUIPMENT.CMS
	JOIN tmpsv_PN PN ON PN.CMS = R_EQUIPMENT.CMS

UPDATE R_EQUIPMENT SET
	SVMAJ_EQT = 'PSEQ'
FROM
	R_EQUIPMENT
	--JOIN OPENQUERY(PSS_A400M,'SELECT BNAME FROM tmpsv_STANDARDPART') AS STANDARD_PART ON STANDARD_PART.BNAME = R_EQUIPMENT.CMS
	JOIN tmpsv_STANDARDPART STANDARD_PART ON STANDARD_PART.BNAME = R_EQUIPMENT.CMS

UPDATE T_Responsibility SET
	SVMAJ_Resp = 'PSEQ'
FROM
	T_Responsibility
	JOIN R_FIN_CI ON R_FIN_CI.id_fin = T_Responsibility.idr_fin
WHERE
	SVMAJ_CI = 'PSEQ'

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