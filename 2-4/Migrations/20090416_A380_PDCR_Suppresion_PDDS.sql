-- # 4193913  Delete the id_PDDS: >23661 

-- Calculate the number of existing pdds
declare @pdds_number integer
select @pdds_number = count(*) from T_PDDS
print 'The number of pdds before update: ';print @pdds_number


DELETE FROM T_PDDS WHERE id_pdds = '23661'


-- Calculate the number of existing pdds
select @pdds_number = count(*) from T_PDDS
print 'The number of pdds after update: ';print @pdds_number