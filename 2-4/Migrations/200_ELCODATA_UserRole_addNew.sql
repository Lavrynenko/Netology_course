---------------------------------------------------  ADD NEW ROLE ----------------------------------------------------------

-- CREATE ROLE 'EPC Module - VC PIN Owner'
IF( NOT EXISTS( SELECT * FROM T_USER_ROLE  WHERE name_role = 'EPC Module - VC PIN Owner' ))
BEGIN
	INSERT INTO T_USER_ROLE (name_role) VALUES ('EPC Module - VC PIN Owner')
END