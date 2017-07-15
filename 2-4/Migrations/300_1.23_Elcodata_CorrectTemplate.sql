/*Correct a template on FIN CI page
Add space before all column names to allow the display */

DELETE FROM T_TEMPLATE  WHERE template_label ='DS_LIST'

INSERT INTO
	T_TEMPLATE (
		template_label,
		template_SQL,
		template_title,
		template_isDisplayed
	)
VALUES (
	'DS_LIST',
	'    SELECT     CASE      WHEN R_FIN_DS.EDDReference IS NOT NULL THEN R_FIN_DS.EDDReference      ELSE R_FIN_DS.RefDs     END + ''##FIN DS# Name#'' + CONVERT(VARCHAR, R_FIN_DS.id_ds) AS [ Name],     CASE      WHEN T_IMPACTDS.idr_ds_pre = 0 THEN ''BLANK''      WHEN T_IMPACTDS.idr_ds_pre IS NULL THEN ''''      ELSE       CASE        WHEN PRE.EDDReference IS NOT NULL THEN PRE.EDDReference        ELSE PRE.RefDs       END + ''##FIN DS# Name#'' + ISNULL(CONVERT(VARCHAR, T_IMPACTDS.idr_ds_pre), '''')     END AS [ Pre],     cast(R_FIN_DS.DSEffectivity AS text) AS Effectivity,     CASE      WHEN MPReference IS NOT NULL THEN MPReference + ''##MP# MPReference#'' + CONVERT(VARCHAR, id_mp)      WHEN T_SI.Reference IS NOT NULL THEN T_SI.Reference + ''##SI# Reference#'' + CONVERT(VARCHAR, T_SI.id_si)      WHEN R_FIN_DS.cinstack IS NOT NULL THEN R_FIN_DS.cinstack      ELSE ''''     END AS [ MP/SI],     R_Equipment.PN  + ''##EQUIPMENT# PN#'' + CONVERT(VARCHAR, R_Equipment.id_equip) AS [ PN],     R_Equipment.CMS + ''##EQUIPMENT# CMS#'' + CONVERT(VARCHAR, R_Equipment.id_equip) AS [ CMS],     R_FIN_DS.SystemViewStatus AS [ State],     R_FIN_DS.SVMAJ_DS as [ Flow Origin],     R_FIN_DS.ds_DataOrigin as [ Data Origin]    FROM     R_FIN_DS     LEFT JOIN R_EQUIPMENT ON R_EQUIPMENT.id_equip = R_FIN_DS.idr_equip     LEFT JOIN T_IMPACTDS ON T_IMPACTDS.idr_ds_post = R_FIN_DS.id_ds     LEFT JOIN R_FIN_DS PRE ON PRE.id_ds = T_IMPACTDS.idr_ds_pre     LEFT JOIN T_MP ON T_MP.id_mp = T_IMPACTDS.idr_mp     LEFT JOIN T_SI ON T_SI.id_si = T_IMPACTDS.idr_si    WHERE     R_FIN_DS.idr_fin = #id_fin#     AND R_FIN_DS.ds_type <> 2    ORDER BY     R_FIN_DS.ds_type,     CASE      WHEN R_FIN_DS.ds_type = 1 THEN ISNULL(Effectivity, ''1'')      ELSE 0     END,     R_FIN_DS.RefDs',
	'FIN DS',
	'1'
	)