-- Fichier : BD_PSE_02_nettoyage_tables_business.sql
-- Conserve au maximum 1000 enregistrements par table business
-- Le script n'effectue d'actions que sur les tables existantes

DECLARE @line_count INT



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[R_ATA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM R_ATA
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM R_ATA 
		WHERE id_ata NOT IN (SELECT TOP 1000 id_ata FROM R_ATA ORDER BY id_ata)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[R_SUPPLIER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM R_SUPPLIER
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM R_SUPPLIER 
		WHERE id_supplier NOT IN (SELECT TOP 1000 id_supplier FROM R_SUPPLIER ORDER BY id_supplier)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_ACTION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_ACTION
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_ACTION 
		WHERE id_action NOT IN (SELECT TOP 1000 id_action FROM T_ACTION ORDER BY id_action)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_CHECKDELIVERABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_CHECKDELIVERABLE
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_CHECKDELIVERABLE 
		WHERE id_checkDeliverable NOT IN (SELECT TOP 1000 id_checkDeliverable FROM T_CHECKDELIVERABLE ORDER BY id_checkDeliverable)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_CHECKWORKFLOW]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_CHECKWORKFLOW
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_CHECKWORKFLOW 
		WHERE id_checkWorkflow NOT IN (SELECT TOP 1000 id_checkWorkflow FROM T_CHECKWORKFLOW ORDER BY id_checkWorkflow)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_CIN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_CIN
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_CIN 
		WHERE id_cin NOT IN (SELECT TOP 1000 id_cin FROM T_CIN ORDER BY id_cin)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_DELTA0_FOLLOWUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_DELTA0_FOLLOWUP
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_DELTA0_FOLLOWUP 
		WHERE id_delta0 NOT IN (SELECT TOP 1000 id_delta0 FROM T_DELTA0_FOLLOWUP ORDER BY id_delta0)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_DELTA1_FOLLOWUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_DELTA1_FOLLOWUP
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_DELTA1_FOLLOWUP 
		WHERE id_delta1 NOT IN (SELECT TOP 1000 id_delta1 FROM T_DELTA1_FOLLOWUP ORDER BY id_delta1)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_INVOLVED_TEAM_MP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_INVOLVED_TEAM_MP
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_INVOLVED_TEAM_MP 
		WHERE id_itmp NOT IN (SELECT TOP 1000 id_itmp FROM T_INVOLVED_TEAM_MP ORDER BY id_itmp)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_INVOLVED_TEAM_REQ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_INVOLVED_TEAM_REQ
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_INVOLVED_TEAM_REQ 
		WHERE id_itreq NOT IN (SELECT TOP 1000 id_itreq FROM T_INVOLVED_TEAM_REQ ORDER BY id_itreq)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_LINK_MSN_POWERCENTER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_LINK_MSN_POWERCENTER
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_LINK_MSN_POWERCENTER 
		WHERE id_msnpc NOT IN (SELECT TOP 1000 id_msnpc FROM T_LINK_MSN_POWERCENTER ORDER BY id_msnpc)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_MEETING]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_MEETING
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_MEETING 
		WHERE id_meeting NOT IN (SELECT TOP 1000 id_meeting FROM T_MEETING ORDER BY id_meeting)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_MOD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_MOD
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_MOD 
		WHERE id_mod NOT IN (SELECT TOP 1000 id_mod FROM T_MOD ORDER BY id_mod)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_MP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_MP
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_MP 
		WHERE id_mp NOT IN (SELECT TOP 1000 id_mp FROM T_MP ORDER BY id_mp)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_MSN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_MSN
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_MSN 
		WHERE id_msn NOT IN (SELECT TOP 1000 id_msn FROM T_MSN ORDER BY id_msn)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_PDCI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_PDCI
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_PDCI 
		WHERE id_pdci NOT IN (SELECT TOP 1000 id_pdci FROM T_PDCI ORDER BY id_pdci)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_PDDS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_PDDS
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_PDDS 
		WHERE id_pdds NOT IN (SELECT TOP 1000 id_pdds FROM T_PDDS ORDER BY id_pdds)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_POWERCENTER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_POWERCENTER
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_POWERCENTER 
		WHERE id_PowerCenter NOT IN (SELECT TOP 1000 id_PowerCenter FROM T_POWERCENTER ORDER BY id_PowerCenter)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_PRS_PHASES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_PRS_PHASES
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_PRS_PHASES 
		WHERE id_prs_phases NOT IN (SELECT TOP 1000 id_prs_phases FROM T_PRS_PHASES ORDER BY id_prs_phases)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_QUALITY_CHECK]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_QUALITY_CHECK
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_QUALITY_CHECK 
		WHERE QUALITY_CHECK_id NOT IN (SELECT TOP 1000 QUALITY_CHECK_id FROM T_QUALITY_CHECK ORDER BY QUALITY_CHECK_id)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_ROLEAC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_ROLEAC
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_ROLEAC 
		WHERE id_roleac NOT IN (SELECT TOP 1000 id_roleac FROM T_ROLEAC ORDER BY id_roleac)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_SB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_SB
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_SB 
		WHERE id_SB NOT IN (SELECT TOP 1000 id_SB FROM T_SB ORDER BY id_SB)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_SI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_SI
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_SI 
		WHERE id_si NOT IN (SELECT TOP 1000 id_si FROM T_SI ORDER BY id_si)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[R_EQUIPMENT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM R_EQUIPMENT
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM R_EQUIPMENT 
		WHERE id_equip NOT IN (
			(SELECT TOP 1000 id_equip FROM R_EQUIPMENT)
			union
			(SELECT TOP 500 id_equip FROM R_EQUIPMENT WHERE SVMAJ_Eqt = 'PSEQ')
			union
			(SELECT TOP 500 id_equip FROM R_EQUIPMENT WHERE SVMAJ_Eqt = 'FIN-SI Loader')
		)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[R_FIN_DS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	-- Conserver 500 enregistrements de chaque type : null,0,1,4,5

	SET @line_count = 0
	SELECT @line_count = count(*) FROM R_FIN_DS
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM R_FIN_DS 
		WHERE id_ds NOT IN (SELECT TOP 500 id_ds FROM R_FIN_DS WHERE ds_type is null)
		AND ds_type is null

		DELETE FROM R_FIN_DS 
		WHERE id_ds NOT IN (SELECT TOP 500 id_ds FROM R_FIN_DS WHERE ds_type = 0)
		AND ds_type = 0

		DELETE FROM R_FIN_DS 
		WHERE id_ds NOT IN (SELECT TOP 500 id_ds FROM R_FIN_DS WHERE ds_type = 1)
		AND ds_type = 1

		DELETE FROM R_FIN_DS 
		WHERE id_ds NOT IN (SELECT TOP 500 id_ds FROM R_FIN_DS WHERE ds_type = 4)
		AND ds_type = 4

		DELETE FROM R_FIN_DS 
		WHERE id_ds NOT IN (SELECT TOP 500 id_ds FROM R_FIN_DS WHERE ds_type = 5)
		AND ds_type = 5
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[R_FIN_CI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SET @line_count = 0
	SELECT @line_count = count(*) FROM R_FIN_CI
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM R_FIN_CI 
		WHERE id_fin NOT IN (
			(SELECT TOP 1000 id_fin FROM R_FIN_CI)
			union
			(SELECT TOP 300 id_fin FROM R_FIN_CI WHERE SVMAJ_CI = 'PSEQ')
			union
			(SELECT TOP 300 id_fin FROM R_FIN_CI WHERE SVMAJ_CI = 'FIN-SI Loader')
			union
			(SELECT TOP 300 id_fin FROM R_FIN_CI WHERE SVMAJ_CI = 'CIRCE')
		)
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_MOD_CLOSURE_FOLLOWUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	-- Conserver 500 enregistrements de chaque type : 'Stage 0' et 'Stage 3'

	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_MOD_CLOSURE_FOLLOWUP
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_MOD_CLOSURE_FOLLOWUP 
		WHERE id_mod_closure NOT IN (SELECT TOP 500 id_mod_closure FROM T_MOD_CLOSURE_FOLLOWUP WHERE typeOfStage = 'Stage 0')
		AND typeOfStage = 'Stage 0'

		DELETE FROM T_MOD_CLOSURE_FOLLOWUP 
		WHERE id_mod_closure NOT IN (SELECT TOP 500 id_mod_closure FROM T_MOD_CLOSURE_FOLLOWUP WHERE typeOfStage = 'Stage 3')
		AND typeOfStage = 'Stage 3'
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_REQUEST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	-- Conserver 500 enregistrements de chaque type : 'CR' et 'RFC'

	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_REQUEST
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_REQUEST 
		WHERE id_request NOT IN (SELECT TOP 500 id_request FROM T_REQUEST WHERE typeOfRequest = 'CR')
		AND typeOfRequest = 'CR'

		DELETE FROM T_REQUEST 
		WHERE id_request NOT IN (SELECT TOP 500 id_request FROM T_REQUEST WHERE typeOfRequest = 'RFC')
		AND typeOfRequest = 'RFC'
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_RESPONSIBILITY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	-- Conserver 250 enregistrements de chaque type : 'Provisioning', 'Installation', 'Delivery' et 'Definition'

	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_RESPONSIBILITY
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_RESPONSIBILITY 
		WHERE id_responsibility NOT IN (
			(SELECT TOP 250 id_responsibility FROM T_RESPONSIBILITY WHERE FINRESPONSIBILITY = 'Provisioning')
			union
			(SELECT TOP 100 id_responsibility FROM T_RESPONSIBILITY WHERE FINRESPONSIBILITY = 'Provisioning' AND SVMAJ_Resp = 'PSEQ')
			union
			(SELECT TOP 100 id_responsibility FROM T_RESPONSIBILITY WHERE FINRESPONSIBILITY = 'Provisioning' AND SVMAJ_Resp = 'FIN-SI Loader')
		)
		AND FINRESPONSIBILITY = 'Provisioning'

		DELETE FROM T_RESPONSIBILITY 
		WHERE id_responsibility NOT IN (
			(SELECT TOP 250 id_responsibility FROM T_RESPONSIBILITY WHERE FINRESPONSIBILITY = 'Installation')
			union
			(SELECT TOP 100 id_responsibility FROM T_RESPONSIBILITY WHERE FINRESPONSIBILITY = 'Installation' AND SVMAJ_Resp = 'PSEQ')
			union
			(SELECT TOP 100 id_responsibility FROM T_RESPONSIBILITY WHERE FINRESPONSIBILITY = 'Installation' AND SVMAJ_Resp = 'FIN-SI Loader')
		)
		AND FINRESPONSIBILITY = 'Installation'

		DELETE FROM T_RESPONSIBILITY 
		WHERE id_responsibility NOT IN (
			(SELECT TOP 250 id_responsibility FROM T_RESPONSIBILITY WHERE FINRESPONSIBILITY = 'Delivery')
			union
			(SELECT TOP 100 id_responsibility FROM T_RESPONSIBILITY WHERE FINRESPONSIBILITY = 'Delivery' AND SVMAJ_Resp = 'PSEQ')
			union
			(SELECT TOP 100 id_responsibility FROM T_RESPONSIBILITY WHERE FINRESPONSIBILITY = 'Delivery' AND SVMAJ_Resp = 'FIN-SI Loader')
		)
		AND FINRESPONSIBILITY = 'Delivery'

		DELETE FROM T_RESPONSIBILITY 
		WHERE id_responsibility NOT IN (
			(SELECT TOP 250 id_responsibility FROM T_RESPONSIBILITY WHERE FINRESPONSIBILITY = 'Definition')
			union
			(SELECT TOP 100 id_responsibility FROM T_RESPONSIBILITY WHERE FINRESPONSIBILITY = 'Definition' AND SVMAJ_Resp = 'PSEQ')
			union
			(SELECT TOP 100 id_responsibility FROM T_RESPONSIBILITY WHERE FINRESPONSIBILITY = 'Definition' AND SVMAJ_Resp = 'FIN-SI Loader')
		)
		AND FINRESPONSIBILITY = 'Definition'
	END
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_HISTORY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	-- Conserver les 1000 derniers enregistrements de T_HISTORY

	SET @line_count = 0
	SELECT @line_count = count(*) FROM T_HISTORY
	IF (@line_count > 1000)
	BEGIN 
		DELETE FROM T_HISTORY 
		WHERE id_historic NOT IN (SELECT TOP 1000 id_historic FROM T_HISTORY ORDER BY id_historic DESC)
	END
END

