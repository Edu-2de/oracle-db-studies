// cSpell:disable
insert into curso values ('1','Oracle 8i', '360', TO_DATE('2009-03-01','YYYY-MM-DD'));
insert into curso values ('2','Delphi', '300', TO_DATE('2009-05-30','YYYY-MM-DD'));
insert into curso values ('3','Windows 98', '20', TO_DATE('2009-04-28','YYYY-MM-DD'));
insert into curso values ('4','linux', '35', TO_DATE('2009-06-06','YYYY-MM-DD'));
insert into curso values ('5','Visual Basic', '120', TO_DATE('2009-04-28','YYYY-MM-DD'));
insert into curso values ('6','Office', '15', TO_DATE('2009-05-30','YYYY-MM-DD'));

insert into analista values ('1','Joao', '20','Av. Carlso Gomes, 200', '1','2300');
insert into analista values ('2','Joice', '24','Av independencia,10', '1','2245');
insert into analista values ('3','Pedro', '32','Av Carlos Gomes,100', '2','2145');
insert into analista values ('4','Maria', '28','Dom Pedro II,10', '6','1890');
insert into analista values ('5','Rafael', '29','Av Nilo Peçanha,40', '2','2800');

insert into programador values ('10','Jeferson', '34','Av Ipiranga,10','1000');
insert into programador values ('20','Andrea', '25','Souza Reis,200', '1200');
insert into programador values ('30','Ana Paula', '23','Av. Carlos Gomes,100', '1450');
insert into programador values ('40','Fernando', '20','Av. Ipiranga,20', '1600');
insert into programador values ('50','Susana', '40','Av. Assis Brasil,200', '1180');

insert into atividadesanalise values ('10', TO_DATE('2009-01-01','YYYY-MM-DD'), TO_DATE('2009-01-30','YYYY-MM-DD'), 'Processo de venda', '2');
insert into atividadesanalise values ('20', TO_DATE('2009-02-03','YYYY-MM-DD'), TO_DATE('2009-02-28','YYYY-MM-DD'), 'Pedido de compra', '2');
insert into atividadesanalise values ('30', TO_DATE('2009-04-05','YYYY-MM-DD'), TO_DATE('2009-06-20','YYYY-MM-DD'), 'Cadastro fornecedor', '1');
insert into atividadesanalise values ('40', TO_DATE('2009-06-06','YYYY-MM-DD'), TO_DATE('2009-07-30','YYYY-MM-DD'), 'Cadastro Produto', '4');

insert into atividadesprog values ('100', TO_DATE('2009-01-05','YYYY-MM-DD'), TO_DATE('2009-01-07','YYYY-MM-DD'), 'tela 105', '10', '10');
insert into atividadesprog values ('101', TO_DATE('2009-02-05','YYYY-MM-DD'), TO_DATE('2009-02-28','YYYY-MM-DD'), 'Relatorio 12', '10', '20');
insert into atividadesprog values ('102', TO_DATE('2009-02-05','YYYY-MM-DD'), TO_DATE('2009-02-15','YYYY-MM-DD'), 'Procedure', '20', '20');
insert into atividadesprog values ('103', TO_DATE('2009-04-06','YYYY-MM-DD'), TO_DATE('2009-04-10','YYYY-MM-DD'), 'tela 165', '10', '30');
insert into atividadesprog values ('104', TO_DATE('2009-06-09','YYYY-MM-DD'), TO_DATE('2009-06-15','YYYY-MM-DD'), 'Relatorio 16', '30', '30');