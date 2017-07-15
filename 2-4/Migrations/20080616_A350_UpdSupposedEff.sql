-- Update Supposed Effectivity Bruno Sanguinède
update r_fin_ds
set eddsupposedeffectivity='-101-102-103-104-105-106-107-108-109-'
where eddreference is not null
and eddsupposedeffectivity='-1-'
