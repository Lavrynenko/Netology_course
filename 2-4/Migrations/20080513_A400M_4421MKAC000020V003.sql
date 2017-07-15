/* Written by Bruno Sanguinede */
declare @id_ds integer

-- Take EDD to process
-- 4421MKAC000020V003
set @id_ds = (select id_ds from r_fin_ds where eddreference = '4421MKAC000020V003')

-- Display existing data
select eddreference,group_,EDDCheckSum
from r_fin_ds
where 0=0
and id_ds=@id_ds 

-- Change ELMF group to 42
update r_fin_ds
set group_='42'
where 0=0
and id_ds=@id_ds 

-- Display new data
select eddreference,group_,EDDCheckSum
from r_fin_ds
where 0=0
and id_ds=@id_ds 

-- Update checksum
UPDATE R_FIN_DS
SET EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE 0=0
and id_ds=@id_ds

-- Display new data
select eddreference,group_,EDDCheckSum
from r_fin_ds
where 0=0
and id_ds=@id_ds
