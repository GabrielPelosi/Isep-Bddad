set serveroutput on;

--1)1. Implemente uma função, denominada funcTopServico, que retorne um cursor que contenha,
--para um dado tipo de serviço e período, o id dos n condutores com os maiores valores de custos
--totais das viagens. A função recebe como parâmetros o tipo de serviço, o período e o n. Caso um
--dos parâmetros seja inválido, a função deve retornar o valor NULL.
--FORMULA CUSTO VIAGEM. PRIMEIRA ITERACAO:  
--Custo_Viagem = preco_base + (custo_minuto * duracao_minutos) + (custo_km * distancia_km)
--+ (custo_espera_minuto * atraso_passageiro_minutos) + valor_IVA   

--teste query do ex 1 AAPGAR--

--SELECT DISTINCT
--   nr_idcivil
--FROM
--    condutores c
--WHERE (
--        select distinct sum( cs.preco_base+(cs.custo_min * v.duracao_minutos)+(cs.custo_km*pv.distancia_km)
--                    +(cs.custo_espera_minuto*v.atraso_passageiro_minutos)+ (cs.preco_base+(cs.custo_min * v.duracao_minutos)+(cs.custo_km*pv.distancia_km)
--                    +(cs.custo_espera_minuto*v.atraso_passageiro_minutos))*cs.taxa_iva)  as "custo_total_b"
--                 from  custos_servicos cs, pedidos_viagens pv, viagens v, servicos s 
--                 where s.cod_servico = 1 
--                 AND pv.data_inicio BETWEEN '05/07/08' AND '15/06/07'
--                 order by "custo_total_b" desc
--                 fetch first row only
--        )IS NOT NULL and rownum <= 4;           
        
        SELECT DISTINCT
            c.nr_idcivil
        FROM
            condutores c, custos_servicos cs, pedidos_viagens pv, viagens v, servicos s 
        WHERE  s.cod_servico = 4
        AND (pv.data_inicio BETWEEN '05/07/08' AND '15/06/07' )
        group by c.nr_idcivil
        order by sum(
            Case when pv.cancelado = 'nao' then
             cs.preco_base+(cs.custo_min * v.duracao_minutos)+(cs.custo_km*pv.distancia_km)
                    +(cs.custo_espera_minuto*v.atraso_passageiro_minutos)+ (cs.preco_base+(cs.custo_min * v.duracao_minutos)+(cs.custo_km*pv.distancia_km)
                    +(cs.custo_espera_minuto*v.atraso_passageiro_minutos))*cs.taxa_iva
            ELSE
                cs.custo_cancelamento_pedido
            END    
                ) desc
             fetch first 3 rows only; 
             
--teste--                                                   
create or replace function funcTopServico(tipo_servico servicos.cod_servico%TYPE, periodoI date, periodoF date, n int) 
return SYS_REFCURSOR as
    id_cur SYS_REFCURSOR;
begin 
    --exception check variables-- 
    IF tipo_servico IS NULL OR periodoI IS NULL OR periodoF IS NULL THEN RAISE no_data_found; 
    END IF;
    IF n <= 0 THEN RAISE no_data_found; END IF;
    IF periodoF < periodoI THEN RAISE no_data_found; END IF; 
    -------------------
        OPEN id_cur FOR
        SELECT DISTINCT
            c.nr_idcivil
        FROM
            condutores c, custos_servicos cs, pedidos_viagens pv, viagens v, servicos s 
        WHERE  s.cod_servico = tipo_servico
        AND (pv.data_inicio BETWEEN periodoI AND periodoF )
        GROUP BY c.nr_idcivil
        ORDER BY sum(
            CASE 
                WHEN pv.cancelado = 'nao' THEN
                     cs.preco_base+(cs.custo_min * v.duracao_minutos)+(cs.custo_km*pv.distancia_km)
                        +(cs.custo_espera_minuto*v.atraso_passageiro_minutos)
                        + (cs.preco_base+(cs.custo_min * v.duracao_minutos)+(cs.custo_km*pv.distancia_km)
                        +(cs.custo_espera_minuto*v.atraso_passageiro_minutos))*cs.taxa_iva
                ELSE
                    cs.custo_cancelamento_pedido
            END
            )    
        fetch first n rows only;        
        return id_cur;      
        EXCEPTION WHEN no_data_found THEN return NULL;       
end funcTopServico;

declare
    id_cur SYS_REFCURSOR := funcTopServico(1,to_date('05/07/08'), to_date('15/06/07'), 3);
    nr veiculos_condutores.nr_idcivil%type;
begin
    IF id_cur IS NULL
    THEN 
        DBMS_OUTPUT.PUT_LINE('Dados inválidos!');
    
    ELSE
        LOOP
            FETCH id_cur INTO nr;
             EXIT WHEN id_cur%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('resultado = ' ||nr);
         END LOOP;
    
    END IF;
