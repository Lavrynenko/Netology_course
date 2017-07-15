
/**********************************************/
/* REPORT : "Extract EDD Loads for EDD Tool" */
/**********************************************/

IF (NOT EXISTS (SELECT * FROM T_REPORT_GROUP WHERE report_group_label = 'ELCODATA'))
BEGIN
	INSERT INTO T_REPORT_GROUP (report_group_label) SELECT 'ELCODATA'
END

DELETE FROM T_DBActions WHERE label = 'Extract EDD Loads for EDD Tool';

INSERT INTO T_DBActions (label, command, comments, template_page, parameters, report_commentary, mandatory_fields, report_group_idr) 
	SELECT 'Extract EDD Loads for EDD Tool', 
'SELECT 
	EDDReference,DSEffectivity,EDD_Load_State,

TypeACDC,
TypePhase,
OperationalBehaviour,
Classification,
NominalPower,
InrushCurrent,
Duration,
NPP1,
NPP2,
NPP3,
FINDS_Global_Nominal_Power,
FINDS_AC_Voltage,
PowerFactor,

PushBackMax,
PushBackOp,
StartMax,
StartOp,
RollMax,
RollOp,
TakeOffMax,
TakeOffOp,
ClimbMax,
ClimbOp,
CruiseMax,
CruiseOp,
DescentMax,
DescentOp,
LandingMax,
LandingOp,
TaxiMax,
TaxiOp,
SpareMax,
SpareOp,
BatConfMax,
BatConfOp,
GroundServMax,
GroundServOp,
TurnAround0015Max,
TurnAround0015Op,
TurnAround1530Max,
TurnAround1530Op,
TurnAround3045Max,
TurnAround3045Op,
TurnAround4560Max,
TurnAround4560Op,
TurnAround6075Max,
TurnAround6075Op,
TurnAround7590Max,
TurnAround7590Op,
TurnAround90105Max,
TurnAround90105Op,
TurnAround105120Max,
TurnAround105120Op,
TurnAround120135Max,
TurnAround120135Op,
TurnAround135150Max,
TurnAround135150Op,
TEFO_High_Speed_Max,
TEFO_HighSpeed_Operational,
TEFO_LowSpeed_max,
TEFO_LowSpeed_Operational,
LMES_High_Speed_Max,
LMES_HighSpeed_Operational,
LMES_Low_Speed_Max,
LMES_LowSpeed_Operational

		
FROM 
	R_FIN_DS 
WHERE 
	FINDS_EDD_Type = ''LOAD''


', 
'Report for EDD Tool', NULL, NULL, NULL, NULL, report_group_id
FROM T_REPORT_GROUP
WHERE report_group_label = 'ELCODATA';