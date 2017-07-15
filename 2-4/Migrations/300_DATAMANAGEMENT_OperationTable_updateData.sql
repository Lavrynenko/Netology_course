-----------------------------------------------------------------------------------------------------------------------------
------------------------------------------ Nominal Power Update-Data Migration ----------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------


DECLARE @opID INT, @np FLOAT, @npA FLOAT, @npB FLOAT, @npC FLOAT, @tot FLOAT 

DECLARE myCursor CURSOR
FOR SELECT [id_op_table], [nominalPower], [nominalPowerPh_A],   [nominalPowerPh_B], [nominalPowerPh_C] FROM T_operation_table
	   
OPEN myCursor
FETCH myCursor INTO @opID, @np, @npA, @npB, @npC             -- reading first line

WHILE @@fetch_Status = 0
BEGIN

SET @np  = ISNULL(@np, 0)
SET @npA = ISNULL(@npA, 0)
SET @npB = ISNULL(@npB, 0)
SET @npC = ISNULL(@npC, 0) 
SET @tot = @npA+@npB+@npC

	-- traitment
	IF @np = 0
	BEGIN
		UPDATE T_OPERATION_TABLE SET nominalPower = @tot  where id_op_table = @opID
	END
	
	FETCH myCursor INTO @opID,@np, @npA, @npB, @npC         -- reading the other line
	
END
CLOSE myCursor
DEALLOCATE myCursor
