/* User Elco (for stored prcedure elcofi and elcocheck)*/

-- Drop the user if it already exists (re-entrance)
IF ((SELECT 'Yes' FROM sysusers WHERE sysusers.name='Elco')='Yes')
	EXEC sp_dropuser 'Elco'
GO

-- Ini parameter
DECLARE @PSE_Database VARCHAR(8000)

-- Change this value depending on the environment
SET @PSE_Database = (select name from master..sysdatabases where dbid = DB_ID())


-- Create the login only if it does not already exists (re-entrance)
IF ((SELECT count(Name) FROM master.dbo.syslogins WHERE loginname = 'Elco' and isntname = 0) = 0)
	-- Add the login
	EXEC sp_addlogin 'Elco', 'elco', @PSE_Database
GO

-- Create the user
EXEC sp_adduser 'Elco', 'Elco'
GO


-- Grant rights to procedure creation and deletion
GRANT CREATE PROCEDURE TO Elco

--Grant all rights on All Table
if (exists(select * from sysobjects where name = 'T_CHECK_FIELD')) begin GRANT SELECT ON T_CHECK_FIELD TO ELCO end
if (exists(select * from sysobjects where name = 'R_FIN_CI')) begin GRANT SELECT ON R_FIN_CI TO ELCO end
if (exists(select * from sysobjects where name = 'T_CHOICELIST')) begin GRANT SELECT ON T_CHOICELIST TO ELCO end
if (exists(select * from sysobjects where name = 'R_FIN_DS')) begin GRANT SELECT ON R_FIN_DS TO ELCO end
if (exists(select * from sysobjects where name = 'T_CONCURENT_ACCESS')) begin GRANT SELECT ON T_CONCURENT_ACCESS TO ELCO end
if (exists(select * from sysobjects where name = 'R_FIN_LINK')) begin GRANT SELECT ON R_FIN_LINK TO ELCO end
if (exists(select * from sysobjects where name = 'T_DBActions')) begin GRANT SELECT ON T_DBActions TO ELCO end
if (exists(select * from sysobjects where name = 'R_Supplier')) begin GRANT SELECT ON R_Supplier TO ELCO end
if (exists(select * from sysobjects where name = 'T_FEATURE')) begin GRANT SELECT ON T_FEATURE TO ELCO end
if (exists(select * from sysobjects where name = 'SEPDCPowerSupply')) begin GRANT SELECT ON SEPDCPowerSupply TO ELCO end
if (exists(select * from sysobjects where name = 'T_FEATURE_GROUP')) begin GRANT SELECT ON T_FEATURE_GROUP TO ELCO end
if (exists(select * from sysobjects where name = 'SEPDCTT')) begin GRANT SELECT ON SEPDCTT TO ELCO end
if (exists(select * from sysobjects where name = 'T_LINK_ATTRGROUP_OBJECT')) begin GRANT SELECT ON T_LINK_ATTRGROUP_OBJECT TO ELCO end
if (exists(select * from sysobjects where name = 'SEPDC_FIN_ASSOCIATED')) begin GRANT SELECT ON SEPDC_FIN_ASSOCIATED TO ELCO end
if (exists(select * from sysobjects where name = 'T_LINK_FEATURE_USER_ROLE')) begin GRANT SELECT ON T_LINK_FEATURE_USER_ROLE TO ELCO end
if (exists(select * from sysobjects where name = 'SEPDC_NON_FIN_ASSOCIATED')) begin GRANT SELECT ON SEPDC_NON_FIN_ASSOCIATED TO ELCO end
if (exists(select * from sysobjects where name = 'T_LINK_ROLE_USER')) begin GRANT SELECT ON T_LINK_ROLE_USER TO ELCO end
if (exists(select * from sysobjects where name = 'SSPC_TT_Output')) begin GRANT SELECT ON SSPC_TT_Output TO ELCO end
if (exists(select * from sysobjects where name = 'T_OBJECT')) begin GRANT SELECT ON T_OBJECT TO ELCO end
if (exists(select * from sysobjects where name = 'T_ACTION')) begin GRANT SELECT ON T_ACTION TO ELCO end
if (exists(select * from sysobjects where name = 'T_PERMISSION_ACCESS_ATTRIBUTE')) begin GRANT SELECT ON T_PERMISSION_ACCESS_ATTRIBUTE TO ELCO end
if (exists(select * from sysobjects where name = 'T_CBMFLocation')) begin GRANT SELECT ON T_CBMFLocation TO ELCO end
if (exists(select * from sysobjects where name = 'T_RECUPERATE')) begin GRANT SELECT ON T_RECUPERATE TO ELCO end
if (exists(select * from sysobjects where name = 'T_CHECKDELIVERABLE')) begin GRANT SELECT ON T_CHECKDELIVERABLE TO ELCO end
if (exists(select * from sysobjects where name = 'T_REPORT_GROUP')) begin GRANT SELECT ON T_REPORT_GROUP TO ELCO end
if (exists(select * from sysobjects where name = 'T_CHECKLIST')) begin GRANT SELECT ON T_CHECKLIST TO ELCO end
if (exists(select * from sysobjects where name = 'T_SEARCH_PROFIL')) begin GRANT SELECT ON T_SEARCH_PROFIL TO ELCO end
if (exists(select * from sysobjects where name = 'T_CHECKLIST_DEFINITION')) begin GRANT SELECT ON T_CHECKLIST_DEFINITION TO ELCO end
if (exists(select * from sysobjects where name = 'T_TEMPLATE')) begin GRANT SELECT ON T_TEMPLATE TO ELCO end
if (exists(select * from sysobjects where name = 'T_CHECKWORKFLOW')) begin GRANT SELECT ON T_CHECKWORKFLOW TO ELCO end
if (exists(select * from sysobjects where name = 'T_USER')) begin GRANT SELECT ON T_USER TO ELCO end
if (exists(select * from sysobjects where name = 'T_CIN')) begin GRANT SELECT ON T_CIN TO ELCO end
if (exists(select * from sysobjects where name = 'T_USER_ROLE')) begin GRANT SELECT ON T_USER_ROLE TO ELCO end
if (exists(select * from sysobjects where name = 'T_COE_CMIT')) begin GRANT SELECT ON T_COE_CMIT TO ELCO end
if (exists(select * from sysobjects where name = 'T_USER_SETTINGS')) begin GRANT SELECT ON T_USER_SETTINGS TO ELCO end
if (exists(select * from sysobjects where name = 'T_COMBINAISON_STATUS')) begin GRANT SELECT ON T_COMBINAISON_STATUS TO ELCO end
if (exists(select * from sysobjects where name = 'T_DELTA0_FOLLOWUP')) begin GRANT SELECT ON T_DELTA0_FOLLOWUP TO ELCO end
if (exists(select * from sysobjects where name = 'T_DELTA1_FOLLOWUP')) begin GRANT SELECT ON T_DELTA1_FOLLOWUP TO ELCO end
if (exists(select * from sysobjects where name = 'T_EXPECTED_APPLICABILITY')) begin GRANT SELECT ON T_EXPECTED_APPLICABILITY TO ELCO end
if (exists(select * from sysobjects where name = 'T_FINTypeCard')) begin GRANT SELECT ON T_FINTypeCard TO ELCO end
if (exists(select * from sysobjects where name = 'T_HISTORY')) begin GRANT SELECT ON T_HISTORY TO ELCO end
if (exists(select * from sysobjects where name = 'T_HISTORY_DS')) begin GRANT SELECT ON T_HISTORY_DS TO ELCO end
if (exists(select * from sysobjects where name = 'T_IMPACTDS')) begin GRANT SELECT ON T_IMPACTDS TO ELCO end
if (exists(select * from sysobjects where name = 'T_INVOLVED_TEAM_MP')) begin GRANT SELECT ON T_INVOLVED_TEAM_MP TO ELCO end
if (exists(select * from sysobjects where name = 'T_INVOLVED_TEAM_REQ')) begin GRANT SELECT ON T_INVOLVED_TEAM_REQ TO ELCO end
if (exists(select * from sysobjects where name = 'T_LDAP')) begin GRANT SELECT ON T_LDAP TO ELCO end
if (exists(select * from sysobjects where name = 'T_LINK_CIN_SB')) begin GRANT SELECT ON T_LINK_CIN_SB TO ELCO end
if (exists(select * from sysobjects where name = 'T_LINK_CI__CIN')) begin GRANT SELECT ON T_LINK_CI__CIN TO ELCO end
if (exists(select * from sysobjects where name = 'T_LINK_DS_EQUIP_ALTERNATE')) begin GRANT SELECT ON T_LINK_DS_EQUIP_ALTERNATE TO ELCO end
if (exists(select * from sysobjects where name = 'T_LINK_FIN_DS_FIN_CI')) begin GRANT SELECT ON T_LINK_FIN_DS_FIN_CI TO ELCO end
if (exists(select * from sysobjects where name = 'T_LINK_FIN_POWERCENTER')) begin GRANT SELECT ON T_LINK_FIN_POWERCENTER TO ELCO end
if (exists(select * from sysobjects where name = 'T_LINK_MOD_MP')) begin GRANT SELECT ON T_LINK_MOD_MP TO ELCO end
if (exists(select * from sysobjects where name = 'T_LINK_MOD_MSN')) begin GRANT SELECT ON T_LINK_MOD_MSN TO ELCO end
if (exists(select * from sysobjects where name = 'T_LINK_MOD_OPTION')) begin GRANT SELECT ON T_LINK_MOD_OPTION TO ELCO end
if (exists(select * from sysobjects where name = 'T_LINK_MP_MSN')) begin GRANT SELECT ON T_LINK_MP_MSN TO ELCO end
if (exists(select * from sysobjects where name = 'T_LINK_MSN_POWERCENTER')) begin GRANT SELECT ON T_LINK_MSN_POWERCENTER TO ELCO end
if (exists(select * from sysobjects where name = 'T_LINK_MSN_SB')) begin GRANT SELECT ON T_LINK_MSN_SB TO ELCO end
if (exists(select * from sysobjects where name = 'T_LINK_PDREQUIREMENT_MP')) begin GRANT SELECT ON T_LINK_PDREQUIREMENT_MP TO ELCO end
if (exists(select * from sysobjects where name = 'T_LINK_REQUEST_MP')) begin GRANT SELECT ON T_LINK_REQUEST_MP TO ELCO end
if (exists(select * from sysobjects where name = 'T_LINK_ROLEAC__FIN')) begin GRANT SELECT ON T_LINK_ROLEAC__FIN TO ELCO end
if (exists(select * from sysobjects where name = 'T_MAP242PSEATTRIBUTEBACKUP')) begin GRANT SELECT ON T_MAP242PSEATTRIBUTEBACKUP TO ELCO end
if (exists(select * from sysobjects where name = 'T_MEETING')) begin GRANT SELECT ON T_MEETING TO ELCO end
if (exists(select * from sysobjects where name = 'T_MG')) begin GRANT SELECT ON T_MG TO ELCO end
if (exists(select * from sysobjects where name = 'T_MOD')) begin GRANT SELECT ON T_MOD TO ELCO end
if (exists(select * from sysobjects where name = 'T_MOD_CLOSURE_FOLLOWUP')) begin GRANT SELECT ON T_MOD_CLOSURE_FOLLOWUP TO ELCO end
if (exists(select * from sysobjects where name = 'T_MP')) begin GRANT SELECT ON T_MP TO ELCO end
if (exists(select * from sysobjects where name = 'T_MSN')) begin GRANT SELECT ON T_MSN TO ELCO end
if (exists(select * from sysobjects where name = 'T_OPTION')) begin GRANT SELECT ON T_OPTION TO ELCO end
if (exists(select * from sysobjects where name = 'T_PDCI')) begin GRANT SELECT ON T_PDCI TO ELCO end
if (exists(select * from sysobjects where name = 'T_PDDS')) begin GRANT SELECT ON T_PDDS TO ELCO end
if (exists(select * from sysobjects where name = 'T_PDREQUIREMENT')) begin GRANT SELECT ON T_PDREQUIREMENT TO ELCO end
if (exists(select * from sysobjects where name = 'T_PHASE')) begin GRANT SELECT ON T_PHASE TO ELCO end
if (exists(select * from sysobjects where name = 'T_POWERCENTER')) begin GRANT SELECT ON T_POWERCENTER TO ELCO end
if (exists(select * from sysobjects where name = 'T_PRS_PHASES')) begin GRANT SELECT ON T_PRS_PHASES TO ELCO end
if (exists(select * from sysobjects where name = 'T_QUALITY_CHECK')) begin GRANT SELECT ON T_QUALITY_CHECK TO ELCO end
if (exists(select * from sysobjects where name = 'T_REQUEST')) begin GRANT SELECT ON T_REQUEST TO ELCO end
if (exists(select * from sysobjects where name = 'T_ROLEAC')) begin GRANT SELECT ON T_ROLEAC TO ELCO end
if (exists(select * from sysobjects where name = 'T_Responsibility')) begin GRANT SELECT ON T_Responsibility TO ELCO end
if (exists(select * from sysobjects where name = 'T_SB')) begin GRANT SELECT ON T_SB TO ELCO end
if (exists(select * from sysobjects where name = 'T_SECTION')) begin GRANT SELECT ON T_SECTION TO ELCO end
if (exists(select * from sysobjects where name = 'T_SI')) begin GRANT SELECT ON T_SI TO ELCO end
if (exists(select * from sysobjects where name = 'T_SSPC_VL')) begin GRANT SELECT ON T_SSPC_VL TO ELCO end
if (exists(select * from sysobjects where name = 'T_SubBusBar')) begin GRANT SELECT ON T_SubBusBar TO ELCO end
if (exists(select * from sysobjects where name = 'T_FMP_MSN_MP')) begin GRANT SELECT ON T_FMP_MSN_MP TO ELCO end
if (exists(select * from sysobjects where name = 'T_TICK_BOX')) begin GRANT SELECT ON T_TICK_BOX TO ELCO end
if (exists(select * from sysobjects where name = 'T_TRUTH_TABLE')) begin GRANT SELECT ON T_TRUTH_TABLE TO ELCO end
if (exists(select * from sysobjects where name = 'dtproperties')) begin GRANT SELECT ON dtproperties TO ELCO end
if (exists(select * from sysobjects where name = 'FIN_SI_LOADER_STATE_MAPPING')) begin GRANT SELECT ON FIN_SI_LOADER_STATE_MAPPING TO ELCO end
if (exists(select * from sysobjects where name = 'FIN_SI_LOADER_Counter')) begin GRANT SELECT ON FIN_SI_LOADER_Counter TO ELCO end
if (exists(select * from sysobjects where name = 'FIN_SI_LOADER_REPORT')) begin GRANT SELECT ON FIN_SI_LOADER_REPORT TO ELCO end
if (exists(select * from sysobjects where name = 'T_SIRD')) begin GRANT SELECT ON T_SIRD TO ELCO end
if (exists(select * from sysobjects where name = 'T_SWRD')) begin GRANT SELECT ON T_SWRD TO ELCO end
if (exists(select * from sysobjects where name = 'T_LINK_SIRD_ATA')) begin GRANT SELECT ON T_LINK_SIRD_ATA TO ELCO end
if (exists(select * from sysobjects where name = 'T_LINK_SWRD_ATA')) begin GRANT SELECT ON T_LINK_SWRD_ATA TO ELCO end
if (exists(select * from sysobjects where name = 'T_LINK_SWRD_SIRD')) begin GRANT SELECT ON T_LINK_SWRD_SIRD TO ELCO end
if (exists(select * from sysobjects where name = 'T_IMPACTED_SECTIONS')) begin GRANT SELECT ON T_IMPACTED_SECTIONS TO ELCO end
if (exists(select * from sysobjects where name = 'T_LINK_SIRD_IMPACTED_SECTIONS')) begin GRANT SELECT ON T_LINK_SIRD_IMPACTED_SECTIONS TO ELCO end
if (exists(select * from sysobjects where name = 'tmpsv_EQUIPMENTMODEL')) begin GRANT SELECT ON tmpsv_EQUIPMENTMODEL TO ELCO end
if (exists(select * from sysobjects where name = 'tmpsv_PN')) begin GRANT SELECT ON tmpsv_PN TO ELCO end
if (exists(select * from sysobjects where name = 'tmpsv_Supplier')) begin GRANT SELECT ON tmpsv_Supplier TO ELCO end
if (exists(select * from sysobjects where name = 'tmpsv_TEAM')) begin GRANT SELECT ON tmpsv_TEAM TO ELCO end
if (exists(select * from sysobjects where name = 'CT_GESY')) begin GRANT SELECT ON CT_GESY TO ELCO end
if (exists(select * from sysobjects where name = 'CT_LOGISTIC_RESPONSIBLE')) begin GRANT SELECT ON CT_LOGISTIC_RESPONSIBLE TO ELCO end
if (exists(select * from sysobjects where name = 'Delta1')) begin GRANT SELECT ON Delta1 TO ELCO end
if (exists(select * from sysobjects where name = 'EDDF')) begin GRANT SELECT ON EDDF TO ELCO end
if (exists(select * from sysobjects where name = 'EEPDC')) begin GRANT SELECT ON EEPDC TO ELCO end
if (exists(select * from sysobjects where name = 'EEPDC_FIN_ATA')) begin GRANT SELECT ON EEPDC_FIN_ATA TO ELCO end
if (exists(select * from sysobjects where name = 'FINExport')) begin GRANT SELECT ON FINExport TO ELCO end
if (exists(select * from sysobjects where name = 'FTA')) begin GRANT SELECT ON FTA TO ELCO end
if (exists(select * from sysobjects where name = 'ICAO_IATA')) begin GRANT SELECT ON ICAO_IATA TO ELCO end
if (exists(select * from sysobjects where name = 'ListeDate')) begin GRANT SELECT ON ListeDate TO ELCO end
if (exists(select * from sysobjects where name = 'OPENCIN')) begin GRANT SELECT ON OPENCIN TO ELCO end
if (exists(select * from sysobjects where name = 'APPLICATION_SETUP')) begin GRANT SELECT ON APPLICATION_SETUP TO ELCO end
if (exists(select * from sysobjects where name = 'PEPDC')) begin GRANT SELECT ON PEPDC TO ELCO end
if (exists(select * from sysobjects where name = 'InfoBase')) begin GRANT SELECT ON InfoBase TO ELCO end
if (exists(select * from sysobjects where name = 'PSS_KPI_HTML_REPORT')) begin GRANT SELECT ON PSS_KPI_HTML_REPORT TO ELCO end
if (exists(select * from sysobjects where name = 'T_ATTR_GROUP')) begin GRANT SELECT ON T_ATTR_GROUP TO ELCO end
if (exists(select * from sysobjects where name = 'R_ATA')) begin GRANT SELECT ON R_ATA TO ELCO end
if (exists(select * from sysobjects where name = 'T_BLOCKED_OBJECTS')) begin GRANT SELECT ON T_BLOCKED_OBJECTS TO ELCO end
if (exists(select * from sysobjects where name = 'R_Equipment')) begin GRANT SELECT ON R_Equipment TO ELCO end

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ELCOFI_3_1_5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	GRANT EXEC ON sp_ELCOFI_3_1_5 TO ELCO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ELCOFI_3_2]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	GRANT EXEC ON sp_ELCOFI_3_2 TO ELCO
