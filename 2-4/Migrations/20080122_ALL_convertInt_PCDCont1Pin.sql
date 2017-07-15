
if (NOT exists (select * from syscolumns where syscolumns.id = (select sysobjects.id from sysobjects  where name = 'R_FIN_DS')
   and syscolumns.name = 'PCDCont1Pin'))
begin
    --Add the column
    ALTER TABLE R_FIN_DS ADD [PCDCont1Pin] int NULL
    --update infobase
    if( NOT exists ( select * from infobase where table_name='R_FIN_DS' and object_value='PCDCont1Pin'))
    begin
        INSERT INTO infobase (fast_search,table_name, object_value, type_val)
        VALUES (0,'R_FIN_DS','PCDCont1Pin','int')
    end
    else
    begin
        UPDATE infobase
        set type_val='int'
        where table_name='R_FIN_DS' and object_value='PCDCont1Pin'
    end
end	
else
begin
    ALTER TABLE  R_FIN_DS ALTER COLUMN PCDCont1Pin int NULL
    --update infobase
    if( NOT exists ( select * from infobase where table_name='R_FIN_DS' and object_value='PCDCont1Pin'))
    begin
        INSERT INTO infobase (fast_search,table_name, object_value, type_val)
        VALUES (0,'R_FIN_DS','PCDCont1Pin','int')
    end
    else
    begin
        UPDATE infobase
        set type_val='int'
        where table_name='R_FIN_DS' and object_value='PCDCont1Pin'
    end
end