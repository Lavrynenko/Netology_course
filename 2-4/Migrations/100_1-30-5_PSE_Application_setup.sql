if(
  NOT exists (
	select *
	from syscolumns
	where syscolumns.id = (	select sysobjects.id
							from sysobjects
							where name = 'APPLICATION_SETUP'
						  )
	 and syscolumns.name = 'application_program'
	)
)
BEGIN
	ALTER TABLE dbo.APPLICATION_SETUP ADD application_program varchar(12) NULL
	
END

if(
  NOT exists (
	select *
	from syscolumns
	where syscolumns.id = (	select sysobjects.id
							from sysobjects
							where name = 'APPLICATION_SETUP'
						  )
	 and syscolumns.name = 'application_patch'
	)
)
BEGIN
	ALTER TABLE dbo.APPLICATION_SETUP ADD application_patch varchar(12) NULL
	
END

if(
  NOT exists (
	select *
	from syscolumns
	where syscolumns.id = (	select sysobjects.id
							from sysobjects
							where name = 'APPLICATION_SETUP'
						  )
	 and syscolumns.name = 'application_version'
	)
)
BEGIN
	ALTER TABLE dbo.APPLICATION_SETUP ADD application_version varchar(12) NULL
	
END
