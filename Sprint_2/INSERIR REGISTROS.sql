
--introduzir valores na tabel condutores

INSERT INTO condutores(nr_idcivil, nr_idCivil_supervisor, nome, data_nascimento, nr_carta_conducao, data_validade_carta_conducao)
    VALUES (123451345, 123451345, 'José', TO_DATE('09/12/1970', 'dd/mm/yyyy'), 911435346, TO_DATE('22/06/2023', 'dd/mm/yyyy') );
    
INSERT INTO condutores(nr_idcivil, nr_idCivil_supervisor, nome, data_nascimento, nr_carta_conducao, data_validade_carta_conducao) 
    VALUES (234561212, 123451345, 'Alberto', TO_DATE ('10/07/1960', 'dd/mm/yyyy'), 912423559, TO_DATE ('12/05/2025', 'dd/mm/yyyy'));
    
INSERT INTO condutores(nr_idcivil, nr_idCivil_supervisor, nome, data_nascimento, nr_carta_conducao, data_validade_carta_conducao) 
    VALUES (345671232, 123451345, 'Antonio', TO_DATE ('14/01/1988', 'dd/mm/yyyy'), 913432435, TO_DATE ('27/12/2030', 'dd/mm/yyyy'));
    
INSERT INTO condutores(nr_idcivil, nr_idCivil_supervisor, nome, data_nascimento, nr_carta_conducao, data_validade_carta_conducao)
    VALUES (456783253, 123451345, 'Antonio', TO_DATE ('27/11/1999', 'dd/mm/yyyy'), 914435463,TO_DATE ('07/02/2022', 'dd/mm/yyyy' ));
    
    
INSERT INTO condutores(nr_idcivil, nr_idCivil_supervisor, nome, data_nascimento, nr_carta_conducao, data_validade_carta_conducao) 
    VALUES (567894356, 567894356, 'Ricardo', TO_DATE ('29/04/1973', 'dd/mm/yyyy'), 915523235, TO_DATE ('06/08/2033', 'dd/mm/yyyy'));
    
    
INSERT INTO condutores(nr_idcivil, nr_idCivil_supervisor, nome, data_nascimento, nr_carta_conducao, data_validade_carta_conducao) 
    VALUES (567894302, 567894356, 'teresa', TO_DATE ('29/04/1973', 'dd/mm/yyyy'), 915523202, TO_DATE ('06/08/2033', 'dd/mm/yyyy'));
    
INSERT INTO condutores(nr_idcivil, nr_idCivil_supervisor, nome, data_nascimento, nr_carta_conducao, data_validade_carta_conducao) 
    VALUES (567894303, 567894356, 'lolita', TO_DATE ('29/04/1973', 'dd/mm/yyyy'), 915523203, TO_DATE ('06/08/2033', 'dd/mm/yyyy'));
    
    
    
    
INSERT INTO veiculos(matricula, marca, modelo, nr_chassis, data_matricula)
    VALUES ('AZ-02-AZ', 'Toyota', 'modelo_x', 11712502, TO_DATE ('06/08/2007', 'dd/mm/yyyy'));
    
INSERT INTO veiculos(matricula, marca, modelo, nr_chassis, data_matricula)
    VALUES ('AB-02-AZ', 'Toyota', 'modelo_y', 11712503, TO_DATE ('07/08/2007', 'dd/mm/yyyy'));
    
INSERT INTO veiculos(matricula, marca, modelo, nr_chassis, data_matricula)
    VALUES ('AC-02-AZ', 'Toyota', 'modelo_z', 11712504, TO_DATE ('08/09/2007', 'dd/mm/yyyy'));
    
INSERT INTO veiculos(matricula, marca, modelo, nr_chassis, data_matricula)
    VALUES ('AD-02-AZ', 'Benzo', 'class_c', 11712505, TO_DATE ('06/08/2009', 'dd/mm/yyyy'));
    
INSERT INTO veiculos(matricula, marca, modelo, nr_chassis, data_matricula)
    VALUES ('AE-02-AZ', 'Benzo', 'class_e', 11712506, TO_DATE ('16/11/2011', 'dd/mm/yyyy'));
    
    
    
 INSERT INTO veiculos(matricula, marca, modelo, nr_chassis, data_matricula)
    VALUES ('AF-02-AZ', 'Toyota', 'modelo_x', 11712507, TO_DATE ('06/08/2008', 'dd/mm/yyyy'));
    