end;

--2. Implemente uma função, denominada funcSobreposicoesVeiculosCondutores, que retorne um
--valor booleano no caso de existirem sobreposições temporais nas associações de veículos a
--condutores.

create or replace function funcSobreposicoesVeiculosCondutores return boolean  as 
    bool boolean;
    inicio date;
    fim date;
    matricula_t veiculos_condutores.matricula%type;
    matricula_sobre veiculos_condutores.matricula%type;
    cursor cursors is
        select distinct vc.matricula, vc.data_inicio, vc.data_fim from veiculos_condutores vc;
begin
    open cursors;
    --matricula_sobre := 'AA-AA-AA';
    bool :=FALSE;
loop
    fetch cursors into matricula_t, inicio, fim;
  
  select count(matricula) into matricula_sobre 
  from veiculos_condutores
  where matricula=matricula_t 
  and data_inicio BETWEEN inicio and fim or data_fim BETWEEN inicio and fim;
        if matricula_sobre >1  then
            bool:= true;
        end if;
    exit when cursors%notfound;
end loop;

  return bool;
end;
--execucao 2
set serveroutput on;
Declare
    bollex BOOLEAN;
Begin
    bollex := funcSobreposicoesVeiculosCondutores();
    IF bollex = true then
    DBMS_OUTPUT.PUT_LINE('ha sobreposiçao');
    else 
    DBMS_OUTPUT.PUT_LINE('nao ha sobreposiçao');
    end if;
end;   



--3. Implemente uma função, denominada funcObterInfoSemanalVeiculos, que retorna um cursor
--com informação relativa a todos os veículos. A função recebe como parâmetro um valor de uma
--data e retorna um cursor com a seguinte informação: matrícula, data de início, data de fim,
--número de viagens, número de quilómetros e tempo gasto em viagens. Os valores de número de
--viagens, número de quilómetros e tempo gasto em viagens são relativos à semana, de segunda a
--domingo, à qual a data recebida por parâmetro pertence, ou seja, está compreendida entre os
--valores de data de início e data de fim. A função tem que tirar o máximo proveito do código SQL.

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


--Procedimentos:
--4. Implemente um procedimento denominado procAtualizarCustosServico, que permita atualizar
--em X% o valor do preço_base, do custo_minuto, do custo_espera e do custo_cancelamento do
--serviço que tenha tido o volume de negócio mais elevado. O procedimento recebe como
--parâmetros de entrada uma data para atualização e o valor da percentagem a atualizar (X%).
--Caso não seja passada nenhuma data para atualização, o procedimento deve considerar a data
--do sistema. Se se entender necessário podem ser realizadas alterações ao modelo relacional.
--Observações:
--§ O período de volume de negócio a ser considerado para cada serviço é o dos 12 meses
--anteriores;
--§ Só os serviços que foram atualizados há mais de 6 meses é que podem ser atualizados;
--§ Caso o serviço tenha sido atualizado num período inferior a 6 meses, deve-se notificar essa
--ocorrência, assim como deverão ser notificados os novos preços em vigor, caso o serviço
--tenha sido atualizado.

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


--verificaçao--
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


