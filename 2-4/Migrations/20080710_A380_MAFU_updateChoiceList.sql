
-- Insert choice list for attribute MODMCC
if(not exists(SELECT *
FROM T_CHOICELIST
WHERE ChoiceList = 'MODMCC'
 AND ChoiceValue = 'PARIS Catherine'))
begin
	INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue)
	SELECT 'MODMCC',  'PARIS Catherine'
end

if(not exists(SELECT *
FROM T_CHOICELIST
WHERE ChoiceList = 'MODMCC'
 AND ChoiceValue = 'MENUET Edouard'))
begin
	INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue)
	SELECT 'MODMCC',  'MENUET Edouard'
end

if(not exists(SELECT *
FROM T_CHOICELIST
WHERE ChoiceList = 'MODMCC'
 AND ChoiceValue = 'TARKOWSKI Emmanuel'))
begin
	INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue)
	SELECT 'MODMCC',  'TARKOWSKI Emmanuel'
end

if(not exists(SELECT *
FROM T_CHOICELIST
WHERE ChoiceList = 'MODMCC'
 AND ChoiceValue = 'QUINTON Romain'))
begin
	INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue)
	SELECT 'MODMCC',  'QUINTON Romain'
end

if(not exists(SELECT *
FROM T_CHOICELIST
WHERE ChoiceList = 'MODMCC'
 AND ChoiceValue = 'MENJOU Ninon'))
begin
	INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue)
	SELECT 'MODMCC',  'MENJOU Ninon'
end

if(not exists(SELECT *
FROM T_CHOICELIST
WHERE ChoiceList = 'MODMCC'
 AND ChoiceValue = 'ESCAICH Laurent'))
begin
	INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue)
	SELECT 'MODMCC',  'ESCAICH Laurent'
end

if(not exists(SELECT *
FROM T_CHOICELIST
WHERE ChoiceList = 'MODMCC'
 AND ChoiceValue = 'GAILLARD Ludovic'))
begin
	INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue)
	SELECT 'MODMCC',  'GAILLARD Ludovic'
end

if(not exists(SELECT *
FROM T_CHOICELIST
WHERE ChoiceList = 'MODMCC'
 AND ChoiceValue = 'GRANVILLE Murielle'))
begin
	INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue)
	SELECT 'MODMCC',  'GRANVILLE Murielle'
end

-- Delete choice list for attribute MODMCC
DELETE FROM T_CHOICELIST WHERE ChoiceList = 'MODMCC' AND ChoiceValue = 'LE MORLEC Alain'
DELETE FROM T_CHOICELIST WHERE ChoiceList = 'MODMCC' AND ChoiceValue = 'OULT FERHAT Don Jacques'
DELETE FROM T_CHOICELIST WHERE ChoiceList = 'MODMCC' AND ChoiceValue = 'ROZENBLUM Jerome'