INSERT INTO veiculos(matricula, marca, modelo, nr_chassis, data_matricula)
    VALUES ('AG-02-AZ', 'Toyota', 'modelo_y', 11712508, TO_DATE ('07/08/2005', 'dd/mm/yyyy'));
    
INSERT INTO veiculos(matricula, marca, modelo, nr_chassis, data_matricula)
    VALUES ('AH-02-AZ', 'beamer', 'modelo_z', 11712509, TO_DATE ('30/09/2007', 'dd/mm/yyyy'));
    
INSERT INTO veiculos(matricula, marca, modelo, nr_chassis, data_matricula)
    VALUES ('AI-02-AZ', 'Benzo', 'class_3', 11712510, TO_DATE ('26/08/2009', 'dd/mm/yyyy'));
    
INSERT INTO veiculos(matricula, marca, modelo, nr_chassis, data_matricula)
    VALUES ('AJ-02-AZ', 'Benzo', 'class_s', 11712511, TO_DATE ('16/04/2019', 'dd/mm/yyyy'));
    
INSERT INTO veiculos(matricula, marca, modelo, nr_chassis, data_matricula)
    VALUES ('AL-02-AZ', 'Toyota', 'class_s', 11712512, TO_DATE ('26/07/2019', 'dd/mm/yyyy'));   
    
    
    
    
    
    
    
    
    
    
    
 INSERT INTO veiculos_condutores(matricula, nr_idCivil, data_inicio, data_fim)
    VALUES ('AF-02-AZ', 567894302, TO_DATE ('07/08/2008', 'dd/mm/yyyy'), TO_DATE ('06/02/2015', 'dd/mm/yyyy'));
    
INSERT INTO veiculos_condutores(matricula, nr_idCivil, data_inicio, data_fim)
    VALUES ('AC-02-AZ', 567894303, TO_DATE ('21/08/2016', 'dd/mm/yyyy'), TO_DATE ('06/03/2017', 'dd/mm/yyyy'));
       INSERT INTO veiculos_condutores(matricula, nr_idCivil, data_inicio, data_fim)
       
    VALUES ('AC-02-AZ', 567894356, TO_DATE ('22/08/2016', 'dd/mm/yyyy'), TO_DATE ('06/03/2017', 'dd/mm/yyyy'));
    
     INSERT INTO veiculos_condutores(matricula, nr_idCivil, data_inicio, data_fim)
    VALUES ('AG-02-AZ', 567894302, TO_DATE ('20/08/2008', 'dd/mm/yyyy'), TO_DATE ('07/06/2014', 'dd/mm/yyyy'));
    
    
    
     INSERT INTO veiculos_condutores(matricula, nr_idCivil, data_inicio, data_fim)
    VALUES ('AD-02-AZ', 567894356, TO_DATE ('27/07/2008', 'dd/mm/yyyy'), TO_DATE ('06/02/2017', 'dd/mm/yyyy'));
    
     INSERT INTO veiculos_condutores(matricula, nr_idCivil, data_inicio, data_fim)
    VALUES ('AE-02-AZ', 567894356, TO_DATE ('17/08/2011', 'dd/mm/yyyy'), TO_DATE ('06/09/2016', 'dd/mm/yyyy'));
    
    
    
INSERT INTO veiculos_condutores(matricula, nr_idCivil, data_inicio, data_fim)
    VALUES ('AZ-02-AZ', 567894356, TO_DATE ('07/08/2011', 'dd/mm/yyyy'), TO_DATE ('06/02/2015', 'dd/mm/yyyy'));
    
 INSERT INTO veiculos_condutores(matricula, nr_idCivil, data_inicio, data_fim)
    VALUES ('AH-02-AZ', 456783253, TO_DATE ('12/05/2015', 'dd/mm/yyyy'), TO_DATE ('06/06/2017', 'dd/mm/yyyy'));
    


