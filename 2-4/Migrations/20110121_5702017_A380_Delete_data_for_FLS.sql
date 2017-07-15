select 
FIN,	
FinCiFLSClassification,
	FinCiSWType,
	MilitaryClassification,
	FinCiSWGroup,
	FinCiUploadingMean,
	FinCiMultiInstallation
from r_fin_ci where fin in (
'15mk',
'16mk',
'17mk',
'18mK',
'19MK'
)

update
	r_fin_ci
set
	FinCiFLSClassification = null,
	FinCiSWType = null,
	MilitaryClassification = null,
	FinCiSWGroup = null,
	FinCiUploadingMean = null,
	FinCiMultiInstallation = null
where fin in (
'15mk',
'16mk',
'17mk',
'18mK',
'19MK'
)

select 
FIN,	
FinCiFLSClassification,
	FinCiSWType,
	MilitaryClassification,
	FinCiSWGroup,
	FinCiUploadingMean,
	FinCiMultiInstallation
from r_fin_ci where fin in (
'15mk',
'16mk',
'17mk',
'18mK',
'19MK'
)