
delete from t_infoversion
insert into
	t_infoversion (
		product,
		version,
		startdate
		
	)
select
	'PDMLink A380',
	'4.2',
        '01/10/2009'
union 
select
	'PDMLink A350',
	'4.3',
	'01/09/2009'
union 
select
	'PSV A400M',
	'2.4.5',
	'01/01/2009'
union 
select
	'PSE',
	'1.30',
	'22/01/2010' 
union 
select
	'ELCODATA',
	'3.0',
	'22/01/2010'
union 
select
	'Stored Procedure',
	'4.2',
	'22/01/2010'
		