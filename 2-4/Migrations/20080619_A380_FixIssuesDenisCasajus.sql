-- A380 FIX Issues for Denis C

Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '4631TADC000007'
Update R_FIN_DS set NPP1 = 0 , NPP2=0, NPP3=0 where substring(eddreference,1,14) = '8925ZZAC000005'
Update R_FIN_DS set NPP1 = 0 , NPP2=0, NPP3=0 where substring(eddreference,1,14) = '2456MCAC000230'

Update R_FIN_DS set OperationalBehaviour = 'Intermittent' where substring(eddreference,1,14) = '4611TLDC000034'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '2438PBDC000032'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '2434PEDC000006'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '2435PCDC000011'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '2435PCDC000013'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '3411FPDC000046'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '4631TAAC000020'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '4671TCAC000019'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '4611TLAC000049'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '4611TLAC000046'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '4611TLAC000042'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '4671TCAC000021'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '4631TAAC000043'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '4611TLAC000044'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '2438PBDC000032'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '2425XCDC000021'
Update R_FIN_DS set VALM2 ='Validated',MG='3' where substring(eddreference,1,14) = '4411RHDC000450'
Update R_FIN_DS set VALM2 ='Validated',MG='3' where substring(eddreference,1,14) = '2438PBDC000034'
Update R_FIN_DS set NominalPower = 0, securedopen='Yes', FullProvisionStatus='Installed but Not Used' where substring(eddreference,1,14) = '4411RHDC000181'

Update R_FIN_DS set NPP1 = 0 , NPP2=0, NPP3=0 where substring(eddreference,1,14) = '2311REAC000005'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '2425XCDC000018'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '2724CYAC000061'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '2829QPDC000019'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '2829QPDC000018'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '3162WTDC000004'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '3163WKDC000008'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '3163WKDC000009'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '3471SEAC000004'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '4231THDC000046'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '4611TLAC000053'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '4611TLAC000065'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '4633TADC000004'
Update R_FIN_DS set NominalPower = 0 where substring(eddreference,1,14) = '4633TADC000006'
Update R_FIN_DS set NominalPower = 18 where substring(eddreference,1,14) = '2351RNDC000006'
Update R_FIN_DS set VALM2 ='Validated',MG='3' where substring(eddreference,1,14) = '2829QPDC000014'
Update R_FIN_DS set VALM2 ='Validated',MG='3' where substring(eddreference,1,14) = '2829QPDC000015'
Update R_FIN_DS set VALM2 ='Validated',MG='3' where substring(eddreference,1,14) = '4661TPAC000009'
Update R_FIN_DS set NominalPower = 0,PINAllocation='-10-' where substring(eddreference,1,14) = '4661TPAC000010'
Update R_FIN_DS set PINAllocation='-10-' where substring(eddreference,1,14) = '4661TPAC000004'
Update R_FIN_DS set PINAllocation='-8-',SSPCChannels='3' where substring(eddreference,1,14) = '4661TPAC000008'
Update R_FIN_DS set AllocatedPhase='C',SSPCChannels='3' where substring(eddreference,1,14) = '2126HQAC000021'
Update R_FIN_DS set AllocatedPhase='C',SSPCChannels='3' where substring(eddreference,1,14) = '2153HHAC000006'
Update R_FIN_DS set AllocatedPhase='A',SSPCChannels='3' where substring(eddreference,1,14) = '3341LAAC000009'


declare @id_ds integer

-- 4411RHDC000450
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4411RHDC000450')

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 2438PBDC000034
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2438PBDC000034')

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 2829QPDC000014
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2829QPDC000014')

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 2829QPDC000015
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2829QPDC000015')

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 4661TPAC000009
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4661TPAC000009')

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds