/******************************************************************************************
		Insert values in Tables T_IPT_LEADER and T_WP_LEADER_CODE
*******************************************************************************************/

DECLARE 
	@ipt_leader_name VARCHAR(255), 
	@code VARCHAR(8000)

-- Delete all elements
DELETE FROM T_WP_LEADER_CODE
DELETE FROM T_IPT_LEADER

------------------------------
-- Create IPT Leader values --
------------------------------

IF NOT EXISTS (SELECT * FROM T_IPT_LEADER WHERE ipt_leader_name = 'VSA - Avionics Systems')
	INSERT INTO T_IPT_LEADER (ipt_leader_name) VALUES ('VSA - Avionics Systems')

IF NOT EXISTS (SELECT * FROM T_IPT_LEADER WHERE ipt_leader_name = 'VSI - IMA and Recorders')
	INSERT INTO T_IPT_LEADER (ipt_leader_name) VALUES ('VSI - IMA and Recorders')

IF NOT EXISTS (SELECT * FROM T_IPT_LEADER WHERE ipt_leader_name = 'VSK - FSA-NG')
	INSERT INTO T_IPT_LEADER (ipt_leader_name) VALUES ('VSK - FSA-NG')

IF NOT EXISTS (SELECT * FROM T_IPT_LEADER WHERE ipt_leader_name = 'VSC - Flight Control Hydraulics')
	INSERT INTO T_IPT_LEADER (ipt_leader_name) VALUES ('VSC - Flight Control Hydraulics')
	
IF NOT EXISTS (SELECT * FROM T_IPT_LEADER WHERE ipt_leader_name = 'VSE - Electrical')
	INSERT INTO T_IPT_LEADER (ipt_leader_name) VALUES ('VSE - Electrical')
	
IF NOT EXISTS (SELECT * FROM T_IPT_LEADER WHERE ipt_leader_name = 'VSU - Fuel')
	INSERT INTO T_IPT_LEADER (ipt_leader_name) VALUES ('VSU - Fuel')
	
IF NOT EXISTS (SELECT * FROM T_IPT_LEADER WHERE ipt_leader_name = 'VSV - EMSP')
	INSERT INTO T_IPT_LEADER (ipt_leader_name) VALUES ('VSV - EMSP')


----------------------------------
-- Create WP Leader Code values --
----------------------------------

---- 'VSA - Avionics Systems'
SET @ipt_leader_name = 'VSA - Avionics Systems'

SET @code = 'VSAX     Avionics Systems - General'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAD     Alert & Displays - Cockpit Display System'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAC     Alert & Displays - Flight Warning System (FWS)'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAE     Alert & Displays - Head Up Display (HUD)'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAV     Alert & Displays - Airport Nav Function (ANF)'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAI     Communication & Surveillance - Radiocom System'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAJ     Communication & Surveillance - CVR'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAK     Communication & Surveillance - RAIMS'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAL     Communication & Surveillance - Satcom'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAM     Communication & Surveillance - ACR System'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAN     Communication & Surveillance - ATC System'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSA2     Communication & Surveillance - Radome'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAH     Communication & Surveillance - Communication Multiplexer Video (CMV)'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAB     Communication & Surveillance - WACS'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSA3     Communication & Surveillance - Com Antennas'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAY     Communication & Surveillance - ETACS'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAS     Communication & Surveillance - AESS'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAT     Navigate - ADIRS'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAQ     Navigate - Probes'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSA8     Navigate - ISIS'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAP     Navigate - Flight Management System (FMS)'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAR     Navigate - MMR, DRA'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSA7     Navigate - DME, VOR, ADF'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAA     Cockpit & Layout - Seats'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSA1     Cockpit & Layout - Landing Gear Cockpit Devices'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAF     Cockpit & Layout - Integrated Control Panel (ICP)'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAU     Cockpit & Layout - Fire Protection System'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSA4     Cockpit & Layout - Rain Protection Wipers & Rain Repellent'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSA5     Cockpit & Layout - Ice Detection Probes'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSA6     Cockpit & Layout - Rain & Ice Protection Detection'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAW     Cockpit & Layout - Engine Interface Function'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAG     Cockpit & Layout - Cockpit Lighting'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAZ     Cockpit & Layout - Cockpit Windows'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSAO     Cockpit & Layout - Cockpit Layout'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name


