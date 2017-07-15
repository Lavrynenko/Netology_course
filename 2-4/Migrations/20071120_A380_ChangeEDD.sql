-- FIN 484RH Change for EDD 4411RHDC000288V000 MP in pre MOD
-- Old MP is T60812
-- New MP is T64946

declare 
 @id_mp_old integer,
 @id_mp_new integer,
 @id_edd integer


set @id_mp_old = (select id_mp from t_mp where mpreference='T60812')
set @id_mp_new = (select id_mp from t_mp where mpreference='T64946')
set @id_edd = (select id_ds from r_fin_ds where eddreference='4411RHDC000288V000')

select @id_mp_old as old_mp, @id_mp_new as new_mp, @id_edd as id_edd

select idr_mp mp_before
from t_impactds
where idr_ds_post = @id_edd

update t_impactds
set idr_mp = @id_mp_new
where 0=0
and idr_ds_post = @id_edd

select idr_mp mp_after
from t_impactds
where idr_ds_post = @id_edd