--5. Implemente um procedimento denominado procDetetarAssociacoes, que permita detetar e
--corrigir, as associações de condutores a veículos que se sobrepõem temporalmente.
--Considere que os atributos data_inicio e data_fim são datas e, que os intervalos são fechados na
--data de início e abertos na data de fim ( [data_inicio, data_fim[ ).
--A correção consiste em analisar as sobreposições, por matrícula e por condutor, tendo em
--consideração a seguinte lógica:
--§ Processar matrículas, e para cada registo que tenha de ser modificado, colocar a data de
--fim igual à data inicial do período seguinte;
--§ Processar condutores, e para cada registo que tenha de ser modificado, colocar a data de
--fim igual à data inicial do período seguinte;
--§ Se após o processamento não tiver sido possível corrigir todas as sobreposições, então deve
--abortar o processamento gerando uma exceção.
--Observação:
--Para testar o procedimento deverá usar os dados disponibilizados no ponto 2 do anexo A. 
Create OR REPlACE PROCEDURE procDetetarAssociacoes AS
inicio date;
fim date;
matricula_t veiculos_condutores.matricula%type;
matricula_sobre veiculos_condutores.matricula%type;
correction_not_sucesfull EXCEPTION;
dummy boolean;

cursor cursors is
 select  vc.matricula as m, vc.data_inicio as di, vc.data_fim as df from veiculos_condutores vc;
 cursor cursors2 is
 select  vc.matricula from veiculos_condutores vc where   vc.data_inicio BETWEEN inicio and fim or vc.data_fim BETWEEN inicio  and fim;
begin
open cursors;



loop
fetch cursors into matricula_t, inicio, fim;
  

open cursors2;
 loop 


  fetch cursors2 into matricula_sobre ;
  update Veiculos_condutores
 SET data_fim=data_inicio where matricula = matricula_sobre;
 exit when cursors2%notfound;
end loop;


  exit when cursors%notfound;
  
  close cursors2;
end loop;

dummy := funcSobreposicoesVeiculosCondutores();
if  dummy = true then
raise correction_not_sucesfull;
end if;
EXCEPTION 
    when  correction_not_sucesfull THEN 

      		dbms_output.put_line('nao foi possivel resolver a sobreposicao');

end;
--execuçao 5
set SERVEROUTPUT ON
execute procDetetarAssociacoes();

select * from veiculos_condutores;





--6. Implemente um procedimento em PL/SQL, designado procGuardarInformacaoSemanal, que
--insira na tabela ResumosVeiculos a informação retornada pela função
--funcObterInfoSemanalVeiculos e também escreva no ecrã um resumo da informação.
--O procedimento recebe como parâmetro o valor de uma data e insere na tabela
--ResumosVeiculos a informação retornada pela função funcObterInfoSemanalVeiculos,
--acrescida do instante temporal em quem a mesma foi inserida (Figura 1). Tenha em consideração
--que, para efeitos de teste, os registos da tabela ResumosVeiculos devem ser manualmente
--eliminados recorrendo, e.g. à instrução de SQL delete.
--No ecrã devem ser escritos os valores das percentagens de veículos que fizeram ou não viagens
--nessa semana, complementados com a lista das matrículas dos veículos associados a cada uma
--delas.
--Observação:
--Podem ser encontradas mais informações, sobre este procedimento, no ponto 3 do anexo A.
create or replace PROCEDURE procGuardarInformacaoSemanal(
	   date_in DATE)     
AS


    curs1 SYS_REFCURSOR;
    CURSOR curs2 is   select matricula, data_inicio, data_fim from veiculos_condutores  ;--fetch first 2 rows only;
     CURSOR curs3 is   select resumos_veiculos_matricula, resumos_veiculos_nr_viagens from resumos_veiculos  ;--fetch first 2 rows only;
    
    ite number;
    counter number;
  
percentagem_v_activos number;
percentagem_v_inactivos number;

    cod_Matricula veiculos.matricula%type;
    cod_Data_Inicio veiculos_condutores.data_inicio%type;
    cod_Data_Fim veiculos_condutores.data_fim%type;
    cod_numero_viagens integer;
    cod_total_distancia integer;
    cod_total_duracao integer;
    
    dummy_nr_viagens number;
BEGIN 
counter := 0;

   curs1 := FUNCOBTERINFOSEMANALVEICULOS(date_in);
        select count(*) into ite from veiculos_condutores;
        OPEN curs2;
        LOOP 
         EXIT WHEN counter =ite;
            FETCH curs2 INTO cod_Matricula, cod_Data_Inicio, cod_Data_Fim;
       
        INSERT INTO resumos_veiculos VALUES (sysdate, cod_Data_Inicio, cod_Data_Fim, cod_Matricula, null, null, null);
        counter := counter+1;
        END LOOP; 
        CLOSE curs2;
        counter := 0;
         LOOP
        FETCH curs1 INTO cod_Matricula, cod_Data_Inicio, cod_Data_Fim, cod_numero_viagens, cod_total_distancia, cod_total_duracao;
        update resumos_veiculos
 SET   resumos_veiculos_nr_viagens = cod_numero_viagens, resumos_veiculos_soma_km=cod_total_distancia,resumos_veiculos_soma_duracao= cod_total_duracao   where resumos_veiculos_data_inicio =  cod_Data_Inicio;
        EXIT WHEN curs1%NOTFOUND; 
        counter := counter+1;
        END LOOP;
        
        percentagem_v_activos := (counter/ite)*100;
        percentagem_v_inactivos := 100-percentagem_v_activos;
        dbms_output.put_line('A percentagem de veiculos que realizaram serviços esta semana é de'||percentagem_v_activos|| 'e dos que nao realizaram é de '|| percentagem_v_inactivos);
        counter :=0;
        
        OPEN curs3;
         LOOP 
         EXIT WHEN counter =ite;
           FETCH curs3 INTO cod_Matricula, dummy_nr_viagens;
           if dummy_nr_viagens != null then
                dbms_output.put_line('o veiculo de matricula' || cod_Matricula|| ' realizou viagens ');
                else
                  dbms_output.put_line('o veiculo de matricula' || cod_Matricula|| ' NAO realizou viagens ');
         end if;
         counter :=counter+1;
         end loop;
         
END;
---execuçao 6--

execute procGuardarInformacaoSemanal( TO_DATE('2/10/2019', 'dd/mm/yyyy'));
select * from resumos_veiculos;