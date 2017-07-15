/****** Object:  StoredProcedure [dbo].[sp_GET_ACMM]    Script Date: 06/21/2012 15:59:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GET_ACMM]
	@mainMod varchar(50),
	@MPActive varchar(50)
	
AS
BEGIN
	 select *, case closurestatus when 'STAGE3' THEN 1 WHEN 'STAGE3A' THEN 2 WHEN 'STAGE0' THEN 3 ELSE 4 END order_closure_status FROM ACMM_CIN_CLOSURE..SS10.VW_SS10_CIN_CLOSURE_STS WHERE C_MOD = @mainMod AND C_MP = @MPActive order by order_closure_status
END
