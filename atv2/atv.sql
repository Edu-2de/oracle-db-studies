// cSpell:disable
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
