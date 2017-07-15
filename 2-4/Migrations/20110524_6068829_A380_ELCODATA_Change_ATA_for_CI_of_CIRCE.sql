update
	r_fin_ci
set
	idr_ata = (select id_ata from r_ata where atacode = '2422')
where
	FIN = '7XU3' OR FIN = '7XU4'