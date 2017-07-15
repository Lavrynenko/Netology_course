---------------------------------------------
-- PRIMES SYSTEM VIEW: equipment doubloons --
---------------------------------------------

-- Equipment without category
/*
SELECT
	*
FROM
	r_equipment
WHERE
	eqt_category IS NULL
	AND SVMAJ_EQT = 'PSEQ'
*/

DELETE r_equipment
FROM
	r_equipment
WHERE
	eqt_category IS NULL
	AND SVMAJ_EQT = 'PSEQ'

-- Equipment Doubloon PSEQ: search max id
SELECT
	max(e1.id_equip) id_equip, e1.CMS, e1.PN
INTO
	#@REF_EQUIP_PSEQ
FROM
	r_equipment e1
	JOIN r_equipment e2 ON e2.PN = e1.PN
		AND e2.CMS = e1.CMS
		AND e1.id_equip != e2.id_equip
WHERE
	e1.SVMAJ_EQT = 'PSEQ'
	AND e2.SVMAJ_EQT = 'PSEQ'
GROUP BY e1.CMS, e1.PN
--> 28 lines

-- Id_equip to be replaced by id_equip ref
SELECT
	e1.id_equip ex_id_equip, e1.CMS, e1.PN, e2.id_equip
INTO
	#@EQUIP_CHG_PSEQ
FROM
	r_equipment e1
	JOIN #@REF_EQUIP_PSEQ e2 ON e2.PN = e1.PN
		AND e2.CMS = e1.CMS
		AND e1.id_equip != e2.id_equip
WHERE
	e1.SVMAJ_EQT = 'PSEQ'
-- 616 lines

-- DS to be updated
SELECT
	ds.id_ds, ds.fin_ds_sv, ds.idr_equip ex_idr_equip, e1.CMS, e1.PN, e1.id_equip
INTO
	#@EQUIP_PSEQ_TOBEUPDATED
FROM
	r_fin_ds ds
	JOIN #@EQUIP_CHG_PSEQ e1 ON e1.ex_id_equip = ds.idr_equip
ORDER BY
	e1.CMS
-- 63 lines

/* save ds updated
SELECT
	ds1.*
FROM
	r_fin_ds ds1
	JOIN #@EQUIP_PSEQ_TOBEUPDATED ds2 ON ds2.id_ds = ds1.id_ds
*/

--- Update identified ds
UPDATE r_fin_ds SET
	idr_equip = ds2.id_equip
FROM
	r_fin_ds ds1
	JOIN #@EQUIP_PSEQ_TOBEUPDATED ds2 ON ds2.id_ds = ds1.id_ds

-- Equipment Doubloon PSEQ with DS
SELECT
	e1.id_equip, max(e1.CMS) CMS, max(e1.PN) PN, max(e1.SVMAJ_EQT) SVMAJ_EQT, max(ds.FIN_DS_SV) DS
INTO
	#@WITH_DS_PSEQ
FROM
	r_equipment e1
	JOIN r_equipment e2 ON e2.PN = e1.PN 
		AND e2.CMS = e1.CMS
		AND e1.id_equip != e2.id_equip
	JOIN r_fin_ds ds on ds.idr_equip = e1.id_equip 
WHERE
	e1.SVMAJ_EQT = 'PSEQ'
	AND e2.SVMAJ_EQT = 'PSEQ'
GROUP BY e1.id_equip
ORDER BY CMS
--> 22 lines

-- Equipment Doubloon PSEQ without DS, but with at least one with a DS: to be deleted
SELECT
	e1.id_equip, max(e1.CMS) CMS, max(e1.PN) PN, max(e1.SVMAJ_EQT) SVMAJ_EQT
INTO
	#@EQUIP1_PSEQ_TOBEDELETED
FROM
	r_equipment e1
	JOIN #@WITH_DS_PSEQ e2 ON e2.PN = e1.PN 
		AND e2.CMS = e1.CMS
		AND e1.id_equip != e2.id_equip
	LEFT JOIN r_fin_ds ds ON ds.idr_equip = e1.id_equip
