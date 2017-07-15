
CREATE PROCEDURE sp_MOD_MAS_toBeIssued  @msn VARCHAR(50)
AS

SELECT DISTINCT     
	CONVERT(VARCHAR, T_MOD.MODReference) + '##MOD#MODReference#' + CONVERT(VARCHAR, T_MOD.id_mod) [MOD],	
	T_MOD.MODTitle [Title], 
	T_MOD.ValidityFromACC [ACC Validity]
	FROM         
	T_LINK_MOD_MP 
	INNER JOIN T_MOD ON T_LINK_MOD_MP.idr_mod = T_MOD.id_mod 
	INNER JOIN T_MSN 
	INNER JOIN T_LINK_MOD_MSN ON T_MSN.MSN = T_LINK_MOD_MSN.MSN ON T_MOD.id_mod = T_LINK_MOD_MSN.idr_mod
	WHERE     
		T_LINK_MOD_MSN.msn = @msn 
		AND (T_MOD.MODSiteLeader like '%AIRBUS FRANCE%') 
		AND (T_MOD.MODTypeDesign is null OR T_MOD.MODTypeDesign = '')
		AND (T_MOD.MODMASIssue is null OR T_MOD.MODMASIssue = '')
		AND (T_MOD.MODValidityCat <>'T')
		AND (T_MOD.MODValidityCat <>'G')
	ORDER BY CONVERT(VARCHAR, T_MOD.MODReference) + '##MOD#MODReference#' + CONVERT(VARCHAR, T_MOD.id_mod)

GO
