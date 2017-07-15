-----------------------------------------------------------------------------------------------------------------------
------------------------ Delete EDDREFERNCE 3119VMDC000030 from A350  -------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
DECLARE @idds int

SELECT top 1 @idds=id_ds FROM R_FIN_DS WHERE  substring(EDDReference,1,14)='3119VMDC000030' order by id_ds desc 

DELETE FROM R_FIN_DS WHERE id_ds = @idds

DELETE FROM T_IMPACTDS WHERE idr_ds_pre = @idds  OR idr_ds_post= @idds