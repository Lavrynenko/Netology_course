-----------------------------------------------------------------------------------------------------------
-- Rename field "Global Nominal Power (W or V.A)" (object_name) to "Nominal Power Max" in InfoBase and T_MG
-----------------------------------------------------------------------------------------------------------

UPDATE InfoBase SET object_name = 'Nominal Power Max'
WHERE object_value = 'FINDS_Global_Nominal_Power' AND table_name = 'R_FIN_DS';

UPDATE T_MG SET Object_Name = 'Nominal Power Max' WHERE Object_Name = 'Global Nominal Power (W or V.A)';


--------------------------------------------------------------------------------------------------
-- Delete (rights) of field "NominalPower" (object_value) in InfoBase and associated lines in T_MG
-- Modification of all stored procedure using this field
--------------------------------------------------------------------------------------------------

DELETE FROM T_MG WHERE Object_name = 'Nominal Power (W or V.A)';