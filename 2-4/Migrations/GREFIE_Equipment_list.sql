-- report GREFIE Equipment list
UPDATE T_DBActions
SET command = 'SELECT DISTINCT
	ATACode,
	ATATitle,
	PN,
	Equipment_SeriesNumber AS [Series Number],
	EquipmentDesignation,
	SupName
FROM 
	R_Equipment 
	JOIN R_FIN_DS ON R_Equipment.id_equip = R_FIN_DS.idr_equip
	JOIN R_FIN_CI ON R_FIN_DS.idr_fin = R_FIN_CI.id_fin
	JOIN R_ATA ON R_FIN_CI.idr_ata = R_ATA.id_ata
	LEFT JOIN R_Supplier ON R_Equipment.idr_supplier = R_Supplier.id_supplier'
WHERE (label LIKE 'GREFIE Equipment list');