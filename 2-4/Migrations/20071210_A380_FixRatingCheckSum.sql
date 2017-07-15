declare @id_ds integer

-- EDD
set @id_ds = (select id_ds from r_fin_ds where eddreference = '2734CTAC000055V000')
select EDDcheckSum,@id_ds from r_fin_ds where id_ds = @id_ds

UPDATE R_FIN_DS 
SET EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

select EDDcheckSum,@id_ds from r_fin_ds where id_ds = @id_ds

--EDD
set @id_ds = (select id_ds from r_fin_ds where eddreference = '2734CTAC000054V000')
select EDDcheckSum,@id_ds from r_fin_ds where id_ds = @id_ds

UPDATE R_FIN_DS 
SET EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

select EDDcheckSum,@id_ds from r_fin_ds where id_ds = @id_ds

--EDD
set @id_ds = (select id_ds from r_fin_ds where eddreference = '2724CYAC000049V000')
select EDDcheckSum,@id_ds from r_fin_ds where id_ds = @id_ds

UPDATE R_FIN_DS 
SET EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

select EDDcheckSum,@id_ds from r_fin_ds where id_ds = @id_ds

--EDD
set @id_ds = (select id_ds from r_fin_ds where eddreference = '2714CRAC000055V000')
select EDDcheckSum,@id_ds from r_fin_ds where id_ds = @id_ds

UPDATE R_FIN_DS 
SET EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

select EDDcheckSum,@id_ds from r_fin_ds where id_ds = @id_ds

--EDD
set @id_ds = (select id_ds from r_fin_ds where eddreference = '2724CYAC000048V000')
select EDDcheckSum,@id_ds from r_fin_ds where id_ds = @id_ds

UPDATE R_FIN_DS 
SET EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

select EDDcheckSum,@id_ds from r_fin_ds where id_ds = @id_ds

--EDD
set @id_ds = (select id_ds from r_fin_ds where eddreference = '2714CRAC000054V000')
select EDDcheckSum,@id_ds from r_fin_ds where id_ds = @id_ds

UPDATE R_FIN_DS 
SET EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

select EDDcheckSum,@id_ds from r_fin_ds where id_ds = @id_ds

--EDD
set @id_ds = (select id_ds from r_fin_ds where eddreference = '2432PUDC000090V003')
select EDDcheckSum,@id_ds,rating from r_fin_ds where id_ds = @id_ds

UPDATE R_FIN_DS 
SET rating = 3
WHERE id_ds = @id_ds

UPDATE R_FIN_DS 
SET EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

select EDDcheckSum,@id_ds from r_fin_ds where id_ds = @id_ds

--EDD
set @id_ds = (select id_ds from r_fin_ds where eddreference = '2432PUDC000091V003')
select EDDcheckSum,@id_ds,rating from r_fin_ds where id_ds = @id_ds

UPDATE R_FIN_DS 
SET rating = 5
WHERE id_ds = @id_ds

UPDATE R_FIN_DS 
SET EDDCheckSum = dbo.ELCOCHECK(@id_ds)
WHERE id_ds = @id_ds

select EDDcheckSum,@id_ds from r_fin_ds where id_ds = @id_ds