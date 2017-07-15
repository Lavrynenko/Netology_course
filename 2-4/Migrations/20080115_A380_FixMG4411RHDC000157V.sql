-- Upgrade MG 1->2 for EDD 4411RHDC000157V005

update r_fin_ds
set mg=2
where eddreference like '4411RHDC000157V%'