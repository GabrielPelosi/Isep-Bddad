--pl1

--4. Criar um script com código PL/SQL para implementar uma função, designada funcMenorIdadeClientes, para
--retornar a menor das idades de clientes. Caso não existam datas de nascimento, a função deve retornar
--o valor NULL. Testar adequadamente a função implementada, através de blocos anónimos. 

--not done

CREATE OR REPLACE FUNCTION funcMenorIdadeClientes return clientes.data_nascimento%TYPE AS

    menor_idade clientes.data_nascimento%TYPE;
    
BEGIN

    Select clientes.data_nascimento into menor_idade
    FROM Clientes;
    
    return menor_idade;
    
END;

--5
set SERVEROUTPUT ON;
create or replace function funcTemLivrosEditora (identificador Editoras.id_editora%TYPE) return boolean as 
    stock_Livro Edicoes_livros.stock%TYPE;   
Begin 
    Select sum(stock) into stock_livro
    from edicoes_livros where id_editora = identificador;
    
    IF stock_livro IS NULL THEN
    return NULL;
    END IF;
    
    IF stock_livro > 0 THEN
        return true;
    ELSE
        return false;
    END IF;
    
EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('ID invalido');
    
END funcTemLivrosEditora;
--execucao 5
Begin 
if funcTemLivrosEditora(0) then
    DBMS_OUTPUT.PUT_LINE('Tem stock');
else
    DBMS_OUTPUT.PUT_LINE('Nao tem stock');
end if;
END;
--6
set serveroutput on;
create or replace function funcClienteInfo(nome_cliente Clientes.nome%TYPE) return clientes%rowtype is
    cursor info_cli(nome Clientes.nome%TYPE) is
         select * from clientes where nome_cliente LIKE clientes.nome;
         informacao info_cli%rowtype;
    
begin
    open info_cli(nome_cliente);
    loop 
        fetch  info_cli into informacao;
        exit when info_cli%notfound;
    end loop;
    close info_cli;
    return informacao;
end;
--execucao 6
Declare
    outt clientes%rowtype;
Begin 
outt := funcClienteInfo('Jose');
DBMS_OUTPUT.PUT_LINE(outt.nome || ' '  || 
outt.nif_cliente ||' '|| outt.cod_postal ||' '|| outt.data_nascimento ||' '|| outt.morada ||' '|| outt.nr_telemovel);
END;

--7
create or replace function funcStockAnoEditora (identificador_editora Edicoes_livros.id_editora%TYPE,
ano_da_edicao Edicoes_livros.ano_edicao%TYPE default 2019)
return edicoes_livros.stock%TYPE as
        stock_ano Edicoes_livros.stock%TYPE;       
Begin
    Select stock into stock_ano
    from Edicoes_livros edl
    where edl.id_editora=identificador_editora 
    AND ano_da_edicao=edl.ano_edicao;
Exception
    When no_data_found then
        DBMS_OUTPUT.PUT_LINE('dados não encontrados, mude os parametros');
        return NULL;
return stock_ano;
end funcStockAnoEditora;
--execucao do 7      
Declare
    stock1 Edicoes_livros.stock%TYPE;
Begin
    stock1 := funcStockAnoEditora(1800);
    DBMS_OUTPUT.PUT_LINE(stock1);
    
end;
--8
create or replace function funcPrecoVenda(num_venda vendas.nr_venda%TYPE) return precos_edicoes_livros.preco%TYPE as
    preco_venda precos_edicoes_livros.preco%TYPE;
    identificador_livro vendas.isbn%TYPE;
    
Begin
        select isbn into identificador_livro
        from vendas where nr_venda=num_venda;
        
        select sum(preco) into preco_venda
        from precos_edicoes_livros
        where isbn = identificador_livro;
    return preco_venda;   
Exception
    when no_data_found Then
        dbms_output.put_line('dados introduzidos invalidos');
        return NULL;
end;

--exec8
Declare

    preco precos_edicoes_livros.preco%TYPE;
Begin
   preco:= funcPrecoVenda(536675675);
    dbms_output.put_line(preco);
end;




