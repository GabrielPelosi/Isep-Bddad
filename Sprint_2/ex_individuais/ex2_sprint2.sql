
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
