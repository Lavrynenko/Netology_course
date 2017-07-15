--incident 4653317 - suppression de la MP T75432  id: 3331

---------------
-- Delete MP --
---------------
-- calculate the number of existing mp
declare @mp_number integer
select @mp_number = count(*) from T_MP
print 'The number of mp before update: ';print @mp_number

DELETE T_MP WHERE id_mp = 3331 

-- calculate the number of existing mp ( after update)
select @mp_number = count(*) from T_MP
print 'The number of mp after update: ';print @mp_number


declare @link_number integer

------------------------------------
-- Delete link between MP and Mod --
------------------------------------
-- calculate the number of existing link
select @link_number = count(*) from T_link_mod_mp
print 'The number of link before update: ';print @link_number

DELETE T_link_mod_mp WHERE idr_mp = 3331 

-- calculate the number of existing link_number ( after update)
select @link_number = count(*) from T_link_mod_mp
print 'The number of link between MP and MOD after update: ';print @link_number

----------------------------------------
-- Delete link between MP and request --
----------------------------------------
-- calculate the number of existing link
select @link_number = count(*) from t_link_request_mp
print 'The number of link before update: ';print @link_number

DELETE t_link_request_mp where idr_mp like 3331

-- calculate the number of existing link_number ( after update)
select @link_number = count(*) from t_link_request_mp
print 'The number of link between MP and request after update: ';print @link_number





