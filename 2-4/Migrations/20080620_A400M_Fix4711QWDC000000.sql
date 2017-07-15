declare @id_ds integer

-- 4711QWDC000000 -> 4711QIDC000000
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4711QWDC000000')

select fin_ds_sv,eddreference
from r_fin_ds
where 0=0
and fin_ds_sv like 'M%800QI%'

UPDATE R_FIN_DS 
SET 
 eddreference = '4711QIDC000000V001'
WHERE id_ds = @id_ds

select fin_ds_sv,eddreference
from r_fin_ds
where 0=0
and fin_ds_sv like 'M%800QI%'
