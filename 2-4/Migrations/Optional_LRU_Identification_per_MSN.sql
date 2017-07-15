-- report Optional LRU Identification per MSN
UPDATE T_DBActions
SET command = 'SELECT DISTINCT
	bite_lru_code [BITE LRU Code],
	FIN,
	FunctionnalDesignation [Functional Designation],
	ATACode AS ATA,
	SupName AS Supplier,
	SystemViewStatus AS [FIN-DS Status],
	PN,
	Equipment_SeriesNumber AS [Series Number],
	Basic AS [Basic/Optional],
	FullProvision AS [Full Provision],
	DSEffectivity AS [Effectivity],
	Quantity
FROM 
	R_Equipment 
	JOIN R_FIN_DS ON R_Equipment.id_equip = R_FIN_DS.idr_equip
	JOIN R_FIN_CI ON R_FIN_DS.idr_fin = R_FIN_CI.id_fin
	JOIN R_ATA ON R_FIN_CI.idr_ata = R_ATA.id_ata
	LEFT JOIN R_Supplier ON R_Equipment.idr_supplier = R_Supplier.id_supplier
WHERE
	(ds_type = 0 OR ds_type = 4)
	AND bite_lru_code IS NOT NULL
	AND bite_lru_code <> '''''
WHERE (label LIKE 'Optional LRU Identification per MSN');
