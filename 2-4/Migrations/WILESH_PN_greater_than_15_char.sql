-- report WILESH PN greater than 15 char
UPDATE T_DBActions
SET command = 'SELECT DISTINCT
	InstallationNatCo AS InstallationNatCo,
	MAPEquip.PN AS DevPN,
	MAPEquip.Equipment_SeriesNumber AS Series NUmBER Dev,
	MAPEquip.CMS AS DevCMS,
	SupName,
	ATACode
FROM
	R_FIN_CI 
	JOIN R_ATA ON idr_ata = id_ata
	JOIN R_FIN_DS AS MAPDS ON MAPDS.idr_fin = id_fin
	JOIN R_FIN_DS AS SERDS ON SERDS.idr_fin = id_fin
	JOIN R_Equipment AS MAPEquip ON MAPDS.idr_equip = MAPEquip.id_equip
	JOIN R_Equipment AS SEREquip ON SERDS.idr_equip = SEREquip.id_equip
	LEFT JOIN R_Supplier ON SEREquip.idr_Supplier = id_Supplier
WHERE
	(SERDS.ds_type = 0 OR SERDS.ds_type = 4)
	AND SERDS.SVMAJ_DS=''>''
	AND MAPDS.ds_type = 1
	AND
	(
		DesignNatco=''A-D''
		OR DesignNatco LIKE ''D%''
		OR InstallationNatco=''A-D''
		OR InstallationNatco LIKE ''D%''
		OR ProcurementNatco=''A-D''
		OR ProcurementNatco LIKE ''D%''
	)
	AND MAPDS.last_effective = 1
	AND MAPEquip.CMS <> ''6L00000000''
	AND LEN(MAPEquip.PN) > 15
ORDER BY MAPEquip.PN'
WHERE (label LIKE 'WILESH PN greater than 15 char');