INSERT INTO veiculos_condutores(matricula, nr_idCivil, data_inicio, data_fim)
    VALUES ('AI-02-AZ', 345671232, TO_DATE ('07/02/2008', 'dd/mm/yyyy'), TO_DATE ('06/03/2015', 'dd/mm/yyyy'));
    
INSERT INTO veiculos_condutores(matricula, nr_idCivil, data_inicio, data_fim)
    VALUES ('AJ-02-AZ', 234561212, TO_DATE ('07/11/2008', 'dd/mm/yyyy'), TO_DATE ('06/02/2017', 'dd/mm/yyyy'));
    
INSERT INTO veiculos_condutores(matricula, nr_idCivil, data_inicio, data_fim)
    VALUES ('AL-02-AZ', 123451345, TO_DATE ('07/08/2009', 'dd/mm/yyyy'), TO_DATE ('06/02/2016', 'dd/mm/yyyy'));
    
    



INSERT INTO servicos(cod_servico, descricao)
    VALUES (001, 'Eco');    
INSERT INTO servicos(cod_servico, descricao)
    VALUES (002, 'Casual');    
INSERT INTO servicos(cod_servico, descricao)
    VALUES (003, 'Luxo');    
INSERT INTO servicos(cod_servico, descricao)
    VALUES (004, 'Grupo');    
     
    
    
    
    INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
    VALUES (1001,'AZ-02-AZ', 567894356, TO_DATE ('07/08/2011', 'dd/mm/yyyy'), 001,  (TO_DATE('1/10/2017 21:02:44', 'dd/mm/yyyy hh24:mi:ss')), (TO_DATE('1/10/2019 23:02:44', 'dd/mm/yyyy hh24:mi:ss')), 45.5, 'nao');
    
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
    VALUES (1002,'AF-02-AZ', 567894302,  TO_DATE ('07/08/2008', 'dd/mm/yyyy'), 002,  (TO_DATE('2/10/2019 22:02:44', 'dd/mm/yyyy hh24:mi:ss')), (TO_DATE('3/10/2019 23:02:44', 'dd/mm/yyyy hh24:mi:ss')), 245.5, 'nao');
    
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
    VALUES (1003,'AG-02-AZ', 567894302, TO_DATE ('20/08/2008', 'dd/mm/yyyy'), 003,  (TO_DATE('3/10/2019 21:02:44', 'dd/mm/yyyy hh24:mi:ss')), (TO_DATE('4/10/2019 23:02:44', 'dd/mm/yyyy hh24:mi:ss')), 145.5, 'sim');
    
    
    
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
    VALUES (1004,'AD-02-AZ', 567894356,  TO_DATE ('27/07/2008', 'dd/mm/yyyy'), 004,  (TO_DATE('1/10/2019 21:02:44', 'dd/mm/yyyy hh24:mi:ss')), (TO_DATE('1/10/2019 23:02:44', 'dd/mm/yyyy hh24:mi:ss')), 45.5, 'nao');
    
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
    VALUES (1005,'AE-02-AZ', 567894356, TO_DATE ('17/08/2011', 'dd/mm/yyyy'), 001,  (TO_DATE('1/10/2019 21:02:44', 'dd/mm/yyyy hh24:mi:ss')), (TO_DATE('1/10/2019 23:02:44', 'dd/mm/yyyy hh24:mi:ss')), 45.5, 'nao');
    
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
    VALUES (1006,'AH-02-AZ', 456783253, TO_DATE ('12/05/2015', 'dd/mm/yyyy'), 002,  (TO_DATE('1/10/2017 21:02:44', 'dd/mm/yyyy hh24:mi:ss')), (TO_DATE('1/10/2019 23:02:44', 'dd/mm/yyyy hh24:mi:ss')), 45.5, 'nao');
    
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
    VALUES (1007,'AI-02-AZ', 345671232, TO_DATE ('07/02/2008', 'dd/mm/yyyy'), 003,  (TO_DATE('1/10/2017 21:02:44', 'dd/mm/yyyy hh24:mi:ss')), (TO_DATE('1/10/2019 23:02:44', 'dd/mm/yyyy hh24:mi:ss')), 45.5, 'nao');
    
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
    VALUES (1008,'AJ-02-AZ', 234561212, TO_DATE ('07/11/2008', 'dd/mm/yyyy'), 004,  (TO_DATE('1/10/2017 21:02:44', 'dd/mm/yyyy hh24:mi:ss')), (TO_DATE('1/10/2019 23:02:44', 'dd/mm/yyyy hh24:mi:ss')), 45.5, 'nao');
    
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
    VALUES (1009,'AL-02-AZ', 123451345, TO_DATE ('07/08/2009', 'dd/mm/yyyy'), 001,  (TO_DATE('1/10/2018 21:02:44', 'dd/mm/yyyy hh24:mi:ss')), (TO_DATE('1/10/2019 23:02:44', 'dd/mm/yyyy hh24:mi:ss')), 45.5, 'nao');
    
    INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
    VALUES (1011,'AD-02-AZ', 567894356,  TO_DATE ('27/07/2008', 'dd/mm/yyyy'), 004,  (TO_DATE('1/10/2017 21:02:44', 'dd/mm/yyyy hh24:mi:ss')), (TO_DATE('1/10/2019 23:02:44', 'dd/mm/yyyy hh24:mi:ss')), 45.5, 'nao');
    INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
    VALUES (1012,'AD-02-AZ', 567894356,  TO_DATE ('27/07/2008', 'dd/mm/yyyy'), 004,  (TO_DATE('1/10/2017 21:02:44', 'dd/mm/yyyy hh24:mi:ss')), (TO_DATE('1/10/2019 23:02:44', 'dd/mm/yyyy hh24:mi:ss')), 45.5, 'nao');

   
    INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
    VALUES (1013,'AL-02-AZ', 123451345, TO_DATE ('07/08/2009', 'dd/mm/yyyy'), 004,  (TO_DATE('1/10/2017 21:02:44', 'dd/mm/yyyy hh24:mi:ss')), (TO_DATE('1/10/2019 23:02:44', 'dd/mm/yyyy hh24:mi:ss')), 45.5, 'nao');
    INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
    VALUES (1014,'AL-02-AZ', 123451345, TO_DATE ('07/08/2009', 'dd/mm/yyyy'), 003,  (TO_DATE('1/10/2017 21:02:44', 'dd/mm/yyyy hh24:mi:ss')), (TO_DATE('1/10/2019 23:02:44', 'dd/mm/yyyy hh24:mi:ss')), 45.5, 'nao');
     INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
    VALUES (1015,'AL-02-AZ', 123451345, TO_DATE ('07/08/2009', 'dd/mm/yyyy'), 002,  (TO_DATE('1/10/2017 21:02:44', 'dd/mm/yyyy hh24:mi:ss')), (TO_DATE('1/10/2019 23:02:44', 'dd/mm/yyyy hh24:mi:ss')), 45.5, 'nao'); 
      INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
    VALUES (1016,'AL-02-AZ', 123451345, TO_DATE ('07/08/2009', 'dd/mm/yyyy'), 002,  (TO_DATE('1/10/2017 21:02:44', 'dd/mm/yyyy hh24:mi:ss')), (TO_DATE('1/10/2019 23:02:44', 'dd/mm/yyyy hh24:mi:ss')), 45.5, 'nao'); 



