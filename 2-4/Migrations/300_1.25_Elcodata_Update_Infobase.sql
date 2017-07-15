
-- Update 'Global Nominal Power' as 'Global Nominal Power (W or V.A)'

UPDATE  
	Infobase
SET 
	object_name = 'Global Nominal Power (W or V.A)'
WHERE 
	object_value = 'FINDS_Global_Nominal_Power'
