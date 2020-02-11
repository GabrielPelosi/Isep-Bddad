--PL12
set serveroutput on;
--4. Criar um script com código PL/SQL para implementar uma função, designada funcStockMax. A função deve
--retornar o maior stock das edições dos livros da livraria. Testar adequadamente a função implementada,
--através de blocos anónimos.  

create or replace function funcStockMax return edicoes_livros.stock%TYPE as  
    stock_max edicoes_livros.stock%TYPE;   
 Begin
    Select distinct max(stock) into stock_max
    From Edicoes_livros;
    return stock_max;
end funcStockMax;
--exec 4
Declare
    stock_max edicoes_livros.stock%TYPE; 
Begin
    stock_max := funcStockMax;
    DBMS_OUTPUT.PUT_LINE(stock_max);
end;    


--5. Criar um novo script PL/SQL para implementar um procedimento, designado
--procTitulosEdicoesStockMax. O procedimento deve listar os títulos das edições dos livros que têm o
--maior stock. Caso o stock seja zero, deve ser apresentada uma mensagem apropriada, usando o
--mecanismo de exceções. Testar adequadamente o procedimento implementado, através de blocos
--anónimos.

create or replace procedure procTitulosEdicoesStockMax as  
    lista_titulos Livros%ROWTYPE;
    contador NUMBER;
    
    cursor tit_livro_max_stock is
        select titulo from livros
        inner join edicoes_livros on livros.id_livro=edicoes_livros.id_livro
        where stock = funcStockMax;    
    
Begin
    for lista_titulos IN tit_livro_max_stock
    loop
        DBMS_OUTPUT.PUT_LINE(lista_titulos.titulo);
        contador := contador +1;
    end loop;
    
end  procTitulosEdicoesStockMax;

Declare
Begin
procTitulosEdicoesStockMax();
end;

--6. Criar um novo script PL/SQL para implementar uma função, designada funcTitulosAno, para retornar os
--títulos dos livros editados num dado ano. A função deve receber, por parâmetro, o ano e tem de retornar
--um CURSOR do tipo SYS_REFCURSOR. Caso o ano recebido seja inválido, a função tem de retornar o valor
--NULL. Testar adequadamente a função implementada através de blocos anónimos.






--7. Criar um novo script PL/SQL para implementar um procedimento, designado procTitulos. Este
--procedimento deve listar os títulos de livros recebidos, por parâmetro, num CURSOR do tipo
--SYS_REFCURSOR. Se este parâmetro for NULL, o procedimento deve mostrar uma mensagem
--apropriada. Testar adequadamente o procedimento implementado através de blocos anónimos, usando
--a função criada anteriormente (ponto 6).






--8. Criar um novo script PL/SQL para implementar uma função, designada funcAumentarSaldos, para
--adicionar um dado montante ao saldo atual e ao saldo acumulado, dos cartões de clientes com mais de
--10 anos. A função deve receber, por parâmetro, o montante e deve mostrar a quantidade de cartões
--atualizados. Caso o montante recebido seja inválido, a função tem de retornar o valor NULL. Testar
--adequadamente a função implementada, usando blocos anónimos e o comando ROLLBACK para não
--afetar a BD.