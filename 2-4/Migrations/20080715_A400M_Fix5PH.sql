declare @id_ds integer

-- 2462PHDC000022V000
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2462PHDC000022')

select distinct
 eddreference
,fullprovisionstatus
from
 r_fin_ds
where 0=0
and id_ds = @id_ds

update r_fin_ds
set fullprovisionstatus='Not installed'
where 0=0
and id_ds = @id_ds

select distinct
 eddreference
,fullprovisionstatus
from
 r_fin_ds
where 0=0
and id_ds = @id_ds