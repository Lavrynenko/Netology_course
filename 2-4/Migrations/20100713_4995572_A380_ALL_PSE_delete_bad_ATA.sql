-- Suppression des CR
print 'NUMBER OF CR IMPACTED BEFORE DELETE'
select id_request,RequestReference from t_request where idr_ata in (select id_ata from r_ata where atacode like ' %')
print 'NUMBER OF DELETE CR'
delete from t_request where idr_ata in (select id_ata from r_ata where atacode like ' %')
print 'NUMBER OF CR IMPACTED AFTER DELETE'
select id_request,RequestReference from t_request where idr_ata in (select id_ata from r_ata where atacode like ' %')

-- Change ATA lié aux MP
print 'NUMBER OF MP IMPACTED BEFORE CHANGE'
select * from t_mp where idr_ata in (select id_ata from r_ata where atacode like ' %')
print 'NUMBER OF MP CHANGE'
update
	T_mp
set
	T_mp.idr_ata = GARDE.id_ata
FROM
	r_ata as GARDE,
	r_ata as JETTE
where
	T_mp.idr_ata in (select id_ata from r_ata where atacode like ' %') 
	and T_mp.idr_ata = JETTE.id_ata
	and GARDE.atacode = ltrim(JETTE.atacode)
print 'NUMBER OF MP IMPACTED AFTER CHANGE'
select * from t_mp where idr_ata in (select id_ata from r_ata where atacode like ' %')

-- Change ATA lié aux PDCI
print 'NUMBER OF PDCI IMPACTED BEFORE CHANGE'
select * from T_PDCI where pdci_idr_ata in (select id_ata from r_ata where atacode like ' %')
print 'NUMBER OF PDCI IMPACTED BEFORE CHANGE BY firt ATA'
select * from t_pdci where pdci_idr_ata = 169
print 'NUMBER OF PDCI IMPACTED BEFORE CHANGE BY second ATA'
select * from t_pdci where pdci_idr_ata = 641
print 'NUMBER OF PDCI CHANGE'
update
	T_PDCI
set
	T_PDCI.pdci_idr_ata = GARDE.id_ata
FROM
	r_ata as GARDE,
	r_ata as JETTE
where
	T_PDCI.pdci_idr_ata in (select id_ata from r_ata where atacode like ' %') 
	and T_PDCI.pdci_idr_ata = JETTE.id_ata
	and GARDE.atacode = ltrim(JETTE.atacode)
print 'NUMBER OF PDCI IMPACTED AFTER CHANGE'
select * from T_PDCI where pdci_idr_ata in (select id_ata from r_ata where atacode like ' %')
print 'NUMBER OF PDCI IMPACTED AFTER CHANGE BY firt ATA'
select * from t_pdci where pdci_idr_ata = 185855
print 'NUMBER OF PDCI IMPACTED AFTER CHANGE BY second ATA'
select * from t_pdci where pdci_idr_ata = 185899	

-- Suppression des FIN CI
print 'NUMBER OF FIN CI IMPACTED BEFORE DELETE'
select id_fin,FIN from R_FIN_CI where idr_ata in (select id_ata from r_ata where atacode like ' %')
print 'NUMBER OF FIN CI DELETE'
delete from R_FIN_CI where idr_ata in (select id_ata from r_ata where atacode like ' %')
print 'NUMBER OF FIN CI IMPACTED AFTER DELETE'
select id_fin,FIN from R_FIN_CI where idr_ata in (select id_ata from r_ata where atacode like ' %')

-- Suppression des ATA
print 'NUMBER OF ATA IMPACTED BEFORE DELETE'
select * from r_ata where atacode like ' %'
print 'NUMBER OF ATA DELETE'
delete from R_ATA WHERE atacode like ' %'
print 'NUMBER OF ATA IMPACTED AFTER DELETE'
select * from r_ata where atacode like ' %'