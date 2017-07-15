-- Global PDCR Global Report creation in PSE

IF (SELECT REPORT_GROUP_id FROM T_REPORT_GROUP WHERE REPORT_GROUP_LABEL = 'Others') IS NULL
	INSERT INTO [T_REPORT_GROUP]
	(
		[REPORT_GROUP_LABEL]
	)
	VALUES
	(
		'Others'
	)

DECLARE
	@AttGroup INT

SELECT @AttGroup = REPORT_GROUP_id FROM T_REPORT_GROUP WHERE REPORT_GROUP_LABEL = 'Others'

-- Add report in PSE
DELETE T_DBActions WHERE label = 'PDCR global Report'

INSERT INTO [T_DBActions]
(
	[label],
	[command],
	[comments],
	[template_page],
	[parameters],
	[report_commentary],
	[mandatory_fields],
	[report_group_idr]
)
VALUES
(
	'PDCR global Report',
	'SELECT
	T_PDDS.last_issue,
	CASE
		WHEN SUBSTRING(pdci_reference, 7, 1) = ''2'' THEN ''A-F''
		WHEN SUBSTRING(pdci_reference, 7, 1) = ''9'' THEN ''A-D''
		WHEN SUBSTRING(pdci_reference, 7, 1) = ''4'' THEN ''A-UK''
		WHEN SUBSTRING(pdci_reference, 7, 1) = ''5'' THEN ''A-UK''
		WHEN SUBSTRING(pdci_reference, 7, 1) = ''8'' THEN ''A-E''
	END AS NatCO,
	T_PDDS.pdds_status,
	R_ATA.ATACode,
	R_ATA.circuit_letter,
	T_PDDS.pdds_type,
	T_PDCI.pdci_reference,
	T_PDDS.pdds_reference,
	CONVERT(VARCHAR, T_PDDS.pdds_date_validation_local, 111) AS date_validation,
	CONVERT(VARCHAR, T_PDDS.pdds_date_emission_local, 111) AS date_emission_local,
	T_PDDS.pdds_effectivity,
	T_PDDS.pdds_version_effectivity,
	T_PDDS.pdds_ns11_12,
	T_PDDS.pdds_f_s13,
	T_PDDS.pdds_c_s15_21,
	T_PDDS.pdds_a_s18_19,
	T_PDDS.pdds_t_s19_1,
	T_PDDS.pdds_r_cabin,
	T_PDDS.pdds_h_htp,
	T_PDDS.pdds_v_vtp,
	T_PDDS.pdds_w_wing,
	T_PDDS.pdds_p_pylon,
	T_PDDS.pdds_l_lgs,
	T_PDDS.pdds_pdFile,
	T_PDDS.pdds_ecnFile,
	T_PDDS.pdds_q_checkFile,
	T_PDDS.pdds_ehes, T_PDDS.pdds_ce,
	T_PDDS.pdds_rfc, T_PDDS.pdds_cr,
	T_PDDS.pdds_design_query_note,
	T_MP.MPReference AS MP,
	T_PDDS.pdds_MPEmbodied AS [MP(s) embodied on PDDS],
	T_PDDS.pdds_other,
	T_PDDS.pdds_comment,
	T_PDDS.id_pdds,
	T_PDCI.id_pdci
FROM
	T_PDDS
	JOIN T_PDCI ON T_PDDS.idr_pdci = T_PDCI.id_pdci
	JOIN R_ATA ON T_PDCI.pdci_idr_ata = R_ATA.id_ata
	LEFT JOIN T_MP ON T_PDDS.pdds_idr_mp = T_MP.id_mp',
	'- Report all Principle Diagram Common Repository data without Q check attributes',
	NULL,
	NULL,
	NULL,
	NULL,
	@AttGroup
)
