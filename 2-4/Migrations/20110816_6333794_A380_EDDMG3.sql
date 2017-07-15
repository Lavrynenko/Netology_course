

--2172HXAC000008V002	
Update R_FIN_DS Set MG='3'  Where substring(EDDReference,1,14)='2172HXAC000008' 
Update r_fin_ds set eddchecksum=dbo.ELCOCHECK((select id_ds from r_fin_ds where substring(eddreference,1,14)='2172HXAC000008')) where substring(eddreference,1,14)='2172HXAC000008'


--3321LGAC000456V003
Update R_FIN_DS Set MG='3'  Where substring(EDDReference,1,14)='3321LGAC000456' 
Update r_fin_ds set eddchecksum=dbo.ELCOCHECK((select id_ds from r_fin_ds where substring(eddreference,1,14)='3321LGAC000456')) where substring(eddreference,1,14)='3321LGAC000456'


--3321LGAC000456
Update R_FIN_DS Set MG='3'  Where substring(EDDReference,1,14)='3321LGAC000456' 
Update r_fin_ds set eddchecksum=dbo.ELCOCHECK((select id_ds from r_fin_ds where substring(eddreference,1,14)='3321LGAC000456')) where substring(eddreference,1,14)='3321LGAC000456'

--3321LGAC000311
Update R_FIN_DS Set MG='3'  Where substring(EDDReference,1,14)='3321LGAC000311' 
Update r_fin_ds set eddchecksum=dbo.ELCOCHECK((select id_ds from r_fin_ds where substring(eddreference,1,14)='3321LGAC000311')) where substring(eddreference,1,14)='3321LGAC000311'

--3325LWAC000037
Update R_FIN_DS Set MG='3'  Where substring(EDDReference,1,14)='3325LWAC000037' 
Update r_fin_ds set eddchecksum=dbo.ELCOCHECK((select id_ds from r_fin_ds where substring(eddreference,1,14)='3325LWAC000037')) where substring(eddreference,1,14)='3325LWAC000037'

--3325LWAC000038
Update R_FIN_DS Set MG='3'  Where substring(EDDReference,1,14)='3325LWAC000038' 
Update r_fin_ds set eddchecksum=dbo.ELCOCHECK((select id_ds from r_fin_ds where substring(eddreference,1,14)='3325LWAC000038')) where substring(eddreference,1,14)='3325LWAC000038'

--4411RHDC000540
Update R_FIN_DS Set MG='3'  Where substring(EDDReference,1,14)='4411RHDC000540' 
Update r_fin_ds set eddchecksum=dbo.ELCOCHECK((select id_ds from r_fin_ds where substring(eddreference,1,14)='4411RHDC000540')) where substring(eddreference,1,14)='4411RHDC000540'

