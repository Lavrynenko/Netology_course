if(
  NOT exists (
	select *
	from syscolumns
	where syscolumns.id = (	select sysobjects.id
							from sysobjects
							where name = 'T_IMPACTDS'
						  )
	 and syscolumns.name = 'SNPreMOD'
	)
)
BEGIN
	ALTER TABLE dbo.T_IMPACTDS ADD SNPreMOD varchar(255) NULL
	
END

if(
  NOT exists (
	select *
	from syscolumns
	where syscolumns.id = (	select sysobjects.id
							from sysobjects
							where name = 'T_IMPACTDS'
						  )
	 and syscolumns.name = 'SNPostMOD'
	)
)
BEGIN
	ALTER TABLE dbo.T_IMPACTDS ADD SNPostMOD varchar(255) NULL
	
END





UPDATE
	T_TEMPLATE
SET 
	template_SQL='
SELECT   
	R_FIN_CI.FIN + ''##FIN CI#FIN#'' + CONVERT(VARCHAR, R_FIN_CI.id_fin) AS [FIN],   
	CASE    
		WHEN IMPACT.idr_ds_pre = 0 THEN ''BLANK''    
		WHEN IMPACT.idr_ds_pre IS NULL THEN ''''    
		ELSE     
			CASE      
				WHEN IMPACT.EDDReference IS NOT NULL THEN IMPACT.EDDReference      
				ELSE IMPACT.[DS_SI]     
			END 
		+ ''##FIN DS#Name#'' + CONVERT(VARCHAR, IMPACT.idr_ds_pre)   
	END AS [Pre],
	IMPACT.SNPreMOD AS [Pre MOD S/N],
	IMPACT.CMSPRE + ''##EQUIPMENT#CMS#''+ CONVERT(VARCHAR, IDPNPRE) AS [Pre MOD CMS],
	IMPACT.PNPRE + ''##EQUIPMENT#PN#''+ CONVERT(VARCHAR, IDPNPRE) AS [Pre MOD P/N],
	CASE
		WHEN R_FIN_DS.EDDReference IS NOT NULL THEN R_FIN_DS.EDDReference
		ELSE RefDS
	END  + ''##FIN DS#Name#'' + CONVERT(VARCHAR, R_FIN_DS.id_ds) AS [POST],
	IMPACT.SNPostMOD AS [Post MOD S/N],
	EquipPOST.CMS + ''##EQUIPMENT#CMS#''+ CONVERT(VARCHAR, EquipPOST.id_equip) AS [Post MOD CMS],
	EquipPOST.PN + ''##EQUIPMENT#PN#''+ CONVERT(VARCHAR, EquipPOST.id_equip ) AS [Post MOD P/N],
	DSEffectivity
FROM
	R_FIN_DS
	LEFT JOIN (
		SELECT
			idr_ds_post,
			idr_ds_pre,
			RefDS AS [DS_SI],
			EDDReference,
			SNPreMOD,
			SNPostMOD,
			id_equip as IDPNPRE,
			PN as PNPRE,
			CMS as CMSPRE
		FROM
			T_IMPACTDS
			LEFT JOIN R_FIN_DS ON R_FIN_DS.id_ds = T_IMPACTDS.idr_ds_pre
			LEFT JOIN R_EQUIPMENT EquipPRE on idr_equip=EquipPRE.id_equip
                ) IMPACT ON IMPACT.idr_ds_post = R_FIN_DS.id_ds
	
	LEFT JOIN R_FIN_CI ON R_FIN_CI.id_fin = R_FIN_DS.idr_fin
	LEFT JOIN T_IMPACTDS ON R_FIN_DS.id_ds = T_IMPACTDS.idr_ds_post
	LEFT JOIN R_EQUIPMENT EquipPOST on R_FIN_DS.idr_equip=EquipPOST.id_equip
	LEFT JOIN T_SI ON T_IMPACTDS.idr_si = T_SI.id_si
WHERE
	id_si =#id_si#
ORDER BY [POST]'
WHERE  template_label like '%DS_LINK_TO_SI%'