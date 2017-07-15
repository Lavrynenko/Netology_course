if(not exists (SELECT	T_USER_ROLE.id_role, T_FEATURE.id_feature
			FROM	T_USER_ROLE
			 inner JOIN T_LINK_FEATURE_USER_ROLE on id_role = idr_user_role
			 inner join T_FEATURE on idr_feature = id_feature
			WHERE   (T_USER_ROLE.name_role = 'MAFU_AISS_WRITER') AND (T_FEATURE.label = 'Edit')
					AND (T_FEATURE.linked_url = '/BUSINESS_OBJECTS/MOD/update/MOD_Update_Form.php?id_mod=#id_mod#')))
begin
INSERT INTO T_LINK_FEATURE_USER_ROLE (idr_user_role, idr_feature)
			SELECT	T_USER_ROLE.id_role, T_FEATURE.id_feature
			FROM	T_USER_ROLE CROSS JOIN T_FEATURE
			WHERE   (T_USER_ROLE.name_role = 'MAFU_AISS_WRITER') AND (T_FEATURE.label = 'Edit')
					AND (T_FEATURE.linked_url = '/BUSINESS_OBJECTS/MOD/update/MOD_Update_Form.php?id_mod=#id_mod#')
end