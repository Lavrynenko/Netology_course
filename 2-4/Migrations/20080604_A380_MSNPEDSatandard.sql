-- Update MSN_SEPDS_PED_Standard

UPDATE T_MSN SET MSN_SEPDS_PED_Standard = 'STD6.4.1'

UPDATE 
	T_MSN
SET
	MSN_SEPDS_PED_Standard='STD6.4.1'
FROM
	T_MSN
	INNER JOIN T_LINK_MSN_POWERCENTER ON id_msn=idr_msn
	INNER JOIN T_POWERCENTER on id_powercenter=idr_powercenter
WHERE 
	Powercenter like 'SPDB_'
	--and column1 is null
	and T_MSN.MSN < 11

UPDATE 
	T_MSN
SET
	MSN_SEPDS_PED_Standard='STD8.0'
FROM
	T_MSN
	INNER JOIN T_LINK_MSN_POWERCENTER ON id_msn=idr_msn
	INNER JOIN T_POWERCENTER on id_powercenter=idr_powercenter
WHERE 
	Powercenter like 'SPDB_'
	--and column1 is null
	and T_MSN.MSN >= 11


UPDATE 
	T_MSN
SET
	MSN_SEPDS_PED_Standard='STD6.4.1'
WHERE 
	MSN IN (1, 2, 4, 7 , 9,3, 5, 6, 8,10, 12, 19, 21, 34, 45, 51, 58)
