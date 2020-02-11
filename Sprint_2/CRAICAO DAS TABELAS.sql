Drop TABLE resumos_veiculos CASCADE CONSTRAINTS PURGE;
DROP TABLE Condutores CASCADE CONSTRAINTS PURGE;
DROP TABLE custos_servicos CASCADE CONSTRAINTS PURGE;
DROP TABLE pedidos_viagens CASCADE CONSTRAINTS PURGE;
DROP TABLE itinerarios_viagens CASCADE CONSTRAINTS PURGE;

DROP TABLE pontos_turisticos CASCADE CONSTRAINTS PURGE;
DROP TABLE servicos CASCADE CONSTRAINTS PURGE;
DROP TABLE veiculos CASCADE CONSTRAINTS PURGE;
DROP TABLE veiculos_condutores CASCADE CONSTRAINTS PURGE;
DROP TABLE viagens CASCADE CONSTRAINTS PURGE;

CREATE TABLE Condutores(
    nr_idCivil   NUMBER(9),
    nr_idCivil_supervisor NUMBER(9),
    nome VARCHAR(40),
    data_nascimento DATE,
    nr_carta_conducao NUMBER(9) CONSTRAINT nr_carta_conducaoC UNIQUE,
    data_validade_carta_conducao DATE,
    CONSTRAINT pk_nr_idCivil PRIMARY KEY (nr_idCivil)
    
    );
ALTER TABLE condutores ADD CONSTRAINT Condutores_fk_nr_idCivil_supervisor FOREIGN KEY (nr_idCivil_supervisor) REFERENCES Condutores(nr_idCivil);



CREATE TABLE Veiculos(
  matricula char(8),
    marca VARCHAR2(55) ,
   modelo VARCHAR2(55),
     nr_chassis int UNIQUE,
    
    data_MATRICULA DATE,
    CONSTRAINT matricula_pk PRIMARY KEY (matricula)
);


CREATE TABLE servicos(
  
    cod_servico NUMBER(3) ,
   descricao VARCHAR2(55),
   CONSTRAINT cod_servico_pk PRIMARY KEY (cod_servico)
     
);
    
    
  
CREATE TABLE custos_servicos(
  
    cod_servico int  ,
   data_inicio_custo date,
   data_fim_custo float,
   preco_base float not null,
   custo_min float,
   custo_km float,
   taxa_iva float(1),
   temp_maximo_espera_minutos int,
   custo_espera_minuto float,
   custo_cancelamento_pedido float,
   CONSTRAINT pk_custos_servico_data Primary KEY (cod_servico, data_inicio_custo)
   
   
     
);  

ALTER TABLE custos_servicos ADD CONSTRAINT fk_custos_servico FOREIGN KEY (cod_servico) REFERENCES servicos(cod_servico);   -- É MELHOR DEFENIR AS CHAVES ESTRANGEIRAS NUM ALTER TABLE PARA NAO FICAR DEPENDENTE DA CRIAÇAO DE OUTRAS TABELAS,



CREATE TABLE veiculos_condutores(
   data_inicio DATE,
   nr_idCivil int,
   matricula char(8) ,
   
   data_fim DATE,
    
   CONSTRAINT pk_veiculos_condutores Primary KEY (data_inicio, nr_idCivil, matricula)
   
);  

ALTER TABLE veiculos_condutores ADD CONSTRAINT fk_veiculos_condutores2 FOREIGN KEY (nr_idCivil) REFERENCES condutores(nr_idCivil); 
ALTER TABLE veiculos_condutores ADD CONSTRAINT fk_veiculos_condutores FOREIGN KEY (matricula) REFERENCES veiculos(matricula);   

    
CREATE TABLE Pontos_Turisticos(
   cod_ponto_turistico NUMBER(5),
   nome_ponto_turistico varchar2(55),
   tipo_ponto_turistico varchar2(2) CHECK (tipo_ponto_turistico='M' OR tipo_ponto_turistico='MU'OR tipo_ponto_turistico='PN'OR tipo_ponto_turistico='MI' ),
   
   
    
   CONSTRAINT pk_pontos_turisticos Primary KEY (cod_ponto_turistico)
   
);  


