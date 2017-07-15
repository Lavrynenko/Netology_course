-- Add Report

DECLARE
	@label VARCHAR(255),
	@page VARCHAR(255),
	@report_group VARCHAR(255),
	@idr_group INT,
	@id_report INT

--initialise variables
SET @label='ELCODATA TRACK EDD Change'
SET @report_group='ELCODATA'
SET @idr_group = 0
SET @id_report = 0

-- test if group already exist
SELECT
	@idr_group = REPORT_GROUP_ID
FROM
	T_REPORT_GROUP
WHERE
	REPORT_GROUP_LABEL = @report_group
--if not exist
if(@idr_group=0)
	BEGIN
		INSERT INTO T_REPORT_GROUP (REPORT_GROUP_LABEL)
		VALUES (@report_group)
		--store id
		SET @idr_group=@@IDENTITY
	END

-- test if report already exist 
SELECT
	@id_report = id
FROM
	T_DBACTIONS
WHERE
	label=@label
	AND report_group_idr=@idr_group

-- if not exist
if(@id_report = 0)
	BEGIN
		-- create new report
		INSERT INTO T_DBACTIONS (label,command,comments,template_page,parameters,report_commentary,mandatory_fields,report_group_idr)
		VALUES (@label,'sp_ChangeTrackEDD ''#beginDate#'',''#endDate#''','- Export changes for EDD between two dates',NULL,'Enter a start date (dd/mm/yyyy) :#beginDate#;Enter a end date (dd/mm/yyyy) :#endDate#','-  <strong>Start Date</strong> and <strong>End Date</strong> are mandatory<br>- Limited to 20 change per EDD','beginDate,endDate',@idr_group)
	END
ELSE
	BEGIN
		UPDATE
			T_DBACTIONS
		SET
			command = 'sp_ChangeTrackEDD ''#beginDate#'',''#endDate#''',
			comments = '- Export changes for EDD between two dates',
			template_page = NULL,
			parameters = 'Enter a start date (dd/mm/yyyy) :#beginDate#;Enter a end date (dd/mm/yyyy) :#endDate#',
			report_commentary = '- <strong>Start Date</strong> and <strong>End Date</strong> are mandatory<br>- Limited to 20 change per EDD',
			mandatory_fields = 'beginDate,endDate'
		WHERE
			id = @id_report
	END

	
	

-- Add Stored Procedure	
	
	
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ChangeTrackEDD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ChangeTrackEDD]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE [dbo].[sp_ChangeTrackEDD] @beginDate VARCHAR(50),@endDate VARCHAR(50)
AS
DECLARE
	@EDD_ref AS VARCHAR(255),
	@object_name AS VARCHAR(255),
	@action_data AS VARCHAR(4000),
	@id_table AS INT,
	@NB_res AS INT,
	@value_beg AS VARCHAR(255),
	@value_end AS VARCHAR(255),
	@NextString AS VARCHAR(4000),
 	@Pos AS INT,
	@NextPos AS INT,
	@Delimiter AS CHAR(1),
	@parser AS CHAR(2)

CREATE TABLE #ValueTable
	(
		Id_table INT IDENTITY,
		EDD VARCHAR(255),
		Object VARCHAR(255),
		New VARCHAR(255),
		Old VARCHAR(255)
	)

set dateformat dmy
set @Delimiter = ';'
SET @parser = '; '

-- date validity
IF ( (ISDATE(@beginDate)=1) AND (ISDATE(@endDate)=1) )
BEGIN
	--compare date
	if(@beginDate > @endDate)
	BEGIN
		SELECT 'The End Date is lower than Start date' as [NoResult]
	END
	ELSE
	BEGIN
		DECLARE CURSOR_changeTrack CURSOR FOR
		-- recuperate all modification for all EDD
			SELECT 
				t_history.ObjectReference,
				t_history.ActionData
			FROM 
				t_history
			WHERE
				ActionType='UPDATE EDD'
				AND ActionData NOT LIKE ''
				AND ActionDate >= CONVERT(DATETIME, @beginDate,103)
				AND ActionDate <= DATEADD(dd,1,CONVERT(DATETIME, @endDate,103))
		-- open cursor
		OPEN CURSOR_changeTrack
		-- first result
		FETCH NEXT FROM CURSOR_changeTrack INTO
			--initiate variable
			@EDD_ref,
			@action_data
		
		WHILE @@FETCH_STATUS = 0
			BEGIN  
				
				-- fonction split
				--Initialize
				set @NextString = ''
				
				--Get position of first Comma
				set @Pos = charindex(@Delimiter,@action_data)
				set @NextPos = 1
				 
				 --Loop while there is still a comma in the String of levels
				WHILE (@Pos <>  0)  
					 BEGIN
						  -- split value
						  set @NextString = LTRIM(RTRIM(substring(@action_data,1,@Pos - 1)))+@parser
						  SET @object_name = LTRIM(RTRIM(LEFT(@NextString,CHARINDEX(' : # ',@NextString))))
						  SET @value_beg = RIGHT(LEFT(@NextString,CHARINDEX(' # new = ',@NextString)),LEN(LEFT(@NextString,CHARINDEX(' # new = ',@NextString)))-CHARINDEX('=',LEFT(@NextString,CHARINDEX(' # new = ',@NextString))))
						  SET @value_end = RIGHT(LEFT(@NextString, CHARINDEX(' #;',@NextString)),LEN(@NextString)-CHARINDEX(' # new = ',@NextString)-LEN(' # new = ')-2)
							
						  -- test if attribute per EDD is mor lower than 20
						  SELECT 
							@NB_res = count(*)
						  FROM
							#ValueTable
						  WHERE
							EDD = @EDD_ref
					  

						  SET @id_table = 0  
							
						  -- Test IF EDD reference and object already exist
						  SELECT
							@id_table = Id_table
						  FROM
							#ValueTable
						  WHERE
							EDD = @EDD_ref
							AND Object = @object_name
					 	  --if atribute for EDD ref note exist and the EDD ref is not link with more than 20 attributes, insert
						  if(@id_table = 0 and @NB_res <20)
							  BEGIN
								INSERT INTO
									#ValueTable ( EDD,Object,New,Old) 
								Values (@EDD_ref,@object_name,@value_end,@value_beg)
							  END
						  ELSE -- update new value
						 	  BEGIN
								-- if association already exist
								if(@id_table > 0)
								BEGIN
									UPDATE
										#ValueTable
									SET
										New = @value_end
									WHERE
										Id_table = @id_table
								END
							  END
						 
						  -- traitement of variables
						  set @action_data = substring(@action_data,@Pos +1,len(@action_data))
						  set @NextPos = @Pos
						  set @Pos  = charindex(@Delimiter,@action_data)
					END
				-- next result
				FETCH NEXT FROM CURSOR_changeTrack INTO
					--initiate variable
					@EDD_ref,
					@action_data
			END
		
		--close cursor
		CLOSE CURSOR_changeTrack
		-- empty memory
		DEALLOCATE CURSOR_changeTrack
		
		-- display result
		SELECT
			#ValueTable.EDD AS [EDD REFERENCE],
			Infobase.object_name AS [FIELD MODIFIED],
			#ValueTable.Old AS [Value at Start Date],
			#ValueTable.New AS [Value at End Date]
		FROM 
			#ValueTable
			INNER JOIN Infobase ON Infobase.object_value=#ValueTable.object
		ORDER BY #ValueTable.EDD

		-- drop temporary table
		DROP table #ValueTable
	END
END
ELSE
BEGIN
	SELECT 'One or all dates is empty or the format is incorrect' as [NoResult]
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO