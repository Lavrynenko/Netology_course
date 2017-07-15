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
DELETE FROM T_DBActions WHERE label='List of SW to be reloaded'
INSERT INTO t_dbactions 
(label, command, comments, report_group_idr, parameters)
SELECT
	'List of SW to be reloaded',
	'
SELECT  
	HW.fin AS [HW FIN-CI],
	SW.fin AS [SW FIN-CI],
	SW.FunctionnalDesignation AS [SW Functional Designation],
	Reload.fin AS [List of SW to be reloaded]
FROM 
	R_FIN_CI SW
	JOIN R_FIN_LINK Rlink ON SW.id_fin = Rlink.id_fin_link
	JOIN R_FIN_CI Reload  ON Reload.id_fin = Rlink.idr_fin_link
	JOIN R_FIN_LINK HOST ON SW.id_fin = HOST.idr_fin_link
	JOIN R_FIN_CI HW ON  HW.id_fin = HOST.id_fin_link
WHERE
	Rlink.link_type = ''RELOADED''
	AND HOST.link_type = ''HOST''
	AND RTRIM(LTRIM(SW.FinCiReloadingConditionTag)) = ''Yes''
ORDER BY
	SW.fin,
	Reload.fin
	',
	'- List of SW to be reloaded',
	report_group_id,
	''

FROM
	t_report_group
WHERE
	report_group_label='FLS'



