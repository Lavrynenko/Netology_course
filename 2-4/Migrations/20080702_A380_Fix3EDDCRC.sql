-- FIX Channel error

Update R_FIN_DS set SSPCChannels='6' where substring(eddreference,1,14) = '2126HQAC000021'

Update R_FIN_DS set SSPCChannels='4' where substring(eddreference,1,14) = '3341LAAC000009'

Update R_FIN_DS set SSPCChannels='5' where substring(eddreference,1,14) = '2153HHAC000006'
declare @id_ds integer

-- 2126HQAC000021
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2126HQAC000021')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds

-- 3341LAAC000009
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '3341LAAC000009')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds

-- 2153HHAC000006
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2153HHAC000006')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds

