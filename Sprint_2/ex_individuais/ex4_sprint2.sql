--SO PARA VERIFICAR SE ATUALIZOU O CUSTO
create or replace view view_total_ex4 as
select cod_servico as  "Cod_servico", NVL((select sum( cs.preco_base+(cs.custo_min * v.duracao_minutos)+(cs.custo_km*pv.distancia_km)
+(cs.custo_espera_minuto*v.atraso_passageiro_minutos)+ (cs.preco_base+(cs.custo_min * v.duracao_minutos)+(cs.custo_km*pv.distancia_km)
+(cs.custo_espera_minuto*v.atraso_passageiro_minutos))*cs.taxa_iva)
from  custos_servicos cs, pedidos_viagens pv, viagens v
where EXTRACT(YEAR FROM pv.data_hora_pedido)BETWEEN  EXTRACT(YEAR FROM(TO_DATE('4/10/2018', 'dd/mm/yyyy'))) and  EXTRACT(YEAR FROM(TO_DATE('4/10/2019', 'dd/mm/yyyy')))  and  pv.cod_servico = a.cod_servico and cs.cod_servico=a.cod_servico and v.cod_pedido=pv.cod_pedido and pv.data_hora_pedido>= sysdate - interval '1' year), 0 ) as "custo_total"
from servicos a
where rownum<=1
order by "custo_total" desc;


select * from view_total_ex4;

select * from custos_servicos;
-----

--ex4----

Create OR REPlACE PROCEDURE procAtualizarCustosServico(data_up in DATE, percen in number) AS
custo Number;
data_ultimo_update DATE;
upd_per int;
cod_servico_maior_vol_neg servicos.cod_servico%type ;
data_inicio_ser_maior_vel custos_servicos.data_inicio_custo%type;
time_exception EXCEPTION;
preco_base_up custos_servicos.preco_base%type;
custo_minuto_up custos_servicos.custo_min%type;
custo_espera_minuto_up custos_servicos.custo_espera_minuto%type;
custo_cancelamento_pedido_up custos_servicos.custo_cancelamento_pedido%type;

 
 begin

 
select  cod_servico as  "Cod_servico",   NVL((select sum( cs.preco_base+(cs.custo_min * v.duracao_minutos)+(cs.custo_km*pv.distancia_km)
+(cs.custo_espera_minuto*v.atraso_passageiro_minutos)+ (cs.preco_base+(cs.custo_min * v.duracao_minutos)+(cs.custo_km*pv.distancia_km)
+(cs.custo_espera_minuto*v.atraso_passageiro_minutos))*cs.taxa_iva)
from  custos_servicos cs, pedidos_viagens pv, viagens v
where  EXTRACT(YEAR FROM pv.data_hora_pedido)BETWEEN  EXTRACT(YEAR FROM(data_up)) and  (EXTRACT(YEAR FROM(data_up))-1) and pv.cod_servico = a.cod_servico and cs.cod_servico=a.cod_servico and v.cod_pedido=pv.cod_pedido and pv.data_hora_pedido>= sysdate - interval '1' year), 0 ) as "custo_total" into  cod_servico_maior_vol_neg,custo
from servicos a
where rownum<=1 
order by "custo_total" desc;

select cs.data_inicio_custo into data_ultimo_update from custos_servicos cs, servicos s where cs.cod_servico = s.cod_servico and cod_servico_maior_vol_neg=s.cod_servico ;



if MONTHS_BETWEEN (current_date, data_ultimo_update ) < 6 then
raise time_exception;
else
 
  update Custos_servicos
 SET preco_base=preco_base+((percen/100)*preco_base), custo_min=custo_min+((percen/100)*custo_min), custo_espera_minuto=custo_espera_minuto+(custo_espera_minuto*(percen/100)), custo_cancelamento_pedido=custo_cancelamento_pedido+(custo_cancelamento_pedido*(percen/100)), data_inicio_custo=(CURRENT_DATE)
 where  cod_servico= cod_servico_maior_vol_neg; 

select preco_base, custo_min,custo_espera_minuto,custo_cancelamento_pedido into preco_base_up, custo_minuto_up,custo_espera_minuto_up,custo_cancelamento_pedido_up    from Custos_servicos cs where cs.cod_servico=cod_servico_maior_vol_neg ;

 dbms_output.put_line('Preços atualizados :--preco base--'||preco_base_up||'--custo_minuto--'||custo_minuto_up||'--custo_espera_minuto--'||custo_espera_minuto_up||'--custo_cancelamento_pedido--'||custo_cancelamento_pedido_up );

end if;

EXCEPTION 
    when  time_exception THEN 
  
      		dbms_output.put_line('NAO PODE SER ACTUALIZADO VISTO QUE FOI ACTUALIZADO Á MENOS DE 6 MESES');
 end;
 
 
 
 --execuçao--
 set serveroutput on;
 Declare
    data_s DATE  := TO_DATE('4/10/2019', 'dd/mm/yyyy');
    percentagem number;
Begin
   
    percentagem := 10;
   procAtualizarCustosServico(data_s, percentagem);
end;   
