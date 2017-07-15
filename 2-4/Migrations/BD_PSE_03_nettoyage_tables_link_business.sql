-- Fichier : BD_PSE_03_nettoyage_tables_link_business.sql
-- Supprime les enregistrements des tables de liens dont les id n'existent plus dans les tables business
-- Le script n'effectue d'actions que sur les tables existantes


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_LINK_CR_CIN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	DELETE FROM T_LINK_CR_CIN
	WHERE idr_mp NOT IN (SELECT id_mp FROM T_MP)
END


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_LINK_MOD_MP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	DELETE FROM T_LINK_MOD_MP
	WHERE idr_mp NOT IN (SELECT id_mp FROM T_MP)
	OR idr_mod NOT IN (SELECT id_mod FROM T_MOD)
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_LINK_REQUEST_MP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	DELETE FROM T_LINK_REQUEST_MP
	WHERE idr_mp NOT IN (SELECT id_mp FROM T_MP)
	OR idr_request NOT IN (SELECT id_request FROM T_REQUEST)
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_LINK_MSN_POWERCENTER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	DELETE FROM T_LINK_MSN_POWERCENTER
	WHERE idr_MSN NOT IN (SELECT id_msn FROM T_MSN)
	OR idr_PowerCenter NOT IN (SELECT id_PowerCenter FROM T_POWERCENTER)
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_LINK_MOD_MSN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	DELETE FROM T_LINK_MOD_MSN
	WHERE MSN NOT IN (SELECT id_msn FROM T_MSN)
	OR idr_mod NOT IN (SELECT id_mod FROM T_MOD)
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_LINK_ROLEAC__FIN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	DELETE FROM T_LINK_ROLEAC__FIN
	WHERE idr_fin NOT IN (SELECT id_fin FROM R_FIN_CI)
	OR idr_roleac NOT IN (SELECT id_roleac FROM T_ROLEAC)
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_LINK_CI__CIN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	DELETE FROM T_LINK_CI__CIN
	WHERE idr_cin NOT IN (SELECT id_cin FROM T_CIN)
	OR idr_fin NOT IN (SELECT id_fin FROM R_FIN_CI)
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_LINK_CIN_SB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	DELETE FROM T_LINK_CIN_SB
	WHERE idr_SB NOT IN (SELECT id_SB FROM T_SB)
	OR idr_cin_acc NOT IN (SELECT id_CIN_ACC FROM T_LINK_MOD_MP)
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_LINK_MSN_SB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	DELETE FROM T_LINK_MSN_SB
	WHERE MSN NOT IN (SELECT id_msn FROM T_MSN)
	OR idr_sb NOT IN (SELECT id_SB FROM T_SB)
END





if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_LINK_MP_MSN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	DELETE FROM T_LINK_MP_MSN
	WHERE idr_mp NOT IN (SELECT id_mp FROM T_MP)
	OR MSN NOT IN (SELECT id_msn FROM T_MSN)
END



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_LINK_PDREQUIREMENT_MP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	DELETE FROM T_LINK_PDREQUIREMENT_MP
	WHERE idr_pdreq NOT IN (SELECT idr_pdreq FROM T_PDREQUIREMENT)
	OR idr_mp NOT IN (SELECT id_mp FROM T_MP)
END

