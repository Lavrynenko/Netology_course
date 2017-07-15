delete from
	t_mg
where
	object_name like 'PIN Allocation%ower Output Connector Neutral'

insert into t_mg (
		object_name,
		pctype,
		devicetype,
		ml,
		specificcontrol
	)
select 'PIN Allocation - Power Output Connector Neutral', 'CBP','C/B',null,0
union
select 'PIN Allocation - Power Output Connector Neutral', 'CBP','SSPC',null,0
union
select 'PIN Allocation - Power Output Connector Neutral', 'EPDC','C/B',null,0
union
select 'PIN Allocation - Power Output Connector Neutral', 'EPDC','RCCB',null,0
union
select 'PIN Allocation - Power Output Connector Neutral', 'EPDC','SSPC',null,0
union
select 'PIN Allocation - Power Output Connector Neutral', 'SPDB','SSPC',3,0