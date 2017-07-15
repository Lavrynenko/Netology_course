EXEC sp_UpdateMGCheckSum

Update 
	r_fin_ds 
set 
	eddchecksum=dbo.ELCOCHECK((select id_ds 
							   from r_fin_ds 
							   where eddreference like '3341LAAC000005V%')) 
where 
	eddreference like '3341LAAC000005V%'
	
Update 
	r_fin_ds 
set 
	eddchecksum=dbo.ELCOCHECK((select id_ds 
							   from r_fin_ds 
							   where eddreference like '3341LAAC000006V%')) 
where 
	eddreference like '3341LAAC000006V%'
	
Update 
	r_fin_ds 
set 
	eddchecksum=dbo.ELCOCHECK((select id_ds 
							   from r_fin_ds 
							   where eddreference like '3341LAAC000007V%')) 
where 
	eddreference like '3341LAAC000007V%'
	
Update 
	r_fin_ds 
set 
	eddchecksum=dbo.ELCOCHECK((select id_ds 
							   from r_fin_ds 
							   where eddreference like '3341LAAC000008V%')) 
where 
	eddreference like '3341LAAC000008V%'
	
Update 
	r_fin_ds 
set 
	eddchecksum=dbo.ELCOCHECK((select id_ds 
							   from r_fin_ds 
							   where eddreference like '3341LAAC000009V%')) 
where 
	eddreference like '3341LAAC000009V%'
	
Update 
	r_fin_ds 
set 
	eddchecksum=dbo.ELCOCHECK((select id_ds 
							   from r_fin_ds 
							   where eddreference like '3341LAAC000010V%')) 
where 
	eddreference like '3341LAAC000010V%'
	
Update 
	r_fin_ds 
set 
	eddchecksum=dbo.ELCOCHECK((select id_ds 
							   from r_fin_ds 
							   where eddreference like '4421MKDC000152V%')) 
where 
	eddreference like '4421MKDC000152V%'
	
Update 
	r_fin_ds 
set 
	eddchecksum=dbo.ELCOCHECK((select id_ds 
							   from r_fin_ds 
							   where eddreference like '2529MEAC000044V%')) 
where 
	eddreference like '2529MEAC000044V%'



  
 
  
  
 
 
 
 
