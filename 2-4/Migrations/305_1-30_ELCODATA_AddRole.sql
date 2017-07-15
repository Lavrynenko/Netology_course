
-- Add EPC PED owner Role

if not exists (SELECT * 
			   FROM T_USER_ROLE 
		       WHERE name_role = 'EPC PED owner')
BEGIN
INSERT INTO T_USER_ROLE (name_role) VALUES ('EPC PED owner')
END