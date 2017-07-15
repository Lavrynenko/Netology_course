DECLARE
	@TemplateLabel			VARCHAR(255),
	@TemplateSQL			VARCHAR(8000),
	@TemplateTitle			VARCHAR(255),
	@TemplateIsDisplayed		VARCHAR(255)	
	
	--
	-- SIRD - ESDCR LINKED SERVER FOR FDDSI
	SET @TemplateLabel			=	'SIRD_FDDSI_ESDCR_LINKED_SERVER'
	SET @TemplateSQL			=	'	SELECT  
										*
									FROM OPENQUERY(R_ESDCR_A350, 
											''SELECT
										FDDSReference,
										REPLACE(T_FDDS.FDDSReference,LEFT(T_FDDS.FDDSReference,14),'''''''') AS FDDSIssue, 
										T_FDDS.FDDSMaturityLevel, 
										T_FDDS.FDDSStatus,
										REPLACE (''''?action=detail_form&data=FDDS&data_id=#data_id#'''', ''''#data_id#'''', FDDS_id) AS FDDSLink
									FROM
										T_FDDS 
										JOIN (	SELECT
													*
												FROM
													T_FDCI 
												WHERE 
													FDCISWRDReference = ''''#SWRDReference#'''') as sortedFDCI 
											ON T_FDDS.FDDS_FDCI_idr = sortedFDCI.FDCI_id
									ORDER BY 
										FDDSReference, 
										LEFT(REPLACE(T_FDDS.FDDSReference,LEFT(T_FDDS.FDDSReference,12),''''''''),2), 
										REPLICATE(''''0'''', 3 - LEN(REPLACE(T_FDDS.FDDSReference,LEFT(T_FDDS.FDDSReference,14),''''''''))) + REPLACE(T_FDDS.FDDSReference,LEFT(T_FDDS.FDDSReference,14),'''''''')
									'')AS OQ_ESDCR_FDDS'

	SET @TemplateTitle			=	'LINK SIRD -> FDDS_ESDCR_LINKED_SERVER'
	SET @TemplateIsDisplayed	=	'0'

	PRINT '________________________________________________________________________'
	if (not exists(select * from T_TEMPLATE where template_label = @TemplateLabel)) 
	begin
		print('New template inserted');
		INSERT INTO T_TEMPLATE
		(
			template_label,
			template_SQL,
			template_title,
			template_isDisplayed
		)
		VALUES
		(
			@TemplateLabel,
			@TemplateSQL, 
			@TemplateTitle, 
			0
		)
	end
	else
	begin
		print('Template Updataded');
		UPDATE	T_TEMPLATE SET 
			template_SQL		=	@TemplateSQL,
			template_title		=	@TemplateTitle,
			template_isDisplayed	=	0
		WHERE template_label = @TemplateLabel
	end

	--
	-- SIRD - ESDCR LINKED SERVER FOR BDDS
	--
	SET @TemplateLabel			=	'SIRD_BDDS_ESDCR_LINKED_SERVER'
	SET @TemplateSQL			=	'	SELECT  
										*
									FROM OPENQUERY(R_ESDCR_A350, 
											''SELECT
										BDDSReference,
										REPLACE(T_BDDS.BDDSReference,LEFT(T_BDDS.BDDSReference,14),'''''''') AS BDDSIssue, 
										T_BDDS.BDDSMaturityLevel, 
										T_BDDS.BDDSStatus,
										REPLACE (''''?action=detail_form&data=BDDS&data_id=#data_id#'''', ''''#data_id#'''', BDDS_id) AS BDDSLink
									FROM
										T_BDDS 
										JOIN (	SELECT
													*
												FROM
													T_BDCI 
												WHERE 
													BDCISWRDReference = ''''#SWRDReference#'''') as sortedBDCI 
											ON T_BDDS.BDDS_BDCI_idr = sortedBDCI.BDCI_id
									ORDER BY 
										BDDSReference, 
										LEFT(REPLACE(T_BDDS.BDDSReference,LEFT(T_BDDS.BDDSReference,12),''''''''),2), 
										REPLICATE(''''0'''', 3 - LEN(REPLACE(T_BDDS.BDDSReference,LEFT(T_BDDS.BDDSReference,14),''''''''))) + REPLACE(T_BDDS.BDDSReference,LEFT(T_BDDS.BDDSReference,14),'''''''')
									'')AS OQ_ESDCR_BDDS'

	SET @TemplateTitle			=	'LINK SIRD -> BDDS_ESDCR_LINKED_SERVER'
	SET @TemplateIsDisplayed	=	'0'

	PRINT '________________________________________________________________________'
	if (not exists(select * from T_TEMPLATE where template_label = @TemplateLabel)) 
	begin
		INSERT INTO T_TEMPLATE
		(
			template_label,
			template_SQL,
			template_title,
			template_isDisplayed
		)
		VALUES
		(
			@TemplateLabel,
			@TemplateSQL, 
			@TemplateTitle, 
			0
		)
	end
	else
	begin
		UPDATE	T_TEMPLATE SET 
			template_SQL		=	@TemplateSQL,
			template_title		=	@TemplateTitle,
			template_isDisplayed	=	0
		WHERE template_label = @TemplateLabel
	end
	