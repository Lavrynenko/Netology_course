-- A380 Fix AFDX Fall Back status

declare @id_ds integer,
        @id_tt_input integer

-- 4421MKAC000060V010
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4421MKAC000060')

set @id_tt_input = (select T_SSPC_VL.SSPC_VL_id from 
	R_FIN_DS
	JOIN T_TRUTH_TABLE ON T_TRUTH_TABLE.TRUTH_TABLE_R_FIN_DS_idr = R_FIN_DS.id_ds
	JOIN T_SSPC_VL ON T_SSPC_VL.SSPC_VL_TRUTH_TABLE_idr = T_TRUTH_TABLE.TRUTH_TABLE_id
	WHERE id_ds = @id_ds)

update T_SSPC_VL
set SSPC_VL_AFDXFallBackStatus = 1
where SSPC_VL_id = @id_tt_input

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 4421MKAC000061V006 

set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4421MKAC000061')

set @id_tt_input = (select T_SSPC_VL.SSPC_VL_id from 
	R_FIN_DS
	JOIN T_TRUTH_TABLE ON T_TRUTH_TABLE.TRUTH_TABLE_R_FIN_DS_idr = R_FIN_DS.id_ds
	JOIN T_SSPC_VL ON T_SSPC_VL.SSPC_VL_TRUTH_TABLE_idr = T_TRUTH_TABLE.TRUTH_TABLE_id
	WHERE id_ds = @id_ds)

update T_SSPC_VL
set SSPC_VL_AFDXFallBackStatus = 1
where SSPC_VL_id = @id_tt_input

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds


-- 4421MKAC000062V006 
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4421MKAC000062')

set @id_tt_input = (select T_SSPC_VL.SSPC_VL_id from 
	R_FIN_DS
	JOIN T_TRUTH_TABLE ON T_TRUTH_TABLE.TRUTH_TABLE_R_FIN_DS_idr = R_FIN_DS.id_ds
	JOIN T_SSPC_VL ON T_SSPC_VL.SSPC_VL_TRUTH_TABLE_idr = T_TRUTH_TABLE.TRUTH_TABLE_id
	WHERE id_ds = @id_ds)

update T_SSPC_VL
set SSPC_VL_AFDXFallBackStatus = 1
where SSPC_VL_id = @id_tt_input

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 4421MKAC000063V006
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4421MKAC000063')

set @id_tt_input = (select T_SSPC_VL.SSPC_VL_id from 
	R_FIN_DS
	JOIN T_TRUTH_TABLE ON T_TRUTH_TABLE.TRUTH_TABLE_R_FIN_DS_idr = R_FIN_DS.id_ds
	JOIN T_SSPC_VL ON T_SSPC_VL.SSPC_VL_TRUTH_TABLE_idr = T_TRUTH_TABLE.TRUTH_TABLE_id
	WHERE id_ds = @id_ds)

update T_SSPC_VL
set SSPC_VL_AFDXFallBackStatus = 1
where SSPC_VL_id = @id_tt_input

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 4421MKAC000064V006 
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4421MKAC000064')

set @id_tt_input = (select T_SSPC_VL.SSPC_VL_id from 
	R_FIN_DS
	JOIN T_TRUTH_TABLE ON T_TRUTH_TABLE.TRUTH_TABLE_R_FIN_DS_idr = R_FIN_DS.id_ds
	JOIN T_SSPC_VL ON T_SSPC_VL.SSPC_VL_TRUTH_TABLE_idr = T_TRUTH_TABLE.TRUTH_TABLE_id
	WHERE id_ds = @id_ds)

update T_SSPC_VL
set SSPC_VL_AFDXFallBackStatus = 1
where SSPC_VL_id = @id_tt_input

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 4421MKAC000065V006 
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4421MKAC000065')

set @id_tt_input = (select T_SSPC_VL.SSPC_VL_id from 
	R_FIN_DS
	JOIN T_TRUTH_TABLE ON T_TRUTH_TABLE.TRUTH_TABLE_R_FIN_DS_idr = R_FIN_DS.id_ds
	JOIN T_SSPC_VL ON T_SSPC_VL.SSPC_VL_TRUTH_TABLE_idr = T_TRUTH_TABLE.TRUTH_TABLE_id
	WHERE id_ds = @id_ds)

update T_SSPC_VL
set SSPC_VL_AFDXFallBackStatus = 1
where SSPC_VL_id = @id_tt_input

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 4421MKAC000066V006 
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4421MKAC000066')

set @id_tt_input = (select T_SSPC_VL.SSPC_VL_id from 
	R_FIN_DS
	JOIN T_TRUTH_TABLE ON T_TRUTH_TABLE.TRUTH_TABLE_R_FIN_DS_idr = R_FIN_DS.id_ds
	JOIN T_SSPC_VL ON T_SSPC_VL.SSPC_VL_TRUTH_TABLE_idr = T_TRUTH_TABLE.TRUTH_TABLE_id
	WHERE id_ds = @id_ds)

update T_SSPC_VL
set SSPC_VL_AFDXFallBackStatus = 1
where SSPC_VL_id = @id_tt_input

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 4421MKAC000067V006 
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4421MKAC000067')

set @id_tt_input = (select T_SSPC_VL.SSPC_VL_id from 
	R_FIN_DS
	JOIN T_TRUTH_TABLE ON T_TRUTH_TABLE.TRUTH_TABLE_R_FIN_DS_idr = R_FIN_DS.id_ds
	JOIN T_SSPC_VL ON T_SSPC_VL.SSPC_VL_TRUTH_TABLE_idr = T_TRUTH_TABLE.TRUTH_TABLE_id
	WHERE id_ds = @id_ds)

update T_SSPC_VL
set SSPC_VL_AFDXFallBackStatus = 1
where SSPC_VL_id = @id_tt_input

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 4421MKAC000068V006 
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4421MKAC000068')

set @id_tt_input = (select T_SSPC_VL.SSPC_VL_id from 
	R_FIN_DS
	JOIN T_TRUTH_TABLE ON T_TRUTH_TABLE.TRUTH_TABLE_R_FIN_DS_idr = R_FIN_DS.id_ds
	JOIN T_SSPC_VL ON T_SSPC_VL.SSPC_VL_TRUTH_TABLE_idr = T_TRUTH_TABLE.TRUTH_TABLE_id
	WHERE id_ds = @id_ds)

update T_SSPC_VL
set SSPC_VL_AFDXFallBackStatus = 1
where SSPC_VL_id = @id_tt_input

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 4421MKAC000069V006 
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4421MKAC000069')

set @id_tt_input = (select T_SSPC_VL.SSPC_VL_id from 
	R_FIN_DS
	JOIN T_TRUTH_TABLE ON T_TRUTH_TABLE.TRUTH_TABLE_R_FIN_DS_idr = R_FIN_DS.id_ds
	JOIN T_SSPC_VL ON T_SSPC_VL.SSPC_VL_TRUTH_TABLE_idr = T_TRUTH_TABLE.TRUTH_TABLE_id
	WHERE id_ds = @id_ds)

update T_SSPC_VL
set SSPC_VL_AFDXFallBackStatus = 1
where SSPC_VL_id = @id_tt_input

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 4421MKAC000070V006 
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4421MKAC000070')

set @id_tt_input = (select T_SSPC_VL.SSPC_VL_id from 
	R_FIN_DS
	JOIN T_TRUTH_TABLE ON T_TRUTH_TABLE.TRUTH_TABLE_R_FIN_DS_idr = R_FIN_DS.id_ds
	JOIN T_SSPC_VL ON T_SSPC_VL.SSPC_VL_TRUTH_TABLE_idr = T_TRUTH_TABLE.TRUTH_TABLE_id
	WHERE id_ds = @id_ds)

update T_SSPC_VL
set SSPC_VL_AFDXFallBackStatus = 1
where SSPC_VL_id = @id_tt_input

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds


