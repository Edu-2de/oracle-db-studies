// cSpell:disable
// quarta atividade feita pelo oracle apex

--1 Criar uma procedure Aumenta_Produto: Esta procedure recebe como parâmetro o percentual de aumento dos produtos. Essa procedure deve atualizar os preços dos produtos no percentual informado.
CREATE OR REPLACE PROCEDURE Aumenta_Produto (valor in float) return float
IS
BEGIN
    update xproduto set preco = preco+ (preco*valor)/100;
END;

begin
Aumenta_Produto(50);
end;

select codproduto, descricaoproduto, 1+.50,preco, preco*1.50, (preco*50)/100 + preco
from xproduto;




--2 Criar a função percdesconto, que recebe como parâmetro o código do cliente e deve retornar o percentual de desconto conforme a tabela abaixo:
CREATE OR REPLACE FUNCTION percdesconto (c_codcliente IN INT) RETURN VARCHAR2
IS
    desconto FLOAT;
    v_totalqtde FLOAT;
BEGIN 
    SELECT NVL(SUM(i.qtde), 0) INTO v_totalqtde
    FROM XITENSVENDA i
    INNER JOIN XVENDA v ON i.NNF = v.NNF AND i.DTVENDA = v.DTVENDA
    WHERE v.codcliente = c_codcliente;

    IF v_totalqtde = 1 THEN
        desconto := 5.0;
    ELSIF v_totalqtde > 1 AND v_totalqtde <=9 THEN
        desconto := 7.5;
    ELSIF v_totalqtde >= 10 THEN
        desconto := 12.5;
    ELSE
        desconto := 0;
    END IF;
    RETURN('A quantidade de produtos foi: '|| v_totalqtde || ' E o percentual de desconto é: '|| desconto);
END;

SELECT percdesconto(1) FROM dual;




--3 Criar uma procedure media_vendas: Esta procedure recebe como parâmetro o código do cliente e deve retornar o valor médio das vendas do cliente e a quantidade de vendas do cliente.
CREATE OR REPLACE PROCEDURE media_vendas (
    c_codcliente IN INT,
    p_media OUT FLOAT,
    p_quantid OUT INT
)
IS
BEGIN
    SELECT AVG(v.vlvenda), COUNT(*)
    INTO p_media, p_quantid
    FROM xvenda v
    WHERE v.codcliente = c_codcliente;
END;


DECLARE
    v_media FLOAT;
    v_quantid INT;
BEGIN
    media_vendas(3, v_media, v_quantid);
    DBMS_OUTPUT.PUT_LINE('A média de valor de venda do cliente é: ' || v_media || ' e a quantidade de vendas dele foi: ' || v_quantid);
END;




--4 Criar uma procedure media_produto: Esta procedure recebe como parâmetro duas datas, uma de início e uma de fim e deve retornar o valor médio dos produtos vendidos no período e a soma das quantidades de produto vendido no período.
CREATE OR REPLACE PROCEDURE media_produto(
    i_dtinicio IN DATE,
    i_dtfim IN DATE,
    p_media OUT FLOAT,
    p_qtde OUT FLOAT
)
IS 
    BEGIN
    SELECT NVL(AVG(p.preco), 0), NVL(SUM(i.qtde), 0)
    INTO p_media, p_qtde
    FROM XPRODUTO p
    INNER JOIN XITENSVENDA i ON p.CODPRODUTO = i.CODPRODUTO
    WHERE i.DTVENDA >= i_dtinicio AND i.DTVENDA <= i_dtfim;
END;


DECLARE
    v_media FLOAT;
    v_qtde FLOAT;
BEGIN
    media_produto(TO_DATE('20/04/2002', 'DD/MM/YYYY'), TO_DATE('25/04/2002', 'DD/MM/YYYY'), v_media, v_qtde);
    DBMS_OUTPUT.PUT_LINE('A média do valor dos produtos foi: ' || v_media || ' e a quantidade de produtos vendidos foi: ' || v_qtde);
END;




--5 Criar uma procedure max_vltipopagto: Esta procedure recebe como parâmetro a descrição do tipo de pagamento e retorna o maior valor vendido para o tipo de pagamento informado no parâmetro
CREATE OR REPLACE PROCEDURE max_vltipopagto(
    t_tipo IN VARCHAR2,
    t_maxvl OUT FLOAT
)
IS
BEGIN 
    SELECT MAX(v.VLVENDA)
    INTO t_maxvl 
    FROM XVENDA v, XTIPOSPAGAMENTO t
    WHERE v.CODTPPAGAMENTO = t.CODTPPAGAMENTO
      AND t.DESCRICAOTPPAGAMENTO = t_tipo;
END;

DECLARE 
    v_maxvl FLOAT;
BEGIN
    max_vltipopagto('Cheque', v_maxvl);
    DBMS_OUTPUT.PUT_LINE('Maior valor de venda pelo método ' || 'Cheque' || ': ' || v_maxvl);
END;




--6 Criar a função retorna_mediageral que retorna a média geral das vendas. 
CREATE OR REPLACE FUNCTION retorna_mediageral RETURN VARCHAR2
IS
    v_mediageral FLOAT;
BEGIN
    SELECT AVG(v.vlvenda) INTO v_mediageral
    FROM XVENDA v;
    RETURN 'A média geral de vendas foi: ' || v_mediageral;
END;

SELECT retorna_mediageral FROM dual;




--7 Criar a função retorna_novo_preco, que recebe como parâmetro a descrição do produto e mediante a quantidade vendida retorna o novo preço do produto, conforme a tabela abaixo: Qtd vendida % Aumento 1 5 2 7 3 8 4 9 maior ou igual a 5 12
CREATE OR REPLACE FUNCTION retorna_novo_preco(p_descricao IN VARCHAR2) RETURN FLOAT
IS
    it_qtdesvendidas FLOAT;
    v_preco FLOAT;
    p_novopreco FLOAT;
BEGIN
    SELECT NVL(SUM(i.qtde), 0)
    INTO it_qtdesvendidas
    FROM XITENSVENDA i, XPRODUTO p
    WHERE i.codproduto = p.codproduto
      AND p.descricaoproduto = p_descricao;

    SELECT preco
    INTO v_preco
    FROM XPRODUTO
    WHERE descricaoproduto = p_descricao;

    IF it_qtdesvendidas = 1 THEN
        p_novopreco := v_preco + (v_preco * 0.05);
    ELSIF it_qtdesvendidas = 2 THEN
        p_novopreco := v_preco + (v_preco * 0.07);
    ELSIF it_qtdesvendidas = 3 THEN
        p_novopreco := v_preco + (v_preco * 0.08);
    ELSIF it_qtdesvendidas = 4 THEN
        p_novopreco := v_preco + (v_preco * 0.09);
    ELSIF it_qtdesvendidas >= 5 THEN
        p_novopreco := v_preco + (v_preco * 0.12);
    ELSE
        p_novopreco := v_preco; 
    END IF;

    RETURN p_novopreco;
END;

SELECT retorna_novo_preco('Coca Cola') FROM dual;




--8 Criar a função retorna_valor_pagamento que recebe como parâmetro a descrição do tipo de pagamento e retorna a quantidade de clientes que realizou venda com esse tipo de pagamento