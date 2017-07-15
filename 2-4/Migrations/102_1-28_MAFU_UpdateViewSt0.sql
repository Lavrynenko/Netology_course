if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_MOD_CLOSURE_STAGE0]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_MOD_CLOSURE_STAGE0]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.V_MOD_CLOSURE_STAGE0
	AS
	SELECT  id_mod_closure AS id_stage,
			idr_mp, typeOfStage AS stage0_typeOfStage, 
			modClosureDateT AS stage0_modClosureDateT, 
			modClosureDateF AS stage0_modClosureDateF, 
			modClosureDateA AS stage0_modClosureDateA, 
			sysPartStatus AS stage0_sysPartStatus, 
			Stage0Delta1 AS stage0_Stage0Delta1, 
			Stage0grtReference AS stage0_Stage0grtReference, 
			Stage0EDES AS stage0_Stage0EDES, 
			Stage0EDDnTRS AS stage0_Stage0EDDnTRS, 
			Stage0ISCDinTRS AS stage0_Stage0ISCDinTRS, 
			Stage0SDGPinTRS AS stage0_Stage0SDGPinTRS, 
			modClosureComment AS stage0_modClosureComment, 
			ITStatus AS stage0_ITStatus, 
			ITComment AS stage0_ITComment, 
			Stage0PDinPDCR AS stage0_Stage0PDinPDCR,
	        fullTrsOk AS stage0_fullTrsOk
	FROM    dbo.T_MOD_CLOSURE_FOLLOWUP
	WHERE     (typeOfStage = 'Stage 0')

	


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

