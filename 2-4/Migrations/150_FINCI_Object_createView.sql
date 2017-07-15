/******************************************************************************************
		Create view for  R_FIN_CI   
*******************************************************************************************/



IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[V_ASS_SUB_FIN_CI]') AND OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[V_ASS_SUB_FIN_CI]
GO

CREATE VIEW [dbo].[V_ASS_SUB_FIN_CI]
AS
	SELECT   Id_fin as id_asssubci, FIN as ASSFINCI_name 
		FROM         dbo.R_FIN_CI  
	JOIN T_link_fin_ds_fin_ci  
		ON  R_FIN_CI.id_fin = T_link_fin_ds_fin_ci.idr_fin
	WHERE T_link_fin_ds_fin_ci.linktype = 'LRI'













