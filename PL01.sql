---PL01

--1) Mostrar todos os dados da tabela CD
SELECT * FROM CD;
--2) Mostrar os titutol e a data de compra da tabela CD
SELECT TITULO, data_compra FROM CD;
--3) Mostrar a data de compra da tabela CD
SELECT data_compra FROM CD;
--4) Mostrar os dados da alinea anterior mas sem repetir
SELECT DISTINCT data_compra FROM CD;
--5) Mostrar os codigos e interpretes da tabela musicas
SELECT cod_cd, interprete FROM musicas;
--6) Mostrar os resultados da alinea anterior sem repetir
SELECT DISTINCT cod_cd, interprete FROM musicas;
--7) Mostrar a data de compra de todos os CD com o resultado intitulado "Data de Compra"
SELECT data_compra as "Data de Compra " FROM CD;
--8) Mostrar o título, o valor pago e o respetivo valor do IVA de todos os CD. O valor do IVA é calculado de   
--acordo com a seguinte fórmula: valor do IVA = (valor pago * 0.23) / 1.23;
SELECT titulo, valor_pago, (valor_pago * 0.23)/1.23 as "IVA " FROM CD;
--9) Mostrar todos os  dados de todas as músicas do CD com o código 2
SELECT  * FROM musicas WHERE cod_cd=2;
--10) Mostrar todos os  dados de todas as músicas do CD com o código 2
SELECT  * FROM musicas WHERE cod_cd!=2;
--11) Mostrar todos os dados de todas as músicas do CD com o código 2 cuja duração seja superior a 5
SELECT * FROM musicas WHERE (cod_cd=2 AND duracao > 5);
--12) Mostrar todos os dados das músicas do CD com o código 2 cuja duração pertença ao intervalo [4,6]
SELECT * FROM musicas WHERE (cod_cd=2 AND  duracao BETWEEN 4 AND 6 ); 
--13)  Mostrar todos os dados das músicas do CD com o código 2 cuja duração seja inferior a 4 ou superior a 6
SELECT * FROM musicas WHERE (cod_cd=2 AND duracao not BETWEEN 4 AND 6);
--14) Mostrar todos os dados das músicas com os números: 1, 3, 5 ou 6
SELECT * FROM musicas WHERE cod_cd IN (1,3,5,6);
--15) Mostrar todos os dados das músicas com os números diferentes 1, 3, 5 ou 6
SELECT * FROM musicas WHERE cod_cd NOT IN (1,3,5,6);
--16) Mostrar os títulos dos CD comprados na FNAC;
SELECT titulo FROM CD WHERE local_compra LIKE 'FNAC';
--17) Mostrar os títulos dos CD que não foram comprados na FNAC;
select titulo from cd where local_compra NOT LIKE 'FNAC';
--18) Mostrar todos os dados das músicas cujo intérprete é uma orquestra;
select * from musicas where interprete LIKE 'Orquestra%';
--19) Mostrar todos os dados das músicas cujo intérprete tem um Y;
select * from musicas where interprete LIKE '%Y%';
--20) Mostrar todos os dados das músicas cujo nome termina com DAL?, sendo ? qualquer caráter;
select * from musicas where ; --errado
--21) Mostrar todos os dados das músicas cujo título tem o caráter %;
select * from musicas where titulo LIKE '%@%%' ESCAPE '@';
--22) Mostrar todos os dados das músicas cujo título é iniciado pela letra B, D ou H;
select * from musicas where titulo LIKE IN ('B%'  'D%' 'H%');
--23) Mostrar todos os dados dos CD sem o local de compra registado;
select * from cd where local_compra IS null;
--24) Mostrar todos os dados dos CD com o local de compra registado.
select * from cd where local_compra is not null;

select * from musicas;
-- B. Ordenacoes
---------------------------------------------------------

-- 1) Mostrar o titulo e a data de compra dos CD, por ordem alfabetica do titulo do CD;
select titulo, data_compra from cd order by titulo;
-- 2) Mostrar o titulo e a data de compra dos CD, por ordem descendente da data de compra do CD;
select titulo, data_compra from cd order by data_compra desc;
-- 3) Mostrar o titulo e o local de compra dos CD, por ordem ascendente do local de compra do CD;
select titulo, local_compra from cd order by local_compra;
-- 4) Mostrar o resultado da ali?nea anterior, mas por ordem descendente do local de compra do CD;
select titulo, local_compra from cd order by local_compra desc;
-- 5) Mostrar o titulo, o valor pago e o respetivo valor do IVA dos CD, por ordem decrescente do IVA;
select titulo, valor_pago, (valor_pago * 0.23) from cd order by (valor_pago * 0.23) desc;
-- 6) Mostrar o titulo do CD por ordem descendente da data de compra e, no caso da igualdade de datas, por ordem alfabetica do titulo.
select * from cd order by data_compra, titulo;


-- C. Funcoes de agregacao
---------------------------------------------------------

-- 1) Mostrar a quantidade de musicas;
select count(nr_musica) from musicas;
-- 2) Mostrar a quantidade de locais de compra distintos;
select count(distinct local_compra) from cd;
-- 3) Mostrar o total gasto com a compra de todos os CD;
select sum(valor_pago) from cd;
-- 4) Mostrar o maior valor pago por um CD;
select max(valor_pago) from cd;
-- 5) Mostrar o menor valor pago por um CD;
select min(valor_pago) from cd;
-- 6) Mostrar a media da duracao de todas as mu?sicas.
select avg(duracao) from musicas;

-- D. Selecoes em multiplas tabelas – Juncoes (joins)
---------------------------------------------------------

-- 1) Mostrar o titulo do CD e o titulo das musicas de todos os CD;
select cd.titulo, musicas.titulo from cd inner join musicas on cd.cod_cd = musicas.cod_cd;
-- 2) Mostrar o titulo do CD e o titulo da musica com o numero 1 de cada CD;
select cd.titulo, musicas.titulo from cd inner join musicas on cd.cod_cd = musicas.cod_cd and musicas.nr_musica = 1;
-- 3) Mostrar o numero, o titulo e a duracao, de todas as musicas do CD com o titulo Punkzilla.
select musicas.nr_musica, musicas.titulo, musicas.duracao from musicas inner join cd on cd.cod_cd = musicas.cod_cd and cd.titulo = 'Punkzilla';




