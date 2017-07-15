-- FIN 498RH Remove loop 4411RHDC000193 -- T62514 --> 4411RHDC000193

declare 
 @id_mp integer,
 @id_edd integer

set @id_mp = (select id_mp from t_mp where mpreference='T62514')
set @id_edd = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4411RHDC000193')

select @id_mp as mp, @id_edd as id_edd

select *
from t_impactds
where 0=0
and idr_ds_post = @id_edd
and idr_ds_pre = @id_edd
and idr_mp = @id_mp

delete from t_impactds
where 0=0
and idr_ds_post = @id_edd
and idr_ds_pre = @id_edd
and idr_mp = @id_mp

select *
from t_impactds
where 0=0
and idr_ds_post = @id_edd
and idr_ds_pre = @id_edd
and idr_mp = @id_mp
