
UPDATE
	Infobase
SET
	mandatory = 0
WHERE
	object_value = 'UProcMP'
	AND table_name = 'T_MP'

-- update PDT Leader choice list
UPDATE
	Infobase
SET
	list_val = 'OAD;SYS;WNG;FWD;AFT;NOF;DOR;CEF;CCC;RFE;FAL;FTI'
WHERE
	object_value = 'ACMTLeaderMP'
	AND table_name = 'T_MP'
UPDATE
	Infobase
SET
	list_val = 'OAD;SYS;WNG;FWD;AFT;NOF;DOR;CEF;CCC;RFE;FAL;FTI'
WHERE
	object_value = 'ModACMTLeader'
	AND table_name = 'T_MOD'
UPDATE
	Infobase
SET
	list_val = 'OAD;SYS;WNG;FWD;AFT;NOF;DOR;CEF;CCC;RFE;FAL;FTI'
WHERE
	object_value = 'cr_ACMTLeaderCR'
	AND table_name = 'V_CR'
UPDATE
	Infobase
SET
	list_val = 'OAD;SYS;WNG;FWD;AFT;NOF;DOR;CEF;CCC;RFE;FAL;FTI'
WHERE
	object_value = 'rfc_ACMTLeaderCR'
	AND table_name = 'V_RFC'