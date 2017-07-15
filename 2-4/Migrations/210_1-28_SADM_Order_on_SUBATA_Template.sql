DECLARE
	@TemplateLabel			VARCHAR(255),
	@TemplateSQL			VARCHAR(8000),
	@TemplateTitle			VARCHAR(255),
	@TemplateIsDisplayed	VARCHAR(255)



/******************************************************************************************************
		T_TEMPLATE Implementation
*******************************************************************************************************/
	--
	-- SIRD SUBATA LINK
	--
	SET @TemplateLabel			=	'SIRD_SUBATA'
	SET @TemplateSQL			=	'SELECT     CONVERT(VARCHAR, R_ATA.ATACode) + ''##ATA#ATACode#'' + CONVERT(VARCHAR, R_ATA.id_ata) [ATA Code], ATATitle 
										FROM    R_ATA INNER JOIN T_LINK_SIRD_ATA 
										ON 		R_ATA.id_ata = T_LINK_SIRD_ATA.idr_ata
										WHERE     (T_LINK_SIRD_ATA.idr_sird = #id_sird#)
										ORDER BY [ATA Code]'
	SET @TemplateTitle			=	'LINK SIRD -> SUBATA'
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
		print('Template Updataded');
		UPDATE	T_TEMPLATE SET 
			template_SQL		=	@TemplateSQL,
			template_title		=	@TemplateTitle,
			template_isDisplayed	=	0
		WHERE template_label = @TemplateLabel
	end

	--
	-- SWRD SUBATA LINK
	--
	SET @TemplateLabel			=	'SWRD_SUBATA'
	SET @TemplateSQL			=	'SELECT     CONVERT(VARCHAR, R_ATA.ATACode) + ''##ATA#ATACode#'' + CONVERT(VARCHAR, R_ATA.id_ata) [ATA Code], ATATitle 
										FROM    R_ATA INNER JOIN T_LINK_SWRD_ATA 
										ON 		R_ATA.id_ata = T_LINK_SWRD_ATA.idr_ata
										WHERE     (T_LINK_SWRD_ATA.idr_swrd = #id_swrd#)
										ORDER BY [ATA Code]'
	SET @TemplateTitle			=	'LINK SWRD -> SUBATA'
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
		print('Template Updataded');
		UPDATE	T_TEMPLATE SET 
			template_SQL		=	@TemplateSQL,
			template_title		=	@TemplateTitle,
			template_isDisplayed	=	0
		WHERE template_label = @TemplateLabel
	end
