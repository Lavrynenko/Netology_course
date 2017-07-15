update
	t_pdci
set
	pdci_idr_ata=id_ata
from
	r_ata
where
	atacode='7836'
	and pdci_reference like 'egl%'


update
	t_pdci
set
	pdci_idr_ata=id_ata
from
	r_ata
where
	atacode='2426'
	and pdci_reference='XAL24226601'