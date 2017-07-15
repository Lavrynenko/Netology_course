DECLARE @derniere_occurence AS INT
INSERT INTO t_user_role (name_role) VALUES ('PDCR ADMINISTRATOR')
SELECT @derniere_occurence = @@identity

INSERT INTO
		t_permission_access_attribute (idr_user_role, idr_infobase,read_mode,write_mode,fast_search)
	SELECT
		@derniere_occurence,
		id_infobase,
		1,
		1,
		0
	FROM
		infobase
		LEFT JOIN t_permission_access_attribute ON idr_infobase = id_infobase
		LEFT JOIN t_user_role ON id_role = idr_user_role
	WHERE
		name_role in ('PRINCIPLE DIAGRAM LOCAL MANAGER','PDExporter')
	ORDER BY
		table_name

INSERT INTO
		t_link_feature_user_role
	SELECT
		id_feature,
		@derniere_occurence
	FROM
		t_feature
	WHERE
		display_context like ';PD%'
		or label like '%search%'