CREATE OR REPLACE TRIGGER  trgAtribuicaoPedido
before INSERT or update  ON
pedidos_viagens_cliente
for each row

declare

numero_pedidos_existentes int;
counter int;

matricula_0 veiculos_condutores.matricula%Type;
condutor_0 veiculos_condutores.nr_idCivil%TYPE;
data_inicio_0 veiculos_condutores.data_inicio%TYPE;

cod_servico_atm int;
data_comeco_atual Pedidos_Viagens_cliente.data_hora_recolha_passageiro%type;
data_fim_atual pedidos_viagens_cliente.data_hora_final_prevista%TYPE;

nr_idCivil_Condutor_m Pedidos_Viagens_cliente.nr_idCivil_Condutor%TYPE;
matricula_m  Pedidos_Viagens_cliente.matricula%TYPE;
data_m  Pedidos_Viagens_cliente.data_inicio%TYPE;



cursor cursors is
      
        ((select  vc.nr_idCivil, vc.matricula, vc.data_inicio from  veiculos_condutores vc where  :new.data_hora_recolha_passageiro between vc.data_inicio and vc.data_fim and :new.data_hora_final_prevista between vc.data_inicio and vc.data_fim
        Minus Select pvc.nr_idCivil_condutor, pvc.matricula,  pvc.data_inicio from pedidos_viagens_cliente pvc where     :new.data_hora_recolha_passageiro  between pvc.data_hora_recolha_passageiro and pvc.data_hora_final_prevista and :new.data_hora_final_prevista between pvc.data_hora_recolha_passageiro and pvc.data_hora_final_prevista)
      
      Minus Select   vc.nr_idCivil, vc.matricula, vc.data_inicio from pedidos_viagens_cliente pvc, veiculos v, veiculos_condutores vc where vc.matricula=v.matricula and  v.matricula=pvc.matricula and  TO_CHAR(:new.data_hora_recolha_passageiro , 'WW') = TO_CHAR(pvc.data_hora_recolha_passageiro , 'WW') and v.km_semanais-pvc.distancia_km < :new.distancia_km);
nao_disponivel exception;

BEGIN



select count(*) into numero_pedidos_existentes from pedidos_viagens_cliente
where rownum = 1;


if numero_pedidos_existentes =0 then 
select vc.matricula, vc.nr_idCivil, vc.data_inicio into matricula_0, condutor_0, data_inicio_0 from veiculos_condutores vc, veiculos v where   v.matricula=vc.matricula and v.km_semanais > :new.distancia_km and :new.data_hora_recolha_passageiro BETWEEN   data_inicio and data_fim and :new.data_hora_final_prevista between data_inicio and data_fim   and ROWNUM =1 group by vc.matricula, vc.nr_idcivil, vc.data_inicio ;
if matricula_0 is not NULL then
numero_pedidos_existentes :=1;
end if;
if numero_pedidos_existentes =0 then raise nao_disponivel;

end if;
  :new.matricula := matricula_0;
  :new.nr_idCivil_condutor := condutor_0;
   :new.data_inicio := data_inicio_0;
  else

counter :=0;

  open cursors;

 
  if cursors%notfound then raise nao_disponivel;
 end if;
loop
 exit when cursors%notfound;
 
   
    fetch cursors into nr_idCivil_Condutor_m, matricula_m, data_m;
   

  :new.matricula := matricula_m;
  :new.nr_idCivil_condutor := nr_idCivil_Condutor_m;
  :new.data_inicio     := data_m;
  if  matricula_m is null or data_m is null  then raise nao_disponivel;
 end if;

  counter := counter+1;

   if counter = 0 then raise nao_disponivel;
     end if;
  


     
   
end loop;

  end if;


EXCEPTION 
    when  nao_disponivel THEN 
    
raise_application_error(-20001,'nao ha veiculos_condutores com disponibilidade');
      		



END;



alter trigger  trgAtribuicaoPedido enable;
set SERVEROUTPUT ON

