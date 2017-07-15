
------------------------------------------------------------------------
-- MANAGE ATTRIBUTES 
-- 
-- @program		A400M
-- @version		5.0
-- @module		ESDCR
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Update ValueList: Add CHECKED status 
------------------------------------------------------------------------

UPDATE T_EDIP_ATTRIBUTE 
SET
ValuesList = 'WIP;PREVIEW;HELD;CHECKED;RELEASED'
WHERE 
ValuesList = 'WIP;PREVIEW;HELD;RELEASED' and
TableName = 'T_PDDS';

UPDATE T_EDIP_ATTRIBUTE 
SET
ValuesList = 'WIP;PREVIEW;HELD;CHECKED;RELEASED'
WHERE 
ValuesList = 'WIP;PREVIEW;HELD;RELEASED' and
TableName = 'T_WDDS';

UPDATE T_EDIP_ATTRIBUTE 
SET
ValuesList = 'WIP;PREVIEW;HELD;CHECKED;RELEASED'
WHERE 
ValuesList = 'WIP;PREVIEW;HELD;RELEASED' and
TableName = 'T_BDDS';

UPDATE T_EDIP_ATTRIBUTE 
SET
ValuesList = 'WIP;PREVIEW;HELD;CHECKED;RELEASED'
WHERE 
ValuesList = 'WIP;PREVIEW;HELD;RELEASED' and
TableName = 'T_FDDS';





---------------------------------------------------------------------------
-- Create New Role "A400M_CHECKER"
---------------------------------------------------------------------------
IF (NOT EXISTS(	SELECT * FROM T_EDIP_CONTEXT
					WHERE ContextName='A400M_Checker')
) BEGIN
INSERT INTO T_EDIP_CONTEXT VALUES ('A400M_Checker',1,1)
END
---------------------------
DECLARE @CONTEXT_id INT
 SELECT @CONTEXT_id=CONTEXT_id FROM T_EDIP_CONTEXT WHERE CONTEXTNAME='A400M_Checker'

DECLARE @USER_id VARCHAR(5000)
 
DECLARE list_user_Admin CURSOR FOR 
	SELECT CONTEXT__USER_USER_idr FROM T_LINK_CONTEXT__USER WHERE CONTEXT__USER_CONTEXT_idr = (SELECT CONTEXT_id FROM T_EDIP_CONTEXT WHERE CONTEXTNAME='Admin')

OPEN list_user_Admin

FETCH list_user_Admin INTO @USER_id

WHILE @@FETCH_STATUS = 0
BEGIN
                IF (NOT EXISTS(SELECT * FROM T_LINK_CONTEXT__USER WHERE CONTEXT__USER_CONTEXT_idr=@CONTEXT_id AND CONTEXT__USER_USER_idr=@USER_id))
                BEGIN
                INSERT INTO T_LINK_CONTEXT__USER (CONTEXT__USER_CONTEXT_idr,CONTEXT__USER_USER_idr) VALUES (@CONTEXT_id,@USER_id)
                END

                FETCH list_user_Admin INTO @USER_id
END

CLOSE list_user_Admin
DEALLOCATE list_user_Admin

 
DECLARE list_user_Support CURSOR FOR 
	SELECT CONTEXT__USER_USER_idr FROM T_LINK_CONTEXT__USER WHERE CONTEXT__USER_CONTEXT_idr = (SELECT CONTEXT_id FROM T_EDIP_CONTEXT WHERE CONTEXTNAME='A400M_Support')

OPEN list_user_Support

FETCH list_user_Support INTO @USER_id

WHILE @@FETCH_STATUS = 0
BEGIN
                IF (NOT EXISTS(SELECT * FROM T_LINK_CONTEXT__USER WHERE CONTEXT__USER_CONTEXT_idr=@CONTEXT_id AND CONTEXT__USER_USER_idr=@USER_id))
                BEGIN
                INSERT INTO T_LINK_CONTEXT__USER (CONTEXT__USER_CONTEXT_idr,CONTEXT__USER_USER_idr) VALUES (@CONTEXT_id,@USER_id)
                END

                FETCH list_user_Support INTO @USER_id
END

CLOSE list_user_Support
DEALLOCATE list_user_Support

DECLARE list_user_UserAdmin CURSOR FOR 
	SELECT CONTEXT__USER_USER_idr FROM T_LINK_CONTEXT__USER WHERE CONTEXT__USER_CONTEXT_idr = (SELECT CONTEXT_id FROM T_EDIP_CONTEXT WHERE CONTEXTNAME='Admin_User')

OPEN list_user_UserAdmin

FETCH list_user_UserAdmin INTO @USER_id

WHILE @@FETCH_STATUS = 0
BEGIN
                IF (NOT EXISTS(SELECT * FROM T_LINK_CONTEXT__USER WHERE CONTEXT__USER_CONTEXT_idr=@CONTEXT_id AND CONTEXT__USER_USER_idr=@USER_id))
                BEGIN
                INSERT INTO T_LINK_CONTEXT__USER (CONTEXT__USER_CONTEXT_idr,CONTEXT__USER_USER_idr) VALUES (@CONTEXT_id,@USER_id)
                END

                FETCH list_user_UserAdmin INTO @USER_id
END

CLOSE list_user_UserAdmin
DEALLOCATE list_user_UserAdmin