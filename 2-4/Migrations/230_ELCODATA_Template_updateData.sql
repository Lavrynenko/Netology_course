------------------------------------------------------------------------------------
---------------------------------------- TEMPLATE ---------------------------------
------------------------------------------------------------------------------------


/* Updation of template for 'Associated FIN DS'  */

UPDATE T_TEMPLATE
	SET
	template_SQL = 	' SELECT name +''##FIN DS#Name#''+ CONVERT(VARCHAR, id_ds) as [Associated Primary DS (Struc)], Category as [Category], SystemViewStatus as [State], ReasonNotRecordedAIR as [Reason not recorded AIR]  FROM T_LINK_FIN_DS_FIN_CI JOIN R_FIN_DS ON R_FIN_DS.id_ds = T_LINK_FIN_DS_FIN_CI.idr_ds WHERE T_LINK_FIN_DS_FIN_CI.idr_fin =#id_fin#',
	template_title = 'Associated TOP FIN DS'
WHERE template_label = 'Asso_DS'


