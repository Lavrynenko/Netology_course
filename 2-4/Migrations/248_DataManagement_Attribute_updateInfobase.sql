
------------------------------------------------------------------------------------
-- Updated data  for (FINDS_SSPCCommandType)
------------------------------------------------------------------------------------

UPDATE InfoBase 
	SET list_val = 'Always On;Direct AFDX;Direct Discrete;Logic;Network Direct Discrete;Network Always On' 
	WHERE table_name = 'R_FIN_DS' AND object_value = 'FINDS_SSPCCommandType';
	
	
UPDATE R_FIN_DS	
	SET FINDS_SSPCCommandType = 'Always On'
	WHERE FINDS_SSPCCommandType = 'Always On' OR FINDS_SSPCCommandType = 'Always on' 

