UPDATE 
	T_FEATURE
SET
	where_clause = 'SELECT TOP 1 * FROM OPENCIN WHERE CheckCIN=0'
WHERE
	label like 'Validate new CIN' 
	and where_clause = 'SELECT * FROM OPENCIN WHERE CheckCIN=0'