WHERE
	e1.SVMAJ_EQT = 'PSEQ'
	AND e2.SVMAJ_EQT = 'PSEQ'
	AND ds.id_ds IS NULL
GROUP BY e1.id_equip
ORDER BY CMS
--> 392 lines

-- Equipment Doubloon PSEQ without DS
SELECT
	e1.id_equip, max(e1.CMS) CMS, max(e1.PN) PN, max(e1.SVMAJ_EQT) SVMAJ_EQT
INTO
	#@WITHOUT_DS_PSEQ
FROM
	r_equipment e1
	JOIN r_equipment e2 ON e2.PN = e1.PN 
		AND e2.CMS = e1.CMS
		AND e1.id_equip != e2.id_equip
	LEFT JOIN #@WITH_DS_PSEQ e3 ON e3.PN = e1.PN
		AND e3.CMS = e1.CMS
WHERE
	e1.SVMAJ_EQT = 'PSEQ'
	AND e2.SVMAJ_EQT = 'PSEQ'
	AND e3.id_equip IS NULL
GROUP BY e1.id_equip
ORDER BY CMS
--> 230 lines

-- Equipment Doubloon without DS: max id
SELECT
	max(id_equip) id_equip, CMS, PN, max(SVMAJ_EQT) SVMAJ_EQT
INTO
	#@WITHOUT_DS_PSEQ_KEEP
FROM
	#@WITHOUT_DS_PSEQ
GROUP BY CMS, PN
ORDER BY CMS
--> 10 lines

-- Equipment Doubloon without DS to be deleted
SELECT
	e1.*
INTO
	#@EQUIP2_PSEQ_TOBEDELETED
FROM
	#@WITHOUT_DS_PSEQ e1
	LEFT JOIN #@WITHOUT_DS_PSEQ_KEEP e2 ON e2.id_equip = e1.id_equip
WHERE
	e2.id_equip IS NULL
-- 220 lines


-- Equipment Doubloon PSEQ
/*
SELECT
	e1.id_equip, max(e1.CMS) CMS, max(e1.PN) PN, max(e1.SVMAJ_EQT) SVMAJ_EQT
FROM
	r_equipment e1
	JOIN r_equipment e2 ON e2.PN = e1.PN
		AND e2.CMS = e1.CMS
		AND e1.id_equip != e2.id_equip
WHERE
	e1.SVMAJ_EQT = 'PSEQ'
	AND e2.SVMAJ_EQT = 'PSEQ'
GROUP BY e1.id_equip
ORDER BY CMS
--> 644 lines
*/

/* to save deleted data
SELECT
	e1.*
FROM
	r_equipment e1
	JOIN #@EQUIP1_PSEQ_TOBEDELETED e2 ON e2.id_equip = e1.id_equip

SELECT
	e1.*
FROM
	r_equipment e1
	JOIN #@EQUIP2_PSEQ_TOBEDELETED e2 ON e2.id_equip = e1.id_equip
*/

-- Delete identified doubloon
DELETE
	r_equipment
FROM
	r_equipment e1
	JOIN #@EQUIP1_PSEQ_TOBEDELETED e2 ON e2.id_equip = e1.id_equip

DELETE
	r_equipment
FROM
	r_equipment e1
	JOIN #@EQUIP2_PSEQ_TOBEDELETED e2 ON e2.id_equip = e1.id_equip

-- Update DS with new standard part
UPDATE
	R_FIN_DS
SET
	R_FIN_DS.idr_equip = R_Equipment.id_equip
FROM
	tmpsv_DS
	JOIN R_FIN_DS ON R_FIN_DS.fin_ds_sv = tmpsv_DS.BWTPARTNUMBER
	JOIN tmpsv_STANDARDPART ON tmpsv_DS.IDSTDPT = tmpsv_STANDARDPART.IDA2A2
	JOIN R_Equipment ON tmpsv_STANDARDPART.BNAME = R_Equipment.CMS
WHERE
	R_FIN_DS.SVMAJ_DS = 'PSEQ'
	AND R_Equipment.SVMAJ_Eqt = 'PSEQ'

--------------------------------
-- CIRCE: equipment doubloons --
--------------------------------

