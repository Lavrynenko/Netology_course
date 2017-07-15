-- Script to delete 9 EDD + impacts associated
declare @id_ds integer,
        @edd_ref varchar(20),
        @id_mp integer

--BEGIN TRANSACTION WorkStart


-- T71922
set @id_mp = (select id_mp from t_mp where mpreference='M82292')

-- ==================
-- 6122KFAC000013

set @edd_ref = '6122KFAC000013'
-- ==================
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = @edd_ref)

select @id_ds id_ds,@edd_ref edd_ref,@id_mp id_mp

-- Delete impact
delete from t_impactds
where 0=0
and idr_ds_post = @id_ds
and idr_mp = @id_mp

-- Delete EDD
delete from r_fin_ds
where 0=0
and id_ds = @id_ds

select id_ds from r_fin_ds where substring(eddreference,1,14) = @edd_ref


--ROLLBACK TRANSACTION WorkStart