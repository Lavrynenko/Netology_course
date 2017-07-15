DECLARE @id_ds AS INT, @FIN AS VARCHAR (8000), @MP AS VARCHAR (8000), @id_TRUTH_TABLE AS INT
DECLARE @VLOrder AS INT,
         @VLDesignation AS VARCHAR (8000),
         @VLType AS VARCHAR (8000),
         @VLPinNumber AS INT,
         @VLConnectorNumber AS VARCHAR (8000),
         @VLName AS VARCHAR (8000),
         @VLIdentifier AS INT,
         @VLUdpPort AS INT,
         @VLAddress AS INT,
         @VLPosition AS INT,
         @VLBackStatus AS INT,
         @VLTime0 AS INT,
         @VLTime1 AS INT

DECLARE CURSOR_SSPV_VL CURSOR FOR
SELECT 
    SEPDCTT.[MP],
    SEPDCTT.[FINSSPC],
    SEPDCTT.[Order],
    SEPDCTT.[Designation],
    SEPDCTT.[VLType],
    SEPDCTT.[PinNumber],
    SEPDCTT.[ConnectorNumber],
    SEPDCTT.[VLName],
    SEPDCTT.[VLIdentifier],
    SEPDCTT.[VLUDPPort],
    SEPDCTT.[VLSignalAddress],
    SEPDCTT.[VLSignalPosition],
    SEPDCTT.[VLAFDXFallBackstatus],
    SEPDCTT.[VLTimedelay0],
    SEPDCTT.[VLTimedelay0]
FROM SEPDCTT
ORDER BY SEPDCTT.[MP],SEPDCTT.[FINSSPC],SEPDCTT.[ORDER]

OPEN CURSOR_SSPV_VL
-- Perform the first fetch.
FETCH NEXT FROM CURSOR_SSPV_VL INTO
    
    @MP,
    @FIN,	
    @VLOrder,
    @VLDesignation,
    @VLType,
    @VLPinNumber,
    @VLConnectorNumber,
    @VLName,
    @VLIdentifier,
    @VLUdpPort,
    @VLAddress,
    @VLPosition,
    @VLBackStatus,
    @VLTime0,
    @VLTime1

WHILE @@FETCH_STATUS = 0
BEGIN  

SELECT @id_ds = id_ds
FROM R_FIN_DS
JOIN T_MP ON T_MP.id_mp = R_FIN_DS.idr_mp
JOIN R_FIN_CI ON R_FIN_CI.id_fin = R_FIN_DS.idr_fin
WHERE T_MP.MPReference = @MP  
AND R_FIN_CI.FIN = @FIN

print @id_ds
IF(@VLOrder = 1)
BEGIN
    -- On cr‰‰ une nouvelle ligne dans la table TRUTH TABLE
    DELETE FROM T_TRUTH_TABLE where TRUTH_TABLE_R_FIN_DS_idr = @id_ds
    INSERT INTO T_TRUTH_TABLE(TRUTH_TABLE_R_FIN_DS_idr) VALUES(@id_ds)
END

-- On r‰cupˆre l'ID cr‰‰
SELECT @id_TRUTH_TABLE = MAX(TRUTH_TABLE_id) FROM T_TRUTH_TABLE

-- On insˆre les donn‰es dans la table T_SSPC_VL
INSERT INTO T_SSPC_VL
(
    SSPC_VL_order,
    SSPC_VL_Designation,
    SSPC_VL_type,
    SSPC_VL_PinNumber,
    SSPC_VL_ConnectorNumber,
    SSPC_VL_VlName,
    SSPC_VL_VlIdentifier,
    SSPC_VL_UdpPort,
    SSPC_VL_SignalAddress,
    SSPC_VL_SignalPosition,
    SSPC_VL_AfdxFallBackStatus,
    SSPC_VL_TimeDelay1To0,
    SSPC_VL_TimeDelay0To1,
    SSPC_VL_TRUTH_TABLE_idr
    
)
VALUES
(
   	@VLOrder,
	@VLDesignation,
	@VLType,
	CONVERT(INTEGER,@VLPinNumber),
	@VLConnectorNumber,
	@VLName,
	CONVERT(INTEGER,@VLIdentifier),
	CONVERT(INTEGER,@VLUdpPort),
	CONVERT(INTEGER,@VLAddress),
	CONVERT(INTEGER,@VLPosition),
	CONVERT(INTEGER,@VLBackStatus),
	CONVERT(INTEGER,@VLTime0),
	CONVERT(INTEGER,@VLTime1),
    @id_TRUTH_TABLE
)

FETCH NEXT FROM CURSOR_SSPV_VL INTO
	@MP,
	@FIN,	
	@VLOrder,
	@VLDesignation,
	@VLType,
	@VLPinNumber,
	@VLConnectorNumber,
	@VLName,
	@VLIdentifier,
	@VLUdpPort,
	@VLAddress,
	@VLPosition,
	@VLBackStatus,
	@VLTime0,
	@VLTime1		
END
CLOSE CURSOR_SSPV_VL
DEALLOCATE CURSOR_SSPV_VL
