if(
	NOT exists (
		select *
		from syscolumns
		where syscolumns.id = (	select sysobjects.id
								from sysobjects
								where name = 'T_MSN'
							  )
		 and syscolumns.name = 'MSN_SEPDS_PED_Standard'
	)
)
BEGIN
	ALTER TABLE dbo.T_MSN ADD MSN_SEPDS_PED_Standard varchar(50) NULL
END



if(
	NOT exists (
		select *
		from syscolumns
		where syscolumns.id = (	select sysobjects.id
								from sysobjects
								where name = 'T_LINK_MSN_POWERCENTER'
							  )
		 and syscolumns.name = 'Ic1_High_Column1'
	)
)
BEGIN
	ALTER TABLE dbo.T_LINK_MSN_POWERCENTER ADD Ic1_High_Column1 float(8) NULL
END



if(
	NOT exists (
		select *
		from syscolumns
		where syscolumns.id = (	select sysobjects.id
								from sysobjects
								where name = 'T_LINK_MSN_POWERCENTER'
							  )
		 and syscolumns.name = 'Ic1_Low_Column1'
	)
)
BEGIN
	ALTER TABLE dbo.T_LINK_MSN_POWERCENTER ADD Ic1_Low_Column1 float(8) NULL
END



if(
	NOT exists (
		select *
		from syscolumns
		where syscolumns.id = (	select sysobjects.id
								from sysobjects
								where name = 'T_LINK_MSN_POWERCENTER'
							  )
		 and syscolumns.name = 'Ic2_High_Column1'
	)
)
BEGIN
	ALTER TABLE dbo.T_LINK_MSN_POWERCENTER ADD Ic2_High_Column1 float(8) NULL
END



if(
	NOT exists (
		select *
		from syscolumns
		where syscolumns.id = (	select sysobjects.id
								from sysobjects
								where name = 'T_LINK_MSN_POWERCENTER'
							  )
		 and syscolumns.name = 'Ic2_Low_Column1'
	)
)
BEGIN
	ALTER TABLE dbo.T_LINK_MSN_POWERCENTER ADD Ic2_Low_Column1 float(8) NULL
END



if(
	NOT exists (
		select *
		from syscolumns
		where syscolumns.id = (	select sysobjects.id
								from sysobjects
								where name = 'T_LINK_MSN_POWERCENTER'
							  )
		 and syscolumns.name = 'Ic1_High_Column2'
	)
)
BEGIN
	ALTER TABLE dbo.T_LINK_MSN_POWERCENTER ADD Ic1_High_Column2 float(8) NULL
END



if(
	NOT exists (
		select *
		from syscolumns
		where syscolumns.id = (	select sysobjects.id
								from sysobjects
								where name = 'T_LINK_MSN_POWERCENTER'
							  )
		 and syscolumns.name = 'Ic1_Low_Column2'
	)
)
BEGIN
	ALTER TABLE dbo.T_LINK_MSN_POWERCENTER ADD Ic1_Low_Column2 float(8) NULL
END



if(
	NOT exists (
		select *
		from syscolumns
		where syscolumns.id = (	select sysobjects.id
								from sysobjects
								where name = 'T_LINK_MSN_POWERCENTER'
							  )
		 and syscolumns.name = 'Ic2_High_Column2'
	)
)
BEGIN
	ALTER TABLE dbo.T_LINK_MSN_POWERCENTER ADD Ic2_High_Column2 float(8) NULL
END



if(
	NOT exists (
		select *
		from syscolumns
		where syscolumns.id = (	select sysobjects.id
								from sysobjects
								where name = 'T_LINK_MSN_POWERCENTER'
							  )
		 and syscolumns.name = 'Ic2_Low_Column2'
	)
)
BEGIN
	ALTER TABLE dbo.T_LINK_MSN_POWERCENTER ADD Ic2_Low_Column2 float(8) NULL
END



if(
	NOT exists (
		select *
		from syscolumns
		where syscolumns.id = (	select sysobjects.id
								from sysobjects
								where name = 'T_LINK_MSN_POWERCENTER'
							  )
		 and syscolumns.name = 'Ic1_High_Column3'
	)
)
BEGIN
	ALTER TABLE dbo.T_LINK_MSN_POWERCENTER ADD Ic1_High_Column3 float(8) NULL
END



if(
	NOT exists (
		select *
		from syscolumns
		where syscolumns.id = (	select sysobjects.id
								from sysobjects
								where name = 'T_LINK_MSN_POWERCENTER'
							  )
		 and syscolumns.name = 'Ic1_Low_Column3'
	)
)
BEGIN
	ALTER TABLE dbo.T_LINK_MSN_POWERCENTER ADD Ic1_Low_Column3 float(8) NULL
END



if(
	NOT exists (
		select *
		from syscolumns
		where syscolumns.id = (	select sysobjects.id
								from sysobjects
								where name = 'T_LINK_MSN_POWERCENTER'
							  )
		 and syscolumns.name = 'Ic2_High_Column3'
	)
)
BEGIN
	ALTER TABLE dbo.T_LINK_MSN_POWERCENTER ADD Ic2_High_Column3 float(8) NULL
END



if(
	NOT exists (
		select *
		from syscolumns
		where syscolumns.id = (	select sysobjects.id
								from sysobjects
								where name = 'T_LINK_MSN_POWERCENTER'
							  )
		 and syscolumns.name = 'Ic2_Low_Column3'
	)
)
BEGIN
	ALTER TABLE dbo.T_LINK_MSN_POWERCENTER ADD Ic2_Low_Column3 float(8) NULL
END



if(
	NOT exists (
		select *
		from syscolumns
		where syscolumns.id = (	select sysobjects.id
								from sysobjects
								where name = 'T_LINK_MSN_POWERCENTER'
							  )
		 and syscolumns.name = 'Ic1_High_Column4'
	)
)
BEGIN
	ALTER TABLE dbo.T_LINK_MSN_POWERCENTER ADD Ic1_High_Column4 float(8) NULL
END



if(
	NOT exists (
		select *
		from syscolumns
		where syscolumns.id = (	select sysobjects.id
								from sysobjects
								where name = 'T_LINK_MSN_POWERCENTER'
							  )
		 and syscolumns.name = 'Ic1_Low_Column4'
	)
)
BEGIN
	ALTER TABLE dbo.T_LINK_MSN_POWERCENTER ADD Ic1_Low_Column4 float(8) NULL
END



if(
	NOT exists (
		select *
		from syscolumns
		where syscolumns.id = (	select sysobjects.id
								from sysobjects
								where name = 'T_LINK_MSN_POWERCENTER'
							  )
		 and syscolumns.name = 'Ic2_High_Column4'
	)
)
BEGIN
	ALTER TABLE dbo.T_LINK_MSN_POWERCENTER ADD Ic2_High_Column4 float(8) NULL
END



if(
	NOT exists (
		select *
		from syscolumns
		where syscolumns.id = (	select sysobjects.id
								from sysobjects
								where name = 'T_LINK_MSN_POWERCENTER'
							  )
		 and syscolumns.name = 'Ic2_Low_Column4'
	)
)
BEGIN
	ALTER TABLE dbo.T_LINK_MSN_POWERCENTER ADD Ic2_Low_Column4 float(8) NULL
END