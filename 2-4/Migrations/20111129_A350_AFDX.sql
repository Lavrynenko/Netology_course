-- ***********************************************************************************
-- AFDX data migration in R_FIN_DS
-- ***********************************************************************************


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '3347LYAC000001V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '1' WHERE [EDDReference] like '3347LYAC000001V%'
	PRINT ' AFDX Block Number for EDD Reference  3347LYAC000001V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 3347LYAC000001V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKAC000015V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '5' WHERE [EDDReference] like '2161HKAC000015V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKAC000015V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKAC000015V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKAC000016V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '6' WHERE [EDDReference] like '2161HKAC000016V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKAC000016V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKAC000016V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKAC000017V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '7' WHERE [EDDReference] like '2161HKAC000017V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKAC000017V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKAC000017V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKAC000018V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '8' WHERE [EDDReference] like '2161HKAC000018V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKAC000018V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKAC000018V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKDC000001V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '9' WHERE [EDDReference] like '2161HKDC000001V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKDC000001V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKDC000001V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKAC000010V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '10' WHERE [EDDReference] like '2161HKAC000010V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKAC000010V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKAC000010V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKAC000023V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '11' WHERE [EDDReference] like '2161HKAC000023V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKAC000023V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKAC000023V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKAC000024V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '12' WHERE [EDDReference] like '2161HKAC000024V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKAC000024V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKAC000024V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKAC000025V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '13' WHERE [EDDReference] like '2161HKAC000025V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKAC000025V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKAC000025V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKAC000026V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '14' WHERE [EDDReference] like '2161HKAC000026V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKAC000026V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKAC000026V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKAC000027V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '15' WHERE [EDDReference] like '2161HKAC000027V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKAC000027V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKAC000027V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKDC000009V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '16' WHERE [EDDReference] like '2161HKDC000009V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKDC000009V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKDC000009V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2172HXAC000005V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '17-18-19' WHERE [EDDReference] like '2172HXAC000005V%'
	PRINT ' AFDX Block Number for EDD Reference  2172HXAC000005V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2172HXAC000005V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2142HJAC000001V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '20-21-22' WHERE [EDDReference] like '2142HJAC000001V%'
	PRINT ' AFDX Block Number for EDD Reference  2142HJAC000001V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2142HJAC000001V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2128HNAC000001V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '23-24-25' WHERE [EDDReference] like '2128HNAC000001V%'
	PRINT ' AFDX Block Number for EDD Reference  2128HNAC000001V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2128HNAC000001V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2129HYAC000001V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '26-27-28' WHERE [EDDReference] like '2129HYAC000001V%'
	PRINT ' AFDX Block Number for EDD Reference  2129HYAC000001V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2129HYAC000001V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2157HDDC000001V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '29' WHERE [EDDReference] like '2157HDDC000001V%'
	PRINT ' AFDX Block Number for EDD Reference  2157HDDC000001V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2157HDDC000001V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2159HWDC000001V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '31' WHERE [EDDReference] like '2159HWDC000001V%'
	PRINT ' AFDX Block Number for EDD Reference  2159HWDC000001V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2159HWDC000001V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2159HWDC000003V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '32' WHERE [EDDReference] like '2159HWDC000003V%'
	PRINT ' AFDX Block Number for EDD Reference  2159HWDC000003V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2159HWDC000003V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2159HWDC000007V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '33' WHERE [EDDReference] like '2159HWDC000007V%'
	PRINT ' AFDX Block Number for EDD Reference  2159HWDC000007V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2159HWDC000007V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2159HWDC000009V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '34' WHERE [EDDReference] like '2159HWDC000009V%'
	PRINT ' AFDX Block Number for EDD Reference  2159HWDC000009V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2159HWDC000009V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2159HWDC000005V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '35' WHERE [EDDReference] like '2159HWDC000005V%'
	PRINT ' AFDX Block Number for EDD Reference  2159HWDC000005V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2159HWDC000005V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000002V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '36-37-38' WHERE [EDDReference] like '4422MWAC000002V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000002V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000002V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000006V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '39-40-41' WHERE [EDDReference] like '4422MWAC000006V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000006V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000006V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000009V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '42-43-44' WHERE [EDDReference] like '4422MWAC000009V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000009V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000009V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000011V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '45-46-47' WHERE [EDDReference] like '4422MWAC000011V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000011V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000011V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000026V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '48-49-50' WHERE [EDDReference] like '4422MWAC000026V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000026V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000026V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000029V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '51-52-53' WHERE [EDDReference] like '4422MWAC000029V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000029V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000029V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000032V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '54-55-56' WHERE [EDDReference] like '4422MWAC000032V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000032V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000032V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000035V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '57-58-59' WHERE [EDDReference] like '4422MWAC000035V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000035V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000035V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000003V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '60-61-62' WHERE [EDDReference] like '4422MWAC000003V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000003V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000003V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000007V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '63-64-65' WHERE [EDDReference] like '4422MWAC000007V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000007V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000007V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000010V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '66-67-68' WHERE [EDDReference] like '4422MWAC000010V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000010V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000010V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000013V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '69-70-71' WHERE [EDDReference] like '4422MWAC000013V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000013V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000013V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000033V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '72-73-74' WHERE [EDDReference] like '4422MWAC000033V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000033V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000033V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000036V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '75-76-77' WHERE [EDDReference] like '4422MWAC000036V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000036V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000036V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000005V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '78-79-80' WHERE [EDDReference] like '4422MWAC000005V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000005V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000005V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000008V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '81-82-83' WHERE [EDDReference] like '4422MWAC000008V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000008V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000008V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000012V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '84-85-86' WHERE [EDDReference] like '4422MWAC000012V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000012V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000012V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000039V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '87-88-89' WHERE [EDDReference] like '4422MWAC000039V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000039V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000039V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000004V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '90-91-92' WHERE [EDDReference] like '4422MWAC000004V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000004V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000004V% does not exist '







IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '3347LYAC000002V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '1' WHERE [EDDReference] like '3347LYAC000002V%'
	PRINT ' AFDX Block Number for EDD Reference  3347LYAC000002V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 3347LYAC000002V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4642RFAC000001V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '2' WHERE [EDDReference] like '4642RFAC000001V%'
	PRINT ' AFDX Block Number for EDD Reference  4642RFAC000001V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4642RFAC000001V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKAC000019V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '5' WHERE [EDDReference] like '2161HKAC000019V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKAC000019V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKAC000019V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKAC000020V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '6' WHERE [EDDReference] like '2161HKAC000020V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKAC000020V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKAC000020V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKAC000021V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '7' WHERE [EDDReference] like '2161HKAC000021V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKAC000021V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKAC000021V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKAC000022V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '8' WHERE [EDDReference] like '2161HKAC000022V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKAC000022V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKAC000022V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKDC000006V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '9' WHERE [EDDReference] like '2161HKDC000006V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKDC000006V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKDC000006V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKAC000011V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '10' WHERE [EDDReference] like '2161HKAC000011V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKAC000011V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKAC000011V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKAC000028V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '11' WHERE [EDDReference] like '2161HKAC000028V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKAC000028V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKAC000028V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKAC000029V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '12' WHERE [EDDReference] like '2161HKAC000029V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKAC000029V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKAC000029V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKAC000030V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '13' WHERE [EDDReference] like '2161HKAC000030V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKAC000030V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKAC000030V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKAC000031V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '14' WHERE [EDDReference] like '2161HKAC000031V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKAC000031V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKAC000031V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKAC000032V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '15' WHERE [EDDReference] like '2161HKAC000032V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKAC000032V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKAC000032V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2161HKDC000012V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '16' WHERE [EDDReference] like '2161HKDC000012V%'
	PRINT ' AFDX Block Number for EDD Reference  2161HKDC000012V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2161HKDC000012V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2173HXAC000001V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '17-18-19' WHERE [EDDReference] like '2173HXAC000001V%'
	PRINT ' AFDX Block Number for EDD Reference  2173HXAC000001V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2173HXAC000001V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2173HXAC000011V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '20-21-22' WHERE [EDDReference] like '2173HXAC000011V%'
	PRINT ' AFDX Block Number for EDD Reference  2173HXAC000011V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2173HXAC000011V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2173HXDC000010V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '23' WHERE [EDDReference] like '2173HXDC000010V%'
	PRINT ' AFDX Block Number for EDD Reference  2173HXDC000010V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2173HXDC000010V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2173HXAC000009V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '24-25-26' WHERE [EDDReference] like '2173HXAC000009V%'
	PRINT ' AFDX Block Number for EDD Reference  2173HXAC000009V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2173HXAC000009V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2173HXAC000013V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '27-28-29' WHERE [EDDReference] like '2173HXAC000013V%'
	PRINT ' AFDX Block Number for EDD Reference  2173HXAC000013V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2173HXAC000013V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2173HXDC000012V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '30' WHERE [EDDReference] like '2173HXDC000012V%'
	PRINT ' AFDX Block Number for EDD Reference  2173HXDC000012V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2173HXDC000012V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2128HNAC000003V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '31-32-33' WHERE [EDDReference] like '2128HNAC000003V%'
	PRINT ' AFDX Block Number for EDD Reference  2128HNAC000003V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2128HNAC000003V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2128HNAC000002V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '34-35-36' WHERE [EDDReference] like '2128HNAC000002V%'
	PRINT ' AFDX Block Number for EDD Reference  2128HNAC000002V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2128HNAC000002V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2129HYAC000002V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '37-38-39' WHERE [EDDReference] like '2129HYAC000002V%'
	PRINT ' AFDX Block Number for EDD Reference  2129HYAC000002V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2129HYAC000002V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2157HDDC000002V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '40' WHERE [EDDReference] like '2157HDDC000002V%'
	PRINT ' AFDX Block Number for EDD Reference  2157HDDC000002V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2157HDDC000002V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2159HWDC000002V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '41' WHERE [EDDReference] like '2159HWDC000002V%'
	PRINT ' AFDX Block Number for EDD Reference  2159HWDC000002V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2159HWDC000002V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2159HWDC000051V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '42' WHERE [EDDReference] like '2159HWDC000051V%'
	PRINT ' AFDX Block Number for EDD Reference  2159HWDC000051V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2159HWDC000051V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2159HWDC000004V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '42' WHERE [EDDReference] like '2159HWDC000004V%'
	PRINT ' AFDX Block Number for EDD Reference  2159HWDC000004V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2159HWDC000004V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2159HWDC000006V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '43' WHERE [EDDReference] like '2159HWDC000006V%'
	PRINT ' AFDX Block Number for EDD Reference  2159HWDC000006V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2159HWDC000006V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2159HWDC000008V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '44' WHERE [EDDReference] like '2159HWDC000008V%'
	PRINT ' AFDX Block Number for EDD Reference  2159HWDC000008V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2159HWDC000008V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2159HWDC000052V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '44' WHERE [EDDReference] like '2159HWDC000052V%'
	PRINT ' AFDX Block Number for EDD Reference  2159HWDC000052V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2159HWDC000052V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2159HWDC000010V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '45' WHERE [EDDReference] like '2159HWDC000010V%'
	PRINT ' AFDX Block Number for EDD Reference  2159HWDC000010V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2159HWDC000010V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '2159HWDC000053V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '45' WHERE [EDDReference] like '2159HWDC000053V%'
	PRINT ' AFDX Block Number for EDD Reference  2159HWDC000053V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 2159HWDC000053V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000014V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '46-47-48' WHERE [EDDReference] like '4422MWAC000014V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000014V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000014V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000018V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '49-50-51' WHERE [EDDReference] like '4422MWAC000018V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000018V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000018V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000021V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '52-53-54' WHERE [EDDReference] like '4422MWAC000021V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000021V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000021V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000023V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '55-56-57' WHERE [EDDReference] like '4422MWAC000023V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000023V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000023V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000001V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '58-59-60' WHERE [EDDReference] like '4422MWAC000001V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000001V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000001V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000030V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '61-62-63' WHERE [EDDReference] like '4422MWAC000030V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000030V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000030V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000034V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '64-65-66' WHERE [EDDReference] like '4422MWAC000034V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000034V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000034V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000037V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '67-68-69' WHERE [EDDReference] like '4422MWAC000037V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000037V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000037V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000015V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '70-71-72' WHERE [EDDReference] like '4422MWAC000015V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000015V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000015V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000019V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '73-74-75' WHERE [EDDReference] like '4422MWAC000019V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000019V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000019V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000022V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '76-77-78' WHERE [EDDReference] like '4422MWAC000022V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000022V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000022V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000025V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '79-80-81' WHERE [EDDReference] like '4422MWAC000025V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000025V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000025V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000028V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '82-83-84' WHERE [EDDReference] like '4422MWAC000028V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000028V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000028V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000031V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '85-86-87' WHERE [EDDReference] like '4422MWAC000031V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000031V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000031V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000017V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '88-89-90' WHERE [EDDReference] like '4422MWAC000017V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000017V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000017V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000020V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '91-92-93' WHERE [EDDReference] like '4422MWAC000020V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000020V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000020V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000024V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '94-95-96' WHERE [EDDReference] like '4422MWAC000024V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000024V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000024V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000040V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '97-98-99' WHERE [EDDReference] like '4422MWAC000040V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000040V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000040V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000041V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '100-101-102' WHERE [EDDReference] like '4422MWAC000041V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000041V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000041V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000016V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '103-104-105' WHERE [EDDReference] like '4422MWAC000016V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000016V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000016V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4422MWAC000027V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '106-107-108' WHERE [EDDReference] like '4422MWAC000027V%'
	PRINT ' AFDX Block Number for EDD Reference  4422MWAC000027V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4422MWAC000027V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4421MKAC000001V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '109' WHERE [EDDReference] like '4421MKAC000001V%'
	PRINT ' AFDX Block Number for EDD Reference  4421MKAC000001V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4421MKAC000001V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4421MKAC000031V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '110' WHERE [EDDReference] like '4421MKAC000031V%'
	PRINT ' AFDX Block Number for EDD Reference  4421MKAC000031V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4421MKAC000031V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4421MKAC000032V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '111' WHERE [EDDReference] like '4421MKAC000032V%'
	PRINT ' AFDX Block Number for EDD Reference  4421MKAC000032V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4421MKAC000032V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4421MKAC000002V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '112' WHERE [EDDReference] like '4421MKAC000002V%'
	PRINT ' AFDX Block Number for EDD Reference  4421MKAC000002V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4421MKAC000002V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4421MKAC000010V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '113' WHERE [EDDReference] like '4421MKAC000010V%'
	PRINT ' AFDX Block Number for EDD Reference  4421MKAC000010V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4421MKAC000010V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4421MKAC000012V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '114' WHERE [EDDReference] like '4421MKAC000012V%'
	PRINT ' AFDX Block Number for EDD Reference  4421MKAC000012V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4421MKAC000012V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4421MKAC000014V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '115' WHERE [EDDReference] like '4421MKAC000014V%'
	PRINT ' AFDX Block Number for EDD Reference  4421MKAC000014V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4421MKAC000014V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4421MKAC000028V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '116' WHERE [EDDReference] like '4421MKAC000028V%'
	PRINT ' AFDX Block Number for EDD Reference  4421MKAC000028V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4421MKAC000028V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4433RLAC000001V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '117' WHERE [EDDReference] like '4433RLAC000001V%'
	PRINT ' AFDX Block Number for EDD Reference  4433RLAC000001V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4433RLAC000001V% does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE  [EDDReference] like '4433RLAC000002V%' ) 
	BEGIN
	UPDATE R_FIN_DS SET AFDXBlockNumber  =  '117' WHERE [EDDReference] like '4433RLAC000002V%'
	PRINT ' AFDX Block Number for EDD Reference  4433RLAC000002V% is Updated '	
	END
ELSE
	PRINT ' EDD Reference for 4433RLAC000002V% does not exist '

