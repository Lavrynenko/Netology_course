
/** Add and update fast_search column in T_PERMISSION_ACCESS_ATTRIBUTE **/

if(
  NOT exists (
	select *
	from syscolumns
	where syscolumns.id = (	select sysobjects.id
							from sysobjects
							where name = 'T_PERMISSION_ACCESS_ATTRIBUTE'
						  )
	 and syscolumns.name = 'fast_search'
	)
)
BEGIN
	ALTER TABLE dbo.T_PERMISSION_ACCESS_ATTRIBUTE ADD fast_search BIT NOT NULL DEFAULT 0

	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = '1'
	WHERE idr_infobase IN (SELECT id_infobase FROM INFOBASE WHERE fast_search = '1')
	AND read_mode = '1'

END


/** Delete fast_search column in INFOBASE **/

if(
  exists (
	select *
	from syscolumns
	where syscolumns.id = (	select sysobjects.id
							from sysobjects
							where name = 'INFOBASE'
						  )
	 and syscolumns.name = 'fast_search'
	)
)
BEGIN

ALTER TABLE INFOBASE DROP COLUMN fast_search

END

