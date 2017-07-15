-- report WILESH Double PN
UPDATE T_DBActions
SET command = 'SELECT DISTINCT
	MAPEquip.PN AS DevPN,
	MAPEquip.Equipment_SeriesNumber AS [Series Number Dev],
	MAPEquip.CMS AS DevCMS,
	SEREquip.PN AS SerPN,
	SEREquip.Equipment_SeriesNumber AS [Series Number Ser],
	SEREquip.CMS AS SerCMS,
	FIN,
	FunctionnalDesignation,
	SupName,
	DesignNatco,
	InstallationNatco,
	ProcurementNatco,
	ATACode,
	MAPDS.DS_SI_REFERENCE,
	MAPDS.SystemViewStatus
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
	AND MAPEquip.SVMAJ_Eqt = ''X''
	AND MAPEquip.CMS <> ''6L00000000''
ORDER BY
	MAPEquip.PN'
WHERE (label LIKE 'WILESH Double PN');
