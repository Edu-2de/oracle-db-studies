ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';

CREATE TABLE produto (
  cod_prod INTEGER NOT NULL,
  nome VARCHAR2(30) NOT NULL,
  preco NUMBER NOT NULL,
  categoria VARCHAR2(20) NOT NULL,
  PRIMARY KEY (cod_prod)
);

CREATE TABLE cliente (
  cod_cli CHAR(10) NOT NULL,
  nome VARCHAR2(40) NOT NULL,
  cidade VARCHAR2(20) NOT NULL,
  uf CHAR(2) NOT NULL,
  telefone VARCHAR2(20),
  status CHAR(5) NOT NULL,
  limite NUMBER NOT NULL,
  PRIMARY KEY (cod_cli)
);

CREATE TABLE pedido (
  nro_ped CHAR(10) NOT NULL,
  data_elab DATE NOT NULL,
  data_ent DATE,
  cod_cli CHAR(10) NOT NULL,
  PRIMARY KEY (nro_ped),
  FOREIGN KEY (cod_cli) REFERENCES cliente(cod_cli)
);

CREATE TABLE movimento (
  nro_ped CHAR(10) NOT NULL,
  cod_prod INTEGER NOT NULL,
  qtde INTEGER NOT NULL,
  total_mov NUMBER NOT NULL,
  PRIMARY KEY (nro_ped, cod_prod),
  FOREIGN KEY (nro_ped) REFERENCES pedido(nro_ped),
  FOREIGN KEY (cod_prod) REFERENCES produto(cod_prod)
);

ALTER TABLE pedido ADD total_ped NUMBER;

CREATE INDEX Ch_Pr_Mov ON movimento (qtde);