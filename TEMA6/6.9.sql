SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION FAREA (RADIO NUMBER) RETURN NUMBER IS
PI NUMBER := 3.14;
AREA NUMBER;
BEGIN 
AREA := PI * POWER(RADIO,2);

DBMS_OUTPUT.PUT_LINE(AREA);
RETURN AREA;
END;

DECLARE
VRADIO NUMBER := 3;
AREA NUMBER;
BEGIN 
AREA := FAREA(VRADIO);
END;