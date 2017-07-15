------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------ Update control values for EDD attributes in T_MG --------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- @program                     A400M
-- @version			2.1.1
-- @module                      ELCODATA


--List of couples for which the attributes are updated:

--PEPDC - RCCB
--PEPDC - C/B
--PEPDC - RCCB
--SEPDC - SSPC
------------------------------------------------------------------

DECLARE @Object_name VARCHAR(255)

DECLARE @PCType VARCHAR(255)

DECLARE @DeviceType VARCHAR(255)

DECLARE @ML INT

DECLARE @SpecificControl INT


delete from T_MG where t_mg.Object_name like '%ICD functional designation%spare%'

----------------------------------------------------------------------------------------------------
-- Update Attributes for couple PEPDC - C/B --
-------------------------------------------------------------------------------------------------------

SET @PCType = 'PEPDC'

SET @DeviceType = 'C/B'

-----------------------------------------------------------------
--Update Attribute "ICD C/B or RCCB space functional designation"
-----------------------------------------------------------------
SET @Object_name = 'ICD C/B or RCCB space functional designation'

SET @ML = 3

SET @SpecificControl=0

IF EXISTS(SELECT * FROM T_MG WHERE Object_name = @Object_name AND PCType = @PCType AND DeviceType = @DeviceType)

	UPDATE T_MG SET ML = @ML WHERE Object_name = @Object_name AND PCType = @PCType AND DeviceType = @DeviceType

ELSE

	INSERT INTO T_MG (Object_name,PCType,DeviceType,ML,SpecificControl,eddType) VALUES (@Object_name, @PCType, @DeviceType, @ML, @SpecificControl, 'PCD' );







----------------------------------------------------------------------------------------------------
-- Update Attributes for couple PEPDC - RCCB --
-------------------------------------------------------------------------------------------------------

SET @PCType = 'PEPDC'

SET @DeviceType = 'RCCB'


-----------------------------------------------------------------
--Update Attribute "ICD C/B or RCCB space functional designation"
-----------------------------------------------------------------
SET @Object_name = 'ICD C/B or RCCB space functional designation'

SET @ML = 3

SET @SpecificControl=0

IF EXISTS(SELECT * FROM T_MG WHERE Object_name = @Object_name AND PCType = @PCType AND DeviceType = @DeviceType)

	UPDATE T_MG SET ML = @ML WHERE Object_name = @Object_name AND PCType = @PCType AND DeviceType = @DeviceType

ELSE

	INSERT INTO T_MG (Object_name,PCType,DeviceType,ML,SpecificControl,eddType) VALUES (@Object_name, @PCType, @DeviceType, @ML, @SpecificControl, 'PCD' );






