declare 
 @id_ata integer

set @id_ata = (select id_ata from r_ata where atacode='4411')

select @id_ata as new_id_ata

select FIN,idr_ata
from r_fin_ci
where 0=0
and idr_ata is null
and fin in ('445RH','446RH','447RH','486RH','487RH'
           ,'488RH','490RH','493RH','494RH','497RH')

update R_FIN_CI
set idr_ata = @id_ata
where 0=0
and idr_ata is null
and fin in ('445RH','446RH','447RH','486RH','487RH'
           ,'488RH','490RH','493RH','494RH','497RH')

select FIN,idr_ata
from r_fin_ci
where 0=0
and fin in ('445RH','446RH','447RH','486RH','487RH'
           ,'488RH','490RH','493RH','494RH','497RH')