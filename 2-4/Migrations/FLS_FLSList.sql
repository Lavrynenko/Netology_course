--
-- T_REPORT_GROUP Update
--
if (not exists (SELECT *
		FROM t_report_group
		WHERE report_group_label='FLS'))
begin
	INSERT INTO t_report_group (report_group_label)
	SELECT 'FLS'
end


--
-- T_DBACTIONS Update
--
DELETE FROM T_DBActions WHERE label='FLS List'
INSERT INTO t_dbactions 
(label, command, comments, report_group_idr, parameters)
SELECT
	'FLS List',
	'
SELECT 
	SW.FLSdataValidated AS [FLS data validated?],
	SUBSTRING(ATAHW.ATACode,1,2) AS [ATA HW],
	SUBSTRING(ATAHW.ATACode,3,2) AS [Sub ATA HW],
	HW.fin AS [Host HW FIN],
	HW.FinCIHWGroup AS [HW Group],
	HW.FunctionnalDesignation AS [Host HW FIN Functional Designation],
	HW.UploadSpecInstructExists AS [Uploading specific instruction exists of the FIN HW?],
	HW.UploadSpecInstructRef AS [Uploading specific instruction reference of the FIN HW?],
	SUBSTRING(ATASW.ATACode,1,2) AS [ATA of FIN SW],
	SUBSTRING(ATASW.ATACode,3,2) AS [SubATA of FIN SW],
	ATASW.ATATitle AS [ATA Description of FIN SW],
	SW.FIN AS [FIN SW],
	SW.FinCISWGroup AS [SW Group ],
	SW.FunctionnalDesignation AS [Functional Designation of FIN SW],
	SW.FinCIFLSClassification AS [FLS Classification],
	SW.MilitaryClassification AS [Military Classification],
	SW.FinCiFLSDomain AS [A/C Domain ],
	SW.FinCiSWType AS [SW Type],
	SW.FinCiConfFileMultiSource AS [Conf file multi source ? (Y/N)],
	SW.ContentDependsACCustYN AS [Content depends on A/C Customisation?(Y/N)],
	SW.GenericSoftware AS [Generic SW ],
	SW.FinCiMultiInstallation AS [Intermediate PNR exists?],
	SW.KindOfPNRDeliveredAL AS [Which kind of PNR will be delivered to A/L?],
	SW.FinCiFLSUserModCapacity AS [PNR customizable by Customer?],
	SW.FinCiUploadingMean AS [Uploading mean],
	SW.FinCiSoftUpType AS [Uploading mode],
	SW.FinCIRank AS [Uploading chronology rank],
	SW.FinCiReloadingConditionTag AS [Reloading condition? (Y/N)],
	SW.UploadSpecInstructExists AS [Uploading specific instruction exists of FIN SW?],
	SW.UploadSpecInstructRef AS [Uploading specific instruction reference of FIN SW]
FROM 
	R_FIN_CI SW
	JOIN R_FIN_LINK ON R_FIN_LINK.idr_fin_link = SW.id_fin
	JOIN R_FIN_CI HW ON R_FIN_LINK.id_fin_link = HW.id_fin
	JOIN R_ATA ATASW ON SW.idr_ata = ATASW.id_ata
	JOIN R_ATA ATAHW ON HW.idr_ata = ATAHW.id_ata
WHERE
	SW.fincategory IN (''LRU LOADABLE SOFTWARE'',''GENERIC SW'',''CUSTOMER SW'',''FIN SW SPP'',''LRU SW IN A SUBCONTRACTED CA'')
	AND R_FIN_LINK.link_type = ''HOST''
	AND SW.finci_status <> ''INVALID''
	AND SW.finci_status <> ''DELETED ''
	',
	'- FLS List',
	report_group_id,
	''

FROM
	t_report_group
WHERE
	report_group_label='FLS'



