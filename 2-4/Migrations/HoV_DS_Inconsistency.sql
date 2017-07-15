IF EXISTS (    SELECT * FROM dbo.sysobjects
                WHERE id = object_id(N'[dbo].[sp_HOV_DS_Inconsistency]')
                AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[sp_HOV_DS_Inconsistency]
GO

CREATE PROCEDURE [dbo].[sp_HOV_DS_Inconsistency]
AS

	Declare
	 @programLetter varchar(1),
	 @program varchar(5)


	--set @withMSN='Y'
	set @programLetter='L'
	set @program='A380'

	-- 1015MK001 UA
	-- PRINT @PS_FIN_CI_Reference



--declare @PS_FIN_CI_Reference as varchar(200)
DECLARE @TSQL as varchar(8000)
--set @PS_FIN_CI_Reference = '%5323HW%'

--IF EXISTS(SELECT * FROM sysobjects WHERE id = object_id(N'#@tmp_MSNRANGE') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)


CREATE TABLE #@tmp_MSNRANGE_ALL (
		IDA3A5 VARCHAR(400),
		IDA3B5 VARCHAR(400),
		MSNEFFRANGE VARCHAR(8000),
		MSNEFFRANGE_ORIGIN VARCHAR(8000),
		HOVFINCATEGORY  VARCHAR(400),
		HOVDMURELEVANT  VARCHAR(400),
		INSTALLATIONSITE VARCHAR(400),
		RANKFROM VARCHAR(400),
		RANKTO VARCHAR(400),
		STDSIGLUM VARCHAR(400),
		VERSIGLUM VARCHAR(400),
		MSNFROM  VARCHAR(400),
		MSNTO  VARCHAR(400)
);

set @TSQL = 'insert into #@tmp_MSNRANGE_ALL select *  from openquery(R_PSS_'+@program+',''
SELECT
	tmpsv_EFFFINRESPONSIBILITY.IDA3A5,
	tmpsv_EFFFINRESPONSIBILITY.IDA3B5,
	isnull(tmpsv_EFFFINRESPONSIBILITY.MSNEFFRANGE,''''''''),
	isnull(tmpsv_EFFFINRESPONSIBILITY.MSNEFFRANGE,''''''''),
	isnull(tmpsv_EFFFINRESPONSIBILITY.HOVFINCATEGORY,''''''''),
	isnull(CONVERT(VARCHAR(400),tmpsv_EFFFINRESPONSIBILITY.HOVDMURELEVANT),''''''''),	
	isnull(tmpsv_FINRESPONSIBILITY.INSTALLATIONSITE,''''''''),
	tmpsv_EFFFINRESPONSIBILITY.RANKFROM,
	tmpsv_EFFFINRESPONSIBILITY.RANKTO,
	isnull(tmpsv_EFFFINRESPONSIBILITY.STDSIGLUM,''''''''),
	isnull(tmpsv_EFFFINRESPONSIBILITY.VERSIGLUM,''''''''),
	0 AS MSNFROM,
	0 AS MSNTO

FROM
	tmpsv_EFFFINRESPONSIBILITY
	JOIN tmpsv_FINRESPONSIBILITY ON tmpsv_FINRESPONSIBILITY.IDA2A2 = tmpsv_EFFFINRESPONSIBILITY.IDA3B5
	JOIN tmpsv_FIN ON tmpsv_FIN.IDA2A2 = tmpsv_EFFFINRESPONSIBILITY.IDA3A5
WHERE
	tmpsv_FINRESPONSIBILITY.FINRESPONSIBILITY = ''''Installation''''
	'')'

