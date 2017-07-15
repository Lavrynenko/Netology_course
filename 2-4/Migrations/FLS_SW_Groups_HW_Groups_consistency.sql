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
DELETE FROM T_DBActions WHERE label='SW Groups - HW Groups consistency'
INSERT INTO t_dbactions 
(label, command, comments, report_group_idr, parameters)
SELECT
	'SW Groups - HW Groups consistency',
	'
--SELECT inconsistent FINCI
SELECT DISTINCT
	SW.FinCISWGroup AS [SW Group],
	SW.FIN AS [SW FIN-CI],
	SW.FunctionnalDesignation AS [SW Functionnal Designation],
	HW.FinCIHWGroup AS [HW Group],
	HW.FIN AS [HW HOST FIN-CI],
	HW.FunctionnalDesignation AS [HW Functionnal Designation],
	''HW-SW Group inconsistency'' AS GAP
FROM 
	R_FIN_CI SW
	JOIN R_FIN_LINK ON R_FIN_LINK.idr_fin_link = SW.id_fin
	JOIN R_FIN_CI HW ON R_FIN_LINK.id_fin_link = HW.id_fin
WHERE
	SW.FinCISWGroup IN (
		--SELECT inconsistent groups
		SELECT DISTINCT 
			SW.FinCISWGroup
		FROM 
			R_FIN_CI HW
			JOIN R_FIN_LINK ON HW.id_fin = R_FIN_LINK.id_fin_link
			JOIN R_FIN_CI SW  ON SW.id_fin = R_FIN_LINK.idr_fin_link
		WHERE 
			HW.FinCIHWGroup IS NOT NULL
			AND HW.FinCIHWGroup <> ''''
			AND R_FIN_LINK.link_type = ''HOST''
			AND SW.FinCISWGroup IS NOT NULL
			AND SW.FinCISWGroup <> ''''
			AND SW.FinCiSoftUpType <> ''REPOSITORY''
		GROUP BY 
			SW.FinCISWGroup
		HAVING
			COUNT(distinct HW.FinCIHWGroup) > 1)
	AND R_FIN_LINK.link_type = ''HOST''
	AND SW.FinCiSoftUpType <> ''REPOSITORY''
UNION
--SELECT consistent FINCI
SELECT DISTINCT
	SW.FinCISWGroup,
	SW.FIN AS [FIN SW],
	SW.FunctionnalDesignation AS [SW Functionnal Designation],
	HW.FinCIHWGroup,
	HW.fin AS [Host HW FIN],
	HW.FunctionnalDesignation AS [HW Functionnal Designation],
	''OK'' AS GAP
FROM 
	R_FIN_CI SW
	JOIN R_FIN_LINK ON R_FIN_LINK.idr_fin_link = SW.id_fin
	JOIN R_FIN_CI HW ON R_FIN_LINK.id_fin_link = HW.id_fin
WHERE
	SW.FinCISWGroup IN (
		--SELECT consistent groups
		SELECT DISTINCT 
			SW.FinCISWGroup
		FROM 
			R_FIN_CI HW
			JOIN R_FIN_LINK ON HW.id_fin = R_FIN_LINK.id_fin_link
			JOIN R_FIN_CI SW  ON SW.id_fin = R_FIN_LINK.idr_fin_link
		WHERE 
			HW.FinCIHWGroup IS NOT NULL
			AND HW.FinCIHWGroup <> ''''
			AND R_FIN_LINK.link_type = ''HOST''
			AND SW.FinCISWGroup IS NOT NULL
			AND SW.FinCISWGroup <> ''''
			AND SW.FinCiSoftUpType <> ''REPOSITORY''
		GROUP BY 
			SW.FinCISWGroup
		HAVING
			COUNT(distinct HW.FinCIHWGroup) = 1)
	AND R_FIN_LINK.link_type = ''HOST''
	AND SW.FinCiSoftUpType <> ''REPOSITORY''
ORDER BY [FIN SW]
	',
	'- SW Groups - HW Groups consistency',
	report_group_id,
	''

FROM
	t_report_group
WHERE
	report_group_label='FLS'



