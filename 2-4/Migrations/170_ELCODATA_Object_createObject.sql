/******************************************************************************************
		Create objects in  T_OBJECT   
*******************************************************************************************/

-- Create 'Associated Sub FIN CI'  in T_OBJECT
IF NOT EXISTS(
	SELECT * FROM T_OBJECT
	WHERE label = 'Associated Sub FIN CI'
	AND table_primary_key='V_ASS_SUB_FIN_CI'
)
BEGIN

	INSERT INTO T_OBJECT (label, display_order, attribute_primary_key, table_primary_key)
		SELECT ('Associated Sub FIN CI'), 
			(SELECT MAX(display_order + 10) FROM  T_OBJECT), 
			('id_asssubci'), 
			('V_ASS_SUB_FIN_CI')

END




-- Create 'Associated Top FIN DS'  in T_OBJECT
IF NOT EXISTS(
	SELECT * FROM T_OBJECT
	WHERE label = 'Associated Top FIN DS'
	AND table_primary_key='V_ASS_TOP_FIN_DS'
)
BEGIN

	INSERT INTO T_OBJECT (label, display_order, attribute_primary_key, table_primary_key)
		SELECT ('Associated Top FIN DS'), 
			(SELECT MAX(display_order + 10) FROM  T_OBJECT), 
			('id_asstopds'), 
			('V_ASS_TOP_FIN_DS')

END



