-- MP
if( not exists (select * from T_MP where MPacmtOrigin is not null))
begin
	UPDATE T_MP SET MPacmtOrigin = ACMTLeaderMP WHERE ACMTLeaderMP in ('SYS', 'PRO', 'LGS')
end

-- MOD
if( not exists (select * from T_MOD where MODacmtOrigin is not null))
begin
	UPDATE T_MOD SET MODacmtOrigin = ModACMTLeader WHERE ModACMTLeader in ('SYS', 'PRO', 'LGS')
end

-- CR
if( not exists (select * from V_CR where cr_CRacmtOrigin is not null))
begin
	UPDATE V_CR SET cr_CRacmtOrigin = cr_ACMTLeaderCR WHERE cr_ACMTLeaderCR in ('SYS', 'PRO', 'LGS')
end

-- RFC
if( not exists (select * from V_RFC where rfc_RFCacmtOrigin is not null))
begin
	UPDATE V_RFC SET rfc_RFCacmtOrigin = rfc_ACMTLeaderCR WHERE rfc_ACMTLeaderCR in ('SYS', 'PRO', 'LGS')
end


-- Init site Responsible
-- MOD
update T_MOD
set MODsiteResponsible=
	case
		when ATACode = '2126' then 'TLSE'
		when ATACode = '2611' then 'TLSE'
		when ATACode = '2612' then 'TLSE'
		when ATACode = '2613' then 'TLSE'
		when ATACode = '3611' then 'TLSE'
		when ATACode = '5610' then 'TLSE'
		when ATACode = '2270' then 'TLSE'
		when ATACode = '2510' then 'TLSE'
		when ATACode = '2565' then 'TLSE'
		when ATACode = '3119' then 'TLSE'
		when ATACode = '3150' then 'TLSE'
		when ATACode = '3310' then 'TLSE'
		when ATACode = '4620' then 'TLSE'
		when ATACode = '4610' then 'TLSE'
		when ATACode = '4630' then 'TLSE'
		when ATACode >= '2200' AND ATACode <= '2299' then 'TLSE'
		when ATACode >= '2400' AND ATACode <= '2499' then 'TLSE'
		when ATACode >= '2700' AND ATACode <= '2799' then 'TLSE'
		when ATACode >= '3000' AND ATACode <= '3099' then 'TLSE'
		when ATACode >= '3100' AND ATACode <= '3199' then 'TLSE'
		when ATACode >= '4700' AND ATACode <= '4799' then 'TLSE'
		when ATACode >= '7000' AND ATACode <= '7099' then 'TLSE'
		when ATACode >= '2300' AND ATACode <= '2399' then 'TLSE'
		when ATACode >= '3400' AND ATACode <= '3499' then 'TLSE'
		when ATACode >= '4200' AND ATACode <= '4299' then 'TLSE'
		when ATACode >= '2100' AND ATACode <= '2199' then 'HBG'
		when ATACode = '2750' then 'HBG'
		when ATACode = '2780' then 'HBG'
		when ATACode = '3130' then 'HBG'
		when ATACode = '3611' then 'HBG'
		when ATACode = '3612' then 'HBG'
		when ATACode = '3622' then 'HBG'
		when ATACode = '4530' then 'HBG'
		when ATACode = '4612' then 'HBG'
		when ATACode >= '2900' AND ATACode <= '2999' then 'HBG'
		when ATACode >= '2800' AND ATACode <= '2899' then 'FLT'
		when ATACode = '3011' then 'FLT'
		when ATACode >= '3200' AND ATACode <= '3299' then 'FLT'
		else ''
	end
FROM T_MOD
 INNER JOIN R_ATA ON R_ATA.id_ata = T_MOD.idr_mod_ata

