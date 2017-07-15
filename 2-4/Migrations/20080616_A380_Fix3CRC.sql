/*Bruno Sanguinede*/ 
declare @id_ds integer

select 
 eddreference
,EDDCheckSum
,dbo.ELCOCHECK(id_ds) NewCheckSUM
from
 r_fin_ds
where 0=0
and substring(eddreference,1,14) in ('3347LYAC000001','2325TTAC000000','4421MKAC000027')
and EDDCheckSum != dbo.ELCOCHECK(id_ds)
and mg=3

-- 3347LYAC000001
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '3347LYAC000001')

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 2325TTAC000000
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2325TTAC000000')

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 4421MKAC000027
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4421MKAC000027')

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

select 
 eddreference
,EDDCheckSum
,dbo.ELCOCHECK(id_ds) NewCheckSUM
from
 r_fin_ds
where 0=0
and substring(eddreference,1,14) in ('3347LYAC000001','2325TTAC000000','4421MKAC000027')
and EDDCheckSum != dbo.ELCOCHECK(id_ds)
and mg=3