--insert pontos turisticos 
INSERT INTO pontos_turisticos(cod_ponto_turistico, nome_ponto_turistico, tipo_ponto_turistico) 
    VALUES(12345,'Ribeira', 'M');
INSERT INTO pontos_turisticos(cod_ponto_turistico, nome_ponto_turistico, tipo_ponto_turistico) 
    VALUES(54879,'Baixa', 'MU');
INSERT INTO pontos_turisticos(cod_ponto_turistico, nome_ponto_turistico, tipo_ponto_turistico) 
    VALUES(12365,'Alto da boa Vista', 'PN');
INSERT INTO pontos_turisticos(cod_ponto_turistico, nome_ponto_turistico, tipo_ponto_turistico) 
    VALUES(78489,'Rio da Gaia', 'MI');
INSERT INTO pontos_turisticos(cod_ponto_turistico, nome_ponto_turistico, tipo_ponto_turistico) 
    VALUES(23567,'Rio douro', 'M');
INSERT INTO pontos_turisticos(cod_ponto_turistico, nome_ponto_turistico, tipo_ponto_turistico) 
    VALUES(15487,'Estadio do Dragão', 'MU');
INSERT INTO pontos_turisticos(cod_ponto_turistico, nome_ponto_turistico, tipo_ponto_turistico) 
    VALUES(15457,'Estádio Rio Aves', 'M');
