--
-- T_REPORT_GROUP Update
--
if (not exists (SELECT *
		FROM t_report_group
		WHERE report_group_label='Others'))
begin
	INSERT INTO t_report_group (report_group_label)
	SELECT 'Others'
end


--
-- T_DBACTIONS Update
--
DELETE FROM T_DBActions WHERE label='List of PSE Users'
INSERT INTO t_dbactions 
(label, command, comments,template_page,report_group_idr)
SELECT
	'List of PSE Users',
	'SELECT user_logon AS Logon, 
		user_first_name AS [First Name], 
		user_surname As Surname, 
		user_mail AS [E-mail], 
		name_role AS [Role] 
	FROM	T_USER 
		JOIN T_LINK_ROLE_USER ON user_id = idr_user 
		JOIN T_USER_ROLE ON idr_user_role = id_role 
	ORDER BY user_logon',
	'- List of PSE Users',
	'PSE_Users.php',
	report_group_id
FROM
	t_report_group
WHERE
	report_group_label='Others'

