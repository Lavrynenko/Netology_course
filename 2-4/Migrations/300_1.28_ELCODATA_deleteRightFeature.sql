delete
from T_LINK_FEATURE_USER_ROLE
where idr_feature in (select id_feature from t_feature where label = 'Downgrade to lower MG')
and idr_user_role in (select id_role from t_user_role where name_role = 'EPC ATAXX')