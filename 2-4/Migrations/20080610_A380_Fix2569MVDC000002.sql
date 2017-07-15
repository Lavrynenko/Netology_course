/* Bruno Sanguinede*/ 
declare @id_ds integer

-- 2569MVDC000002
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2569MVDC000002')

select @id_ds

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

