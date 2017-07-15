/******************************************************************************************
		Add new roles
*******************************************************************************************/
if(not exists(select * from T_USER_ROLE where name_role = 'MAFU CM Change Leader'))
begin
	INSERT INTO T_USER_ROLE (name_role) VALUES ('MAFU CM Change Leader')
end

if(not exists(select * from T_USER_ROLE where name_role = 'MAFU IPT CM Group Leader'))
begin
	INSERT INTO T_USER_ROLE (name_role) VALUES ('MAFU IPT CM Group Leader')
end

if(not exists(select * from T_USER_ROLE where name_role = 'MAFU PDT Operational Team'))
begin
	INSERT INTO T_USER_ROLE (name_role) VALUES ('MAFU PDT Operational Team')
end

if(not exists(select * from T_USER_ROLE where name_role = 'MAFU Common User'))
begin
	INSERT INTO T_USER_ROLE (name_role) VALUES ('MAFU Common User')
end

if(not exists(select * from T_USER_ROLE where name_role = 'MAFU Customisation Team'))
begin
	INSERT INTO T_USER_ROLE (name_role) VALUES ('MAFU Customisation Team')
end

if(not exists(select * from T_USER_ROLE where name_role = 'MAFU Engineering Team'))
begin
	INSERT INTO T_USER_ROLE (name_role) VALUES ('MAFU Engineering Team')
end

if(not exists(select * from T_USER_ROLE where name_role = 'MAFU Industrial Team'))
begin
	INSERT INTO T_USER_ROLE (name_role) VALUES ('MAFU Industrial Team')
end

if(not exists(select * from T_USER_ROLE where name_role = 'MAFU Edit Search'))
begin
	INSERT INTO T_USER_ROLE (name_role) VALUES ('MAFU Edit Search')
end

if(not exists(select * from T_USER_ROLE where name_role = 'MAFU Certification Team'))
begin
	INSERT INTO T_USER_ROLE (name_role) VALUES ('MAFU Certification Team')
end

if(not exists(select * from T_USER_ROLE where name_role = 'MAFU PDT CM Group Leader'))
begin
	INSERT INTO T_USER_ROLE (name_role) VALUES ('MAFU PDT CM Group Leader')
end

if(not exists(select * from T_USER_ROLE where name_role = 'MAFU Edit List'))
begin
	INSERT INTO T_USER_ROLE (name_role) VALUES ('MAFU Edit List')
end