-- MP
update T_MP
set MPsiteResponsible=
	case
		when ATACode = '2126' then 'TLSE'
		when ATACode = '2611' then 'TLSE'
		when ATACode = '2612' then 'TLSE'
		when ATACode = '2613' then 'TLSE'
		when ATACode = '3611' then 'TLSE'
		when ATACode = '5610' then 'TLSE'
		when ATACode = '2270' then 'TLSE'
		when ATACode = '2510' then 'TLSE'
		when ATACode = '2565' then 'TLSE'
		when ATACode = '3119' then 'TLSE'
		when ATACode = '3150' then 'TLSE'
		when ATACode = '3310' then 'TLSE'
		when ATACode = '4620' then 'TLSE'
		when ATACode = '4610' then 'TLSE'
		when ATACode = '4630' then 'TLSE'
		when ATACode >= '2200' AND ATACode <= '2299' then 'TLSE'
		when ATACode >= '2400' AND ATACode <= '2499' then 'TLSE'
		when ATACode >= '2700' AND ATACode <= '2799' then 'TLSE'
		when ATACode >= '3000' AND ATACode <= '3099' then 'TLSE'
		when ATACode >= '3100' AND ATACode <= '3199' then 'TLSE'
		when ATACode >= '4700' AND ATACode <= '4799' then 'TLSE'
		when ATACode >= '7000' AND ATACode <= '7099' then 'TLSE'
		when ATACode >= '2300' AND ATACode <= '2399' then 'TLSE'
		when ATACode >= '3400' AND ATACode <= '3499' then 'TLSE'
		when ATACode >= '4200' AND ATACode <= '4299' then 'TLSE'
		when ATACode >= '2100' AND ATACode <= '2199' then 'HBG'
		when ATACode = '2750' then 'HBG'
		when ATACode = '2780' then 'HBG'
		when ATACode = '3130' then 'HBG'
		when ATACode = '3611' then 'HBG'
		when ATACode = '3612' then 'HBG'
		when ATACode = '3622' then 'HBG'
		when ATACode = '4530' then 'HBG'
		when ATACode = '4612' then 'HBG'
		when ATACode >= '2900' AND ATACode <= '2999' then 'HBG'
		when ATACode >= '2800' AND ATACode <= '2899' then 'FLT'
		when ATACode = '3011' then 'FLT'
		when ATACode >= '3200' AND ATACode <= '3299' then 'FLT'
		else ''
	end
FROM T_MOD
 INNER JOIN R_ATA ON R_ATA.id_ata = T_MOD.idr_mod_ata


-- Update ACMT Leader
-- MOD
UPDATE T_MOD SET ModACMTLeader = 'SYS' WHERE ModACMTLeader in ('PRO', 'LGS')

-- MP
UPDATE T_MP SET ACMTLeaderMP = 'SYS' WHERE ACMTLeaderMP in ('PRO', 'LGS')

-- CR
UPDATE V_CR SET cr_ACMTLeaderCR = 'SYS' WHERE cr_ACMTLeaderCR in ('PRO', 'LGS')

-- RFC
UPDATE V_RFC SET rfc_ACMTLeaderCR = 'SYS' WHERE rfc_ACMTLeaderCR in ('PRO', 'LGS')

-- Update Leader or Involved
-- MP
UPDATE T_MP SET LinvoldMP = 'Leader' WHERE ACMTLeaderMP in ('PRO', 'LGS', 'SYS')

-- CR
UPDATE V_CR SET cr_Linvold = 'Leader' WHERE cr_ACMTLeaderCR in ('PRO', 'LGS', 'SYS')

-- RFC
UPDATE V_RFC SET rfc_Linvold = 'Leader' WHERE rfc_ACMTLeaderCR in ('PRO', 'LGS', 'SYS')

-- Update Group Leader
-- MOD
UPDATE T_MOD SET MODgroupLeader = 'PECOSTE Jean-Louis' WHERE MODacmtOrigin like 'PRO'
UPDATE T_MOD SET MODgroupLeader = 'WILSON Leigh-Ann' WHERE MODacmtOrigin like 'LGS'

-- MP
UPDATE T_MP SET GrpLeaderMP = 'PECOSTE Jean-Louis' WHERE MPacmtOrigin like 'PRO'
UPDATE T_MP SET GrpLeaderMP = 'WILSON Leigh-Ann' WHERE MPacmtOrigin like 'LGS'

-- CR
UPDATE V_CR SET cr_GrpLeaderCR = 'PECOSTE Jean-Louis' WHERE cr_CRacmtOrigin like 'PRO'
UPDATE V_CR SET cr_GrpLeaderCR = 'WILSON Leigh-Ann' WHERE cr_CRacmtOrigin like 'LGS'

-- RFC
UPDATE V_RFC SET rfc_GrpLeaderCR = 'PECOSTE Jean-Louis' WHERE rfc_RFCacmtOrigin like 'PRO'
UPDATE V_RFC SET rfc_GrpLeaderCR = 'WILSON Leigh-Ann' WHERE rfc_RFCacmtOrigin like 'LGS'
