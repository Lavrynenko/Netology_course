/******************************************************************************************
		Delete permissions on old date fields
*******************************************************************************************/

DECLARE 
	@table_name VARCHAR(255), 
	@object_value VARCHAR(255), 
	@idr_infobase INT

--------
-- CR --
--------

SET @table_name = 'V_CR'

SET @idr_infobase = 0
SET @object_value = 'cr_DistributionDate'

SELECT @idr_infobase = id_infobase FROM INFOBASE WHERE object_value = @object_value AND table_name = @table_name

if (@idr_infobase <> 0) 
BEGIN
	DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_infobase = @idr_infobase
END 
ELSE 
BEGIN 
	print 'The attribute cr_DistributionDate does not exist in Infobase.'
END


---------
-- RFC --
---------

SET @table_name = 'V_RFC'

SET @idr_infobase = 0
SET @object_value = 'LaunchingDate'

SELECT @idr_infobase = id_infobase FROM INFOBASE WHERE object_value = @object_value AND table_name = @table_name

if (@idr_infobase <> 0) 
BEGIN
	DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_infobase = @idr_infobase
END 
ELSE 
BEGIN 
	print 'The attribute LaunchingDate does not exist in Infobase.'
END


SET @idr_infobase = 0
SET @object_value = 'SYSCCC0ReleasedDate'

SELECT @idr_infobase = id_infobase FROM INFOBASE WHERE object_value = @object_value AND table_name = @table_name

if (@idr_infobase <> 0) 
BEGIN
	DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_infobase = @idr_infobase
END 
ELSE 
BEGIN 
	print 'The attribute SYSCCC0ReleasedDate does not exist in Infobase.'
END


---------
-- MOD --
---------

SET @table_name = 'T_MOD'

SET @idr_infobase = 0
SET @object_value = 'MODTargetDate'

SELECT @idr_infobase = id_infobase FROM INFOBASE WHERE object_value = @object_value AND table_name = @table_name

if (@idr_infobase <> 0) 
BEGIN
	DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_infobase = @idr_infobase
END 
ELSE 
BEGIN 
	print 'The attribute MODTargetDate does not exist in Infobase.'
END


SET @idr_infobase = 0
SET @object_value = 'MODMASEASADate'

SELECT @idr_infobase = id_infobase FROM INFOBASE WHERE object_value = @object_value AND table_name = @table_name

if (@idr_infobase <> 0) 
BEGIN
	DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_infobase = @idr_infobase
END 
ELSE 
BEGIN 
	print 'The attribute MODMASEASADate does not exist in Infobase.'
END


---------------
-- T_MEETING --
---------------

SET @table_name = 'T_MEETING'

SET @idr_infobase = 0
SET @object_value = 'meetDate'

SELECT @idr_infobase = id_infobase FROM INFOBASE WHERE object_value = @object_value AND table_name = @table_name

if (@idr_infobase <> 0) 
BEGIN
	DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_infobase = @idr_infobase
END 
ELSE 
BEGIN 
	print 'The attribute meetDate does not exist in Infobase.'
END


--------------
-- T_ACTION --
--------------

SET @table_name = 'T_ACTION'

SET @idr_infobase = 0
SET @object_value = 'act_date'

SELECT @idr_infobase = id_infobase FROM INFOBASE WHERE object_value = @object_value AND table_name = @table_name

if (@idr_infobase <> 0) 
BEGIN
	DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_infobase = @idr_infobase
END 
ELSE 
BEGIN 
	print 'The attribute act_date does not exist in Infobase.'
END


SET @idr_infobase = 0
SET @object_value = 'act_closureDate'

SELECT @idr_infobase = id_infobase FROM INFOBASE WHERE object_value = @object_value AND table_name = @table_name

if (@idr_infobase <> 0) 
BEGIN
	DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_infobase = @idr_infobase
END 
ELSE 
BEGIN 
	print 'The attribute act_closureDate does not exist in Infobase.'
END


-----------------------
-- T_DELTA1_FOLLOWUP --
-----------------------

SET @table_name = 'T_DELTA1_FOLLOWUP'

SET @idr_infobase = 0
SET @object_value = 'removalDateF'

SELECT @idr_infobase = id_infobase FROM INFOBASE WHERE object_value = @object_value AND table_name = @table_name

if (@idr_infobase <> 0) 
BEGIN
	DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_infobase = @idr_infobase
END 
ELSE 
BEGIN 
	print 'The attribute removalDateF does not exist in Infobase.'
END


SET @idr_infobase = 0
SET @object_value = 'removalDateA'

SELECT @idr_infobase = id_infobase FROM INFOBASE WHERE object_value = @object_value AND table_name = @table_name

if (@idr_infobase <> 0) 
BEGIN
	DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_infobase = @idr_infobase
END 
ELSE 
BEGIN 
	print 'The attribute removalDateA does not exist in Infobase.'
END

