// cSpell:disable
--1: Criar uma view com o nome de cursosanalista, que contém o nome do curso, nome do analista e salário do analista com um aumento de 10%.

CREATE OR REPLACE VIEW vw_cursosanalista AS
SELECT Analista, salario, Codcurso FROM analista;

UPDATE analista
SET salario = salario * 1.10;

SELECT c.Curso, a.Analista, a.Salario FROM vw_cursosanalista a
JOIN curso c ON a.Codcurso = c.Codcurso;

--2: Montar uma consulta que mostra o nome do programador e a quantidade de dias de férias. Caso o programador tenha idade
--de 20 a 24 anos 18 dias
--de 25 a 35 anos 21 dias
--acima de 35 anos 25 dias
