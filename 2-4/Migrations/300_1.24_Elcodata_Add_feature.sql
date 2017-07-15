-----------------------------------------------------------------------------------------
------------------------------ INSERT FEATURE -------------------------------------------
-----------------------------------------------------------------------------------------
DECLARE 
	@feature_group INT,
	@display_order INT,
	@id_feature INT
	
-- Upgrade EDD MG

SELECT @feature_group = id_feature_group FROM T_FEATURE_GROUP WHERE label = 'ADMINISTRATION'
SELECT @display_order = 2 + id_feature FROM T_FEATURE WHERE label = 'Batch upgrade MG'

SELECT @display_order = id_feature 
			FROM T_feature 
			WHERE label = 'Batch upgrade MG'
			AND linked_url = 'BUSINESS_OBJECTS/DS/EDD/MG/EDD_Update_MG3_Form.php'
			AND display_context = ';HOME;'


IF (not exists(SELECT * 
			FROM T_feature 
			WHERE label = 'Batch upgrade MG'
			AND linked_url = 'BUSINESS_OBJECTS/DS/EDD/MG/EDD_Update_MG3_Form.php'
			AND display_context = ';HOME;'))

	BEGIN	
		-- Create feature
		 Insert into T_feature (label, 
					description, 
					idr_feature_group, 
					display_order, 
					linked_url, 
					DSType, 
					display_context, 
					is_PopUp, 
					popup_description, 
					popup_name, 
					is_displayed_separated, 
					icon, 
					where_clause)

			       VALUES (	'Batch upgrade MG', 
					'Upgrade MG for some EDD',
					@feature_group,
					@display_order,
					'BUSINESS_OBJECTS/DS/EDD/MG/EDD_Update_MG3_Form.php',
					'',
					';HOME;',
					'',
					'',
					'',
					'',
					'puce_orange.gif',
					'')
	END

ELSE

	BEGIN
		UPDATE T_feature
		SET display_order = @display_order
		WHERE id_feature = @id_feature
	END