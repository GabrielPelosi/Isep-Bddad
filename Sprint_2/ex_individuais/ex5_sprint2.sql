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

