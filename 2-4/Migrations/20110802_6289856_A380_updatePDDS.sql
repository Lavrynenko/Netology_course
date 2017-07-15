update
            t_pdds
set
            pdds_date_validation_local='2011-07-11 00:00:00.000'
where 
            idr_pdci=(select id_pdci from t_pdci where pdci_reference='RHL44191027')
            and pdds_reference='18A00'
