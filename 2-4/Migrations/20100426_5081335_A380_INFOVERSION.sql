
delete from t_infoversion
insert into
	t_infoversion (
		product,
		startdate,
		version
		
		
	)
select 'SV','01/10/2009','PDMLink A380 4.2'     
union select 'PDMLink','01/10/2009','4.2'
union select 'PSE','22/01/2010','1.30'     
union select 'ELCODATA','22/01/2010','3.0'         
union select 'Stored Procedure','22/01/2010','4.2'        
union select 'ELCOFI','01/06/2009','4.1.2'  
	