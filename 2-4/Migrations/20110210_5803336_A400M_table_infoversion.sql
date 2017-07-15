--update infoversion table for A400M program

truncate table t_infoversion

insert into t_infoversion (Product, StartDate, EndDate, Version) Values ('ELCODATA','21/01/2011',null,'3.2')
insert into t_infoversion (Product, StartDate, EndDate, Version) Values ('ELCODATA','22/01/2010','21/01/2011','3.0')
insert into t_infoversion (Product, StartDate, EndDate, Version) Values ('ELCOFI','01/06/2009',null,'4.1.2')
insert into t_infoversion (Product, StartDate, EndDate, Version) Values ('PSE','21/01/2011',null,'1.32')
insert into t_infoversion (Product, StartDate, EndDate, Version) Values ('PSE','22/01/2010','21/01/2011','1.30')
insert into t_infoversion (Product, StartDate, EndDate, Version) Values ('Stored Procedure','17/12/2010',null,'5.0')
insert into t_infoversion (Product, StartDate, EndDate, Version) Values ('Stored Procedure','22/01/2010','17/12/2010','4.2')
insert into t_infoversion (Product, StartDate, EndDate, Version) Values ('SV','05/11/2010',null,'2.4.6')
insert into t_infoversion (Product, StartDate, EndDate, Version) Values ('SV','01/10/2009','05/11/2010','2.4.5')

