INSERT INTO Pessoas(nr_idcivil, nome, nr_contribuinte, data_nascimento)
    VALUES (00000001, 'jose', '000001', TO_DATE('09/12/1971', 'dd/mm/yyyy') );
    
INSERT INTO Pessoas(nr_idcivil, nome, nr_contribuinte, data_nascimento)
    VALUES (00000002, 'joel', '000002', TO_DATE('09/12/1972', 'dd/mm/yyyy') );
    
INSERT INTO Pessoas(nr_idcivil, nome, nr_contribuinte, data_nascimento)
    VALUES (00000003, 'joao', '000003', TO_DATE('09/12/1973', 'dd/mm/yyyy') );

INSERT INTO Pessoas(nr_idcivil, nome, nr_contribuinte, data_nascimento)
    VALUES (00000004, 'jacinto', '000004', TO_DATE('09/12/1974', 'dd/mm/yyyy') );
    
INSERT INTO Pessoas(nr_idcivil, nome, nr_contribuinte, data_nascimento)
    VALUES (00000005, 'jaimao', '000005', TO_DATE('09/12/1975', 'dd/mm/yyyy') );
    
INSERT INTO Pessoas(nr_idcivil, nome, nr_contribuinte, data_nascimento)
    VALUES (00000006, 'carlos', '000006', TO_DATE('09/12/1976', 'dd/mm/yyyy') );
    
INSERT INTO Pessoas(nr_idcivil, nome, nr_contribuinte, data_nascimento)
    VALUES (00000007, 'costa', '000007', TO_DATE('09/12/1977', 'dd/mm/yyyy') );
    
INSERT INTO Pessoas(nr_idcivil, nome, nr_contribuinte, data_nascimento)
    VALUES (00000008, 'carlao', '000008', TO_DATE('09/12/1978', 'dd/mm/yyyy') );
    
INSERT INTO Pessoas(nr_idcivil, nome, nr_contribuinte, data_nascimento)
    VALUES (00000009, 'capira', '000009', TO_DATE('09/12/1979', 'dd/mm/yyyy') );
    
    
INSERT INTO Pessoas(nr_idcivil, nome, nr_contribuinte, data_nascimento)
    VALUES (00000010, 'carlota', '000010', TO_DATE('09/12/1980', 'dd/mm/yyyy') );    
    


    
INSERT INTO condutores(nr_idcivil, nr_idCivil_supervisor, rua,codigo_postal,nr_carta,data_carta)
    VALUES (00000006, null, 'alexandrino chaves','4590-318',00006,TO_DATE('09/12/2019', 'dd/mm/yyyy') );
  INSERT INTO condutores(nr_idcivil, nr_idCivil_supervisor, rua,codigo_postal,nr_carta,data_carta)
    VALUES (00000007, 00000006, 'alexandrino','4590-319',00007,TO_DATE('09/12/2020', 'dd/mm/yyyy') );
    INSERT INTO condutores(nr_idcivil, nr_idCivil_supervisor, rua,codigo_postal,nr_carta,data_carta)
    VALUES (00000008, null, 'alexandrino chaves','4590-318',00008,TO_DATE('12/12/2019', 'dd/mm/yyyy') );
    INSERT INTO condutores(nr_idcivil, nr_idCivil_supervisor, rua,codigo_postal,nr_carta,data_carta)
    VALUES (00000009, 00000006, 'alexandrino chaves','4590-318',00009,TO_DATE('25/12/2019', 'dd/mm/yyyy') );
    INSERT INTO condutores(nr_idcivil, nr_idCivil_supervisor, rua,codigo_postal,nr_carta,data_carta)
    VALUES (00000010, 00000008, 'alexandrino chaves','4590-318',00010,TO_DATE('10/07/2021', 'dd/mm/yyyy') );




INSERT INTO Clientes(nr_idcivil, login, password)
    VALUES (00000001, 'jose1', 'pass1' );
    

INSERT INTO Clientes(nr_idcivil, login, password)
    VALUES (00000002, 'joel1', 'pass2' );
INSERT INTO Clientes(nr_idcivil, login, password)
    VALUES (00000003, 'joao1', 'pass3' );
    
INSERT INTO Clientes(nr_idcivil, login, password)
    VALUES (00000004, 'jacint1', 'pass4' );
    
INSERT INTO Clientes(nr_idcivil, login, password)
    VALUES (00000005, 'jaimao1', 'pass5' );
    

       



INSERT INTO servicos(cod_servico, descricao)
    VALUES (1, 'individual' );
    
