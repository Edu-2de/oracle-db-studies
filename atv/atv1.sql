// cSpell:disable

--1: Selecionar o nome do cliente e quantidade de produtos comprados, somente para clientes que compraram Coca Cola
select c.cliente, i.qtde
from cliente c
inner join venda v on c.codcliente = v.codcliente
inner join itensvenda i on v.nnf = i.nnf
inner join produto p on i.codproduto = p.codproduto
where p.descricaoproduto = 'Coca Cola';

--2: Selecionar o nome do cliente e o valor total comprado por ele.
select c.cliente, sum(i.qtde * p.preco) as sum
from cliente c
inner join venda v on c.codcliente = v.codcliente
inner join itensvenda i on v.nnf = i.nnf
inner join produto p on i.codproduto = p.codproduto
group by c.cliente

--3: Selecionar a descrição e o maior preço de produto vendido.
select p.descricaoproduto, max(p.preco) from produto p

--4: 

