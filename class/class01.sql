// cSpell:disable

select * from cliente
-- MOstre o nome e o telefone dos clientes 
select nome, telefone from cliente
-- MOstre o nome e o telefone dos clientes que risedem
-- em POA
select nome, telefone from cliente
--WHERE CIDADE = 'Porto Alegre'
-- QTDE DE CLIENTE CADASTRADOS
select count(*) from cliente
select * from cliente
select sum(limite) from cliente
select avg(limite) from cliente
select min(limite) from cliente

select count(*), avg(limite),
min(limite),max(limite) from cliente
where cidade = 'Canoas' and uf = 'RS'

select cidade, uf,count(*) from cliente
group by cidade, uf

select cidade,sum(limite) from cliente
where cidade = 'Porto Alegre'
group by cidade
having sum(limite) > 5000

select limite, count(*) from cliente
group by limite
having count(*) > 1

--1) Mostre todos os dados de clientes 
select * from cliente