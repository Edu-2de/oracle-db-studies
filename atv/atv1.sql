// cSpell:disable

--1: Selecionar o nome do cliente e quantidade de produtos comprados, somente para clientes que compraram Coca Cola
select c.cliente, i.qtde
from cliente c
inner join venda v on c.codcliente = v.codcliente
inner join itensvenda i on v.nnf = i.nnf
inner join produto p on i.codproduto = p.codproduto
where p.descricaoproduto = 'Coca Cola'

--2: Selecionar o nome do cliente e o valor total comprado por ele.
select c.cliente, sum(i.qtde * p.preco) as sum
from cliente c
inner join venda v on c.codcliente = v.codcliente
inner join itensvenda i on v.nnf = i.nnf
inner join produto p on i.codproduto = p.codproduto

--3: Selecionar a descrição e o maior preço de produto vendido.
select p.descricaoproduto, max(p.preco) from produto p

--4: Selecionar o nome do cliente e descrição do tipo de pagamento utilizado nas vendas.
select c.cliente, t.descricaopagamento
from cliente c
inner join venda v on v.codcliente = c.codcliente
inner join tipospagamento t on v.codtppagamento = t.codtppagamento

--5: Selecionar o nome do cliente, nnf, data da venda, descrição do tipo de pagamento,descrição do produto e quantidade vendida dos itens vendidos.
select c.cliente, i.nnf, i.dtvenda, t.descricaotppagamento, p.descricaoproduto, i.qtde
from cliente c
inner join venda v on c.codcliente = v.codcliente
inner join tipospagamento t on v.codtppagamento = t.codtppagamento
inner join itensvenda i on v.nnf = i.nnf
inner join produto p on i.codproduto = p.codproduto

--6: Selecionar a média de preço dos produtos vendidos
select avg(p.preco)
from itensvnda i
inner join produto p on i.codproduto = p.codproduto