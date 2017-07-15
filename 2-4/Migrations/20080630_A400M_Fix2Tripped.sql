/*
select distinct
 FINDS_AFDXTrippedStatus
from 
 r_fin_ds
where 0=0
and FINDS_AFDXTrippedStatus is not null
*/

update r_fin_ds
set 
 FINDS_AFDXTrippedStatus=replace(FINDS_AFDXTrippedStatus,'I2TR','I2TTR')
where 0=0
and FINDS_AFDXTrippedStatus is not null
and isnull(FINDS_AFDXTrippedStatus,'ZZ') like '%I2TR%'