SET SERVEROUTPUT ON;

SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION ES_PAR (NUMERO NUMBER) RETURN BOOLEAN IS
 VBOOL BOOLEAN;
BEGIN 
    IF (MOD(numero, 2) = 0) THEN
        VBOOL := TRUE;
    ELSE 
        VBOOL := FALSE;
    END IF;

    return vbool;
   
END;

DECLARE 
V_BOOL BOOLEAN;
V_NUMERO NUMBER := 9;
BEGIN 
V_BOOL := ES_PAR(V_NUMERO);

IF V_BOOL THEN
    DBMS_OUTPUT.PUT_LINE('TRUE');
    ELSE
    DBMS_OUTPUT.PUT_LINE('FALSE');
    END IF;
END;