---- 'VSI - IMA & Recorders'
SET @ipt_leader_name = 'VSI - IMA and Recorders'

SET @code = 'VSIX     IMA & Recorders - General'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSIC     IMA - cRDC Dev & Tools'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSIB     IMA - CPIOM Dev & Tools'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSIA     ADCN - ADCN Design / Switch NBF Development'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSII     Recording - ACMS System'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSIK     Recording - DFDRS System'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name


---- 'VSK - FSA-NG'
SET @ipt_leader_name = 'VSK - FSA-NG'

SET @code = 'VSKX     FSA-NG - General'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSKN     WP Networks & Servers'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSKF     WP FOPS Tool Box'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSKC     WP Centralized Maintenance Tool Box'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSKA     Cabin Applications'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSKS     SCI Gateway'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSKM     WP Maintenance'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name


---- 'VSC - Flight Control Hydraulics'
SET @ipt_leader_name = 'VSC - Flight Control Hydraulics'

SET @code = 'VSCX     Flight Control Hydraulics - General'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSCH     Hydraulics System'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSCL     High Lift System - General'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSCS     High Lift System - Slats Actuation'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSCF     High Lift System - Flaps Actuation'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSCM     High Lift System - Control & Monitoring'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSCC     FCGS - Architecture & Computers - General'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSC1     FCGS - Architecture & Computers - PRIM'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSC2     FCGS - Architecture & Computers - SEC'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSCI     FCGS - Architecture & Computers - FCDC & FCU Back-up'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSCJ     FCGS - Architecture & Computers - TMDC (RNP 0.1) Application'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSCZ     FCGS - Architecture & Computers - FCU'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSCA     FCGS Pilot Control & Actuators - General'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSCP     FCGS Pilot Control & Actuators - PFCA'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSCT     FCGS Pilot Control & Actuators - THSA'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSCB     FCGS Pilot Control & Actuators - BCM Development / BPS'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSCV     FCGS Pilot Control & Actuators - PFTU / Speed Brakes / RVDT / SSU / Accelero / Gyro'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSCU     FCGS Pilot Control & Actuators - PDFU'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSCG     FCGS Pilot Control & Actuators - TCA'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSCD     Stability & Control'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name


---- 'VSE - Electrical'
SET @ipt_leader_name = 'VSE - Electrical'

SET @code = 'VSEX     Electrical - General'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSEG     Electrical Power Generation'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSEP     Electrical Power Distribution'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSEC     Power Converters'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSEB     Batteries'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSER     Ram Air Turbine (RAT)'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSEE     External Lights'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name


---- 'VSU - Fuel'
SET @ipt_leader_name = 'VSU - Fuel'

SET @code = 'VSUX     Fuel - General'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSUF     Fuel - Fluid Mechanical'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSUP     Fuel - Pump'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSUC     Fuel - Control & HMI'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSUI     Inerting - Inerting Definition & Design'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name


---- 'VSI - IMA & Recorders'
SET @ipt_leader_name = 'VSV - EMSP'

SET @code = 'VSVX     EMSP - General'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSVP     EASP - WP1 Pneumatic Power Distribution'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSVB     EASP - WP1 Wing Ice Protection'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSVG     EASP - WP2 Air cooling / Conditioning & Comp Temp Control'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSVC     EASP - WP3 Control Fuselage Pressure'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSVD     EASP - WP4/6 Ventilation Control & Air Management'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSVS     EASP - WP5 Supplemental Cooling System (SCS)'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSVA     APS - APU Engine'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSVK     APS - APU Installation Kit'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name

SET @code = 'VSVM     APS - APS Control & SGS'
IF NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code)
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader) SELECT @code, id_ipt_leader FROM T_IPT_LEADER WHERE ipt_leader_name = @ipt_leader_name
