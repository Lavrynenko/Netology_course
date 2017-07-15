------------------------------------------------------------------------------------
---------------------------------------- Equipment ---------------------------------
------------------------------------------------------------------------------------


------------------------------------------------------------------------------------
-- Equipment_EAT
------------------------------------------------------------------------------------

UPDATE InfoBase 
	SET 
		type_search = 'listv',
		type_edit = 'listv',
		type_val = 'text',
		list_val = 'Variant;Invariant'	
	WHERE object_value = 'Equipment_EAT'




------------------------------------------------------------------------------------
-- EquipTypeReleaseCertif 
------------------------------------------------------------------------------------

UPDATE InfoBase 
	SET 
		type_search = 'text',
		type_edit = 'text',
		type_val = 'text',
		list_val = NULL	
	WHERE object_value = 'EquipTypeReleaseCertif'


------------------------------------------------------------------------------------
-- SpecifiedThermalDissipation  
------------------------------------------------------------------------------------

UPDATE InfoBase 
	SET object_name = 'Specified Thermal Dissipation (Watts)'
	WHERE object_value = 'SpecifiedThermalDissipation'



------------------------------------------------------------------------------------
-- SpecifiedComsumption   
------------------------------------------------------------------------------------

UPDATE InfoBase 
	SET object_name = 'Specified Consumption (Watts)'
	WHERE object_value = 'SpecifiedComsumption'


------------------------------------------------------------------------------------
-- SpecifiedAirPressDrop    
------------------------------------------------------------------------------------

UPDATE InfoBase 
	SET object_name = 'Specified Air Press Drop (Psi)'
	WHERE object_value = 'SpecifiedAirPressDrop'



------------------------------------------------------------------------------------
-- ActualThermalDissipation     
------------------------------------------------------------------------------------

UPDATE InfoBase 
	SET object_name = 'Actual Thermal Dissipation (Watts)'
	WHERE object_value = 'ActualThermalDissipation'


------------------------------------------------------------------------------------
-- LifeOperatingHours      
------------------------------------------------------------------------------------

UPDATE InfoBase 
	SET object_name = 'Life Operating Hours (Life Hour)'
	WHERE object_value = 'LifeOperatingHours'



------------------------------------------------------------------------------------
-- StorageLifeLimitation      
------------------------------------------------------------------------------------

UPDATE InfoBase 
	SET object_name = 'Storage Life Limitation (Month(s))'
	WHERE object_value = 'StorageLifeLimitation'



------------------------------------------------------------------------------------
-- ActualComsumption       
------------------------------------------------------------------------------------

UPDATE InfoBase 
	SET object_name = 'Actual Consumption (Watts)'
	WHERE object_value = 'ActualComsumption'


------------------------------------------------------------------------------------
-- RFIRFPPTSGuaranteedWeight        
------------------------------------------------------------------------------------

UPDATE InfoBase 
	SET object_name = 'RFI/RFP/PTS guaranteed weight (grammes)'
	WHERE object_value = 'RFIRFPPTSGuaranteedWeight'



------------------------------------------------------------------------------------
-- AcceptanceSheetWeighedWeight         
------------------------------------------------------------------------------------

UPDATE InfoBase 
	SET object_name = 'Acceptance sheet weighed weight (grammes)'
	WHERE object_value = 'AcceptanceSheetWeighedWeight'



------------------------------------------------------------------------------------
-- CalculatedWeight          
------------------------------------------------------------------------------------

UPDATE InfoBase 
	SET object_name = 'Calculated Weight (grammes)'
	WHERE object_value = 'CalculatedWeight'



------------------------------------------------------------------------------------
-- AcceptableTargetWeight           
------------------------------------------------------------------------------------

UPDATE InfoBase 
	SET object_name = 'Acceptable / Target Weight (grammes)'
	WHERE object_value = 'AcceptableTargetWeight'


------------------------------------------------------------------------------------
-- PackageOverallLenght            
------------------------------------------------------------------------------------

UPDATE InfoBase 
	SET object_name = 'Package Overall Length (Millimeter)'
	WHERE object_value = 'PackageOverallLenght'



------------------------------------------------------------------------------------
-- PackageOverallWidth             
------------------------------------------------------------------------------------

UPDATE InfoBase 
	SET object_name = 'Package Overall Width (Millimeter)'
	WHERE object_value = 'PackageOverallWidth'

------------------------------------------------------------------------------------
-- PackageOverallHeight             
------------------------------------------------------------------------------------

UPDATE InfoBase 
	SET object_name = 'Package Overall Height (Millimeter)'
	WHERE object_value = 'PackageOverallHeight'