--AND tmpsv_FIN.bname like ''''%'+@PS_FIN_CI_Reference+'%''''''

exec(@TSQL)


--Filter 1: It is not possible to have conflict with a FIN CI linked with only one responsibility. All this case must be deleted.
SELECT
	* 
INTO 
	#@tmp_MSNRANGE_filter1 
FROM 	
	#@tmp_MSNRANGE_ALL 
WHERE 
	IDA3A5 in 
		(SELECT DISTINCT  
			IDA3A5 
		FROM 
			#@tmp_MSNRANGE_ALL 
		GROUP BY 
			IDA3A5  
		HAVING 
			COUNT(*) > 1 ) 
			
--Filter 2: For one FIN CI, it is not possible to have conflict if all responsibility have the same couple HOVFINCATEGORY/HOVDMURELEVANT. All this data must be deleted.
SELECT
	*
INTO
	#@tmp_MSNRANGE
FROM
	#@tmp_MSNRANGE_filter1
WHERE
	#@tmp_MSNRANGE_filter1.IDA3A5 in (
		SELECT 
			ida3a5 
		FROM
		(
			SELECT DISTINCT 
				IDa3a5, HOVFINCATEGORY,HOVDMURELEVANT 
			FROM 
				#@tmp_MSNRANGE_filter1 
			GROUP BY 
				IDa3a5, HOVFINCATEGORY,HOVDMURELEVANT) as temp
		GROUP BY 
			IDA3A5 
		HAVING COUNT(*) > 1)



WHILE (SELECT count(*) FROM #@tmp_MSNRANGE WHERE CHARINDEX(',', MSNEFFRANGE) > 0) > 0
BEGIN
	INSERT INTO
		#@tmp_MSNRANGE
	SELECT
		IDA3A5,
		IDA3B5,
		LEFT(MSNEFFRANGE, CHARINDEX(',', MSNEFFRANGE)-1) AS MSNEFFRANGE,
		MSNEFFRANGE_ORIGIN,
		HOVFINCATEGORY,
		HOVDMURELEVANT,
		INSTALLATIONSITE,
		RANKFROM,
		RANKTO,
		STDSIGLUM,
		VERSIGLUM,
		MSNFROM,
		MSNTO
	FROM
		#@tmp_MSNRANGE
	WHERE
		CHARINDEX(',', MSNEFFRANGE) >0

	UPDATE
		#@tmp_MSNRANGE
	SET
		MSNEFFRANGE = RIGHT(MSNEFFRANGE, LEN(MSNEFFRANGE)-CHARINDEX(',', MSNEFFRANGE))
	WHERE
		CHARINDEX(',', MSNEFFRANGE) >0
END

UPDATE
	#@tmp_MSNRANGE
SET
	MSNFROM =
		CASE
			WHEN CHARINDEX('-', MSNEFFRANGE) > 0 THEN CONVERT(INT, LEFT(MSNEFFRANGE, CHARINDEX('-', MSNEFFRANGE) - 1))
		ELSE
			ISNULL(CONVERT(INT, MSNEFFRANGE), 0)
		END,
	MSNTO =
		CASE
			WHEN CHARINDEX('-', MSNEFFRANGE) > 0 THEN CONVERT(INT, RIGHT(MSNEFFRANGE, LEN(MSNEFFRANGE) - CHARINDEX('-', MSNEFFRANGE)))
		ELSE
			ISNULL(CONVERT(INT, MSNEFFRANGE), 0)
		END
FROM
	#@tmp_MSNRANGE


select * into #@tmp_MSNRANGE_DEF
from
#@tmp_MSNRANGE as InstResp
join  (select *  from openquery(R_PSS_A380,'
SELECT
	tmpsv_EFFFINRESPONSIBILITY.IDA3A5 as FIN_DEF,
	tmpsv_EFFFINRESPONSIBILITY.IDA3B5 as ID_DEF,
	tmpsv_obs.BWTPARTNUMBER + '' - '' + tmpsv_obs.BNAME as OBS_DEF,
	tmpsv_FINRESPONSIBILITY.DESIGNFOCALPOINT,
	isnull(tmpsv_EFFFINRESPONSIBILITY.MSNEFFRANGE,'''') as MSNEFRANGE_DEF,
	0 AS MSNFROM_DEF,
	0 AS MSNTO_DEF