--deve dar um erro devido aos kilometros excederem
INSERT INTO Pedidos_Viagens_cliente(cod_pedido, matricula, nr_idCivil_Condutor, data_inicio, cod_servico, nr_idCivil_Cliente,data_hora_pedido,data_hora_recolha_passageiro,distancia_km, data_hora_final_prevista ) 
     VALUES (0003,NULL, NULL,  NULL,0002, 00000001,TO_DATE('05-11-2019', 'DD-MM-YYYY'),(TO_DATE('06/11/2019 21:02:44', 'dd/mm/yyyy hh24:mi:ss')), 200, (TO_DATE('07/11/2019 23:02:44', 'dd/mm/yyyy hh24:mi:ss'))  );
     --
     
INSERT INTO Pedidos_Viagens_cliente(cod_pedido, matricula, nr_idCivil_Condutor, data_inicio, cod_servico, nr_idCivil_Cliente,data_hora_pedido,data_hora_recolha_passageiro,distancia_km, data_hora_final_prevista ) 
     VALUES (0001, NULL, NULL,   NULL,0001, 00000001,TO_DATE('10-12-2019', 'DD-MM-YYYY'),(TO_DATE('12/12/2019 21:02:44', 'dd/mm/yyyy hh24:mi:ss')), 20, (TO_DATE('13/12/2019 23:02:44', 'dd/mm/yyyy hh24:mi:ss'))  );
     
 INSERT INTO Pedidos_Viagens_cliente(cod_pedido, matricula, nr_idCivil_Condutor, data_inicio, cod_servico, nr_idCivil_Cliente,data_hora_pedido,data_hora_recolha_passageiro,distancia_km, data_hora_final_prevista ) 
     VALUES (0002,NULL, NULL,  NULL,0003, 00000001,TO_DATE('10-12-2019', 'DD-MM-YYYY'),(TO_DATE('14/12/2019 21:02:44', 'dd/mm/yyyy hh24:mi:ss')), 20, (TO_DATE('15/12/2019 23:02:44', 'dd/mm/yyyy hh24:mi:ss'))  );
  --deve dar um erro porque embora na data de hora recolha passageiro haja veiculos_condutores disponiveis para a recolha do passageiro, a data  em que calha o fim da viagem faz com que nao hajam veiculos_condutores que a possam realizar
 INSERT INTO Pedidos_Viagens_cliente(cod_pedido, matricula, nr_idCivil_Condutor, data_inicio, cod_servico, nr_idCivil_Cliente,data_hora_pedido,data_hora_recolha_passageiro,distancia_km, data_hora_final_prevista ) 
     VALUES (0006,NULL, NULL,  NULL,0004, 00000001,TO_DATE('05-11-2019', 'DD-MM-YYYY'),(TO_DATE('6/11/2019 21:02:44', 'dd/mm/yyyy hh24:mi:ss')), 20, (TO_DATE('6/11/2020 22:02:44', 'dd/mm/yyyy hh24:mi:ss'))  );        
     
     ---inserir esre depois de inserir o 1 e o 2 pois  faz parte da mesma semana e esgoteu os kilometros do carro com matricula aa-aa-ad que é o unico disponivel nessa semana (nao ha sobrepisçao de datas, se os kilometros forem 10 ou menos, a linha é inserida
     INSERT INTO Pedidos_Viagens_cliente(cod_pedido, matricula, nr_idCivil_Condutor, data_inicio, cod_servico, nr_idCivil_Cliente,data_hora_pedido,data_hora_recolha_passageiro,distancia_km, data_hora_final_prevista ) 
     VALUES (0005,NULL, NULL,  NULL,0001, 00000002,TO_DATE('10-12-2019', 'DD-MM-YYYY'),(TO_DATE('16/12/2019 21:02:44', 'dd/mm/yyyy hh24:mi:ss')), 40, (TO_DATE('16/12/2019 23:02:44', 'dd/mm/yyyy hh24:mi:ss'))  );
     
     
 

     select * from Pedidos_Viagens_cliente;