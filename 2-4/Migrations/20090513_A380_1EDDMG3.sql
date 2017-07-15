Update R_FIN_DS Set MG='3'  Where substring(EDDReference,1,14)='3321LGAC000163' 
Update r_fin_ds set eddchecksum=dbo.ELCOCHECK((select id_ds from r_fin_ds where substring(eddreference,1,14)='3321LGAC000163')) where substring(eddreference,1,14)='3321LGAC000163'

