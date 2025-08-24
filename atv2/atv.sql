// cSpell:disable
// segunda atividade feita pelo oracle apex

--1: Criar uma view com o nome de cursosanalista, que contém o nome do curso, nome do analista e salário do analista com um aumento de 10%.

CREATE OR REPLACE VIEW vw_cursosanalista AS
SELECT Analista, salario, Codcurso FROM analista

UPDATE analista
SET salario = salario * 1.10;

SELECT c.Curso, a.Analista, a.Salario FROM vw_cursosanalista a
JOIN curso c ON a.Codcurso = c.Codcursol;

--2: Montar uma consulta que mostra o nome do programador e a quantidade de dias de férias. Caso o programador tenha idade
--de 20 a 24 anos 18 dias
--de 25 a 35 anos 21 dias
--acima de 35 anos 25 dias

SELECT Programador,
  CASE
    WHEN Idade >= 20 AND Idade <= 24 THEN '18 dias'
    WHEN Idade >= 25 AND Idade <= 35 THEN '21 dias'
    WHEN Idade > 35 THEN '25 dias'
  END AS ferias
FROM programador;

--3: Criar uma view com o nome de ativanalista, contendo o nome do analista e a quantidade de atividades de análise que ele realizou.

CREATE OR REPLACE VIEW vw_ativanalista AS 
SELECT Analista, codanalista FROM analista;

SELECT a.Analista,  COUNT(*) AS total_atividades FROM vw_ativanalista a
JOIN atividadesanalise aa ON a.codanalista = aa.codanalista
GROUP BY a.Analista;

--4: Montar uma consulta para atualizar o salário dos analistas a partir da quantidade de atividades de análise realizadas.
--1 atividade 5%
--2 atividades 10%
--3 atividades ou mais 15%

UPDATE analista
SET salario = salario *
  CASE
    WHEN (
      SELECT COUNT(*) 
      FROM atividadesanalise aa
      WHERE aa.codanalista = analista.codanalista
    ) = 1 THEN 1.05
    WHEN (
      SELECT COUNT(*) 
      FROM atividadesanalise aa
      WHERE aa.codanalista = analista.codanalista
    ) = 2 THEN 1.10
    WHEN (
      SELECT COUNT(*) 
      FROM atividadesanalise aa
      WHERE aa.codanalista = analista.codanalista
    ) >= 3 THEN 1.15
    ELSE 1
  END;

--5:  Monte uma consulta para mostrar o nome do(s) analista(s) e o nome de seu respectivo curso, o(s) qual(is) nunca tive(ram) atividades realizadas com o programador o qual tenha em seu nome a palavra “Jefer”.

SELECT a.analista, c.curso
FROM analista a
INNER JOIN curso c ON a.codcurso = c.codcurso

MINUS

SELECT a.analista, c.curso
FROM analista a
INNER JOIN curso c ON a.codcurso = c.codcurso
INNER JOIN atividadesanalise aa ON a.codanalista = aa.codanalista
INNER JOIN atividadesprog ap ON aa.codatividadeanalise = ap.codatividadeanalise
INNER JOIN programador p ON ap.codprogramador = p.codprogramador
WHERE p.programador LIKE '%Jefer%'
