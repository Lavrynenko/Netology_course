-- report Procurement Worklist A-UK
UPDATE T_DBActions
SET command = 'SELECT
	FIN,
	DS_SI_Reference AS SI,
	PN,
	Equipment_SeriesNumber AS [Series Number],
	CMS,
	SerialNumber AS [SerialNumber],
	ProcurementNatco AS [Procurement Natco],
	InstallationNatco AS [Installation Site],
	InstallationCDBT AS [Installation CDBT],
	DesignCDBT AS [Design CDBT],
	DesignResponsible AS [Design Resp / WP Leader]
FROM
	R_FIN_CI
	JOIN R_FIN_DS ON id_fin = idr_fin
	JOIN R_EQUIPMENT ON id_equip = idr_equip
WHERE
	ds_type = 1
	AND
		(
		SystemViewStatus = ''HELD''
		OR SystemViewStatus = ''RELEASED''
		)
	AND PurchaseOrderSent = ''No''
	AND
		(
		ProcurementNatco = ''A-UK''
		OR ProcurementNatco LIKE ''U%''
		)
	AND CMS <> ''6L00000000'''
WHERE (label LIKE 'Procurement Worklist A-UK');