SELECT * FROM cliente;

DROP VIEW vw_cliente;

CREATE OR REPLACE VIEW vw_cliente AS
SELECT cod_cli, nome, cidade, uf, status FROM cliente
where cidade = 'Canoas';

SELECT * FROM vw_cliente c, pedido p
where c.cod_cli = p.cod_cli;

INSERT INTO cliente(cod_cli, nome, cidade, uf, status, limite) VALUES
('c5', 'SEFORA', 'Caxias', 'RS', 'bom', 500);
