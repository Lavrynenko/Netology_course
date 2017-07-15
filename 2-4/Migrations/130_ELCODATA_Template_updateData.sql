------------------------------------------------------------------------------------
---------------------------------------- TEMPLATE ---------------------------------
------------------------------------------------------------------------------------


/* Updation of template for 'Associated FIN DS'  */

UPDATE T_TEMPLATE
	SET
	template_SQL = 	' SELECT name +''##FIN DS#Name#''+ CONVERT(VARCHAR, id_ds) as [Associated Primary DS (Struc)], Category as [Category], SystemViewStatus as [State], ReasonNotRecordedAIR as [Reason not recorded AIR], LinkType as [Link Type] FROM T_LINK_FIN_DS_FIN_CI JOIN R_FIN_DS ON R_FIN_DS.id_ds = T_LINK_FIN_DS_FIN_CI.idr_ds WHERE T_LINK_FIN_DS_FIN_CI.idr_fin =#id_fin#',
	template_title = 'Associated TOP FIN DS'
WHERE template_label = 'Asso_DS'


/* Updation of template for 'Definition responsibility'  */

UPDATE T_TEMPLATE
	SET
	template_SQL = 	' SELECT   DEFRESPNATCO as [Def Resp Nat Co],  DESIGNFOCALPOINT as [Design Focal Point],   OBS as [Def. OBS], RANKFROM as [Rank From],   RANKTO as [Rank To], STDSIGLUM as [Standard], VERSIGLUM as [Version], Resp_ConfigSet as [Config Set],   MSNEFFRANGE as [Validity], SVMAJ_Resp as [Flow Origin] FROM T_RESPONSIBILITY WHERE FINRESPONSIBILITY like ''Definition'' AND idr_fin= #id_fin# Order By STDSIGLUM , VERSIGLUM ,  RESP_RespTreePosition    '
WHERE template_label = 'DEFINITION_RESP'


/* Updation of template for 'Installation Design responsibility'  */

UPDATE T_TEMPLATE
	SET
	template_SQL = 	' SELECT   DELIVERYSITE as [Delivery Site],   OBS as [Ins. Des. OBS],   RANKFROM as [Rank From],   RANKTO as [Rank To],   STDSIGLUM as [Standard], VERSIGLUM as [Version],   Resp_ConfigSet as [Config Set],   MSNEFFRANGE as [Validity],  SVMAJ_Resp as [Flow Origin]  FROM T_RESPONSIBILITY   WHERE FINRESPONSIBILITY like ''Delivery''  AND idr_fin= #id_fin# Order By STDSIGLUM , VERSIGLUM,  RESP_RespTreePosition   '
WHERE template_label = 'Design_RESP'



/* Updation of template for 'Installation responsibility'  */

UPDATE T_TEMPLATE
	SET
	template_SQL = 	' SELECT   INSTALLATIONSITE as [Installation Site],  RANKFROM as [Rank From],   RANKTO as [Rank To],   STDSIGLUM as [Standard], VERSIGLUM as [Version],  Resp_ConfigSet as [Config Set],  RESP_HoVFINCategory  as [HoV FIN Category], RESP_HoVDMURelevant  as [HoV DMU Relevant],  MSNEFFRANGE as [Validity],   SVMAJ_Resp as [Flow Origin]  FROM T_RESPONSIBILITY   WHERE FINRESPONSIBILITY like ''Installation''  AND idr_fin= #id_fin# Order By STDSIGLUM , VERSIGLUM,  RESP_RespTreePosition   '
WHERE template_label = 'Install_RESP'


/* Updation of template for 'Provisioning responsibility'  */

UPDATE T_TEMPLATE
	SET
	template_SQL = 	'   SELECT   PROVISIONINGSITE as [Provisioning Site],   RANKFROM as [Rank From],   RANKTO as [Rank To],   STDSIGLUM as [Standard], VERSIGLUM as [Version],   Resp_ConfigSet as [Config Set],   MSNEFFRANGE as [Validity],  SVMAJ_Resp as [Flow Origin]  FROM T_RESPONSIBILITY   WHERE  FINRESPONSIBILITY like ''Provisioning''   AND idr_fin= #id_fin#   Order By STDSIGLUM , VERSIGLUM ,  RESP_RespTreePosition  '
WHERE template_label = 'Provis_RESP'




/* Updation of template for 'ASSOCIATED FIN CI'  */

UPDATE T_TEMPLATE SET
	template_SQL = 	' SELECT FIN + ''##FIN CI#FIN#'' + CONVERT(VARCHAR, id_fin) AS [Sub Component (Structure)], FunctionnalDesignation AS [Functional Designation] FROM T_LINK_FIN_DS_FIN_CI JOIN R_FIN_CI ON R_FIN_CI.id_fin = T_LINK_FIN_DS_FIN_CI.idr_fin WHERE idr_ds = #id_ds#',
	template_title = 'Associated Sub FIN CI'
WHERE template_label = 'FIN_DS_FIN_CI'