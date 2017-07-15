-- A380 Fix Issues for Denis

declare @id_ds integer

-- 4411RHDC000451
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4411RHDC000451')

update R_FIN_DS 
set 
 MG ='2'
where id_ds = @id_ds

-- 3422FCDC000005
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '3422FCDC000005')

update R_FIN_DS 
set 
 NominalPower = 30
where id_ds = @id_ds

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 3422FCDC000006
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '3422FCDC000006')

update R_FIN_DS 
set 
 NominalPower = 30
where id_ds = @id_ds

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 3411FPDC000044
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '3411FPDC000044')

update R_FIN_DS 
set 
 NominalPower = 50
,OperationalBehaviour='Intermittent'
where id_ds = @id_ds

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 3411FPDC000034
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '3411FPDC000034')

update R_FIN_DS 
set 
 NominalPower = 50
,OperationalBehaviour='Intermittent'
where id_ds = @id_ds

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 3411FPDC000047
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '3411FPDC000047')

update R_FIN_DS 
set 
 NominalPower = 50
,OperationalBehaviour='Intermittent'
where id_ds = @id_ds

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 3411FPDC000033
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '3411FPDC000033')

update R_FIN_DS 
set 
 NominalPower = 50
,OperationalBehaviour='Intermittent'
where id_ds = @id_ds

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 2792CEDC000075
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2792CEDC000075')

update R_FIN_DS 
set 
 NominalPower = 5
where id_ds = @id_ds

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 2351RNDC000004
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2351RNDC000004')

update R_FIN_DS 
set 
 NominalPower = 26.99
where id_ds = @id_ds

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 2351RNDC000007
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2351RNDC000007')

update R_FIN_DS 
set 
 NominalPower = 8.99
where id_ds = @id_ds

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 2351RNDC000008
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2351RNDC000008')

update R_FIN_DS 
set 
 NominalPower = 8.99
where id_ds = @id_ds

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 4661TPAC000010
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4661TPAC000010')

update R_FIN_DS 
set 
 SecuredOpen ='No'
where id_ds = @id_ds

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 3442SAAC000002
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '3442SAAC000002')

update R_FIN_DS 
set 
 NominalPower = 29
,PowerFactor = 0.56
where id_ds = @id_ds

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 3442SAAC000001
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '3442SAAC000001')

update R_FIN_DS 
set 
 NominalPower = 29
,PowerFactor = 0.56
where id_ds = @id_ds

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 3442SAAC000000
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '3442SAAC000000')

update R_FIN_DS 
set  
 NominalPower = 29
,PowerFactor = 0.56
where id_ds = @id_ds

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 3411FPDC000064
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '3411FPDC000064')

update R_FIN_DS 
set 
 OperationalBehaviour='Intermittent'
where id_ds = @id_ds

UPDATE R_FIN_DS 
SET 
 EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

-- 2123HUAC000011
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '2123HUAC000011')

delete from r_fin_ds where id_ds = @id_ds

-- 4411RHDC000452
set @id_ds = (select id_ds from r_fin_ds where substring(eddreference,1,14) = '4411RHDC000452')

delete from r_fin_ds where id_ds = @id_ds