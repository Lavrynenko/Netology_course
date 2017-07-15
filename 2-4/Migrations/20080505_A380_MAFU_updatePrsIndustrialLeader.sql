-- Create a new ChoiceList
if(not exists(select * from T_CHOICELIST where Choicelist = 'PrsIndusLeader' and ChoiceValue = 'Fabien Dassie'))
begin
	INSERT INTO T_CHOICELIST (Choicelist, ChoiceValue) VALUES ('PrsIndusLeader', 'Fabien Dassie')
end
if(not exists(select * from T_CHOICELIST where Choicelist = 'PrsIndusLeader' and ChoiceValue = 'Jean Du-Boullay'))
begin
	INSERT INTO T_CHOICELIST (Choicelist, ChoiceValue) VALUES ('PrsIndusLeader', 'Jean Du-Boullay')
end
if(not exists(select * from T_CHOICELIST where Choicelist = 'PrsIndusLeader' and ChoiceValue = 'Frederic Fournier'))
begin
	INSERT INTO T_CHOICELIST (Choicelist, ChoiceValue) VALUES ('PrsIndusLeader', 'Frederic Fournier')
end
if(not exists(select * from T_CHOICELIST where Choicelist = 'PrsIndusLeader' and ChoiceValue = 'Andreas Feeder'))
begin
	INSERT INTO T_CHOICELIST (Choicelist, ChoiceValue) VALUES ('PrsIndusLeader', 'Andreas Feeder')
end
if(not exists(select * from T_CHOICELIST where Choicelist = 'PrsIndusLeader' and ChoiceValue = 'Yngvild Billing'))
begin
	INSERT INTO T_CHOICELIST (Choicelist, ChoiceValue) VALUES ('PrsIndusLeader', 'Yngvild Billing')
end
if(not exists(select * from T_CHOICELIST where Choicelist = 'PrsIndusLeader' and ChoiceValue = 'Didier Fraysse'))
begin
	INSERT INTO T_CHOICELIST (Choicelist, ChoiceValue) VALUES ('PrsIndusLeader', 'Didier Fraysse')
end
if(not exists(select * from T_CHOICELIST where Choicelist = 'PrsIndusLeader' and ChoiceValue = 'Toki Ogunkolati'))
begin
	INSERT INTO T_CHOICELIST (Choicelist, ChoiceValue) VALUES ('PrsIndusLeader', 'Toki Ogunkolati')
end
if(not exists(select * from T_CHOICELIST where Choicelist = 'PrsIndusLeader' and ChoiceValue = 'Michael Heesch'))
begin
	INSERT INTO T_CHOICELIST (Choicelist, ChoiceValue) VALUES ('PrsIndusLeader', 'Michael Heesch')
end
if(not exists(select * from T_CHOICELIST where Choicelist = 'PrsIndusLeader' and ChoiceValue = 'David Gavail'))
begin
	INSERT INTO T_CHOICELIST (Choicelist, ChoiceValue) VALUES ('PrsIndusLeader', 'David Gavail')
end
if(not exists(select * from T_CHOICELIST where Choicelist = 'PrsIndusLeader' and ChoiceValue = 'Gartner David'))
begin
	INSERT INTO T_CHOICELIST (Choicelist, ChoiceValue) VALUES ('PrsIndusLeader', 'Gartner David')
end
if(not exists(select * from T_CHOICELIST where Choicelist = 'PrsIndusLeader' and ChoiceValue = 'Duverger Sandra'))
begin
	INSERT INTO T_CHOICELIST (Choicelist, ChoiceValue) VALUES ('PrsIndusLeader', 'Duverger Sandra')
end
if(not exists(select * from T_CHOICELIST where Choicelist = 'PrsIndusLeader' and ChoiceValue = 'Brettschneider Kai'))
begin
	INSERT INTO T_CHOICELIST (Choicelist, ChoiceValue) VALUES ('PrsIndusLeader', 'Brettschneider Kai')
end
if(not exists(select * from T_CHOICELIST where Choicelist = 'PrsIndusLeader' and ChoiceValue = 'O-Kelly-Farell Thomas'))
begin
	INSERT INTO T_CHOICELIST (Choicelist, ChoiceValue) VALUES ('PrsIndusLeader', 'O-Kelly-Farell Thomas')
end
if(not exists(select * from T_CHOICELIST where Choicelist = 'PrsIndusLeader' and ChoiceValue = 'Peter Jones'))
begin
	INSERT INTO T_CHOICELIST (Choicelist, ChoiceValue) VALUES ('PrsIndusLeader', 'Peter Jones')
end
if(not exists(select * from T_CHOICELIST where Choicelist = 'PrsIndusLeader' and ChoiceValue = 'Philippe Castaingts'))
begin
	INSERT INTO T_CHOICELIST (Choicelist, ChoiceValue) VALUES ('PrsIndusLeader', 'Philippe Castaingts')
end
if(not exists(select * from T_CHOICELIST where Choicelist = 'PrsIndusLeader' and ChoiceValue = 'Erwan Courtel'))
begin
	INSERT INTO T_CHOICELIST (Choicelist, ChoiceValue) VALUES ('PrsIndusLeader', 'Erwan Courtel')
end
if(not exists(select * from T_CHOICELIST where Choicelist = 'PrsIndusLeader' and ChoiceValue = 'Jens Goede'))
begin
	INSERT INTO T_CHOICELIST (Choicelist, ChoiceValue) VALUES ('PrsIndusLeader', 'Jens Goede')
end
if(not exists(select * from T_CHOICELIST where Choicelist = 'PrsIndusLeader' and ChoiceValue = 'Maria Schneider'))
begin
	INSERT INTO T_CHOICELIST (Choicelist, ChoiceValue) VALUES ('PrsIndusLeader', 'Maria Schneider')
end

-- Update Infobase in order to use the choicelist
UPDATE Infobase SET list_val = 'SELECT ChoiceValue FROM T_CHOICELIST WHERE Choicelist like ''PrsIndusLeader'''
WHERE object_value = 'prs_PRSIndustrialLeader' AND table_name = 'V_PRS'

-- Delete some users
DELETE FROM T_CHOICELIST WHERE Choicelist = 'PrsIndusLeader' AND ChoiceValue = 'David Gavail'
DELETE FROM T_CHOICELIST WHERE Choicelist = 'PrsIndusLeader' AND ChoiceValue = 'Michael Heesch'
DELETE FROM T_CHOICELIST WHERE Choicelist = 'PrsIndusLeader' AND ChoiceValue = 'Jean Du-Boullay'
DELETE FROM T_CHOICELIST WHERE Choicelist = 'PrsIndusLeader' AND ChoiceValue = 'Didier Fraysse'