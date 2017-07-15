-- update Infobase
-- OBS Leader	T_DELTA0_FOLLOWUP
UPDATE
	Infobase
SET
	list_val = 'SELECT coe_cmit_label FROM T_COE_CMIT WHERE coe_cmit_notused = 0 order by 1'
WHERE
	object_value = 'OBSLeader'
	AND table_name = 'T_DELTA0_FOLLOWUP'

-- MOD ACMT Leader	T_MOD
UPDATE
	Infobase
SET
	list_val = 'SELECT coe_cmit_label FROM T_COE_CMIT WHERE coe_cmit_notused = 0 order by 1'
WHERE
	object_value = 'ModACMTLeader'
	AND table_name = 'T_MOD'

-- ACMT Leader	T_MP
UPDATE
	Infobase
SET
	list_val = 'SELECT coe_cmit_label FROM T_COE_CMIT WHERE coe_cmit_notused = 0 order by 1'
WHERE
	object_value = 'ACMTLeaderMP'
	AND table_name = 'T_MP'

-- ACMT Leader	V_CR
UPDATE
	Infobase
SET
	list_val = 'SELECT coe_cmit_label FROM T_COE_CMIT WHERE coe_cmit_notused = 0 order by 1'
WHERE
	object_value = 'cr_ACMTLeaderCR'
	AND table_name = 'V_CR'

-- CR Originator ACMT	V_CR
UPDATE
	Infobase
SET
	list_val = 'SELECT coe_cmit_label FROM T_COE_CMIT WHERE coe_cmit_notused = 0 order by 1'
WHERE
	object_value = 'cr_OriginatorACMT'
	AND table_name = 'V_CR'

-- ACMT Leader	V_RFC
UPDATE
	Infobase
SET
	list_val = 'SELECT coe_cmit_label FROM T_COE_CMIT WHERE coe_cmit_notused = 0 order by 1'
WHERE
	object_value = 'rfc_ACMTLeaderCR'
	AND table_name = 'V_RFC'
	
