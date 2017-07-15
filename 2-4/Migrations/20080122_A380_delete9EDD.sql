-- Script to delete 9 EDD + impacts associated
declare @id_ds integer,
        @edd_ref varchar(20),
        @id_mp integer

--BEGIN TRANSACTION WorkStart


-- T66091
set @id_mp = (select id_mp from t_mp where mpreference='T66091')

-- ==================
-- 2567MFAC000038V000
set @edd_ref = '2567MFAC000038V000'
-- ==================
set @id_ds = (select id_ds from r_fin_ds where eddreference = @edd_ref)

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

-- ==================
-- 2567MFAC000007V000
set @edd_ref = '2567MFAC000007V000'
-- ==================
set @id_ds = (select id_ds from r_fin_ds where eddreference = @edd_ref)

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

-- ==================
-- 2567MFAC000035V000
set @edd_ref = '2567MFAC000035V000'
-- ==================
set @id_ds = (select id_ds from r_fin_ds where eddreference = @edd_ref)

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

-- ==================
-- 2567MFAC000036V000
set @edd_ref = '2567MFAC000036V000'
-- ==================
set @id_ds = (select id_ds from r_fin_ds where eddreference = @edd_ref)

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

-- ==================
-- 2567MFDC000034V000
set @edd_ref = '2567MFDC000034V000'
-- ==================
set @id_ds = (select id_ds from r_fin_ds where eddreference = @edd_ref)

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

-- ==================
-- 2567MFDC000037V000
set @edd_ref = '2567MFDC000037V000'
-- ==================
set @id_ds = (select id_ds from r_fin_ds where eddreference = @edd_ref)

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

-- ==================
-- 2567MFDC000008V000
set @edd_ref = '2567MFDC000008V000'
-- ==================
set @id_ds = (select id_ds from r_fin_ds where eddreference = @edd_ref)

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

-- ==================
-- 2567MFDC000032V000
set @edd_ref = '2567MFDC000032V000'
-- ==================
set @id_ds = (select id_ds from r_fin_ds where eddreference = @edd_ref)

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

-- ==================
-- 2567MFDC000033V000
set @edd_ref = '2567MFDC000033V000'
-- ==================
set @id_ds = (select id_ds from r_fin_ds where eddreference = @edd_ref)

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

--ROLLBACK TRANSACTION WorkStart