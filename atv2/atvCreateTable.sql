// cSpell:disable
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';

CREATE TABLE produto (
    codproduto INTEGER NOT NULL,
    descricaoproduto VARCHAR(50) NOT NULL,
    unidade CHAR(2) NOT NULL,
    preco FLOAT NOT NULL,
    PRIMARY KEY (codproduto)
);

CREATE TABLE cliente (
    codcliente INTEGER NOT NULL,
    cliente VARCHAR(50) NOT NULL,
    cpf CHAR(11) NOT NULL,
    endereco CHAR(30) NOT NULL,
    PRIMARY KEY (codcliente)
);

CREATE TABLE tipospagamento (
    codtppagamento INTEGER NOT NULL,
    descricaotppagamento VARCHAR(20) NOT NULL,
    PRIMARY KEY (codtppagamento)
);

CREATE TABLE venda (
    nnf INTEGER NOT NULL,
    dtvenda DATE NOT NULL,
    codcliente INTEGER NOT NULL,
    codtppagamento INTEGER NOT NULL,
    vlvenda FLOAT NOT NULL,
    PRIMARY KEY (nnf, dtvenda),
    FOREIGN KEY (codcliente) REFERENCES cliente (codcliente),
    FOREIGN KEY (codtppagamento) REFERENCES tipospagamento (codtppagamento)
);

CREATE TABLE itensvenda (
    nnf INTEGER NOT NULL,
    dtvenda DATE NOT NULL,
    codproduto INTEGER NOT NULL,
    qtde FLOAT not null,
    PRIMARY KEY (nnf, dtvenda, codproduto),
    FOREIGN KEY (nnf, dtvenda) REFERENCES venda (nnf, dtvenda),
    FOREIGN KEY (codproduto) REFERENCES produto (codproduto)
);

//primeira atividade feita no oracle apex