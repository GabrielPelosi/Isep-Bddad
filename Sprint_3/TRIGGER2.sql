create or replace TRIGGER  trgCalculoCustoCancelamento
before INSERT or update ON
pedidos_cancelados
for each row

DECLARE
  cod_servico_atual info_servicos.cod_servico%type;
  perc_atual info_servicos.cancelamento_penalizacao_percentagem%type;
  custo_canc_atual info_servicos.custo_cancelamento%type;
  custo_final float;
  CURSOR cursor_cancelados IS SELECT isv.custo_cancelamento, isv.cod_servico FROM pedidos_viagens_cliente pvc, info_servicos isv WHERE  :new.cod_pedido=pvc.cod_pedido AND pvc.cod_servico=isv.cod_servico;
 
BEGIN
  OPEN cursor_cancelados;
    LOOP
    exit when cursor_cancelados%notfound;
        FETCH cursor_cancelados INTO custo_canc_atual,cod_servico_atual;
        if :new.tempo_cancelamento_minutos < 60 then
            select isv.cancelamento_penalizacao_percentagem into perc_atual FROM info_servicos isv WHERE isv.cod_servico=cod_servico_atual;
            custo_final:=custo_canc_atual+((perc_atual*0.01)*custo_canc_atual);
            :new.custo_cancelamento_final:=custo_final;
            end if;
            
        if :new.tempo_cancelamento_minutos >= 60 then
            :new.custo_cancelamento_final := custo_canc_atual;
        end if;
        end loop;
END;

alter trigger trgCalculoCustoCancelamento enable;
set SERVEROUTPUT ON

INSERT INTO pedidos_cancelados(cod_cancelamento,cod_pedido,tempo_cancelamento_minutos,custo_cancelamento_final)  
VALUES (0003,3,40, NULL);

INSERT INTO pedidos_cancelados(cod_cancelamento,cod_pedido,tempo_cancelamento_minutos,custo_cancelamento_final)  
VALUES (0001,1,45, NULL);

INSERT INTO pedidos_cancelados(cod_cancelamento,cod_pedido,tempo_cancelamento_minutos,custo_cancelamento_final)  
VALUES (0002,2,35, NULL);

INSERT INTO pedidos_cancelados(cod_cancelamento,cod_pedido,tempo_cancelamento_minutos,custo_cancelamento_final)  
VALUES (0004,4,20, NULL);

select * from pedidos_cancelados;