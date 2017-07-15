-- ***************************************************************************************
-- New report in DBActions: BITE Index Report in Group other
-- ***************************************************************************************

if( NOT exists (
select * from t_dbactions where
label = 'BITE Index Report'
)
) BEGIN
INSERT INTO
t_dbactions (label,command,comments,template_page,parameters,report_commentary,mandatory_fields,report_group_idr)
select 'BITE Index Report', 'SELECT  R_ATA.ataCode as ''ATA / Sub ATA'',R_FIN_CI.FIN as ''FIN-CI'',R_FIN_CI.FunctionnalDesignation as ''Functionnal Designation''
 ,R_Equipment.PN  as ''PNR target (at delivery)'',R_Equipment.BITE_Index  as ''BITE Index''
FROM R_ATA 
LEFT JOIN R_FIN_CI ON R_ATA.id_ata = R_FIN_CI.idr_ata
LEFT JOIN R_FIN_DS ON R_FIN_CI.id_fin = R_FIN_DS.idr_fin
LEFT JOIN R_Equipment ON R_FIN_DS.idr_equip = R_Equipment.id_equip
WHERE R_FIN_DS.DSEffectivity like ''-#num_msn#-''
AND R_FIN_CI.BITE_StandardBFunction = ''YES''
AND R_FIN_DS.DS_Type = 0', '- BITE Index Report', NULL, 'Enter the number of MSN :#num_msn', 'MSN', NULL, (SELECT T_REPORT_GROUP.report_group_id 
								FROM T_REPORT_GROUP
				 				WHERE T_REPORT_GROUP.REPORT_GROUP_label = 'Others')
print 'MESSAGE : Report " BITE Index Report " declared in DBActions'
END ELSE BEGIN
print 'WARNING : Report " BITE Index Report " already existing, not added in DBActions'
END
