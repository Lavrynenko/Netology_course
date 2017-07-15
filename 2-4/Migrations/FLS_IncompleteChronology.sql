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
-- T_DBACTIONS Delete
--
DELETE 
	T_DBActions 
WHERE	
	label = 'SW Chronology ranking'
	OR label = 'Incomplete Chronology'

--
-- T_DBACTIONS Update
--
INSERT INTO 
	T_DBActions 
(label,command,comments,report_group_idr) 
SELECT
	'SW Chronology ranking',
	'
	SELECT
		hard.FIN AS [Hardware FINCI],
		soft.FIN AS [Software FINCI],
		soft.FinCiSWType,
		CASE WHEN ISNULL(soft.FinCiRank,'''') = '''' THEN '''' ELSE CONVERT(varchar,soft.FinCiRank) END as [Uploading chronology rank],
		CASE WHEN ISNULL(soft.FinCiRank,'''') = '''' THEN ''not defined'' ELSE ''defined'' END as [Chronology status]
	FROM
		R_FIN_CI hard
		JOIN R_FIN_LINK ON R_FIN_LINK.id_fin_link = hard.id_fin
		JOIN R_FIN_CI soft ON soft.id_fin = R_FIN_LINK.idr_fin_link
	WHERE
		link_type = ''HOST''
	ORDER BY
		hard.FIN, soft.FinCiRank, soft.FIN
	',
	'- Incomplete or missing chronology in PSE',
	report_group_id
FROM
	t_report_group
WHERE 
	t_report_group.report_group_label='FLS'


 