declare @id_ds integer

-- 4411RHDC000451
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4411RHDC000451')

Update R_FIN_DS 
set VALM2 ='Validated',MG='3' 
where id_ds = @id_ds

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

