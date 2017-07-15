 


Update R_FIN_DS Set MG='3', VALM2='Validated'  Where substring(EDDReference,1,14)='2159HWAC000032'
Update r_fin_ds set eddchecksum=dbo.ELCOCHECK((select id_ds from r_fin_ds where substring(eddreference,1,14)='2159HWAC000032')) where substring(eddreference,1,14)='2159HWAC000032'
