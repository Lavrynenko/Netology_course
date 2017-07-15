/* Updation of template for 'Definition responsibility'  */

UPDATE T_TEMPLATE
	SET
	template_SQL = 	' SELECT   DEFRESPNATCO as [Def Resp Nat Co],  DESIGNFOCALPOINT as [Design Focal Point],   OBS as [Def. OBS], RANKFROM as [Rank From],   RANKTO as [Rank To], STDSIGLUM as [Standard], VERSIGLUM as [Version], Resp_ConfigSet as [Config Set],   MSNEFFRANGE as [Validity], SVMAJ_Resp as [Flow Origin] FROM T_RESPONSIBILITY WHERE FINRESPONSIBILITY like ''Definition'' AND idr_fin= #id_fin# Order By isnull(STDSIGLUM,''ZZZZZ'') , VERSIGLUM ,  RESP_RespTreePosition    '
WHERE template_label = 'DEFINITION_RESP'


/* Updation of template for 'Installation Design responsibility'  */

UPDATE T_TEMPLATE
	SET
	template_SQL = 	' SELECT   DELIVERYSITE as [Delivery Site],   OBS as [Ins. Des. OBS],   RANKFROM as [Rank From],   RANKTO as [Rank To],   STDSIGLUM as [Standard], VERSIGLUM as [Version],   Resp_ConfigSet as [Config Set],   MSNEFFRANGE as [Validity],  SVMAJ_Resp as [Flow Origin]  FROM T_RESPONSIBILITY   WHERE FINRESPONSIBILITY like ''Delivery''  AND idr_fin= #id_fin# Order By isnull(STDSIGLUM,''ZZZZZ'') , VERSIGLUM,  RESP_RespTreePosition   '
WHERE template_label = 'Design_RESP'



/* Updation of template for 'Installation responsibility'  */

UPDATE T_TEMPLATE
	SET
	template_SQL = 	' SELECT   INSTALLATIONSITE as [Installation Site],  RANKFROM as [Rank From],   RANKTO as [Rank To],   STDSIGLUM as [Standard], VERSIGLUM as [Version],  Resp_ConfigSet as [Config Set],  RESP_HoVFINCategory  as [HoV FIN Category], RESP_HoVDMURelevant  as [HoV DMU Relevant],  MSNEFFRANGE as [Validity],   SVMAJ_Resp as [Flow Origin]  FROM T_RESPONSIBILITY   WHERE FINRESPONSIBILITY like ''Installation''  AND idr_fin= #id_fin# Order By isnull(STDSIGLUM,''ZZZZZ'') , VERSIGLUM,  RESP_RespTreePosition   '
WHERE template_label = 'Install_RESP'


/* Updation of template for 'Provisioning responsibility'  */

UPDATE T_TEMPLATE
	SET
	template_SQL = 	'   SELECT   PROVISIONINGSITE as [Provisioning Site],   RANKFROM as [Rank From],   RANKTO as [Rank To],   STDSIGLUM as [Standard], VERSIGLUM as [Version],   Resp_ConfigSet as [Config Set],   MSNEFFRANGE as [Validity],  SVMAJ_Resp as [Flow Origin]  FROM T_RESPONSIBILITY   WHERE  FINRESPONSIBILITY like ''Provisioning''   AND idr_fin= #id_fin#   Order By isnull(STDSIGLUM,''ZZZZZ'') , VERSIGLUM ,  RESP_RespTreePosition  '
WHERE template_label = 'Provis_RESP'
