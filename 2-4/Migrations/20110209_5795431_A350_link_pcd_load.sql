DECLARE @idfinlink int
DECLARE @idrfinlink int
DECLARE @id int
DECLARE @idfinlinktmp int
DECLARE @idrfinlinktmp int
DECLARE @fin1 varchar(50)
DECLARE @fin2 varchar(50)

SET @idfinlinktmp=''
SET @idrfinlinktmp=''

DECLARE db_cursor CURSOR FOR 
	select 
		id_finlink,
		id_fin_link,
		idr_fin_link
	from 
		r_fin_link
	where 
		link_type ='LOAD GROUP/PCD'
	order by 
		id_fin_link,
		idr_fin_link 

	OPEN db_cursor
	FETCH NEXT FROM db_cursor INTO 
			 @id,
			 @idfinlink,
			 @idrfinlink
	WHILE (@@FETCH_STATUS <> -1)
	BEGIN
		IF ((@idrfinlinktmp=@idrfinlink) AND (@idfinlinktmp=@idfinlink))
		BEGIN
			DELETE FROM		
				R_FIN_LINK
			WHERE
				id_finlink=@id

			SELECT @fin1=fin from r_fin_ci where id_fin =@idfinlink
			SELECT @fin2=fin from r_fin_ci where id_fin =@idrfinlink
			print 'link between ' + @fin1 + ' and ' + @fin2 + ' has been deleted'
		END
		ELSE
		BEGIN
			SET @idfinlinktmp=@idfinlink
			SET @idrfinlinktmp=@idrfinlink
		END
	
	FETCH NEXT FROM db_cursor INTO 
			 @id,
			 @idfinlink,
			 @idrfinlink
	END

CLOSE db_cursor
DEALLOCATE db_cursor