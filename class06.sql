create or replace function busca_nome
(p_codcliente is char) return varchar2
is
    v_nome varchar(50);
begin
select nome into v_nome from cliente c
where c.cod_cli = p.codcliente
return(v_nome)
end;

select busca_nome('c1') from dual
select busca_nome(cod_cli) from cliente
