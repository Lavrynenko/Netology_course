-- A400M : ATA48 issues, downgrade EDD to MG 0 as nominal power is wrong
-- EDD from CIRCE migrated -> no downgrade of ATAxx notification

select
 eddreference
,mg
from R_FIN_DS
WHERE 0=0
and substring(eddreference,1,14) in ('4822ANDC000000','4823AQDC000000','4821AJDC000000','4821AJDC000001'
                                    ,'4821AJAC000025')

UPDATE R_FIN_DS 
SET 
 MG = '0'
WHERE 0=0
and substring(eddreference,1,14) in ('4822ANDC000000','4823AQDC000000','4821AJDC000000','4821AJDC000001'
                                    ,'4821AJAC000025')

select
 eddreference
,mg
from R_FIN_DS
WHERE 0=0
and substring(eddreference,1,14) in ('4822ANDC000000','4823AQDC000000','4821AJDC000000','4821AJDC000001'
                                    ,'4821AJAC000025')

 