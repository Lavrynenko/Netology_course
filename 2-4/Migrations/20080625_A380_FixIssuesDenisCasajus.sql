declare @id_ds integer

-- 2153HHAC000006
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2153HHAC000006')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 2351RNDC000006
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2351RNDC000006')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 2126HQAC000021
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2126HQAC000021')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 3162WTDC000004
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '3162WTDC000004')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 2829QPDC000019
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2829QPDC000019')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 2829QPDC000018
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2829QPDC000018')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 2311REAC000005
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2311REAC000005')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 2425XCDC000018
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2425XCDC000018')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 4671TCAC000021
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4671TCAC000021')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 4611TLAC000049
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4611TLAC000049')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 4611TLAC000046
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4611TLAC000046')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 3411FPDC000046
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '3411FPDC000046')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 4611TLAC000042
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4611TLAC000042')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 2435PCDC000011
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2435PCDC000011')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 4671TCAC000019
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4671TCAC000019')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 2435PCDC000013
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2435PCDC000013')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 2434PEDC000006
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2434PEDC000006')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 4631TAAC000020
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4631TAAC000020')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 4611TLAC000044
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4611TLAC000044')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 4611TLDC000034
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4611TLDC000034')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 4611TLAC000053
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4611TLAC000053')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 4411RHDC000181
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4411RHDC000181')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 4631TADC000007
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4631TADC000007')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 4633TADC000004
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4633TADC000004')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 4633TADC000006
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4633TADC000006')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 3471SEAC000004
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '3471SEAC000004')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 4661TPAC000004
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4661TPAC000004')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 3163WKDC000008
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '3163WKDC000008')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 3163WKDC000009
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '3163WKDC000009')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 2425XCDC000021
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2425XCDC000021')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 8925ZZAC000005
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '8925ZZAC000005')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 2456MCAC000230
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2456MCAC000230')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 4611TLAC000065
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4611TLAC000065')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 2724CYAC000061
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2724CYAC000061')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 3341LAAC000009
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '3341LAAC000009')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 4661TPAC000008
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4661TPAC000008')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 4661TPAC000010
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4661TPAC000010')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 4231THDC000046
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4231THDC000046')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 4631TAAC000043
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4631TAAC000043')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
-- 2438PBDC000032
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2438PBDC000032')
UPDATE R_FIN_DS SET EDDCheckSum = dbo.ELCOCHECK(@id_ds) WHERE id_ds = @id_ds
