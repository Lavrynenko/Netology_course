/* Written by Bruno Sanguinede */ 

declare @id_ds integer


-- Take EDD to process
-- 2452XHAC000031
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2452XHAC000031')

-- Update MG & ATAXX notifications
update r_fin_ds
set
 mg='3'
,valm1='Validated'
,valm2='Validated'
where id_ds=@id_ds 

-- Update checksum
UPDATE R_FIN_DS
SET EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE 0=0
and id_ds=@id_ds

-- Take EDD to process
-- 2792CEDC000088
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2792CEDC000088')

-- Update MG & ATAXX notifications
update r_fin_ds
set
 mg='3'
,valm1='Validated'
,valm2='Validated'
where id_ds=@id_ds 

-- Update checksum
UPDATE R_FIN_DS
SET EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE 0=0
and id_ds=@id_ds

-- Take EDD to process
-- 2734CTAC000066
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2734CTAC000066')

-- Update MG & ATAXX notifications
update r_fin_ds
set
 mg='3'
,valm1='Validated'
,valm2='Validated'
where id_ds=@id_ds 

-- Update checksum
UPDATE R_FIN_DS
SET EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE 0=0
and id_ds=@id_ds

-- Take EDD to process
-- 2734CTAC000065
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2734CTAC000065')

-- Update MG & ATAXX notifications
update r_fin_ds
set
 mg='3'
,valm1='Validated'
,valm2='Validated'
where id_ds=@id_ds 

-- Update checksum
UPDATE R_FIN_DS
SET EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE 0=0
and id_ds=@id_ds

-- Take EDD to process
-- 2724CYAC000067
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2724CYAC000067')

-- Update MG & ATAXX notifications
update r_fin_ds
set
 mg='3'
,valm1='Validated'
,valm2='Validated'
where id_ds=@id_ds 

-- Update checksum
UPDATE R_FIN_DS
SET EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE 0=0
and id_ds=@id_ds

-- Take EDD to process
-- 2724CYAC000068
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2724CYAC000068')

-- Update MG & ATAXX notifications
update r_fin_ds
set
 mg='3'
,valm1='Validated'
,valm2='Validated'
where id_ds=@id_ds 

-- Update checksum
UPDATE R_FIN_DS
SET EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE 0=0
and id_ds=@id_ds

-- Take EDD to process
-- 2714CRAC000065
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2714CRAC000065')

-- Update MG & ATAXX notifications
update r_fin_ds
set
 mg='3'
,valm1='Validated'
,valm2='Validated'
where id_ds=@id_ds 

-- Update checksum
UPDATE R_FIN_DS
SET EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE 0=0
and id_ds=@id_ds

-- Take EDD to process
-- 2714CRAC000064
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2714CRAC000064')

-- Update MG & ATAXX notifications
update r_fin_ds
set
 mg='3'
,valm1='Validated'
,valm2='Validated'
where id_ds=@id_ds 

-- Update checksum
UPDATE R_FIN_DS
SET EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE 0=0
and id_ds=@id_ds

-- Take EDD to process
-- 4411RHDC000444
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4411RHDC000444')

-- Update MG & ATAXX notifications
update r_fin_ds
set
 mg='3'
,valm1='Validated'
,valm2='Validated'
where id_ds=@id_ds 

-- Update checksum
UPDATE R_FIN_DS
SET EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE 0=0
and id_ds=@id_ds
