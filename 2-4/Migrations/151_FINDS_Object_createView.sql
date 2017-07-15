/******************************************************************************************
		Create view for  R_FIN_DS   
*******************************************************************************************/



IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[V_ASS_TOP_FIN_DS]') AND OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[V_ASS_TOP_FIN_DS]
GO

CREATE VIEW dbo.V_ASS_TOP_FIN_DS
AS
	SELECT    Id_ds as  id_asstopds, name as ASSFINDS_name 
		FROM         dbo.R_FIN_DS 
	JOIN T_link_fin_ds_fin_ci  
		ON  R_FIN_DS.id_ds = T_link_fin_ds_fin_ci.idr_ds
	WHERE T_link_fin_ds_fin_ci.linktype = 'LRI'













