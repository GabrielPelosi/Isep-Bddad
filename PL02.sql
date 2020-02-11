--PL02/Gabriel Pelosi
--A. Seleções simples
--------------------------------------

--1) Mostrar todos os dados da tabela Equipas;
SELECT * FROM equipas;

--2) Mostrar todos os dados da equipa com o id igual a 12;
SELECT * FROM equipas WHERE id_equipa=12;

--3) Mostrar o id e o nome de todas as equipas;
SELECT id_equipa, nome FROM equipas;

--4) Mostrar o id, o nome e a idade dos treinadores com menos de 40 anos de idade;
SELECT id_treinador, nome, idade FROM treinadores WHERE idade < 40; 

--5) Mostrar todos os dados da tabela Experiencias relativos aos treinadores que treinaram juniores
--ou que tenham mais do que 10 anos de experiência;
SELECT * FROM experiencias WHERE escalao LIKE 'juniores' OR anos > 10;

--6) Mostrar todos os dados dos treinadores com idade pertencente ao intervalo [45, 53] e por ordem
--decrescente da idade;
SELECT * FROM treinadores WHERE idade BETWEEN 45 AND 53 ORDER BY idade desc;

--7) Mostrar todos os dados das bolas dos fabricantes Reebok e Olimpic;
SELECT * FROM bolas WHERE fabricante LIKE 'Reebok' OR fabricante LIKE 'Olimpic';

--8) Mostrar todos os dados dos treinadores cujo nome começa pela letra A.
SELECT * FROM treinadores WHERE nome LIKE 'A%';

--B. Funções de agregação
----------------------------------------------------

--1) Mostrar a quantidade de equipas que disputam o campeonato;
SELECT count(id_equipa) FROM equipas;

--2) Mostrar a quantidade de fabricantes distintos que produzem bolas usadas no campeonato;
SELECT  COUNT(DISTINCT fabricante) FROM bolas;

--3) Mostrar a quantidade de treinadores com idade superior a 40 anos;
SELECT COUNT(id_treinador) FROM treinadores WHERE idade > 40;

--4) Mostrar a idade do treinador mais velho.
SELECT MAX(idade) FROM treinadores;

--C. Seleções em múltiplas tabelas – Junções (joins)
-------------------------------------------------------------


--1) Mostrar o id das equipas que utilizam bolas do fabricante Adidas;
SELECT equipas.id_equipa FROM equipas INNER JOIN bolas ON equipas.id_equipa = bolas.id_equipa WHERE fabricante LIKE 'Adidas';
--) Mostrar o resultado da alínea anterior, mas sem repetições;
SELECT DISTINCT equipas.id_equipa FROM equipas INNER JOIN bolas ON equipas.id_equipa = bolas.id_equipa WHERE fabricante LIKE 'Adidas';
--3) Mostrar a média das idades dos treinadores de juvenis;
SELECT avg(treinadores.idade)  FROM treinadores INNER JOIN experiencias ON treinadores.id_treinador = experiencias.id_treinador WHERE escalao LIKE 'juvenis';
--4) Mostrar todos os dados dos treinadores que treinaram juniores durante 5 ou mais anos;
SELECT * FROM treinadores 
INNER JOIN experiencias ON treinadores.id_treinador = experiencias.id_treinador 
WHERE experiencias.anos >= 5 AND experiencias.escalao LIKE 'juniores';
--5) Mostrar todos os dados dos treinadores e das equipas por eles treinadas;
SELECT * FROM treinadores
INNER JOIN experiencias ON treinadores.id_treinador = experiencias.id_treinador
INNER JOIN equipas ON equipas.id_equipa = experiencias.id_equipa;
--6) Mostrar os nomes e os telefones dos treinadores e os nomes das equipas por eles treinadas;
SELECT treinadores.nome, treinadores.telefone, equipas.nome FROM treinadores 
INNER JOIN experiencias ON treinadores.id_treinador = experiencias.id_treinador
INNER JOIN equipas ON experiencias.id_equipa = equipas.id_equipa;
--7) Mostrar todos os dados da equipa do Académico e dos respetivos treinadores;
SELECT * FROM equipas
INNER JOIN experiencias ON experiencias.id_equipa = equipas.id_equipa
INNER JOIN treinadores ON treinadores.id_treinador = experiencias.id_treinador
WHERE equipas.nome = 'Académico';
--8) Mostrar a idade do treinador mais velho do Académico;
SELECT MAX(treinadores.idade) FROM treinadores 
INNER JOIN experiencias ON treinadores.id_treinador = experiencias.id_treinador
INNER JOIN equipas ON equipas.id_equipa=experiencias.id_equipa;
--9) Mostrar o total de anos de experiência do treinador António do Académico.
SELECT SUM(treinadores.idade) FROM treinadores
INNER JOIN experiencias ON treinadores.id_treinador = experiencias.id_treinador
INNER JOIN equipas ON experiencias.id_equipa = equipas.id_equipa
WHERE treinadores.nome = 'António' AND equipas.nome='Académico';
























