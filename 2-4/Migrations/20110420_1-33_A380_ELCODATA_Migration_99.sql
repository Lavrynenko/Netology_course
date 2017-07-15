
------------------------------------------------------------------
-- should launched at the last position of this data migration	
-------------------------------------------------------------------
-- ElocdataSD-A380-PCD-Migration-005
EXECUTE sp_UpdateMGCheckSum 'A380'
DECLARE @idds as integer

DECLARE db_cursor CURSOR FOR 
	SELECT  
		id_ds
	FROM 
		r_fin_ds
	where
		mg='3'
BEGIN
	OPEN db_cursor
	FETCH NEXT FROM db_cursor INTO @idds
	WHILE (@@FETCH_STATUS <> -1)
	BEGIN
		Update 
			r_fin_ds 
		set 
			eddchecksum=dbo.ELCOCHECK(@idds) 
		where 
			id_ds=@idds
		FETCH NEXT FROM db_cursor INTO @idds
	END
END