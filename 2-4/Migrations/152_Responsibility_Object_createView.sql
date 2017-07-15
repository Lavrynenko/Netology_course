/******************************************************************************************
		Create view for  Responsibility   
*******************************************************************************************/


/****** Object:  View [dbo].[V_Installation_responsibility]    ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[V_Installation_responsibility]') AND OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[V_Installation_responsibility]
GO


/* Create the view*/
CREATE VIEW [dbo].[V_Installation_responsibility]
AS
SELECT     id_responsibility, idr_fin, 
	   INSTALLATIONSITE AS ins_InstallationSite, 
	   FINRESPONSIBILITY AS ins_FinResponsibility, 
	   RANKFROM AS ins_RankFrom, 
           RANKTO AS ins_RankTo, 
	   STDSIGLUM AS ins_StdSiglum, 
	   Resp_ConfigSet AS ins_ConfigSet, 
	   MSNEFFRANGE AS ins_Msn, 
           MANUFACTURING AS ins_manufacturing, 
	   NAME AS ins_name, 
	   reasonforchange AS ins_reasonforchange, 
	   SVMAJ_Resp AS ins_SVMAJ_Resp, 
           DataOrigin AS ins_DataOrigin, 
	   VERSIGLUM AS ins_VerSiglum,
	   RESP_HoVDMURelevant as ins_HoVDMURelevant,  
	   RESP_HoVFINCategory  as  ins_HoVFINCategory   
FROM         dbo.T_Responsibility
WHERE     (FINRESPONSIBILITY LIKE 'Installation')










