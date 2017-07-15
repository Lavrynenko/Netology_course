-- A380 Force Custo for MSN 43

declare @id_msn integer,
        @id_sepdc1 integer,
        @id_sepdc2 integer

-- Id SEPDC1
set @id_sepdc1 = (select id_powercenter from t_powercenter where powercenter='SEPDC1')

-- Id SEPDC2
set @id_sepdc2 = (select id_powercenter from t_powercenter where powercenter='SEPDC2')

-- MSN 43
set @id_msn = (select id_msn from t_msn where msn='43')

update t_link_msn_powercenter
set
 custoLaunch='Yes'
,MP='T77655'
where 0=0
and idr_msn = @id_msn
and idr_powercenter = @id_sepdc1

update t_link_msn_powercenter
set
 custoLaunch='Yes'
,MP='T77655'
where 0=0
and idr_msn = @id_msn
and idr_powercenter = @id_sepdc2
