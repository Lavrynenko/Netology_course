
--ElocdataSD-A400M-PCD-Migration-015
update
	r_fin_ds
set
	PCDStatCon=FINDS_SSPCCTLCON
where
	ds_type=4
	and TypeOfProtection='SSPC'


update
	r_fin_ds
set
	PCDStatCon=PCDCont1ConText
where
	ds_type=4
	and TypeOfProtection='RCCB'

--ElocdataSD-A400M-PCD-Migration-020
update
	r_fin_ds
set
	PCDStatPin=FINDS_SSPCCTLPIN
where
	ds_type=4
	and TypeOfProtection='SSPC'


update
	r_fin_ds
set
	PCDStatPin=PCDCont1PinText
where
	ds_type=4
	and TypeOfProtection='RCCB'

--ElocdataSD-A400M-PCD-Migration-025
update
	r_fin_ds
set
	PCDContCon=FINDS_SSPCStatCon
where
	ds_type=4
	and TypeOfProtection='SSPC'


update
	r_fin_ds
set
	PCDContCon=PCDStatConText
where
	ds_type=4
	and TypeOfProtection='RCCB'


--ElocdataSD-A400M-PCD-Migration-030
update
	r_fin_ds
set
	PCDContPin=FINDS_SSPCStatPin
where
	ds_type=4
	and TypeOfProtection='SSPC'


update
	r_fin_ds
set
	PCDContPin=PCDStatPinText
where
	ds_type=4
	and TypeOfProtection='RCCB'

