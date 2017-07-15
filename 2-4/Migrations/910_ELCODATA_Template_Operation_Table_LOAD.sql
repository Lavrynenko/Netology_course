-- * Add template of Operation Table in FIN CI consultation
DELETE FROM T_TEMPLATE WHERE template_label = 'OPERATION_TABLE'

INSERT INTO T_TEMPLATE (
	template_label,
	template_SQL,
	template_title,
	template_isDisplayed
	) 
	VALUES ('OPERATION_TABLE', 'SELECT
	T_MP.MPReference + ''##MP# MPReference#'' + CONVERT(VARCHAR, id_mp) AS [ MP],
	R_FIN_CI.FIN + ''##FIN CI#FIN#'' + CONVERT(VARCHAR, id_fin) AS [ FIN Name],
	T_OPERATION_TABLE.operation AS [ Operation],
	T_OPERATION_TABLE.nominalPower AS [ Nominal Power (W. or V.A)],
	T_OPERATION_TABLE.nominalPowerPh_A AS [ Nominal Power Phase A (V.A)],
	T_OPERATION_TABLE.nominalPowerPh_B AS [ Nominal Power Phase B (V.A)],
	T_OPERATION_TABLE.nominalPowerPh_C AS [ Nominal Power Phase C (V.A)],
	T_OPERATION_TABLE.vibGrounding AS [ VIB Grounding],
	T_OPERATION_TABLE.vibBounding AS [ VIB Bounding]
FROM T_OPERATION_TABLE INNER JOIN
	T_MP ON T_OPERATION_TABLE.idr_mp = T_MP.id_mp INNER JOIN
	R_FIN_CI ON T_OPERATION_TABLE.idr_linked_fin = R_FIN_CI.id_fin
WHERE T_OPERATION_TABLE.idr_fin = #id_fin#
ORDER BY id_op_table', 'OPERATION TABLE', '1')