INSERT INTO pontos_turisticos(cod_ponto_turistico, nome_ponto_turistico, tipo_ponto_turistico) 
    VALUES(24851,'Praia da Póvoa', 'MI');
INSERT INTO pontos_turisticos(cod_ponto_turistico, nome_ponto_turistico, tipo_ponto_turistico) 
    VALUES(69874,'Estacão São Bento', 'M');
INSERT INTO pontos_turisticos(cod_ponto_turistico, nome_ponto_turistico, tipo_ponto_turistico) 
    VALUES(78542,'Aliados', 'PN');
    
    --insert para a tabela Viagens 
INSERT INTO Viagens (cod_viagem,cod_pedido,atraso_passageiro_minutos, duracao_minutos) 
    VALUES(123456,1001,110,20.5);    
INSERT INTO Viagens (cod_viagem,cod_pedido,atraso_passageiro_minutos, duracao_minutos) 
    VALUES(556987,1002,0,80.5);
INSERT INTO Viagens (cod_viagem,cod_pedido,atraso_passageiro_minutos, duracao_minutos) 
    VALUES(123854,1003,10,99.76);
INSERT INTO Viagens (cod_viagem,cod_pedido,atraso_passageiro_minutos, duracao_minutos) 
    VALUES(457896,1002,99,54.65);
INSERT INTO Viagens (cod_viagem,cod_pedido,atraso_passageiro_minutos, duracao_minutos) 
    VALUES(253689,1001,75,120.0);
INSERT INTO Viagens (cod_viagem,cod_pedido,atraso_passageiro_minutos, duracao_minutos) 
    VALUES(693625,1009,19,123.58);    
INSERT INTO Viagens (cod_viagem,cod_pedido,atraso_passageiro_minutos, duracao_minutos) 
    VALUES(485936,1008,0,93.75);
INSERT INTO Viagens (cod_viagem,cod_pedido,atraso_passageiro_minutos, duracao_minutos) 
    VALUES(455689,1007,33,12.36);
INSERT INTO Viagens (cod_viagem,cod_pedido,atraso_passageiro_minutos, duracao_minutos) 
    VALUES(134689,1006,99,66.65);
INSERT INTO Viagens (cod_viagem,cod_pedido,atraso_passageiro_minutos, duracao_minutos) 
    VALUES(143989,1005,75,120.0);
INSERT INTO Viagens (cod_viagem,cod_pedido,atraso_passageiro_minutos, duracao_minutos) 
    VALUES(143001,1005,75,120.0);
INSERT INTO Viagens (cod_viagem,cod_pedido,atraso_passageiro_minutos, duracao_minutos) 
    VALUES(143002,1005,75,120.0);
INSERT INTO Viagens (cod_viagem,cod_pedido,atraso_passageiro_minutos, duracao_minutos) 
    VALUES(143003,1005,75,120.0);
INSERT INTO Viagens (cod_viagem,cod_pedido,atraso_passageiro_minutos, duracao_minutos) 
    VALUES(143004,1005,75,120.0);
INSERT INTO Viagens (cod_viagem,cod_pedido,atraso_passageiro_minutos, duracao_minutos) 
    VALUES(143005,1005,75,120.0);

    

 --insert intinerario viagens
INSERT INTO Itinerarios_Viagens(cod_viagem,cod_ponto_turistico,hora_passagem) 
    VALUES(123456,12345,TO_TIMESTAMP('18:05:19', ' HH24:MI:SS'));
INSERT INTO Itinerarios_Viagens(cod_viagem,cod_ponto_turistico,hora_passagem) 
    VALUES(556987,54879,CURRENT_TIMESTAMP);
