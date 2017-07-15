-- add a column in table T_REQUEST to contain RFC type values
if(
	NOT exists (
		select *
		from syscolumns
		where syscolumns.id = (	select sysobjects.id
					from sysobjects
					where name = 'T_REQUEST'
					  )
		and syscolumns.name = 'TypeRFC'
	)
)
begin
	--Add the column
	ALTER TABLE T_REQUEST ADD [TypeRFC] varchar(100)
end
else
begin
	print 'Column TypeRFC is alredy created'
end
