/******************************************************************************************
		Alter T_MOD   
*******************************************************************************************/

-------- MOD_ModClosure  
if(
	NOT exists (
		select *
		from syscolumns
		where syscolumns.id = (	select sysobjects.id
								from sysobjects
								where name = 'T_MOD'
							  )
		 and syscolumns.name = 'MOD_ModClosure'
	)
)
	begin
		--Add the column
		ALTER TABLE T_MOD ADD [MOD_ModClosure] varchar(255) NULL
	end
else
	begin
		print 'Column MOD_ModClosure is already exist'
	end



