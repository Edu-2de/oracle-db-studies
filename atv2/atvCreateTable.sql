create table curso (codcurso int PRIMARY KEY, curso varchar(50), duracao int, dtcurso
date);
create table analista (codanalista int PRIMARY KEY, analista varchar(50), idade int, endereco
char(30),codcurso int, salario float);
create table programador (codprogramador int PRIMARY KEY, progranador varchar(50),
idade int, endereco char(30), salario float);
create table atividadesanalise (codatividadeanalise int PRIMARY KEY, dtinicio
date,dttermino date, descricao varchar(100), codanalista int);
create table atividadesprog (codatividadeprog int PRIMARY KEY, dtinicio date,dttermino
date, descricao varchar(100), codprogramador int, codatividadeanalise int);