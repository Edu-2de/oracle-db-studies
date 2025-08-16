// cSpell:disable
-- Inserindo dados na tabela produto
INSERT INTO produto (codproduto, descricaoproduto, unidade, preco) VALUES (1, 'Coca Cola', 'lt', 1.20);
INSERT INTO produto (codproduto, descricaoproduto, unidade, preco) VALUES (2, 'Presunto Sadia', 'kg', 5.40);
INSERT INTO produto (codproduto, descricaoproduto, unidade, preco) VALUES (3, 'Sabonete Palmolive', 'Un', 0.65);
INSERT INTO produto (codproduto, descricaoproduto, unidade, preco) VALUES (4, 'Shampoo Colorama', 'Un', 2.60);
INSERT INTO produto (codproduto, descricaoproduto, unidade, preco) VALUES (5, 'Cerveja Skol', 'Gf', 0.99);

-- Inserindo dados na tabela cliente
INSERT INTO cliente (codcliente, cliente, cpf, endereco) VALUES (1, 'João da Silva', '123456789', 'Rua Andradas, 250');
INSERT INTO cliente (codcliente, cliente, cpf, endereco) VALUES (2, 'Maria do Rosário', '26547899', 'Rua Lima e Silva, 648');
INSERT INTO cliente (codcliente, cliente, cpf, endereco) VALUES (3, 'Paulo Silveira', '8963254', 'Rua Plínio Brasil Milano, 980');
INSERT INTO cliente (codcliente, cliente, cpf, endereco) VALUES (4, 'Rosa Aparecida dos Santos', '5896332123', 'Av. Ipiranga, 8960');

-- Inserindo dados na tabela tipospagamento
INSERT INTO tipospagamento (codtppagamento, descricaotppagamento) VALUES (1, 'Cheque');
INSERT INTO tipospagamento (codtppagamento, descricaotppagamento) VALUES (2, 'Dinheiro');
INSERT INTO tipospagamento (codtppagamento, descricaotppagamento) VALUES (3, 'Crediário');

-- Inserindo dados na tabela venda
INSERT INTO venda (nnf, dtvenda, codcliente, codtppagamento, vlvenda) VALUES (1, TO_DATE('20/04/2002', 'DD/MM/YYYY'), 1, 1, 15.00);
INSERT INTO venda (nnf, dtvenda, codcliente, codtppagamento, vlvenda) VALUES (2, TO_DATE('20/04/2002', 'DD/MM/YYYY'), 2, 1, 7.50);
INSERT INTO venda (nnf, dtvenda, codcliente, codtppagamento, vlvenda) VALUES (1, TO_DATE('25/04/2002', 'DD/MM/YYYY'), 3, 2, 7.90);
INSERT INTO venda (nnf, dtvenda, codcliente, codtppagamento, vlvenda) VALUES (1, TO_DATE('30/04/2002', 'DD/MM/YYYY'), 3, 2, 8.50);

-- Inserindo dados na tabela itensvenda
INSERT INTO itensvenda (nnf, dtvenda, codproduto, qtde) VALUES (1, TO_DATE('20/04/2002', 'DD/MM/YYYY'), 1, 1);
INSERT INTO itensvenda (nnf, dtvenda, codproduto, qtde) VALUES (1, TO_DATE('20/04/2002', 'DD/MM/YYYY'), 2, 2);
INSERT INTO itensvenda (nnf, dtvenda, codproduto, qtde) VALUES (2, TO_DATE('20/04/2002', 'DD/MM/YYYY'), 1, 3);
INSERT INTO itensvenda (nnf, dtvenda, codproduto, qtde) VALUES (2, TO_DATE('20/04/2002', 'DD/MM/YYYY'), 2, 2);
INSERT INTO itensvenda (nnf, dtvenda, codproduto, qtde) VALUES (2, TO_DATE('20/04/2002', 'DD/MM/YYYY'), 4, 4);
INSERT INTO itensvenda (nnf, dtvenda, codproduto, qtde) VALUES (1, TO_DATE('25/04/2002', 'DD/MM/YYYY'), 3, 9);
INSERT INTO itensvenda (nnf, dtvenda, codproduto, qtde) VALUES (1, TO_DATE('30/04/2002', 'DD/MM/YYYY'), 3, 7);