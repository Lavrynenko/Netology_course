
UPDATE T_LINK_MSN_POWERCENTER 
SET Column1 = RIGHT(PowerCenter,1) + '1MW'
FROM
	T_LINK_MSN_POWERCENTER
	INNER JOIN T_MSN on idr_MSN=id_MSN
	INNER JOIN T_PowerCenter on id_PowerCenter=idr_PowerCenter
WHERE
	MSN_SEPDS_PED_Standard = 'STD8.0'
	AND PowerCenter LIKE 'SPDB%'
	AND (Column1='Active' OR ISNULL(Column1,'')='')


UPDATE T_LINK_MSN_POWERCENTER 
SET Column2 = RIGHT(PowerCenter,1) + '2MW'
FROM
	T_LINK_MSN_POWERCENTER
	INNER JOIN T_MSN on idr_MSN=id_MSN
	INNER JOIN T_PowerCenter on id_PowerCenter=idr_PowerCenter
WHERE
	MSN_SEPDS_PED_Standard = 'STD8.0'
	AND PowerCenter LIKE 'SPDB%'
	AND (Column2='Active' OR ISNULL(Column2,'')='')
	

UPDATE T_LINK_MSN_POWERCENTER 
SET Column3 = RIGHT(PowerCenter,1) + '3MW'
FROM
	T_LINK_MSN_POWERCENTER
	INNER JOIN T_MSN on idr_MSN=id_MSN
	INNER JOIN T_PowerCenter on id_PowerCenter=idr_PowerCenter
WHERE
	MSN_SEPDS_PED_Standard = 'STD8.0'
	AND PowerCenter LIKE 'SPDB%'
	AND (Column3='Active' OR ISNULL(Column3,'')='')
	
	
UPDATE T_LINK_MSN_POWERCENTER 
SET Column4 = RIGHT(PowerCenter,1) + '4MW'
FROM
	T_LINK_MSN_POWERCENTER
	INNER JOIN T_MSN on idr_MSN=id_MSN
	INNER JOIN T_PowerCenter on id_PowerCenter=idr_PowerCenter
WHERE
	MSN_SEPDS_PED_Standard = 'STD8.0'
	AND PowerCenter LIKE 'SPDB%'
	AND (Column4='Active' OR ISNULL(Column4,'')='')
	
	
UPDATE T_LINK_MSN_POWERCENTER 
SET Column5 = RIGHT(PowerCenter,1) + '5MW'
FROM
	T_LINK_MSN_POWERCENTER
	INNER JOIN T_MSN on idr_MSN=id_MSN
	INNER JOIN T_PowerCenter on id_PowerCenter=idr_PowerCenter
WHERE
	MSN_SEPDS_PED_Standard = 'STD8.0'
	AND PowerCenter LIKE 'SPDB%'
	AND (Column5='Active' OR ISNULL(Column5,'')='')
	


	
UPDATE T_LINK_MSN_POWERCENTER 
SET Column1 = 'Active'
FROM
	T_LINK_MSN_POWERCENTER
	INNER JOIN T_MSN on idr_MSN=id_MSN
	INNER JOIN T_PowerCenter on id_PowerCenter=idr_PowerCenter
WHERE
	MSN_SEPDS_PED_Standard = 'STD6.4.1'
	AND PowerCenter LIKE 'SPDB%'
	AND (ISNULL(Column1,'')='')	
	
	
UPDATE T_LINK_MSN_POWERCENTER 
SET Column2 = 'Active'
FROM
	T_LINK_MSN_POWERCENTER
	INNER JOIN T_MSN on idr_MSN=id_MSN
	INNER JOIN T_PowerCenter on id_PowerCenter=idr_PowerCenter
WHERE
	MSN_SEPDS_PED_Standard = 'STD6.4.1'
	AND PowerCenter LIKE 'SPDB%'
	AND (ISNULL(Column2,'')='')	
	
	
UPDATE T_LINK_MSN_POWERCENTER 
SET Column3 = 'Active'
FROM
	T_LINK_MSN_POWERCENTER
	INNER JOIN T_MSN on idr_MSN=id_MSN
	INNER JOIN T_PowerCenter on id_PowerCenter=idr_PowerCenter
WHERE
	MSN_SEPDS_PED_Standard = 'STD6.4.1'
	AND PowerCenter LIKE 'SPDB%'
	AND (ISNULL(Column3,'')='')	
	
	
UPDATE T_LINK_MSN_POWERCENTER 
SET Column4 = 'Active'
FROM
	T_LINK_MSN_POWERCENTER
	INNER JOIN T_MSN on idr_MSN=id_MSN
	INNER JOIN T_PowerCenter on id_PowerCenter=idr_PowerCenter
WHERE
	MSN_SEPDS_PED_Standard = 'STD6.4.1'
	AND PowerCenter LIKE 'SPDB%'
	AND (ISNULL(Column4,'')='')
	
	
UPDATE T_LINK_MSN_POWERCENTER 
SET Column5 = 'Active'
FROM
	T_LINK_MSN_POWERCENTER
	INNER JOIN T_MSN on idr_MSN=id_MSN
	INNER JOIN T_PowerCenter on id_PowerCenter=idr_PowerCenter
WHERE
	MSN_SEPDS_PED_Standard = 'STD6.4.1'
	AND PowerCenter LIKE 'SPDB%'
	AND (ISNULL(Column5,'')='')
	
	
	
UPDATE T_LINK_MSN_POWERCENTER 
SET Column1 = 'Inactive',
	Column2 = 'Inactive',
	Column3 = 'Inactive',
	Column4 = 'Inactive',
	Column5 = 'Inactive'
FROM
	T_LINK_MSN_POWERCENTER
	INNER JOIN T_MSN on idr_MSN=id_MSN
	INNER JOIN T_PowerCenter on id_PowerCenter=idr_PowerCenter
WHERE
/*	MSN_SEPDS_PED_Standard = 'STD8.0'
	AND*/ PowerCenter LIKE 'SPDB7'
	
	
UPDATE T_LINK_MSN_POWERCENTER 
SET Column1 = 'Inactive',
	Column2 = 'Inactive',
	Column3 = 'Inactive',
	Column4 = 'Inactive',
	Column5 = 'Inactive'
FROM
	T_LINK_MSN_POWERCENTER
	INNER JOIN T_MSN on idr_MSN=id_MSN
	INNER JOIN T_PowerCenter on id_PowerCenter=idr_PowerCenter
WHERE
/*	MSN_SEPDS_PED_Standard = 'STD8.0'
	AND */ PowerCenter LIKE 'SPDB8'
	
	
	
	
	