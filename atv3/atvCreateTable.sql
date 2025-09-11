CREATE TABLE Xproduto (
    codproduto INT NOT NULL,
    descricaoproduto VARCHAR2(50) NOT NULL,
    unidade CHAR(2) NOT NULL,
    preco FLOAT NOT NULL,
    CONSTRAINT pk_xproduto PRIMARY KEY (codproduto)
);


CREATE TABLE Xcliente (
    codcliente INT NOT NULL,
    cliente VARCHAR2(50) NOT NULL,
    cpf CHAR(11) NOT NULL,
    endereco CHAR(30) NOT NULL,
    CONSTRAINT pk_xcliente PRIMARY KEY (codcliente)
);


CREATE TABLE Xtipospagamento (
    codtppagamento INT NOT NULL,
    descricaotppagamento VARCHAR2(20) NOT NULL,
    CONSTRAINT pk_xtipospagamento PRIMARY KEY (codtppagamento)
);


CREATE TABLE Xvenda (
    nnf INT NOT NULL,
    dtvenda DATE NOT NULL,
    codcliente INT NOT NULL,
    codtppagamento INT NOT NULL,
    vlvenda FLOAT NOT NULL,
    CONSTRAINT pk_xvenda PRIMARY KEY (nnf, dtvenda),
    CONSTRAINT fk_xvenda_cliente FOREIGN KEY (codcliente) REFERENCES Xcliente(codcliente),
    CONSTRAINT fk_xvenda_tipopagamento FOREIGN KEY (codtppagamento) REFERENCES Xtipospagamento(codtppagamento)
);


CREATE TABLE Xitensvenda (
    nnf INT NOT NULL,
    dtvenda DATE NOT NULL,
    codproduto INT NOT NULL,
    qtde FLOAT NOT NULL,
    CONSTRAINT pk_xitensvenda PRIMARY KEY (nnf, dtvenda, codproduto),
    CONSTRAINT fk_xitensvenda_venda FOREIGN KEY (nnf, dtvenda) REFERENCES Xvenda(nnf, dtvenda),
    CONSTRAINT fk_xitensvenda_produto FOREIGN KEY (codproduto) REFERENCES Xproduto(codproduto)
);