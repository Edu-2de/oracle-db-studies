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