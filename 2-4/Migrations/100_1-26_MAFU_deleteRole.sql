if(exists(select * from T_USER_ROLE where name_role = 'TO17627'))
begin
	DELETE FROM T_USER_ROLE WHERE name_role = 'TO17627'
end
