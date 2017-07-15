--Ground Max to A/C Stationary Max
UPDATE
	R_FIN_DS
SET
	R_FIN_DS.Stationary_Max=R_FIN_DS.FINDS_GroundMax

-- Ground Operational to A/C Stationary Operational
UPDATE
	R_FIN_DS
SET
	R_FIN_DS.Stationary_Operationnal=R_FIN_DS.FINDS_GroundOp
	
	
-- Step Technical Approach Max to Autonomus approach Max
UPDATE
	R_FIN_DS
SET
	R_FIN_DS.FINDS_approach_Max=R_FIN_DS.FINDS_TacticalMax 
	
-- Step Technical Approach Operational to Autonomus approach Operational
UPDATE
	R_FIN_DS
SET
	R_FIN_DS.FINDS_approach_Operational=R_FIN_DS.FINDS_TacticalOp  
	
	