INSERT INTO servicos(cod_servico, descricao)
    VALUES (2, 'grupo' );
INSERT INTO servicos(cod_servico, descricao)
    VALUES (3, 'executivo' );
    
INSERT INTO servicos(cod_servico, descricao)
    VALUES (4, 'especial' );
        
    
    
    
    


INSERT INTO info_servicos(cod_servico, data_inicio_custo,data_fim_custo,preco_base,custo_min,custo_km,taxa_iva,temp_maximo_espera,custo_por_minuto_espera,custo_cancelamento,cancelamento_penalizacao_percentagem,percentagem_comissao,percentagem_comissao_supervisor)
    VALUES (1, TO_DATE('27/11/2018', 'dd/mm/yyyy') ,TO_DATE('27/11/2019', 'dd/mm/yyyy'),10,2,2,10,30,2,10,20,25,10  );
        
INSERT INTO info_servicos(cod_servico, data_inicio_custo,data_fim_custo,preco_base,custo_min,custo_km,taxa_iva,temp_maximo_espera,custo_por_minuto_espera,custo_cancelamento,cancelamento_penalizacao_percentagem,percentagem_comissao,percentagem_comissao_supervisor)
    VALUES (1, TO_DATE('27/11/2019', 'dd/mm/yyyy') ,TO_DATE('27/11/2020', 'dd/mm/yyyy'),5,2,2,10,30,2,10,20,25,10  );    
 
 
INSERT INTO info_servicos(cod_servico, data_inicio_custo,data_fim_custo,preco_base,custo_min,custo_km,taxa_iva,temp_maximo_espera,custo_por_minuto_espera,custo_cancelamento,cancelamento_penalizacao_percentagem,percentagem_comissao,percentagem_comissao_supervisor)
    VALUES (2, TO_DATE('27/11/2018', 'dd/mm/yyyy') ,TO_DATE('27/11/2019', 'dd/mm/yyyy'),20,4,4,20,30,2,20,20,30,15  );    
  INSERT INTO info_servicos(cod_servico, data_inicio_custo,data_fim_custo,preco_base,custo_min,custo_km,taxa_iva,temp_maximo_espera,custo_por_minuto_espera,custo_cancelamento,cancelamento_penalizacao_percentagem,percentagem_comissao,percentagem_comissao_supervisor)
    VALUES (2, TO_DATE('27/11/2019', 'dd/mm/yyyy') ,TO_DATE('27/11/2020', 'dd/mm/yyyy'),15,4,4,20,30,2,15,20,30,15  ); 
    
    INSERT INTO info_servicos(cod_servico, data_inicio_custo,data_fim_custo,preco_base,custo_min,custo_km,taxa_iva,temp_maximo_espera,custo_por_minuto_espera,custo_cancelamento,cancelamento_penalizacao_percentagem,percentagem_comissao,percentagem_comissao_supervisor)
    VALUES (3, TO_DATE('27/11/2018', 'dd/mm/yyyy') ,TO_DATE('27/11/2019', 'dd/mm/yyyy'),25,10,10,20,30,2,25,20,30,15  ); 
    
     INSERT INTO info_servicos(cod_servico, data_inicio_custo,data_fim_custo,preco_base,custo_min,custo_km,taxa_iva,temp_maximo_espera,custo_por_minuto_espera,custo_cancelamento,cancelamento_penalizacao_percentagem,percentagem_comissao,percentagem_comissao_supervisor)
    VALUES (3, TO_DATE('27/11/2019', 'dd/mm/yyyy') ,TO_DATE('27/11/2020', 'dd/mm/yyyy'),30,10,10,20,30,2,30,20,30,15  );  
    
     INSERT INTO info_servicos(cod_servico, data_inicio_custo,data_fim_custo,preco_base,custo_min,custo_km,taxa_iva,temp_maximo_espera,custo_por_minuto_espera,custo_cancelamento,cancelamento_penalizacao_percentagem,percentagem_comissao,percentagem_comissao_supervisor)
    VALUES (4, TO_DATE('27/11/2018', 'dd/mm/yyyy') ,TO_DATE('27/11/2019', 'dd/mm/yyyy'),40,10,10,20,30,2,50,20,30,15  ); 
    
     INSERT INTO info_servicos(cod_servico, data_inicio_custo,data_fim_custo,preco_base,custo_min,custo_km,taxa_iva,temp_maximo_espera,custo_por_minuto_espera,custo_cancelamento,cancelamento_penalizacao_percentagem,percentagem_comissao,percentagem_comissao_supervisor)
    VALUES (4, TO_DATE('27/11/2019', 'dd/mm/yyyy') ,TO_DATE('27/11/2020', 'dd/mm/yyyy'),50,10,10,20,30,2,50,20,30,15  );  
    
    

    
    INSERT INTO veiculos(matricula, marca, modelo, nr_chassis, data_matricula,km_semanais)
   VALUES ('AA-AA-AA', 'audio', 'A1', 0001, TO_DATE('1/1/2017', 'dd/mm/yyyy'),50 );
    INSERT INTO veiculos(matricula, marca, modelo, nr_chassis, data_matricula,km_semanais)
   VALUES ('AA-AA-AB', 'beamer', 'M3', 0002, TO_DATE('2/1/2016', 'dd/mm/yyyy'),50 );
   INSERT INTO veiculos(matricula, marca, modelo, nr_chassis, data_matricula,km_semanais)
   VALUES ('AA-AA-AC', 'cabriolet', 'cc', 0003, TO_DATE('3/1/2015', 'dd/mm/yyyy'),50 );
   INSERT INTO veiculos(matricula, marca, modelo, nr_chassis, data_matricula,km_semanais)
   VALUES ('AA-AA-AD', 'beamer', 'M3', 0004, TO_DATE('4/1/2014', 'dd/mm/yyyy'),50 );
  INSERT INTO veiculos(matricula, marca, modelo, nr_chassis, data_matricula,km_semanais)
   VALUES ('AA-AA-AE', 'beamer', 'M3', 0005, TO_DATE('5/1/2013', 'dd/mm/yyyy'),50 );
      

    
    
  
