-- Fix CB A350
-- Written by Bruno Sanguinede

update r_fin_ds
set TypeOfProtection='C/B'
where 0=0
and TypeOfProtection='CB'