// cSpell:disable

desc pedido

select * from pedido
insert into pedido values ('ped6',to_date('13/06/1997','dd/mm/yyyy') ,to_date('15/06/1997','dd/mm/yyyy'),'c2',null);

delete from pedido
where nro_ped >= 'ped5'


select * from cliente , pedido
where cliente.cod_cli = pedido.cod_cli

select * from cliente c, pedido p
where c.cod_cli = p.cod_cli
and limite > 1 and uf = 'RS'

select * from cliente c
join pedido p on c.cod_cli = p.cod_cli
where limite > 1 and uf = 'RS'

-- Consultas Negativas
-- MINUS
select nome from cliente
minus
select nome from cliente c, pedido p
where c.cod_cli = p.cod_cli

NOT IN
select nome from cliente
where cod_cli not in (select cod_cli from pedido)

NOT EXISTS
select nome from cliente
where not EXISTS (select cod_cli from pedido WHERE CLIENTE.COD_CLI = PEDIDO.COD_CLI)




select nome from cliente
union
select nome from cliente c, pedido p
where c.cod_cli = p.cod_cli

select nome from cliente
intersect
select nome from cliente c, pedido p
where c.cod_cli = p.cod_cli

select nome from cliente c, pedido p
where c.cod_cli = p.cod_cli



select c.cod_cli, nome, nro_ped from cliente c
inner join pedido p on (c.cod_cli = p.cod_cli)  

select c.cod_cli, nome, nro_ped from cliente c
inner join pedido p on (c.cod_cli = p.cod_cli)  

select nome from cliente c, pedido p
where c.cod_cli = p.cod_cli


select c.cod_cli, nome, nro_ped from cliente c
left join pedido p on (c.cod_cli = p.cod_cli)  

select c.cod_cli, nome, nro_ped from cliente c, pedido p
where c.cod_cli *= p.cod_cli

select c.cod_cli, nome, nro_ped from cliente c
right join pedido p on (c.cod_cli = p.cod_cli)  

select c.cod_cli, nome, nro_ped from cliente c, pedido p
where c.cod_cli(+) = p.cod_cli


-- Pesquisa Negativa: nome dos clientes que NUNCA fizeram pedido
select c.cod_cli, nome, nro_ped from cliente c
left join pedido p on (c.cod_cli = p.cod_cli)  
where nro_ped is null

select c.cod_cli, nome, nro_ped from cliente c, pedido p
where c.cod_cli = p.cod_cli(+)
and  nro_ped is null