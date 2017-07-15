-- Fichier : BD_PSE_01_vidage_tables.sql
-- Vide toutes les tables indiquees
-- Le script n'effectue d'actions que sur les tables existantes


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ATA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM ATA
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ATA_OBS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM ATA_OBS
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CT_GESY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM CT_GESY
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Delta1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM Delta1
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DLW]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM DLW
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EDDF]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM EDDF
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EEPDC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM EEPDC
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EEPDC_FIN_ATA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM EEPDC_FIN_ATA
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FINCI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM FINCI
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FINExport]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM FINExport
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Import_users]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM Import_users
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Load_CR_Leader_Involved]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM Load_CR_Leader_Involved
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Load_CR_Leader_Involved_old]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM Load_CR_Leader_Involved_old
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Mas_Loading]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM Mas_Loading
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Mas_Loading_old]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM Mas_Loading_old
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MigCMS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM MigCMS
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MigDevDSTree]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM MigDevDSTree
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MigDevFINDS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM MigDevFINDS
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MigSI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM MigSI
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ML_EDDRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM ML_EDDRef
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ML_SPDB1_MSN3]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM ML_SPDB1_MSN3
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PEPDC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM PEPDC
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PSS_KPI_HTML_REPORT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM PSS_KPI_HTML_REPORT
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SEPDC_FIN_ASSOCIATED]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM SEPDC_FIN_ASSOCIATED
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SEPDC_NON_FIN_ASSOCIATED]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM SEPDC_NON_FIN_ASSOCIATED
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SEPDCEDD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM SEPDCEDD
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SEPDCPowerSupply]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM SEPDCPowerSupply
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SEPDCTT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM SEPDCTT
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sheet1$]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM Sheet1$
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SSPC_TT_Output]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM SSPC_TT_Output
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_BLOCKED_OBJECTS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM T_BLOCKED_OBJECTS
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_ICCPSEFEEDING_CR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM T_ICCPSEFEEDING_CR
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_ICCPSEFEEDING_STATUS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM T_ICCPSEFEEDING_STATUS
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_MAP242PSEATTRIBUTEBACKUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM T_MAP242PSEATTRIBUTEBACKUP
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_MAPSVFEEDING_NAMESTONAME]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM T_MAPSVFEEDING_NAMESTONAME
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_MAPSVFEEDING_NAMETOLOGON]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM T_MAPSVFEEDING_NAMETOLOGON
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_MAPSVFEEDING_SI2PROCESS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM T_MAPSVFEEDING_SI2PROCESS
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_CONCURENT_ACCESS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM T_CONCURENT_ACCESS
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_RECUPERATE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DELETE FROM T_RECUPERATE
GO