INSERT INTO veiculos_condutores(nr_idCivil, matricula, data_inicio, data_fim)
VALUES (00000006, 'AA-AA-AA',TO_DATE('5/11/2019', 'dd/mm/yyyy'),TO_DATE('12/11/2019', 'dd/mm/yyyy')  );
INSERT INTO veiculos_condutores(nr_idCivil, matricula, data_inicio, data_fim)
VALUES (00000007, 'AA-AA-AB',TO_DATE('7/11/2019', 'dd/mm/yyyy'),TO_DATE('13/11/2019', 'dd/mm/yyyy')  );
INSERT INTO veiculos_condutores(nr_idCivil, matricula, data_inicio, data_fim)
VALUES (00000008, 'AA-AA-AC',TO_DATE('12/11/2019', 'dd/mm/yyyy'),TO_DATE('14/11/2019', 'dd/mm/yyyy')  );
INSERT INTO veiculos_condutores(nr_idCivil, matricula, data_inicio, data_fim)
VALUES (00000009, 'AA-AA-AD',TO_DATE('11/12/2019', 'dd/mm/yyyy'), TO_DATE('21/12/2019', 'dd/mm/yyyy')  ); 
INSERT INTO veiculos_condutores(nr_idCivil, matricula, data_inicio, data_fim)
VALUES (00000010, 'AA-AA-AE',TO_DATE('01/11/2019', 'dd/mm/yyyy'), TO_DATE('12/12/2019', 'dd/mm/yyyy')  ); 

INSERT INTO veiculos_condutores(nr_idCivil, matricula, data_inicio, data_fim)            ---subreposiçao 
VALUES (0000009, 'AA-AA-AE',TO_DATE('11/11/2019', 'dd/mm/yyyy'), TO_DATE('12/11/2019', 'dd/mm/yyyy')  ); 

INSERT INTO veiculos_condutores(nr_idCivil, matricula, data_inicio, data_fim)            ---subreposiçao 
VALUES (0000009, 'AA-AA-AE',TO_DATE('11/11/2019', 'dd/mm/yyyy'), TO_DATE('12/11/2019', 'dd/mm/yyyy')  );




--pontos turisticos

INSERT INTO pontos_turisticos(codigo_pt, nome, tipo)  
VALUES (0001,'primeiro ponto','MU' );
INSERT INTO pontos_turisticos(codigo_pt, nome, tipo)  
VALUES (0002,'segundo ponto','MU' );
INSERT INTO pontos_turisticos(codigo_pt, nome, tipo)  
VALUES (0003 ,'terceiro ponto','MU');
INSERT INTO pontos_turisticos(codigo_pt, nome, tipo)  
VALUES (0004 ,'quarto ponto','MU');
INSERT INTO pontos_turisticos(codigo_pt, nome, tipo)  
VALUES (0005 ,'quinto ponto','MU');
INSERT INTO pontos_turisticos(codigo_pt, nome, tipo)  
VALUES (0006 ,'sexto ponto','MU');