CREATE TABLE Itinerarios_Viagens(
   cod_viagem NUMBER(9),
   cod_ponto_turistico NUMBER(5),
   hora_passagem TIMESTAMP,
   
    
   CONSTRAINT pk_itinerarios_Viagens Primary KEY (cod_viagem, cod_ponto_turistico)
   
);  

ALTER TABLE Itinerarios_Viagens ADD CONSTRAINT fk_Itinerarios_Viagens2 FOREIGN KEY (cod_ponto_turistico) REFERENCES Pontos_Turisticos(cod_ponto_turistico);   


CREATE TABLE Viagens(
   cod_viagem NUMBER(9),
   cod_pedido Number(4),
   atraso_passageiro_minutos float check (atraso_passageiro_minutos between 0 and 120), -- assumo que nao se atrasa em mais que duas horas.
   duracao_minutos float,
  
   
    
   CONSTRAINT pk_Viagens Primary KEY (cod_viagem)
   
);  


ALTER TABLE Itinerarios_Viagens ADD CONSTRAINT fk_Itenerarios_Viagens FOREIGN KEY (cod_viagem) REFERENCES viagens(cod_viagem);  -- alteraçao a tabela Itenerarios_viagem para atribuir uma chave estangeira da tebla criada logo acima desta linha





CREATE TABLE Pedidos_Viagens(
   cod_pedido Number(4),
   matricula char(8),
   nr_idCivil int,
   data_inicio DATE,
   cod_servico int,
   data_hora_pedido TIMESTAMP,
   data_hora_recolha_passageiro TIMESTAMP,
   distancia_km float,
   cancelado char(3) check (cancelado = 'sim' OR cancelado = 'nao'),
   
   CONSTRAINT pk_Pedidos_Viagens Primary KEY (cod_pedido),
   CHECK(data_hora_pedido < data_hora_recolha_passageiro)
   
);  

ALTER TABLE Pedidos_Viagens ADD CONSTRAINT fk_Pedidos_Viagens FOREIGN KEY (data_inicio, nr_idCivil, matricula) REFERENCES Veiculos_condutores(data_inicio, nr_idCivil, matricula);  -- alteraçao a tabela Itenerarios_viagem para atribuir uma chave estangeira da tebla criada logo acima desta linha

ALTER TABLE Pedidos_Viagens ADD CONSTRAINT fk_Pedidos_Viagens4 FOREIGN KEY (cod_servico) REFERENCES Servicos(cod_servico);  -- alteraçao a tabela Itenerarios_viagem para atribuir uma chave estangeira da tebla criada logo acima desta linha

CREATE TABLE Resumos_Veiculos (
    resumos_veiculos_instante       TimeStamp                CONSTRAINT nn_resumos_veiculos_instante                     NOT NULL,
    resumos_veiculos_data_inicio    DATE                    CONSTRAINT nn_resumos_veiculos_data_inicio                  NOT NULL,
    resumos_veiculos_data_fim       DATE                    CONSTRAINT nn_resumos_veiculos_data_fim                     NOT NULL,
    resumos_veiculos_matricula      VARCHAR2(8)             CONSTRAINT nn_resumos_veiculos_matricula                    NOT NULL,
    resumos_veiculos_nr_viagens     INTEGER                 CONSTRAINT ck_resumos_veiculos_nr_viagens                   CHECK ( resumos_veiculos_nr_viagens > 0 ),
    resumos_veiculos_soma_km        INTEGER                 CONSTRAINT ck_resumos_veiculos_soma_km                      CHECK ( resumos_veiculos_soma_km > 0 ),
    resumos_veiculos_soma_duracao   INTEGER                 CONSTRAINT ck_resumos_veiculos_soma_duracao                 CHECK ( resumos_veiculos_soma_duracao > 0 ),
    CONSTRAINT pk_resumos_veiculos_data_inicio_data_fim_matricula PRIMARY KEY (
    resumos_veiculos_matricula, resumos_veiculos_data_inicio, resumos_veiculos_data_fim ));

ALTER TABLE Resumos_Veiculos ADD CONSTRAINT ck_resumos_veiculos_data_fim CHECK (resumos_veiculos_data_fim > resumos_veiculos_data_inicio );