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