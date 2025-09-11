--1– Criar uma procedure Aumenta_Produto: Esta procedure recebe como parâmetro o percentual de aumento dos produtos. Essa procedure deve atualizar os preços dos produtos no percentual informado.

CREATE OR REPLACE PROCEDURE Aumenta_Produto (valor in float) return float
IS
BEGIN
    update xproduto set preco = preco+ (preco*valor)/100;
END;

begin
Aumenta_Produto(50);
end;

select codproduto, descricaoproduto, 1+.50,preco, preco*1.50, (preco*50)/100 + preco
from xproduto
