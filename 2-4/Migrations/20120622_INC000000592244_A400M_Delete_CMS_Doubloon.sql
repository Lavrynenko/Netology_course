delete
from r_equipment 
where CMS = '6M00291350' 
and SVMAJ_Eqt = 'PSEQ'
and id_equip not in(select id_equip
					from r_fin_ds
					join R_equipment on idr_equip = id_equip
					where CMS = '6M00291350' and SVMAJ_Eqt = 'PSEQ')