create or replace FUNCTION FUNCOBTERINFOSEMANALVEICULOS(dat DATE) RETURN SYS_REFCURSOR AS
  matricula  veiculos.matricula%type;
   dataInicial DATE;
    dataFinal DATE;
    nr_viagens number;
    nr_kilometros number;
    tempo_gasto number;
    
   
   cursors   SYS_REFCURSOR;
 begin
dataInicial := TRUNC(dat, 'iw') ;
dataFinal := TRUNC(dat, 'iw')+ 7 - 1/86400 ;
   
 OPEN cursors for SELECT vc.matricula, vc.data_inicio , vc.data_fim, count(pv.cod_pedido) as numero_viagens ,sum(pv.distancia_km) as distancia_total, sum(v.duracao_minutos) as duracao_viagens  FROM veiculos_condutores vc, pedidos_viagens pv, viagens v where  pv.matricula=vc.matricula and v.cod_pedido=pv.cod_pedido and pv.data_hora_pedido BETWEEN dataInicial and dataFinal group by vc.matricula,  vc.data_inicio,  vc.data_fim;

  RETURN cursors;
END ;

--execucao 3

set serveroutput on;
DECLARE
  cc SYS_REFCURSOR := FUNCOBTERINFOSEMANALVEICULOS(TO_DATE('2/10/2019', 'dd/mm/yyyy'));
  
  ma veiculos_condutores.matricula%type;
  data_i date;
  data_f date;
  n_v number;
  n_k number;
  n_t number;
  
  
BEGIN


    LOOP
        FETCH cc INTO ma, data_i,data_f,n_v,n_k,n_t;
        EXIT WHEN cc%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('resultado = ' || ma ||'  '|| data_i  ||'   '||  data_f||'  '|| n_v ||'   ' || n_k ||'   '|| n_t);
    END LOOP;




END;