if not exists (
	select * from information_schema.columns
	where table_name = 'T_SEARCH_PROFIL' 
	and column_name = 'public_search'
)
begin
	alter table T_SEARCH_PROFIL
	add public_search integer not null default 0
end