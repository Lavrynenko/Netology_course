-- declaration des variables
DECLARE 
	@sql varchar(8000),
	@ov varchar(255),
	@tn varchar (255),
	@i integer
	

--curseur sur toutes les lignes en doubles (mais avec un distinct
DECLARE db_cursor CURSOR FOR 
	select distinct
		object_value,
		table_name
	from 
		infobase
	where
		object_value + '-' + table_name IN (
						select object_value + '-' + table_name
						from infobase
						group by object_value,table_name
						having count(id_infobase)>=2
					)
	order by 
		2,1

BEGIN
	OPEN db_cursor
	FETCH NEXT FROM db_cursor INTO @ov,@tn
	WHILE (@@FETCH_STATUS <> -1)
	BEGIN
		SET @i=0
		-- pour chaque ligne on regarde si il y a des droits associés
		SELECT 
			@i=count (*)
		FROM 
			infobase
			inner join t_permission_access_attribute on idr_infobase=id_infobase
		where	
			object_value= @ov
			and table_name = @tn
	
		if @i=1
		--si oui, on supprime donc la ligne qui n'a pas de droit
		begin
			DELETE FROM 
				infobase
			WHERE
				id_infobase IN (SELECT id_infobase 
						FROM 
							infobase
							left join t_permission_access_attribute on idr_infobase=id_infobase
						WHERE
							object_value=@ov 
							and table_name =@tn 
							and idr_user_role is null
						)
		end
		else
		-- si non, on supprime celui avec l'id max
		begin
			DELETE FROM 
				infobase
			WHERE
				id_infobase IN (SELECT MAX(id_infobase) 
						FROM 
							infobase
						WHERE
							object_value=@ov
							 and table_name =@tn
						)
			
		end
		FETCH NEXT FROM db_cursor INTO  @ov,@tn
	END
END
CLOSE db_cursor
DEALLOCATE db_cursor















/*





select 
	id_infobase, object_value,table_name, idr_user_role
from 
	infobase
	left join t_permission_access_attribute on idr_infobase=id_infobase
where
	object_value + '-' + table_name IN (
						select object_value + '-' + table_name
						from infobase
						group by object_value,table_name
						having count(id_infobase)>=2
					)

order by 3,2
*/