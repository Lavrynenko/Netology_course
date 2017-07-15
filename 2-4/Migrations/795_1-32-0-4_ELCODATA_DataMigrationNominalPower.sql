


update
	r_fin_ds
set
	NPP1=NominalPower
where
	AllocatedPhase='A'
	and NominalPower is not null


update
	r_fin_ds
set
	NPP2=NominalPower
where
	AllocatedPhase='B'
	and NominalPower is not null

update
	r_fin_ds
set
	NPP3=NominalPower
where
	AllocatedPhase='C'
	and NominalPower is not null