-- Equipment without category
/*
SELECT
	*
FROM
	r_equipment
WHERE
	eqt_category IS NULL
	AND SVMAJ_EQT = 'CIRCE'
*/

DELETE r_equipment
FROM
	r_equipment
WHERE
	eqt_category IS NULL
	AND SVMAJ_EQT = 'CIRCE'

-- Equipment Doubloon CIRCE: search max id
SELECT
	max(e1.id_equip) id_equip, e1.CMS, e1.PN
INTO
	#@REF_EQUIP_CIRCE
FROM
	r_equipment e1
	JOIN r_equipment e2 ON e2.PN = e1.PN
		AND e2.CMS = e1.CMS
		AND e1.id_equip != e2.id_equip
WHERE
	e1.SVMAJ_EQT = 'CIRCE'
	AND e2.SVMAJ_EQT = 'CIRCE'
GROUP BY e1.CMS, e1.PN
--> 16 lines

-- Id_equip to be replaced by id_equip ref
SELECT
	e1.id_equip ex_id_equip, e1.CMS, e1.PN, e2.id_equip
INTO
	#@EQUIP_CHG_CIRCE
FROM
	r_equipment e1
	JOIN #@REF_EQUIP_CIRCE e2 ON e2.PN = e1.PN
		AND e2.CMS = e1.CMS
		AND e1.id_equip != e2.id_equip
WHERE
	e1.SVMAJ_EQT = 'CIRCE'
-- 697 lines

-- DS to be updated
SELECT
	ds.id_ds, ds.fin_ds_sv, ds.idr_equip ex_idr_equip, e1.CMS, e1.PN, e1.id_equip
INTO
	#@EQUIP_CIRCE_TOBEUPDATED
FROM
	r_fin_ds ds
	JOIN #@EQUIP_CHG_CIRCE e1 ON e1.ex_id_equip = ds.idr_equip
ORDER BY
	e1.CMS
-- 194 lines

/* save ds updated
SELECT
	ds1.*
FROM
	r_fin_ds ds1
	JOIN #@EQUIP_CIRCE_TOBEUPDATED ds2 ON ds2.id_ds = ds1.id_ds
-- 194 lines
*/

--- Update identified ds
UPDATE r_fin_ds SET
	idr_equip = ds2.id_equip
FROM
	r_fin_ds ds1
	JOIN #@EQUIP_CIRCE_TOBEUPDATED ds2 ON ds2.id_ds = ds1.id_ds
-- 194 lines

-- Equipment Doubloon CIRCE with DS: becare full 4 doubloons exists with differents DS
SELECT
	e1.id_equip, max(e1.CMS) CMS, max(e1.PN) PN, max(e1.SVMAJ_EQT) SVMAJ_EQT, max(ds.FIN_DS_SV) DS
INTO
	#@WITH_DS_CIRCE
FROM
	r_equipment e1
	JOIN r_equipment e2 ON e2.PN = e1.PN 
		AND e2.CMS = e1.CMS
		AND e1.id_equip != e2.id_equip
	JOIN r_fin_ds ds on ds.idr_equip = e1.id_equip 
WHERE
	e1.SVMAJ_EQT = 'CIRCE'
	AND e2.SVMAJ_EQT = 'CIRCE'
GROUP BY e1.id_equip
ORDER BY CMS
--> 6 lines

-- Equipment Doubloon CIRCE without DS, but with at least one with a DS: to be deleted
SELECT
	e1.id_equip, max(e1.CMS) CMS, max(e1.PN) PN, max(e1.SVMAJ_EQT) SVMAJ_EQT
INTO
	#@EQUIP1_CIRCE_TOBEDELETED
FROM
	r_equipment e1
	JOIN #@WITH_DS_CIRCE e2 ON e2.PN = e1.PN
		AND e2.CMS = e1.CMS
		AND e1.id_equip != e2.id_equip
	LEFT JOIN r_fin_ds ds ON ds.idr_equip = e1.id_equip
WHERE
	e1.SVMAJ_EQT = 'CIRCE'
	AND e2.SVMAJ_EQT = 'CIRCE'
	AND ds.id_ds IS NULL
