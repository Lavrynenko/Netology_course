-- report LAB Procurement Worklist A-F
UPDATE T_DBActions
SET command = 'SELECT
	FIN,
	PN,
	Equipment_SeriesNumber AS [Series Number],
	CMS,
	ProcurementNatco AS [Procurement Natco],
	InstallationNatco AS [Installation Site],
	InstallationCDBT AS [Installation CDBT],
	DesignCDBT AS [Design CDBT],
	DesignResponsible AS [Design Resp / WP Leader],
	ContractualQuantity,
	NeedQuantity,
	PurchaseOrderRef,
	LaunchOrder AS [Task Leader agreement for order],
	DateOfValidation,
	DateOfNeed AS [Installer CAP Date],
	NewContractualDeliveryDate AS [Committed CMIT Supplier/Installer forecast on dock],
	Equipment_Delivered AS [Equipment Delivered]
FROM
	R_FIN_CI
	JOIN R_FIN_DS ON id_fin = idr_fin
	JOIN R_EQUIPMENT ON id_equip = idr_equip
WHERE
	ds_type = 2
	AND PurchaseOrderSent = ''No''
	AND
		(
		ProcurementNatco = ''A-F''
		OR ProcurementNatco LIKE ''F%''
		)
	AND CMS <> ''6L00000000'''
WHERE (label LIKE 'LAB Procurement Worklist A-F');