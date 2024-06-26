CREATE TYPE TOBJCODPOSTAL AS OBJECT(
LOCALIDAD VARCHAR(30),
PROVINCIA VARCHAR(30));

CREATE TYPE TOBJDOMICILIO AS OBJECT(
TIPOVIA VARCHAR(30),
NOMBREVIA VARCHAR(30),
NUMERO NUMBER(3),
RESTODOMICILIO VARCHAR(30));

CREATE TYPE TOBJNOMBRECOMPLETO AS OBJECT(
NOMBRE VARCHAR(30),
PRAPELLIDO VARCHAR(35),
SGAPELLIDO VARCHAR(35)NULL);

CREATE TYPE TOBJDATOSPERS AS OBJECT(
CODIGODP TOBJCODPOSTAL,
NOMBRECOMPLETO TOBJNOMBRECOMPLETO,
DOMICILIO TOBJDOMICILIO,
FECHA_NACIMIENTO DATE
);

DECLARE 
    VCODPOSTAL TOBJCODPOSTAL := TOBJCODPOSTAL('MADRID', 'MADRID');
    VDOMICILIO TOBJDOMICILIO := TOBJDOMICILIO('AVENIDA', 'POSTIGO', 100, '1�a');
    VNOMBRE TOBJNOMBRECOMPLETO := TOBJNOMBRECOMPLETO('ANGELA', 'NEGRO', 'CASTILLA');
    VDATOSPERS TOBJDATOSPERS := TOBJDATOSPERS(VCODPOSTAL, VNOMBRE, VDOMICILIO, TO_DATE('18/04/1991', 'DD/MM/YYYY'));
BEGIN 
    DBMS_OUTPUT.PUT_LINE(VDATOSPERS.NOMBRECOMPLETO.NOMBRE);
END;


