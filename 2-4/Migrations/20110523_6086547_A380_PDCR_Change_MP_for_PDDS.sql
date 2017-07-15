-- Update idr_mp of the pdds


update t_pdds set pdds_idr_mp = (select id_mp from t_mp where MPReference = 'T75538') where id_pdds = 26056