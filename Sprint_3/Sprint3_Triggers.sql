set serveroutput on;

--3. PLSQL - Triggers:

--3.1. Implemente um trigger designado trgAtribuicaoPedido, que atribua a um pedido um veículo e um
--condutor.




--3.2. Implemente um trigger designado trgCalculoCustoCancelamento, que permita calcular e regista o
--custo de cancelamento de um pedido.




--3.3. Implementar um trigger, designado trgCondutoresImpedirSupervisores, que só permita registar
--supervisores que tenham idade superior a 5 anos e mais viagens realizadas, do que os respetivos
--condutores supervisionados. As mensagens de erro devem permitir identificar a operação DML envolvida.





--3.4. Implemente um trigger designado trgCondutoresVeiculosAssociacoes, que impeça sobreposições
--temporais nas associações de veículos a condutores.
create or replace TRIGGER trgCondutoresVeiculosAssociacoes 
BEFORE INSERT OR UPDATE ON veiculos_condutores for each row
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