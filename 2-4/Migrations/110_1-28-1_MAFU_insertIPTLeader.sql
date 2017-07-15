DECLARE 
	@ipt_leader_name VARCHAR(255), 
	@code VARCHAR(8000)
	
-- Add new IPT leader code
IF (NOT EXISTS (SELECT * FROM T_IPT_LEADER WHERE ipt_leader_name = 'VSF - Flight Test Installation'))
begin
	INSERT INTO T_IPT_LEADER (ipt_leader_name) VALUES ('VSF - Flight Test Installation')
end

IF (NOT EXISTS (SELECT * FROM T_IPT_LEADER WHERE ipt_leader_name = 'VSL - Lab Test'))
begin
	INSERT INTO T_IPT_LEADER (ipt_leader_name) VALUES ('VSL - Lab Test')
end

IF (NOT EXISTS (SELECT * FROM T_IPT_LEADER WHERE ipt_leader_name = 'VSS - Landing Gears Structure'))
begin
	INSERT INTO T_IPT_LEADER (ipt_leader_name) VALUES ('VSS - Landing Gears Structure')
end

IF (NOT EXISTS (SELECT * FROM T_IPT_LEADER WHERE ipt_leader_name = 'VSY - Landing Gears Systems'))
begin
	INSERT INTO T_IPT_LEADER (ipt_leader_name) VALUES ('VSY - Landing Gears Systems')
end


-- delete table
DELETE FROM T_WP_LEADER_CODE
-- insert all values
-- ADD WP Leader Code

---- 'VSA - Avionics Systems'
SET @ipt_leader_name = 'VSA - Avionics Systems'

SET @code = 'VSAX     Avionics Systems - General'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAD     Alert and Displays - Cockpit Display System'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAC     Alert and Displays - Flight Warning System (FWS)'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAE     Alert and Displays - Head Up Display (HUD)'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAV     Alert and Displays - Airport Nav Function (ANF)'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAI     Communication and Surveillance - Radiocom System'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAJ     Communication and Surveillance - CVR'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAK     Communication and Surveillance - RAIMS'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAL     Communication and Surveillance - Satcom'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAM     Communication and Surveillance - ACR System'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAN     Communication and Surveillance - ATC System'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSA2     Communication and Surveillance - Radome'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAH     Communication and Surveillance - Communication Multiplexer Video (CMV)'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAY     Communication and Surveillance - ETACS'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAS     Communication and Surveillance - AESS'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAT     Navigate - ADIRS'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAQ     Navigate - Probes'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSA8     Navigate - ISIS'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAP     Navigate - Flight Management System (FMS)'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAR     Navigate - MMR, DRA'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSA7     Navigate - DME, VOR, ADF'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAA     Cockpit and Layout - Seats'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSA1     Cockpit and Layout - Landing Gear Cockpit Devices'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAF     Cockpit and Layout - Integrated Control Panel (ICP)'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAU     Cockpit and Layout - Fire Protection System'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSA4     Cockpit and Layout - Rain Protection Wipers and Rain Repellent'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSA5     Cockpit and Layout - Ice Detection Probes'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSA6     Cockpit and Layout - Rain and Ice Protection Detection'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAW     Cockpit and Layout - Engine Interface Function'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAG     Cockpit and Layout - Cockpit Lighting'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAZ     Cockpit and Layout - Cockpit Windows'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSAO     Cockpit and Layout - Cockpit Layout'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

---------------------
---- 'VSI - IMA and Recorders'

SET @ipt_leader_name = 'VSI - IMA and Recorders'

SET @code = 'VSIX     IMA and Recorders - General'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSIC     IMA - cRDC Dev and Tools'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSIB     IMA - CPIOM Dev and Tools'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSIA     ADCN - ADCN Design / Switch NBF Development'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSII     Recording - ACMS System'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSIK     Recording - DFDRS System'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

---------------------
---- 'VSK - FSA-NG'
SET @ipt_leader_name = 'VSK - FSA-NG'

SET @code = 'VSKX     FSA-NG - General'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSKN     WP Networks and Servers'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSKF     WP FOPS Tool Box'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSKC     WP Centralized Maintenance Tool Box'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSKA     Cabin Applications'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSKS     SCI Gateway'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSKM     WP Maintenance'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSKW     WP Wireless Communication'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

