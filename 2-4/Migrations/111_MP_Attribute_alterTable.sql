/******************************************************************************************
		Alter T_MP   
*******************************************************************************************/

-------- MP_MASStatusFromACC2 
if(
	NOT exists (
		select *
		from syscolumns
		where syscolumns.id = (	select sysobjects.id
								from sysobjects
								where name = 'T_MP'
							  )
		 and syscolumns.name = 'MP_MASStatusFromACC2'
	)
)
	begin
		--Add the column
		ALTER TABLE T_MP ADD [MP_MASStatusFromACC2] varchar(4) NULL
	end
else
	begin
		print 'Column MP_MASStatusFromACC2 is already exist'
	end