INSERT INTO Itinerarios_Viagens(cod_viagem,cod_ponto_turistico,hora_passagem) 
    VALUES(123854,12365,TO_TIMESTAMP('09:09:55', ' HH24:MI:SS'));
INSERT INTO Itinerarios_Viagens(cod_viagem,cod_ponto_turistico,hora_passagem) 
    VALUES(457896,78489,TO_TIMESTAMP('10:55:19', 'HH24:MI:SS'));
INSERT INTO Itinerarios_Viagens(cod_viagem,cod_ponto_turistico,hora_passagem) 
    VALUES(253689,23567,TO_TIMESTAMP('06:55:19', ' HH24:MI:SS'));
INSERT INTO Itinerarios_Viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
    VALUES(693625,15487,TO_TIMESTAMP('12:45:10', ' HH24:MI:SS'));
INSERT INTO Itinerarios_Viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
    VALUES(485936,15457,TO_TIMESTAMP('14:05:19', ' HH24:MI:SS'));
INSERT INTO Itinerarios_Viagens(cod_viagem,cod_ponto_turistico,hora_passagem) 
    VALUES(455689,24851,CURRENT_TIMESTAMP);
INSERT INTO Itinerarios_Viagens(cod_viagem,cod_ponto_turistico,hora_passagem) 
    VALUES(134689,69874,CURRENT_TIMESTAMP);
INSERT INTO Itinerarios_Viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
    VALUES(143989,78542,TO_TIMESTAMP('20:05:19', ' HH24:MI:SS'));
 INSERT INTO Itinerarios_Viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
    VALUES(143001,78542,TO_TIMESTAMP('20:05:19', ' HH24:MI:SS'));
INSERT INTO Itinerarios_Viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
    VALUES(143002,78542,TO_TIMESTAMP('20:05:19', ' HH24:MI:SS'));
INSERT INTO Itinerarios_Viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
    VALUES(143003,78542,TO_TIMESTAMP('20:05:19', ' HH24:MI:SS'));
INSERT INTO Itinerarios_Viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
    VALUES(143004,78542,TO_TIMESTAMP('20:05:19', ' HH24:MI:SS'));
INSERT INTO Itinerarios_Viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
    VALUES(143005,78542,TO_TIMESTAMP('20:05:19', ' HH24:MI:SS'));
INSERT INTO Itinerarios_Viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
    VALUES(143005,54879,CURRENT_TIMESTAMP);



    
     --insert para a tabela Custos_servicos
INSERT INTO Custos_servicos (cod_servico, data_inicio_custo, data_fim_custo, preco_base, custo_min, custo_km, taxa_iva, temp_maximo_espera_minutos, custo_espera_minuto, custo_cancelamento_pedido) 
    VALUES(001,TO_DATE ('07/02/2017', 'dd/mm/yyyy'),145,130, 0.25, 0.20, 23.1, 25, 0.25, 75);    

INSERT INTO Custos_servicos (cod_servico, data_inicio_custo, data_fim_custo, preco_base, custo_min, custo_km, taxa_iva, temp_maximo_espera_minutos, custo_espera_minuto, custo_cancelamento_pedido) 
    VALUES(002,TO_DATE ('07/02/2017', 'dd/mm/yyyy'),145,130, 0.25, 0.20, 23.1, 25, 0.25, 75);     
INSERT INTO Custos_servicos (cod_servico, data_inicio_custo, data_fim_custo, preco_base, custo_min, custo_km, taxa_iva, temp_maximo_espera_minutos, custo_espera_minuto, custo_cancelamento_pedido) 
    VALUES(003,TO_DATE ('07/02/2016', 'dd/mm/yyyy'),145.3,130, 0.25, 0.20, 23.1, 25, 0.25, 75); 
    INSERT INTO Custos_servicos (cod_servico, data_inicio_custo, data_fim_custo, preco_base, custo_min, custo_km, taxa_iva, temp_maximo_espera_minutos, custo_espera_minuto, custo_cancelamento_pedido) 
 VALUES(004,TO_DATE ('07/02/2008', 'dd/mm/yyyy'),214.3,130, 0.25, 0.20, 23.1, 25, 0.25, 75); 

     
    
    