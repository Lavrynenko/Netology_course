-- incident 458285 

-- calculate the number of existing pdds
declare @pdds_number integer
select @pdds_number = count(*) from T_PDDS
print 'The number of pdds before update: ';print @pdds_number

-- delete the chosen pdds
DELETE T_PDDS WHERE id_pdds = 24794 

-- calculate the number of existing pdds ( after update)
select @pdds_number=count(*) from T_PDDS
print 'The number of pdds after update : ';print @pdds_number