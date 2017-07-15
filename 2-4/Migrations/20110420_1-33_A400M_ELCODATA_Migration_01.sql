--ElocdataSD-A400M-PCD-Migration-010
update
	r_fin_ds
set
	SecuredOpen=null,
	finds_edd_type='Uninstall'
where
	ds_type=4
	and finds_edd_type='PCD'
	and FullProvisionStatus='Not Installed'
	
	
update
	r_fin_ds
set
	SecuredOpen='Calculated'
where
	ds_type=4
	and finds_edd_type='PCD'
	and (FullProvisionStatus<>'Not Installed' or FullProvisionStatus is null)
	
update
	r_fin_ds
set
	mg=0
where
	finds_edd_type='Uninstall'
	and mg<3

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
	PCDContPin='FINDS_SSPCStatPin'
where
	ds_type=4
	and TypeOfProtection='SSPC'


update
	r_fin_ds
set
	PCDContPin='PCDStatPinText'
where
	ds_type=4
	and TypeOfProtection='RCCB'



