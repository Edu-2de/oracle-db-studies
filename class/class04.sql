DBMS_OUTPUT.PUT_LINE (string);

DECLARE
    valor number  := 10;
    letra char(1) := 'A';
    nome varchar(7) := 'SEFORA';
BEGIN
    DBMS_OUTPUT.PUT_LINE ('teste de console');
    DBMS_OUTPUT.PUT_LINE ('Nome: '|| nome || 'tem valor: '|| valor);
END;    


DECLARE
  PROCEDURE p (sales NUMBER)
  IS
    bonus  NUMBER := 0;
  BEGIN 
    IF sales > 50000 THEN
      bonus := 1500;
    ELSIF sales > 35000 THEN
      bonus := 500;
    ELSE
      bonus := 100;
    END IF;
 
    DBMS_OUTPUT.PUT_LINE (
      'Sales = ' || sales || ', bonus = ' || bonus || '.'
    );
  END p;
BEGIN
  p(55000);
  p(40000);
  p(30000);
END;
