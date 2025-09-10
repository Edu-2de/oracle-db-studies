CREATE OR REPLACE PROCEDURE formata_nomes (
  prim_nome IN VARCHAR2,
  ult_nome IN VARCHAR2,
  nome_comp OUT VARCHAR2,
  formato IN VARCHAR2 := 'ULTIMO PRIMEIRO'
)
IS
BEGIN
  IF formato = 'ULTIMO PRIMEIRO' THEN
    nome_comp := ult_nome || ',' || prim_nome;
  ELSIF formato = 'PRIMEIRO ULTIMO' THEN
    nome_comp := prim_nome || ' ' || ult_nome;
  END IF;
END;


DECLARE 
    nome_comp varchar2(20);
BEGIN
    formata_nomes ('Rafael', 'Gastão', nome_comp, 'PRIMEIRO ULTIMO');
    DBMS_OUTPUT.put_line (nome_comp);
END;
