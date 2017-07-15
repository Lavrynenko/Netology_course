/****** Object:  StoredProcedure [dbo].[sp_Template_FINDS_data_cons]    Script Date: 05/11/2012 10:24:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[sp_Template_FINDS_data_cons]
    @PS_FIN_CI_Reference    VARCHAR(100)
AS
	Declare
	 @v_air varchar(10),
	 @v_ca varchar(5),
	 @v_version varchar(10),
	 @v_vrank integer,
	 @v_ds varchar(18),
	 @v_preair varchar(10),
	 @v_preca varchar(5),
	 @v_preds varchar(18),
	 @v_prever varchar(10),
	 @v_prevrank integer,
	 @v_range varchar(400),
	 @v_MSNrange varchar(400),
	 @v_HOVfincat varchar(400),
	 @v_HOVdmu varchar(400),
	 @v_preMSNrange varchar(400),
	 @v_msn varchar(4),
	 @v_premsn varchar(4),
	 @v_seq varchar(1),
	 @withMSN varchar(1)


	--set @withMSN='Y'
	set @withMSN='N'
	set @v_preds = ''
	set @v_range = 'No valid FIN DS or no effective FIN DS found'

	-- 1015MK001 UA
	-- PRINT @PS_FIN_CI_Reference



--declare @PS_FIN_CI_Reference as varchar(200)
DECLARE @TSQL as varchar(8000)
--set @PS_FIN_CI_Reference = '%1015MK001 UA%'

IF EXISTS(SELECT * FROM sysobjects WHERE id = object_id(N'#@tmp_MSNRANGE') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE #@tmp_MSNRANGE

CREATE TABLE #@tmp_MSNRANGE (
		IDA3A5 VARCHAR(400),
		IDA3B5 VARCHAR(400),
		MSNEFFRANGE VARCHAR(400),
		HOVFINCATEGORY  VARCHAR(400),
		HOVDMURELEVANT  VARCHAR(400),
		MSNFROM  VARCHAR(400),
		MSNTO  VARCHAR(400)
);

set @TSQL = 'insert into #@tmp_MSNRANGE select *  from openquery(R_PSS_A380,''
SELECT
	tmpsv_EFFFINRESPONSIBILITY.IDA3A5,
	tmpsv_EFFFINRESPONSIBILITY.IDA3B5,
	tmpsv_EFFFINRESPONSIBILITY.MSNEFFRANGE,
	tmpsv_EFFFINRESPONSIBILITY.HOVFINCATEGORY,
	tmpsv_EFFFINRESPONSIBILITY.HOVDMURELEVANT,
	0 AS MSNFROM,
	0 AS MSNTO

FROM
	tmpsv_EFFFINRESPONSIBILITY
	JOIN tmpsv_FINRESPONSIBILITY ON tmpsv_FINRESPONSIBILITY.IDA2A2 = tmpsv_EFFFINRESPONSIBILITY.IDA3B5
	JOIN tmpsv_FIN ON tmpsv_FIN.IDA2A2 = tmpsv_EFFFINRESPONSIBILITY.IDA3A5
WHERE
	tmpsv_FINRESPONSIBILITY.FINRESPONSIBILITY = ''''Installation''''
	AND tmpsv_FIN.bname like ''''%'+@PS_FIN_CI_Reference+'%'''''')'

exec(@TSQL)

--select * from 	#@tmp_MSNRANGE

WHILE (SELECT count(*) FROM #@tmp_MSNRANGE WHERE CHARINDEX(',', MSNEFFRANGE) > 0) > 0
BEGIN
	INSERT INTO
		#@tmp_MSNRANGE
	SELECT
		IDA3A5,
		IDA3B5,
		LEFT(MSNEFFRANGE, CHARINDEX(',', MSNEFFRANGE)-1) AS MSNEFFRANGE,
		HOVFINCATEGORY,
		HOVDMURELEVANT,
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

	--select * from 	#@tmp_MSNRANGE


IF EXISTS(SELECT * FROM sysobjects WHERE id = object_id(N'#@tmp_templateFINDS_data_cons') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE #@tmp_templateFINDS_data_cons

CREATE TABLE #@tmp_templateFINDS_data_cons (
		bname VARCHAR(400),
		versioncode VARCHAR(400),
		vrank VARCHAR(400),
		msn  VARCHAR(400),
		range  VARCHAR(400),
		HOVFINCATEGORY VARCHAR(400),
		HOVDMURELEVANT VARCHAR(400),
		AIRRecorded  VARCHAR(400),
		CACode  VARCHAR(400)
);

SELECT  @TSQL = 'INSERT INTO #@tmp_templateFINDS_data_cons SELECT
	DS,
	versioncode,
	vrank,
	msn,
	range,
	HOVFINCATEGORY,
	HOVDMURELEVANT,
	AIRRecorded,
	CACode
 FROM OPENQUERY(R_PSS_A380,
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
	and ds.bname like  ''''%' + @PS_FIN_CI_Reference + '%'''' and ds.statestate not in (''''INVALID'''',''''DELETED'''')
	and ds.dstype=''''serial''''
	order by
	 ds.bname
	,aat.versioncode
	,cast(aat.versionrank as integer)'') AS LISTOFDS
	JOIN
	#@tmp_MSNRANGE ON #@tmp_MSNRANGE.IDA3A5 = LISTOFDS.IDFIN
					AND LISTOFDS.msn >= #@tmp_MSNRANGE.MSNFROM
					AND LISTOFDS.msn <= #@tmp_MSNRANGE.MSNTO
	'
	exec(@TSQL)

	DECLARE Req_cursor CURSOR FOR

	select * from #@tmp_templateFINDS_data_cons

	BEGIN

	  DECLARE @DATA TABLE (
		FINDS VARCHAR(18),
		Effectivity VARCHAR(400),
		MSNRange VARCHAR(400),
		AIRRec VARCHAR(10),
		CACode VARCHAR(5));

		OPEN Req_cursor
	    -- Loop on cursor
	  FETCH NEXT FROM Req_cursor INTO @v_ds, @v_version, @v_vrank, @v_msn, @v_MSNrange, @v_HOVfincat, @v_HOVdmu, @v_air, @v_ca
	  WHILE (@@FETCH_STATUS <> -1)
	  BEGIN
	    -- Change of FIN DS
	    if @v_preds <> @v_ds
	    begin
	      -- Not first row
	      if @v_preds <> ''
	      begin
	        if @v_seq = 'Y'
	        begin
	          set @v_range = @v_range + '-' + cast(@v_prevrank as varchar)
	          if @withMSN='Y' set @v_range = @v_range + '('+@v_preMSN+')'
	        end

	        IF NOT (@v_preds IS NULL OR @v_preds = '')
		        INSERT INTO @DATA (FINDS, Effectivity, MSNRange, AIRRec, CACode) VALUES (@v_preds, @v_range, @v_preMSNrange, @v_preair, @v_preca)

	      end
	      -- Init previous data
	      set @v_preds=@v_ds
	      set @v_preMSNrange=@v_MSNrange
	      set @v_preair = @v_air
	      set @v_preca = @v_ca
	      set @v_prever = @v_version
	      set @v_prevrank=@v_vrank
	      set @v_range = @v_version+' '+cast(@v_vrank as varchar)
	      if @withMSN='Y' set @v_range = @v_range +'('+@v_msn+')'
	      set @v_seq = 'N'
	    end
	    -- Same FIN DS
	    else
	    begin
	      -- Same customer version
	      if @v_prever = @v_version
	      begin
	        -- Consecutive MSN in Customer Version
	        if @v_prevrank +1 = @v_vrank
	        begin
	          set @v_seq = 'Y'
	          set @v_prevrank=@v_vrank
	          set @v_premsn=@v_msn
	        end
	        -- Jump in MSN sequence into Customer Version
	        else
	        begin
	          if @v_seq = 'Y'
	          begin
	           set @v_range = @v_range + '-' + cast(@v_prevrank as varchar)
	           if @withMSN='Y' set @v_range = @v_range + '('+@v_preMSN+')'
	          end
	          set @v_range = @v_range + ','
	          set @v_prevrank=@v_vrank
	          set @v_premsn=@v_msn
	          set @v_range = @v_range + cast(@v_prevrank as varchar)
	          if @withMSN='Y' set @v_range = @v_range + '('+@v_preMSN+')'
	          set @v_seq = 'N'
	        end
	      set @v_premsn = @v_msn
	      end
	      -- Customer version change
	      else
	      begin
	          -- Customer version sequence --> add last Rank(MSN)
	          if @v_seq = 'Y'
	          begin
	            set @v_range = @v_range + '-' + cast(@v_prevrank as varchar)
	            if @withMSN='Y' set @v_range = @v_range + '('+@v_preMSN+')'
	          end
	          -- Init data for next Customer Version
	          set @v_prever = @v_version
	          set @v_range = @v_range + ' '+@v_version+' '+cast(@v_vrank as varchar)
	          if @withMSN='Y' set @v_range = @v_range + '('+@v_msn+')'
	          set @v_prevrank=@v_vrank
	          set @v_seq = 'N'
	      end
	    end

	   -- Fetch next row from cursor
	   FETCH NEXT FROM Req_cursor INTO @v_ds, @v_version, @v_vrank, @v_msn, @v_MSNrange,@v_HOVfincat, @v_HOVdmu,  @v_air, @v_ca

	  END

	  if @v_seq = 'Y'
	  begin
	    set @v_range = @v_range + '-' + cast(@v_prevrank as varchar)
	    if @withMSN='Y' set @v_range = @v_range + '('+@v_preMSN+')'
	  end

	  IF NOT (@v_preds IS NULL OR @v_preds = '')
		  INSERT INTO @DATA (FINDS, Effectivity, MSNRange, AIRRec, CACode) VALUES (@v_preds, @v_range, @v_preMSNrange, @v_preair, @v_preca)


	  CLOSE Req_cursor
	  DEALLOCATE Req_cursor
	END

	--SELECT FINDS AS [FIN DS number], Effectivity AS [Eff by Customer Version & Rank],
	--	MSNRange AS [Effectivity by MSN], AIRRec AS [AIR Recorded], CACode AS [CA Code] FROM @DATA

	SELECT 	DISTINCT
		data.FINDS AS [FIN DS number],
		data.Effectivity AS [Eff by Customer Version & Rank],
		data.MSNRange AS [Effectivity by MSN],
		#@tmp_templateFINDS_data_cons.HOVFINCATEGORY AS [HOV FIN Category],
		CASE WHEN #@tmp_templateFINDS_data_cons.HOVDMURELEVANT = '0' THEN 'False' ELSE 'True' END AS [HOV DMU Relevant],
		data.AIRRec AS [AIR Recorded],
		data.CACode AS [CA Code]
	FROM
		@DATA as data
		JOIN #@tmp_templateFINDS_data_cons on	#@tmp_templateFINDS_data_cons.range = data.MSNRange
												AND #@tmp_templateFINDS_data_cons.bname = data.FINDS


