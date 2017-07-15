if not exists (
	select * from information_schema.columns
	where table_name = 'T_SEARCH_PROFIL' 
	and column_name = 'search_date'
)
begin
	alter table T_SEARCH_PROFIL
	add search_date varchar(50)
end