--pontos visitados  //  NOT DONE!!

INSERT INTO pontos_visitados(nr_viagem, codigo_pt,hora_passagem)  
VALUES (null,0001,CURRENT_TIMESTAMP);

INSERT INTO pontos_visitados(nr_viagem, codigo_pt,hora_passagem)  
VALUES (null,0002,TO_TIMESTAMP('18:40', 'HH24:MI:SS'));

INSERT INTO pontos_visitados(nr_viagem, codigo_pt,hora_passagem)  
VALUES (null,0003,TO_TIMESTAMP('09:40', 'HH24:MI:SS'));

INSERT INTO pontos_visitados(nr_viagem, codigo_pt,hora_passagem)  
VALUES (null,0004,TO_TIMESTAMP('13:40', 'HH24:MI:SS'));

INSERT INTO pontos_visitados(nr_viagem, codigo_pt,hora_passagem)  
VALUES (null,0005,TO_TIMESTAMP('22:40', 'HH24:MI:SS'));

INSERT INTO pontos_visitados(nr_viagem, codigo_pt,hora_passagem)  
VALUES (null,0006,TO_TIMESTAMP('03:40', 'HH24:MI:SS'));


--viagem  // NOT DONE!!!
INSERT INTO viagens(nr_viagem, codigo_pedido,local_inicio, duracao,tempo_atrado_minutos)  
VALUES (1111,null,'Porto',22.0,2.0);

INSERT INTO viagens(nr_viagem, codigo_pedido,local_inicio, duracao,tempo_atrado_minutos)  
VALUES (2222,null,'Braga',24.0,3.0);

INSERT INTO viagens(nr_viagem, codigo_pedido,local_inicio, duracao,tempo_atrado_minutos)  
VALUES (3333,null,'Lisboa',28.0,4.0);

INSERT INTO viagens(nr_viagem, codigo_pedido,local_inicio, duracao,tempo_atrado_minutos)  
VALUES (4444,null,'Oslo',20.0,5.0);

INSERT INTO viagens(nr_viagem, codigo_pedido,local_inicio, duracao,tempo_atrado_minutos)  
VALUES (5555,null,'Bruxelas',10.0,6.0);

INSERT INTO viagens(nr_viagem, codigo_pedido,local_inicio, duracao,tempo_atrado_minutos)  
VALUES (6666,null,'Paris',12.0,9.0);

INSERT INTO viagens(nr_viagem, codigo_pedido, local_inicio, duracao, tempo_atrado_minutos)  
VALUES (7777,null,'Londres',45.0,10.0);

--Pedidos viagens

INSERT INTO pedidos_viagens_cliente(cod_pedido, nr_idCivil_condutor, nr_idCivil_cliente, matricula,data_inicio,cod_servico,) 
    VALUES();
    
--Pedidos Cancelados  //  NOT DONE!!!

INSERT INTO pedidos_cancelados(cod_cancelamento,cod_pedido,tempo_cancelamento_horas)  
VALUES (010101,null,12.10);

INSERT INTO pedidos_cancelados(cod_cancelamento,cod_pedido,tempo_cancelamento_horas)  
VALUES (020202,null,66.10);

INSERT INTO pedidos_cancelados(cod_cancelamento,cod_pedido,tempo_cancelamento_horas)  
VALUES (030303,null,11.10);

INSERT INTO pedidos_cancelados(cod_cancelamento,cod_pedido,tempo_cancelamento_horas)  
VALUES (040404,null,07.10);

INSERT INTO pedidos_cancelados(cod_cancelamento,cod_pedido,tempo_cancelamento_horas)  
VALUES (050505,null,09.10);

INSERT INTO pedidos_cancelados(cod_cancelamento,cod_pedido,tempo_cancelamento_horas)  
VALUES (060606,null,87.10);

INSERT INTO pedidos_cancelados(cod_cancelamento,cod_pedido,tempo_cancelamento_horas)  
VALUES (070707,null,88.10);

INSERT INTO pedidos_cancelados(cod_cancelamento,cod_pedido,tempo_cancelamento_horas)  
VALUES (080808,null,55.10);

INSERT INTO pedidos_cancelados(cod_cancelamento,cod_pedido,tempo_cancelamento_horas)  
VALUES (090909,null,12.00);

---viagens NOT DONE
INSERT INTO Viagens (nr_viagem,cod_pedido,local_inicio, duracao,tempo_atraso) 
    VALUES(143005,1005,75,120.0);





