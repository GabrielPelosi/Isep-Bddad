CREATE OR REPLACE TRIGGER TGRCONDUTORESIMPEDIRSUPERVISORES 
BEFORE INSERT OR UPDATE ON CONDUTORES 
FOR EACH ROW
DECLARE
nasc_supervisionado int;
nasc_supervisor int;
viagens_supervisionado int;
viagens_supervisor int;
idade_nao_superior_5 exception;
nao_tem_mais_viagens exception;
BEGIN
    if :new.nr_idcivil_supervisor is not null then
		if inserting or :old.nr_idcivil <> :new.nr_id_civil or :old.nr_idcivil_supervisor <> :new.nr_idcivil_supervisor then
		
			select extract(year from data_nascimento) into nasc_supervisionado from Pessoas where nr_idcivil = :new.nr_idcivil;
			select extract(year from data_nascimento) into nasc_supervisor from Pessoas where nr_idcivil = :new.nr_idcivil_supervisor;
        
			
			if nasc_supervisor - nasc_supervisionado < 5 then
				raise idade_nao_superior_5;
			end if;
			
			select count(*) into viagens_supervisionado from Pedido_viagem_cliente where nr_idcivil_Condutor = :new.nr_idcivil;
			select count(*) into viagens_supervisor from Pedido_viagem_cliente where nr_idcivil_Condutor = :new.nr_idcivil_supervisor;
			
			if viagens_supervisionado >= viagens_supervisor then
				raise nao_tem_mais_viagens;
			end if;
		end if;
    end if;
    exception
        when idade_nao_superior_5 then
            if updating then
                raise_application_error(-20002,'Erro ao atualizar: O supervisor nao é pelo menos 5 anos mais velho');
            else
                raise_application_error(-20003,'Erro ao inserir: O supervisor nao é pelo menos 5 anos mais velho');
            end if;    
        when nao_tem_mais_viagens then
            if updating then 
                raise_application_error(-20004,'Erro ao atualizar: O supervisor nao mais viagens do que o supervisionado');
            else 
                raise_application_error(-20005,'Erro ao inserir: O supervisor nao mais viagens do que o supervisionado');
            end if;
END;

insert into Condutores values(12345678, 22222222, 'rua da primavera' , '1234-123' , 12345, '2010-01-01');
insert into Condutores values(12335658, 22224212, 'rua do inverno' , '1234-123' , 12345, '2010-01-01');
update Condutores set nr_idcivil_supervisor = 22224212 where nr_idcivil = 12345678; 