GROUP BY e1.id_equip
ORDER BY CMS
--> 247 lines

-- Equipment Doubloon CIRCE without DS
SELECT
	e1.id_equip, max(e1.CMS) CMS, max(e1.PN) PN, max(e1.SVMAJ_EQT) SVMAJ_EQT
INTO
	#@WITHOUT_DS_CIRCE
FROM
	r_equipment e1
	JOIN r_equipment e2 ON e2.PN = e1.PN 
		AND e2.CMS = e1.CMS
		AND e1.id_equip != e2.id_equip
	LEFT JOIN #@WITH_DS_CIRCE e3 ON e3.PN = e1.PN
		AND e3.CMS = e1.CMS
WHERE
	e1.SVMAJ_EQT = 'CIRCE'
	AND e2.SVMAJ_EQT = 'CIRCE'
	AND e3.id_equip IS NULL
GROUP BY e1.id_equip
ORDER BY CMS
--> 460 lines

-- Equipment Doubloon without DS: max id
SELECT
	max(id_equip) id_equip, CMS, PN, max(SVMAJ_EQT) SVMAJ_EQT
INTO
	#@WITHOUT_DS_CIRCE_KEEP
FROM
	#@WITHOUT_DS_CIRCE
GROUP BY CMS, PN
ORDER BY CMS
--> 10 lines

-- Equipment Doubloon without DS to be deleted
SELECT
	e1.*
INTO
	#@EQUIP2_CIRCE_TOBEDELETED
FROM
	#@WITHOUT_DS_CIRCE e1
	LEFT JOIN #@WITHOUT_DS_CIRCE_KEEP e2 ON e2.id_equip = e1.id_equip
WHERE
	e2.id_equip IS NULL
-- 450 lines

-- Doubloon CIRCE
/*
SELECT
	e1.id_equip, max(e1.CMS) CMS, max(e1.PN) PN, max(e1.SVMAJ_EQT) SVMAJ
FROM
	r_equipment e1
	JOIN r_equipment e2 ON e2.PN = e1.PN 
		AND e2.CMS = e1.CMS
		AND e1.id_equip != e2.id_equip
WHERE
	e1.SVMAJ_EQT = 'CIRCE'
	AND e2.SVMAJ_EQT = 'CIRCE'
GROUP BY e1.id_equip
ORDER BY CMS
--> 713 lines
*/
/* to save deleted data
SELECT
	e1.*
FROM
	r_equipment e1
	JOIN #@EQUIP1_CIRCE_TOBEDELETED e2 ON e2.id_equip = e1.id_equip
-- 247 lines

SELECT
	e1.*
FROM
	r_equipment e1
	JOIN #@EQUIP2_CIRCE_TOBEDELETED e2 ON e2.id_equip = e1.id_equip
-- 450 lines
*/


-- Delete identified doubloon
DELETE
	r_equipment
FROM
	r_equipment e1
	JOIN #@EQUIP1_CIRCE_TOBEDELETED e2 ON e2.id_equip = e1.id_equip

DELETE
	r_equipment
FROM
	r_equipment e1
	JOIN #@EQUIP2_CIRCE_TOBEDELETED e2 ON e2.id_equip = e1.id_equip


----------------------------------------
-- FIN-SI Loader: equipment doubloons --
----------------------------------------
/*
-- Doubloon FIN-SI LOADER
SELECT
	e1.id_equip, max(e1.CMS) CMS, max(e1.PN) PN, max(e1.EQT_DATAORIGIN) Orig, max(e1.SVMAJ_EQT) SVMAJ
FROM
	r_equipment e1
	JOIN r_equipment e2 ON e2.PN = e1.PN
		AND e2.CMS = e1.CMS
		AND e2.EQT_DATAORIGIN = e1.EQT_DATAORIGIN
		AND e1.id_equip != e2.id_equip
WHERE
	e1.SVMAJ_EQT = 'FIN-SI LOADER'
	AND e2.SVMAJ_EQT = 'FIN-SI LOADER'
GROUP BY e1.id_equip
ORDER BY CMS
--> 0 line
*/
