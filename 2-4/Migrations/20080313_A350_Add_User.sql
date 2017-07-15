DECLARE @idUser VARCHAR(255)
SET @idUser = 0

-- LOUSTEAU Annick TO27088

IF (not exists (SELECT user_logon FROM T_USER WHERE user_logon = 'TO27088'))
	BEGIN 
	INSERT INTO T_USER (user_logon,user_pass,user_first_name,user_surname,user_mail,user_key,user_level,idr_CDBT,user_connexion_state,user_last_refresh) 
		    VALUES ('TO27088','30ea0a768cc9d95255e241efe585e23a','Annick','LOUSTEAU',' ',null,null,null,'DISCONNECTED','0')
	INSERT INTO T_SEARCH_PROFIL (label,idr_user) VALUES ('LAST_SEARCH',@@IDENTITY)
END


ELSE 
	BEGIN
	SELECT @idUser = user_id FROM T_USER WHERE user_logon = 'TO27088'
	UPDATE T_USER 
	SET user_pass='30ea0a768cc9d95255e241efe585e23a', user_first_name='Annick', user_surname='LOUSTEAU' 
	WHERE user_logon='TO27088'
	DELETE FROM T_LINK_ROLE_USER WHERE idr_user = @idUser
END
	
	
INSERT INTO T_LINK_ROLE_USER (idr_user_role,idr_user) SELECT id_role,user_id 
								FROM T_USER,T_USER_ROLE 
								WHERE user_logon='TO27088' 
								AND user_pass='30ea0a768cc9d95255e241efe585e23a' 
								AND user_first_name='Annick' 
								AND user_surname='LOUSTEAU' 
								AND name_role='Administrator'
	

	
	

-- REVERSEAU Claire ST21201

IF (not exists (SELECT user_logon FROM T_USER WHERE user_logon = 'ST21201'))
	BEGIN 
	INSERT INTO T_USER (user_logon,user_pass,user_first_name,user_surname,user_mail,user_key,user_level,idr_CDBT,user_connexion_state,user_last_refresh) 
		    VALUES ('ST21201','30ea0a768cc9d95255e241efe585e23a','Claire','REVERSEAU',' ',null,null,null,'DISCONNECTED','0')
	INSERT INTO T_SEARCH_PROFIL (label,idr_user) VALUES ('LAST_SEARCH',@@IDENTITY)
END


ELSE 
	BEGIN
	SELECT @idUser = user_id FROM T_USER WHERE user_logon = 'ST21201'
	UPDATE T_USER 
	SET user_pass='30ea0a768cc9d95255e241efe585e23a', user_first_name='Claire', user_surname='REVERSEAU' 
	WHERE user_logon='ST21201'
	DELETE FROM T_LINK_ROLE_USER WHERE idr_user = @idUser
END


INSERT INTO T_LINK_ROLE_USER (idr_user_role,idr_user) SELECT id_role,user_id 
								FROM T_USER,T_USER_ROLE 
								WHERE user_logon='ST21201' 
								AND user_pass='30ea0a768cc9d95255e241efe585e23a' 
								AND user_first_name='Claire' 
								AND user_surname='REVERSEAU' 
								AND name_role='Administrator'



-- ARMAND Marie-Laure ST21354

IF (not exists (SELECT * FROM T_USER WHERE user_logon = 'ST21354'))
	BEGIN 
	INSERT INTO T_USER (user_logon,user_pass,user_first_name,user_surname,user_mail,user_key,user_level,idr_CDBT,user_connexion_state,user_last_refresh) 
		    VALUES ('ST21354','30ea0a768cc9d95255e241efe585e23a','Marie-Laure','ARMAND',' ',null,null,null,'DISCONNECTED','0')

	INSERT INTO T_SEARCH_PROFIL (label,idr_user) VALUES ('LAST_SEARCH',@@IDENTITY)
END

ELSE 
	BEGIN
	SELECT @idUser = user_id FROM T_USER WHERE user_logon = 'ST21354'
	UPDATE T_USER 
	SET user_pass='30ea0a768cc9d95255e241efe585e23a', user_first_name='Marie-Laure', user_surname='ARMAND' 
	WHERE user_logon='ST21354'
	DELETE FROM T_LINK_ROLE_USER WHERE idr_user = @idUser
END

INSERT INTO T_LINK_ROLE_USER (idr_user_role,idr_user) SELECT id_role,user_id 
								FROM T_USER,T_USER_ROLE 
								WHERE user_logon='ST21354' 
								AND user_pass='30ea0a768cc9d95255e241efe585e23a' 
								AND user_first_name='Marie-Laure' 
								AND user_surname='ARMAND' 
								AND name_role='Administrator'



-- SALLIONI Jean-Paul ST02450

IF (not exists (SELECT user_logon FROM T_USER WHERE user_logon = 'ST02450'))
	BEGIN 
	INSERT INTO T_USER (user_logon,user_pass,user_first_name,user_surname,user_mail,user_key,user_level,idr_CDBT,user_connexion_state,user_last_refresh) 
		    VALUES ('ST02450','30ea0a768cc9d95255e241efe585e23a','Jean-Paul','SALLIONI',' ',null,null,null,'DISCONNECTED','0')

	INSERT INTO T_SEARCH_PROFIL (label,idr_user) VALUES ('LAST_SEARCH',@@IDENTITY)
END


ELSE 
	BEGIN
	SELECT @idUser = user_id FROM T_USER WHERE user_logon = 'ST02450'
	UPDATE T_USER 
	SET user_pass='30ea0a768cc9d95255e241efe585e23a', user_first_name='Jean-Paul', user_surname='SALLIONI' 
	WHERE user_logon='ST02450'
	DELETE FROM T_LINK_ROLE_USER WHERE idr_user = @idUser
END


INSERT INTO T_LINK_ROLE_USER (idr_user_role,idr_user) SELECT id_role,user_id 
								FROM T_USER,T_USER_ROLE 
								WHERE user_logon='ST02450' 
								AND user_pass='30ea0a768cc9d95255e241efe585e23a' 
								AND user_first_name='Jean-Paul' 
								AND user_surname='SALLIONI' 
								AND name_role='Administrator'
								

-- VINCHES Brigitte ST16152

IF (not exists (SELECT user_logon FROM T_USER WHERE user_logon = 'ST16152'))
	BEGIN 
	INSERT INTO T_USER (user_logon,user_pass,user_first_name,user_surname,user_mail,user_key,user_level,idr_CDBT,user_connexion_state,user_last_refresh) 
		    VALUES ('ST16152','30ea0a768cc9d95255e241efe585e23a','Brigitte','VINCHES',' ',null,null,null,'DISCONNECTED','0')

	INSERT INTO T_SEARCH_PROFIL (label,idr_user) VALUES ('LAST_SEARCH',@@IDENTITY)
END

ELSE 
	BEGIN
	SELECT @idUser = user_id FROM T_USER WHERE user_logon = 'ST16152'
	UPDATE T_USER 
	SET user_pass='30ea0a768cc9d95255e241efe585e23a', user_first_name='Brigitte', user_surname='VINCHES' 
	WHERE user_logon='ST16152'
	DELETE FROM T_LINK_ROLE_USER WHERE idr_user = @idUser
END

INSERT INTO T_LINK_ROLE_USER (idr_user_role,idr_user) SELECT id_role,user_id 
								FROM T_USER,T_USER_ROLE 
								WHERE user_logon='ST16152' 
								AND user_pass='30ea0a768cc9d95255e241efe585e23a' 
								AND user_first_name='Brigitte' 
								AND user_surname='VINCHES' 
								AND name_role='Administrator'