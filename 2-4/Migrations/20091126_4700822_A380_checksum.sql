declare @id_ds integer

set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '3321LGAC000089%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '4421MKAC000034%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '3321LGAC000100%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '3321LGAC000101%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '3321LGAC000108%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '3321LGAC000112%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '3321LGAC000115%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '3324LQAC000025%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '4421MKAC000055%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '3324LQAC000027%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '4641RFAC000008%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '4641RFAC000013%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '4641RFAC000014%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '4641RFAC000015%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '3321LGAC000137%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '3321LGAC000143%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '3321LGAC000145%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '3321LGAC000146%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '4431RDAC000002%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '8925ZZDC000005%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '3347LYAC000000%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) like '3347LYAC000001%')
UPDATE R_FIN_DS SET  EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds

