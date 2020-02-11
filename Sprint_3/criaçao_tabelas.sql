Drop TABLE pessoas CASCADE CONSTRAINTS PURGE;
DROP TABLE Condutores CASCADE CONSTRAINTS PURGE;
DROP TABLE clientes CASCADE CONSTRAINTS PURGE;
DROP TABLE Servicos CASCADE CONSTRAINTS PURGE;
DROP TABLE info_servicos CASCADE CONSTRAINTS PURGE;
DROP TABLE veiculos CASCADE CONSTRAINTS PURGE;
DROP TABLE veiculos_condutores CASCADE CONSTRAINTS PURGE;
DROP TABLE pedidos_viagens_cliente CASCADE CONSTRAINTS PURGE;
DROP TABLE viagens CASCADE CONSTRAINTS PURGE;
DROP TABLE pedidos_cancelados CASCADE CONSTRAINTS PURGE;
DROP TABLE recibos CASCADE CONSTRAINTS PURGE;

DROP TABLE linha_recibos CASCADE CONSTRAINTS PURGE;
DROP TABLE pontos_turisticos CASCADE CONSTRAINTS PURGE;
DROP TABLE pontos_visitados CASCADE CONSTRAINTS PURGE;
DROP TABLE facturas CASCADE CONSTRAINTS PURGE;


---TABELA--FACTURA---




CREATE TABLE pessoas(
    nr_idCivil   NUMBER(9),
    nome varchar(30),
    nr_contribuinte number(6),
    data_nascimento DATE,
    CONSTRAINT pk_nr_idCivil_pessoas PRIMARY KEY (nr_idCivil),
    CONSTRAINT unique_nr_idCivil UNIQUE (nr_contribuinte)
    );


CREATE TABLE condutores(
    nr_idCivil   NUMBER(9),
    nr_idCivil_supervisor NUMBER(9),
    rua VARCHAR(40),
    codigo_postal VARCHAR(9),
    nr_carta number(5),
    data_carta DATE,
   
    CONSTRAINT pk_nr_idCivil PRIMARY KEY (nr_idCivil)
    
    );
ALTER TABLE condutores ADD CONSTRAINT Condutores_fk_nr_idCivil FOREIGN KEY (nr_idCivil) REFERENCES pessoas(nr_idCivil);
ALTER TABLE condutores ADD CONSTRAINT Condutores_fk_nr_idCivil_supervisor FOREIGN KEY (nr_idCivil_supervisor) REFERENCES Condutores(nr_idCivil);




CREATE TABLE clientes(
    nr_idCivil   NUMBER(9),
    login varchar(7),
    password varchar(6),
    
    CONSTRAINT unique_login Unique (login),
    CONSTRAINT pk_nr_idCivil_cliente PRIMARY KEY (nr_idCivil)
    
    );
ALTER TABLE clientes ADD CONSTRAINT cliente_fk_nr_idCivil FOREIGN KEY (nr_idCivil) REFERENCES Pessoas(nr_idCivil);



CREATE TABLE servicos(
  cod_servico number(1),
  descricao varchar(25),
  CONSTRAINT pk_cod_servico PRIMARY KEY (cod_servico),
  CONSTRAINT cons_cod_servico CHECK (cod_servico=1 or cod_servico=2 or cod_servico=3 or cod_servico=4)
    );



CREATE TABLE info_servicos(
  
   cod_servico int  ,
   data_inicio_custo date,
   data_fim_custo date,
   preco_base float not null,
   custo_min float,
   custo_km float,
   taxa_iva float(1),
   temp_maximo_espera int,
   custo_por_minuto_espera float,
   custo_cancelamento float,
   cancelamento_penalizacao_percentagem number(4),
   percentagem_comissao number(4),
   percentagem_comissao_supervisor number(4),
   CONSTRAINT pk_custos_servico_data Primary KEY (cod_servico, data_inicio_custo)
   
   
     
);  
ALTER TABLE info_servicos ADD CONSTRAINT fk_info_servicos FOREIGN KEY (cod_servico) REFERENCES servicos(cod_servico); 







CREATE TABLE veiculos(
  matricula char(8),
    marca VARCHAR2(55) ,
   modelo VARCHAR2(55),
     nr_chassis int UNIQUE,
    
    data_matricula DATE,
    km_semanais int,
    CONSTRAINT matricula_pk PRIMARY KEY (matricula)
);


CREATE TABLE veiculos_condutores(
   data_inicio DATE,
   nr_idCivil int,
   matricula char(8) ,
   
   data_fim DATE,
    
   CONSTRAINT pk_veiculos_condutores Primary KEY (data_inicio, nr_idCivil, matricula)
   
);  
ALTER TABLE veiculos_condutores ADD CONSTRAINT fk_veiculos_condutores2 FOREIGN KEY (nr_idCivil) REFERENCES condutores(nr_idCivil); 
ALTER TABLE veiculos_condutores ADD CONSTRAINT fk_veiculos_condutores FOREIGN KEY (matricula) REFERENCES veiculos(matricula); 


CREATE TABLE Pedidos_Viagens_cliente(
   cod_pedido Number(4),
   matricula char(8),
   nr_idCivil_Condutor NUMBER(9),
   data_inicio DATE,
   cod_servico int,
   nr_idCivil_Cliente NUMBER(9),
   data_hora_pedido TIMESTAMP,
   data_hora_recolha_passageiro TIMESTAMP,
   distancia_km int,  --usada para saber se o veiculos tem quilometros suficientes essa semana
   data_hora_final_prevista TIMESTAMP, -- para ver a sobreposiçao
   
   CONSTRAINT pk_Pedidos_Viagens Primary KEY (cod_pedido),
   CHECK(data_hora_pedido < data_hora_recolha_passageiro),
   CHECK(data_hora_recolha_passageiro < data_hora_final_prevista)
   
);  

ALTER TABLE Pedidos_Viagens_cliente ADD CONSTRAINT fk_Pedidos_Viagens_veiculos_condutores FOREIGN KEY (data_inicio, nr_idCivil_Condutor, matricula) REFERENCES Veiculos_condutores(data_inicio, nr_idCivil, matricula);  -- alteraÃ§ao a tabela Itenerarios_viagem para atribuir uma chave estangeira da tebla criada logo acima desta linha
ALTER TABLE Pedidos_Viagens_cliente ADD CONSTRAINT fk_Pedidos_Viagens_servico FOREIGN KEY (cod_servico) REFERENCES Servicos(cod_servico);  -- alteraÃ§ao a tabela Itenerarios_viagem para atribuir uma chave estangeira da tebla criada logo acima desta linha
ALTER TABLE Pedidos_Viagens_cliente ADD CONSTRAINT fk_Pedidos_Viagens_cliente FOREIGN KEY (nr_idCivil_Cliente) REFERENCES clientes(nr_idCivil);


CREATE TABLE pedidos_cancelados(
   cod_cancelamento int,
   cod_pedido Number(4),
   tempo_cancelamento_minutos int ,
   custo_cancelamento_final float,
   
  
     
   CONSTRAINT unique_pedidos_cancelados UNIQUE  (cod_cancelamento),
   CONSTRAINT pk_pedidos_cancelados Primary KEY (cod_pedido) 
   
);  
ALTER TABLE pedidos_cancelados ADD CONSTRAINT fk_pedidos_cancelados FOREIGN KEY (cod_pedido) REFERENCES Pedidos_Viagens_cliente(cod_pedido); 



CREATE TABLE Viagens(
   nr_viagem NUMBER(4),
   cod_pedido Number(4),
   local_inicio varchar2(55),
   duracao float,
   tempo_atraso_minutos float check (tempo_atraso_minutos between 0 and 120),
   
   
  
   
    
   CONSTRAINT pk_Viagens Primary KEY (nr_viagem)
   
);  


ALTER TABLE Viagens ADD CONSTRAINT fk_Viagens FOREIGN KEY (cod_pedido) REFERENCES pedidos_viagens_cliente(cod_pedido);  



CREATE TABLE Pontos_Turisticos(
   codigo_pt NUMBER(4),
   nome varchar2(55),
   tipo varchar2(2) CHECK (tipo='M' OR tipo='MU'OR tipo='PN'OR tipo='MI' ),
   
   
    
   CONSTRAINT pk_pontos_turisticos Primary KEY (codigo_pt)
   
);  




CREATE TABLE pontos_visitados(
   nr_viagem NUMBER(4),
   codigo_pt NUMBER(4),
   hora_passagem TIMESTAMP,
   
    
   CONSTRAINT pk_pontos_visitados Primary KEY (nr_viagem, codigo_pt)
   
);  

ALTER TABLE pontos_visitados ADD CONSTRAINT fk_pontos_visitados_pt FOREIGN KEY (codigo_pt) REFERENCES Pontos_Turisticos(codigo_pt);   
ALTER TABLE pontos_visitados ADD CONSTRAINT fk_pontos_visitados_nr FOREIGN KEY (nr_viagem) REFERENCES viagens(nr_viagem);   




CREATE TABLE recibos(
   nr_recibo NUMBER(4),
   nr_idCivil_Condutor   NUMBER(9),
   data_pagamento date,
   
    
   CONSTRAINT recibos Primary KEY (nr_recibo)
   
);  

ALTER TABLE recibos ADD CONSTRAINT fk_recibos FOREIGN KEY (nr_idCivil_Condutor) REFERENCES Condutores(nr_idCivil);   


CREATE TABLE linha_recibos(
   nr_recibo NUMBER(4),
   nr_viagem NUMBER(4),
   percentagem_comissao float,
   percentagem_comissao_supervisor float,
   cod_servico int,
   custo_viagem float,
   CONSTRAINT linha_recibos Primary KEY (nr_recibo,nr_viagem)
   
);  

ALTER TABLE linha_recibos ADD CONSTRAINT fk_linha_recibos_nr_recibo FOREIGN KEY (nr_recibo) REFERENCES recibos(nr_recibo);  
ALTER TABLE linha_recibos ADD CONSTRAINT fk_linha_recibos_nr_viagem FOREIGN KEY (nr_viagem) REFERENCES viagens(nr_viagem);   
ALTER TABLE linha_recibos ADD CONSTRAINT fk_linha_recibos_cod_servico FOREIGN KEY (cod_servico) REFERENCES servicos(cod_servico);  

CREATE TABLE facturas(  --relaçao que uma viagem pode ter 0 ou 1 factura  (durante a viagem nao ha fatura, so no fim)
    nr_viagem Number(4),
    cod_factura number(4),
    CONSTRAINT pk_facturas PRIMARY KEY (nr_viagem),
    CONSTRAINT unique_cod_factura UNIQUE (cod_factura)
    );
ALTER TABLE facturas ADD CONSTRAINT fk_facturas FOREIGN KEY (nr_viagem) REFERENCES viagens(nr_viagem);   