---------------------
---- 'VSC - Flight Control Hydraulics'
SET @ipt_leader_name = 'VSC - Flight Control Hydraulics'

SET @code = 'VSCX     Flight Control Hydraulics - General'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSCH     Hydraulics System'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSCL     High Lift System - General'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSCS     High Lift System - Slats Actuation'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSCF     High Lift System - Flaps Actuation'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSCM     High Lift System - Control and Monitoring'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSCC     FCGS - Architecture and Computers - General'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSC1     FCGS - Architecture and Computers - PRIM'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSC2     FCGS - Architecture and Computers - SEC'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSCI     FCGS - Architecture and Computers - FCDC and FCU Back-up'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSCJ     FCGS - Architecture and Computers - TMDC (RNP 0.1) Application'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSCZ     FCGS - Architecture and Computers - FCU'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSCA     FCGS Pilot Control and Actuators - General'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSCP     FCGS Pilot Control and Actuators - PFCA'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSCT     FCGS Pilot Control and Actuators - THSA'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSCB     FCGS Pilot Control and Actuators - BCM Development / BPS'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSCV     FCGS Pilot Control and Actuators - PFTU / Speed Brakes / RVDT / SSU / Accelero / Gyro'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSCU     FCGS Pilot Control and Actuators - PDFU'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSCG     FCGS Pilot Control and Actuators - TCA'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSCD     Stability and Control'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

---------------------
---- 'VSE - Electrical'
SET @ipt_leader_name = 'VSE - Electrical'

SET @code = 'VSEX     Electrical - General'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSEG     Electrical Power Generation'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSEP     Electrical Power Distribution'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSEC     Power Converters'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSEB     Batteries'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSER     Ram Air Turbine (RAT)'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSEE     External Lights'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

---------------------
---- 'VSU - Fuel'
SET @ipt_leader_name = 'VSU - Fuel'

SET @code = 'VSUX     Fuel - General'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSUF     Fuel - Fluid Mechanical'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSUP     Fuel - Pump'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSUC     Fuel - Control and HMI'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSUI     Inerting - Inerting Definition and Design'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

---------------------
---- 'VSV - EMSP'
SET @ipt_leader_name = 'VSV - EMSP'

SET @code = 'VSVX     EMSP - General'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSVP     EASP - WP1 Pneumatic Power Distribution'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSVB     EASP - WP1 Wing Ice Protection'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSVG     EASP - WP2 Air cooling / Conditioning and Comp Temp Control'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSVC     EASP - WP3 Control Fuselage Pressure'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSVD     EASP - WP4/6 Ventilation Control and Air Management'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSVS     EASP - WP5 Supplemental Cooling System (SCS)'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSVA     APS - APU Engine'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSVK     APS - APU Installation Kit'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSVM     APS - APS Control and SGS'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

---------------------
---- 'VSF - Flight Test Installation'
SET @ipt_leader_name = 'VSF - Flight Test Installation'

SET @code = 'VSFX     Flight Test Installation - General'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

---------------------
---- 'VSL - Lab Test'
SET @ipt_leader_name = 'VSL - Lab Test'

SET @code = 'VSLX     Lab Test - General'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

---------------------
---- 'VSS - Landing Gears Structure'
SET @ipt_leader_name = 'VSS - Landing Gears Structure'

SET @code = 'VSSX     Landing Gears Structure - General'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSSM     Landing Gears Structure - Main Landing Gear'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSSN     Landing Gears Structure - Nose Landing Gear'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

---------------------
---- 'VSY - Landing Gears Systems'
SET @ipt_leader_name = 'VSY - Landing Gears Systems'

SET @code = 'VSYX     Landing Gears Systems - General'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSYL     Landing Gears Systems - Extension and Retraction System'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSYW     Landing Gears Systems - Wheels, tyres and brakes'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSYB     Landing Gears Systems - Braking and Steering control system'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSYC     Landing Gears Systems - Brake Cooling'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSYM     Landing Gears Systems - Landing Gear Management System'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end

SET @code = 'VSYS     Landing Gears Systems - Steering System'
IF (NOT EXISTS (SELECT * FROM T_WP_LEADER_CODE WHERE code = @code))
begin
	INSERT INTO T_WP_LEADER_CODE (code, idr_ipt_leader)
	SELECT @code, id_ipt_leader
	FROM T_IPT_LEADER
	WHERE ipt_leader_name = @ipt_leader_name
end