FROM
	tmpsv_EFFFINRESPONSIBILITY
	JOIN tmpsv_FINRESPONSIBILITY ON tmpsv_FINRESPONSIBILITY.IDA2A2 = tmpsv_EFFFINRESPONSIBILITY.IDA3B5
	JOIN tmpsv_FIN ON tmpsv_FIN.IDA2A2 = tmpsv_EFFFINRESPONSIBILITY.IDA3A5
	JOIN tmpsv_obsresponsibility ON tmpsv_obsresponsibility.IDA3B5 = tmpsv_FINRESPONSIBILITY.IDA2A2
	JOIN tmpsv_OBS on tmpsv_OBS.IDA2A2 = tmpsv_obsresponsibility.IDA3A5
WHERE
	tmpsv_FINRESPONSIBILITY.FINRESPONSIBILITY = ''Definition''
	')) as DefResp on InstResp.IDA3A5 = DefResp.FIN_DEF


WHILE (SELECT count(*) FROM #@tmp_MSNRANGE_DEF WHERE CHARINDEX(',', MSNEFRANGE_DEF) > 0) > 0
BEGIN
	INSERT INTO
		#@tmp_MSNRANGE_DEF
	SELECT
		IDA3A5,
		IDA3B5,
		MSNEFFRANGE,
		MSNEFFRANGE_ORIGIN,
		HOVFINCATEGORY,
		HOVDMURELEVANT,
		INSTALLATIONSITE,
		RANKFROM,
		RANKTO,
		STDSIGLUM,
		VERSIGLUM,
		MSNFROM,
		MSNTO,
		FIN_DEF,
		ID_DEF,
		OBS_DEF,
		DESIGNFOCALPOINT,
		MSNEFRANGE_DEF,
		MSNFROM_DEF,
		MSNTO_DEF
	FROM
		#@tmp_MSNRANGE_DEF
	WHERE
		CHARINDEX(',', MSNEFRANGE_DEF) >0

	UPDATE
		#@tmp_MSNRANGE_DEF
	SET
		MSNEFRANGE_DEF = RIGHT(MSNEFRANGE_DEF, LEN(MSNEFRANGE_DEF)-CHARINDEX(',', MSNEFRANGE_DEF))
	WHERE
		CHARINDEX(',', MSNEFRANGE_DEF) >0
END

UPDATE
	#@tmp_MSNRANGE_DEF
SET
	MSNFROM_DEF =
		CASE
			WHEN CHARINDEX('-', MSNEFRANGE_DEF) > 0 THEN CONVERT(INT, LEFT(MSNEFRANGE_DEF, CHARINDEX('-', MSNEFRANGE_DEF) - 1))
		ELSE
			ISNULL(CONVERT(INT, MSNEFRANGE_DEF), 0)
		END,
	MSNTO_DEF =
		CASE
			WHEN CHARINDEX('-', MSNEFRANGE_DEF) > 0 THEN CONVERT(INT, RIGHT(MSNEFRANGE_DEF, LEN(MSNEFRANGE_DEF) - CHARINDEX('-', MSNEFRANGE_DEF)))
		ELSE
			ISNULL(CONVERT(INT, MSNEFRANGE_DEF), 0)
		END
FROM
	#@tmp_MSNRANGE_DEF
	
--	select * from #@tmp_MSNRANGE_DEF where DESIGNFOCALPOINT = 'BOSSY Frank/th32a2' and MSNEFRANGE_DEF like '%9505%'


--DECLARE @TSQL as varchar(8000)
--IF EXISTS(SELECT * FROM sysobjects WHERE id = object_id(N'#@tmp_templateFINDS_data_cons') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
--DROP TABLE #@tmp_templateFINDS_data_cons

CREATE TABLE #@tmp_templateFINDS_data_cons (
		bname VARCHAR(400),
		versioncode VARCHAR(400),
		vrank VARCHAR(400),
		msn  VARCHAR(400),
		range  VARCHAR(8000),
		MSNEFFRANGE_ORIGIN VARCHAR(8000),
		HOVFINCATEGORY VARCHAR(400),
		HOVDMURELEVANT VARCHAR(400),
		INSTALLATIONSITE VARCHAR(400),
		RANKFROM VARCHAR(400),
		RANKTO VARCHAR(400),
		STDSIGLUM VARCHAR(400),
		VERSIGLUM VARCHAR(400),
		AIRRecorded  VARCHAR(400),
		CACode  VARCHAR(400),
		OBS_DEF VARCHAR(400),
		DESIGNFOCALPOINT VARCHAR(400),
		MSNEFRANGE_DEF VARCHAR(8000)
		
);

SELECT  @TSQL = 'INSERT INTO #@tmp_templateFINDS_data_cons SELECT
	DS,
	versioncode,
	vrank,
	msn,
	range,
	MSNEFFRANGE_ORIGIN,
	HOVFINCATEGORY,
	HOVDMURELEVANT,
	INSTALLATIONSITE,
	RANKFROM,
	RANKTO,
	STDSIGLUM,
	VERSIGLUM,
	AIRRecorded,
	CACode,
	OBS_DEF,
	isnull(DESIGNFOCALPOINT,'''') as DESIGNFOCALPOINT,
	MSNEFRANGE_DEF
 FROM OPENQUERY(R_PSS_'+@program+',
''select
	 ci.ida2a2 AS IDFIN
	 ,ds.bname DS
	,aat.versioncode
	,cast(aat.versionrank as integer) vrank
	,dsmsn.msn
	,dsmsnr.range
	,case ds.airrecorded when 0 then ''''False'''' when 1 then ''''True'''' end AIRRecorded
	,isnull(ds.sketch,''''Empty'''') CACode
	from
	 tmpsv_ds ds
	 join tmpsv_fin ci on ds.idci=ci.bida2a2
	 join tmpsv_dsmsnrangew dsmsnr on dsmsnr.bida2a2=ds.bida2a2 and dsmsnr.type=''''MSN''''
	 join tmpsv_dsmsn dsmsn on dsmsn.bida2a2=ds.bida2a2
	 join tmpsv_aceaat aat on dsmsn.msn=aat.msn and aat.configset=ci.bconfigset and aat.versioncode is not null
	where 0=0
	--and ds.bname like  ''''%' + '@PS_FIN_CI_Reference' + '%'''' 
	and ds.statestate not in (''''INVALID'''',''''DELETED'''')
	and ds.dstype=''''serial''''
	order by
	 ds.bname
	,aat.versioncode
	,cast(aat.versionrank as integer)'') AS LISTOFDS
	JOIN
	#@tmp_MSNRANGE_DEF ON #@tmp_MSNRANGE_DEF.IDA3A5 = LISTOFDS.IDFIN
					AND LISTOFDS.msn >= #@tmp_MSNRANGE_DEF.MSNFROM
					AND LISTOFDS.msn <= #@tmp_MSNRANGE_DEF.MSNTO
					AND LISTOFDS.msn >= #@tmp_MSNRANGE_DEF.MSNFROM_DEF
					AND LISTOFDS.msn <= #@tmp_MSNRANGE_DEF.MSNTO_DEF
	'
	exec(@TSQL)

--select * from #@tmp_templateFINDS_data_cons where MSNEFRANGE_DEF like '%9505%'

SELECT
	ATA.ATACode						AS [ATA],
	CI.FIN							AS [FIN CI Name],
	CI.FINCategory					AS [FIN CI FIN Category],	
	CI.FINCI_DMURelevant			AS [FIN CI DMU Relevant],
	CI.TEAMNAME						AS [FIN CI Team Name],
	DS.Name							AS [FIN DS Name],
	DS.DSEffectivity				AS [FIN DS Effectivity],
	DS.DS_CA_CI						AS [FIN DS CA Code],
	MOD.MODReference				AS [MOD Number],
	MP.MPReference					AS [MP Number],
	DATA_SV.DESIGNFOCALPOINT		AS [Def. Design Focal Point],
	DATA_SV.OBS_DEF					AS [Def. OBS],
	--DATA_SV.MSNEFRANGE_DEF			AS [Def. EFF],
	DATA_SV.INSTALLATIONSITE		AS [Inst. site],
	DATA_SV.RANKFROM				AS [Inst. Rank From],
	DATA_SV.RANKTO					AS [Inst. Rank To],
	DATA_SV.STDSIGLUM				AS [Inst. Standard],
	DATA_SV.VERSIGLUM				AS [Inst. Version],
	DATA_SV.[HOV FIN Category]		AS [HOV FIN Category],
	DATA_SV.[HOV DMU Relevant]		AS [HOV DMU Relevant],
	DATA_SV.MSNEFFRANGE_ORIGIN		AS [Inst. Validity]
FROM	
	R_FIN_CI								AS CI
	LEFT JOIN R_ATA							AS ATA			ON ATA.id_ATA			= CI.idr_ata
	LEFT JOIN R_FIN_DS						AS DS			ON DS.idr_fin			= CI.id_fin
	LEFT JOIN (	SELECT 
					idr_ds_post, 
					max(idr_mp) AS idr_mp
				FROM 
					t_impactds 
				GROUP BY 
					idr_ds_post)			AS IMPACTDS		ON IMPACTDS.idr_ds_post = DS.id_ds
	LEFT JOIN T_MP							AS MP			ON MP.id_mp				= IMPACTDS.idr_mp
	LEFT JOIN (	SELECT 
					idr_mp, 
					max(idr_mod) AS idr_mod 
				FROM 
					T_LINK_MOD_MP 
				GROUP BY 
					idr_mp	)				AS LINK_MOD_MP	ON LINK_MOD_MP.idr_mp		= MP.id_mp
	LEFT JOIN T_MOD							AS MOD			ON MOD.id_mod				= LINK_MOD_MP.idr_mod
	JOIN (
				SELECT 	DISTINCT
					@programLetter+#@tmp_templateFINDS_data_cons.bname AS [FIN DS number],
					#@tmp_templateFINDS_data_cons.range AS [Effectivity by MSN],
					MSNEFFRANGE_ORIGIN,
					#@tmp_templateFINDS_data_cons.HOVFINCATEGORY AS [HOV FIN Category],
					CASE WHEN #@tmp_templateFINDS_data_cons.HOVDMURELEVANT = '0' THEN 'False' ELSE 'True' END AS [HOV DMU Relevant],
					INSTALLATIONSITE,
					RANKFROM,
					RANKTO,
					STDSIGLUM,
					VERSIGLUM,
					#@tmp_templateFINDS_data_cons.AIRRecorded AS [AIR Recorded],
					#@tmp_templateFINDS_data_cons.CACode AS [CA Code],
					DESIGNFOCALPOINT,
					OBS_DEF,
					MSNEFRANGE_DEF
				FROM
					#@tmp_templateFINDS_data_cons 
				WHERE
					#@tmp_templateFINDS_data_cons.bname in (	SELECT temp.bname 
																FROM (	SELECT DISTINCT 
																			bname,
																			HOVFINCATEGORY,
																			HOVDMURELEVANT,
																			DESIGNFOCALPOINT,
																			OBS_DEF 
																		FROM 
																			#@tmp_templateFINDS_data_cons) AS temp
																GROUP BY 
																	temp.bname
																HAVING 
																	count(temp.bname) > 1))
											AS DATA_SV		ON DATA_SV.[FIN DS number]	= DS.fin_ds_sv
WHERE
	1 = 1
	AND DS.SystemViewStatus <> 'INVALID' 
	AND DS.SystemViewStatus <> 'DELETED'
ORDER BY
	ATA.[ATA],
	CI.[FIN CI Name],
	DS.[FIN DS Name]
														

														
GO


--
-- T_REPORT_GROUP Update
--
if (not exists (SELECT *
		FROM t_report_group
		WHERE report_group_label='Others'))
begin
	INSERT INTO t_report_group (report_group_label)
	SELECT 'Others'
end


--
-- T_DBACTIONS Update
--
DELETE FROM T_DBActions WHERE label='HoV DS Inconsistency'
INSERT INTO t_dbactions
(label, command, comments, report_group_idr, parameters)
SELECT
	'HoV DS Inconsistency',
	'sp_HOV_DS_Inconsistency',
	'- HoV DS Inconsistency',
	report_group_id,
	''

FROM
	t_report_group
WHERE
	report_group_label='Others'



