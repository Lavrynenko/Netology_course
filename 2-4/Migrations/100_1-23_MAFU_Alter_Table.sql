/******************************************************************************************
		Alter T_MOD
*******************************************************************************************/

-------- MODTypeCertiftext
	if(
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_MOD'
								  )
			 and syscolumns.name = 'MODTypeCertiftext'
		)
	)
	begin
		--Add the column
		ALTER TABLE T_MOD ADD [MODTypeCertiftext] varchar(8000) NULL
	end
	else
	begin
		print 'Column MODTypeCertiftext is alredy created'
	end
	
-------- MODsiteResponsible
	if(
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_MOD'
								  )
			 and syscolumns.name = 'MODsiteResponsible'
		)
	)
	begin
		--Add the column
		ALTER TABLE T_MOD ADD [MODsiteResponsible] varchar(8000) NULL
	end
	else
	begin
		print 'Column MODsiteResponsible is alredy created'
	end
	
-------- MODacmtOrigin
	if(
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_MOD'
								  )
			 and syscolumns.name = 'MODacmtOrigin'
		)
	)
	begin
		--Add the column
		ALTER TABLE T_MOD ADD [MODacmtOrigin] varchar(8000) NULL
	end
	else
	begin
		print 'Column MODacmtOrigin is alredy created'
	end
	
/******************************************************************************************
		Alter T_MP
*******************************************************************************************/

-------- MPsiteResponsible
	if(
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_MP'
								  )
			 and syscolumns.name = 'MPsiteResponsible'
		)
	)
	begin
		--Add the column
		ALTER TABLE T_MP ADD [MPsiteResponsible] varchar(8000) NULL
	end
	else
	begin
		print 'Column MPsiteResponsible is alredy created'
	end
	
-------- MPacmtOrigin
	if(
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_MP'
								  )
			 and syscolumns.name = 'MPacmtOrigin'
		)
	)
	begin
		--Add the column
		ALTER TABLE T_MP ADD [MPacmtOrigin] varchar(8000) NULL
	end
	else
	begin
		print 'Column MPacmtOrigin is alredy created'
	end

/******************************************************************************************
		Alter T_REQUEST - V_CR
*******************************************************************************************/

-------- CRacmtOrigin
	if(
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'CRacmtOrigin'
		)
	)
	begin
		--Add the column
		ALTER TABLE T_REQUEST ADD [CRacmtOrigin] varchar(8000) NULL
	end
	else
	begin
		print 'Column CRacmtOrigin is alredy created'
	end

/******************************************************************************************
		Alter T_REQUEST - V_RFC
*******************************************************************************************/

-------- RFCacmtOrigin
	if(
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'RFCacmtOrigin'
		)
	)
	begin
		--Add the column
		ALTER TABLE T_REQUEST ADD [RFCacmtOrigin] varchar(8000) NULL
	end
	else
	begin
		print 'Column RFCacmtOrigin is alredy created'
	end
