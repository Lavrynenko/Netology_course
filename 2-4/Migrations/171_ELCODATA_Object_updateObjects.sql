/******************************************************************************************
		Update objects in  T_OBJECT   
*******************************************************************************************/

-- Update 'Associated Sub FIN CI' to 'Cascade Link: DS with Sub CI' in T_OBJECT
IF EXISTS(
	SELECT * FROM T_OBJECT
	WHERE attribute_primary_key = 'id_asssubci'
	AND table_primary_key='V_ASS_SUB_FIN_CI'
)
BEGIN

	UPDATE T_OBJECT 
		SET label ='Cascade Link DS with Sub CI',
			Description = 'Cascade Link DS with Sub CI'
		WHERE attribute_primary_key = 'id_asssubci'
			AND table_primary_key='V_ASS_SUB_FIN_CI'
END




-- Update 'Associated Top FIN DS' to 'Cascade Link: CI with Upper DS'  in T_OBJECT
IF EXISTS(
	SELECT * FROM T_OBJECT
	WHERE attribute_primary_key = 'id_asstopds'
	AND table_primary_key='V_ASS_TOP_FIN_DS'
)
BEGIN

	UPDATE T_OBJECT 
		SET label ='Cascade Link CI with Upper DS',
			Description = 'Cascade Link CI with Upper DS'
		WHERE attribute_primary_key = 'id_asstopds'
			AND table_primary_key='V_ASS_TOP_FIN_DS'
END



