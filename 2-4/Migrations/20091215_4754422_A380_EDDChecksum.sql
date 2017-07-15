Update 
	r_fin_ds 
set 
	eddchecksum=dbo.ELCOCHECK((select id_ds 
							   from r_fin_ds 
							   where eddreference like '4421MKAC000038V%')) 
where 
	eddreference like '4421MKAC000038V00%'
	
	
Update 
	r_fin_ds 
set 
	eddchecksum=dbo.ELCOCHECK((select id_ds 
							   from r_fin_ds 
							   where eddreference like '4421MKAC000039V%')) 
where 
	eddreference like '4421MKAC000039V%'
	
	
Update 
	r_fin_ds 
set 
	eddchecksum=dbo.ELCOCHECK((select id_ds 
							   from r_fin_ds 
							   where eddreference like '4421MKAC000034V%')) 
where 
	eddreference like '4421MKAC000034V%'