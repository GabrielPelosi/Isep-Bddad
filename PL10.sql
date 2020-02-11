--PL10 PL/SQL

--4)
Create OR REPlACE PROCEDURE procQtdEdicoesLivrosEditora(num_editora  Editoras.id_editora%TYPE) AS
quant_edi_livros Editoras.id_editora%TYPE;
Begin
    Select  count(el.id_editora) into quant_edi_livros
    From Edicoes_livros el 
    where el.id_editora = num_editora;
    
    dbms_output.put_line(quant_edi_livros);
End;









