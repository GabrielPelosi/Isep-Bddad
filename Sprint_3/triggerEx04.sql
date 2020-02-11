 set serveroutput on;
 
create or replace TRIGGER trgCondutoresVeiculosAssociacoes
BEFORE INSERT OR UPDATE ON veiculos_condutores
for each row
DECLARE
    matricula_sobre number; 
    bool boolean;
    inicio date;
    fim date;
    matricula_t veiculos_condutores.matricula%type;
    sobreposicao_catch exception;
    
    cursor cursors is
            select distinct vc.matricula, vc.data_inicio, vc.data_fim from veiculos_condutores vc;           
BEGIN
    open cursors;
    bool := false;
    
    loop
    fetch cursors into matricula_t, inicio, fim;
      
      select count(matricula) into matricula_sobre 
      from veiculos_condutores
      where matricula=matricula_t 
      and (:new.data_inicio BETWEEN inicio and fim) or (:new.data_fim BETWEEN inicio and fim);
            if matricula_sobre >1  then
                bool:= true;
            end if;
        exit when cursors%notfound;
    end loop;

    if bool = true then
        raise sobreposicao_catch;
    end if;
    
Exception
    WHEN sobreposicao_catch then
        raise_application_error(-20000,'Há sobreposições temporais nas associações de veículos');
end;

INSERT INTO veiculos_condutores(nr_idCivil, matricula, data_inicio, data_fim)
VALUES (00000001, 'AA-AA-AA',TO_DATE('7/11/2019', 'dd/mm/yyyy'),TO_DATE('12/11/2019', 'dd/mm/yyyy')  );


INSERT INTO veiculos_condutores(nr_idCivil, matricula, data_inicio, data_fim)
VALUES (00000002, 'AA-AA-AA',TO_DATE('5/11/2019', 'dd/mm/yyyy'),TO_DATE('12/11/2019', 'dd/mm/yyyy')  );

INSERT INTO veiculos_condutores(nr_idCivil, matricula, data_inicio, data_fim)
VALUES (00000099, 'AA-AA-AA',TO_DATE('13/12/2019', 'dd/mm/yyyy'),TO_DATE('22/12/2019', 'dd/mm/yyyy')  );

INSERT INTO veiculos_condutores(nr_idCivil, matricula, data_inicio, data_fim)
VALUES (00000006, 'AA-AA-AA',TO_DATE('3/11/2019', 'dd/mm/yyyy'),TO_DATE('6/11/2019', 'dd/mm/yyyy')  );








