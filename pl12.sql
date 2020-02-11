--PL12
set serveroutput on;
--4. Criar um script com c�digo PL/SQL para implementar uma fun��o, designada funcStockMax. A fun��o deve
--retornar o maior stock das edi��es dos livros da livraria. Testar adequadamente a fun��o implementada,
--atrav�s de blocos an�nimos.  

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
--procTitulosEdicoesStockMax. O procedimento deve listar os t�tulos das edi��es dos livros que t�m o
--maior stock. Caso o stock seja zero, deve ser apresentada uma mensagem apropriada, usando o
--mecanismo de exce��es. Testar adequadamente o procedimento implementado, atrav�s de blocos
--an�nimos.

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

--6. Criar um novo script PL/SQL para implementar uma fun��o, designada funcTitulosAno, para retornar os
--t�tulos dos livros editados num dado ano. A fun��o deve receber, por par�metro, o ano e tem de retornar
--um CURSOR do tipo SYS_REFCURSOR. Caso o ano recebido seja inv�lido, a fun��o tem de retornar o valor
--NULL. Testar adequadamente a fun��o implementada atrav�s de blocos an�nimos.






--7. Criar um novo script PL/SQL para implementar um procedimento, designado procTitulos. Este
--procedimento deve listar os t�tulos de livros recebidos, por par�metro, num CURSOR do tipo
--SYS_REFCURSOR. Se este par�metro for NULL, o procedimento deve mostrar uma mensagem
--apropriada. Testar adequadamente o procedimento implementado atrav�s de blocos an�nimos, usando
--a fun��o criada anteriormente (ponto 6).






--8. Criar um novo script PL/SQL para implementar uma fun��o, designada funcAumentarSaldos, para
--adicionar um dado montante ao saldo atual e ao saldo acumulado, dos cart�es de clientes com mais de
--10 anos. A fun��o deve receber, por par�metro, o montante e deve mostrar a quantidade de cart�es
--atualizados. Caso o montante recebido seja inv�lido, a fun��o tem de retornar o valor NULL. Testar
--adequadamente a fun��o implementada, usando blocos an�nimos e o comando ROLLBACK para n�o
--afetar a BD.