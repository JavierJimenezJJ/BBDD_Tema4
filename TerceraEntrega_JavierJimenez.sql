
--Realizacion de drops para a�adir delete on cascade 
ALTER TABLE TRABAJADORES DROP CONSTRAINT TRABAJADORES_FK;

ALTER TABLE TRABAJADORES ADD CONSTRAINT TRABAJADORES_FK FOREIGN KEY (COD_DESCUENTO) REFERENCES DESCUENTO(CODIGO_DESCUENTO)ON DELETE CASCADE;

ALTER TABLE PRODUCTO DROP CONSTRAINT PRODUCTO_FK;

ALTER TABLE PRODUCTO ADD CONSTRAINT PRODUCTO_FK FOREIGN KEY (CIF) REFERENCES PROVEEDOR(CIF) ON DELETE CASCADE;

ALTER TABLE VENTA DROP CONSTRAINT VENTA_FK;

ALTER TABLE VENTA ADD CONSTRAINT VENTA_FK FOREIGN KEY (COD_EMPLEADO) REFERENCES CAMARERO(CODIGO_CAMARERO) ON DELETE CASCADE;

ALTER TABLE VENTA DROP CONSTRAINT VENTA_FK2;

ALTER TABLE VENTA ADD CONSTRAINT VENTA_FK2 FOREIGN KEY (DNI) REFERENCES TRABAJADORES(DNI) ON DELETE CASCADE;

ALTER TABLE VENTA DROP CONSTRAINT VENTA_FK3;

ALTER TABLE VENTA ADD CONSTRAINT VENTA_FK3 FOREIGN KEY (COD_PRODUCTO) REFERENCES PRODUCTO(CODIGO_PRODUCTO) ON DELETE CASCADE;

--A�ADIDO CODPROVEEDOR EN PROVEEDOR
ALTER TABLE PROVEEDOR ADD CODPROVEEDOR NUMBER(2);

--ALTERAR ATRIBUTO EN PROVEEDOR CIF DE 8 A 9
-- Modificar el tama�o del CIF de 8 a 9
ALTER TABLE PROVEEDOR MODIFY CIF VARCHAR(9);

--NUEVA CONSTRAINT
ALTER TABLE PRODUCTO ADD CODPROVEEDOR NUMBER(2);

--DROPAMOS PRIMARY KEY CIF
ALTER TABLE PROVEEDOR DROP CONSTRAINT PK_PROVEEDOR;

ALTER TABLE PRODUCTO DROP CONSTRAINT PRODUCTO_FK;

--CREAMOS PRIAMRY KEY CODPROVEEDOR
ALTER TABLE PROVEEDOR ADD CONSTRAINT PK_PROVEEDOR PRIMARY KEY (CODPROVEEDOR);

--CREAMOS FOREIGN KEY
ALTER TABLE PRODUCTO ADD CONSTRAINT PRODUCTO_FK FOREIGN KEY (CODPROVEEDOR) REFERENCES PROVEEDOR(CODPROVEEDOR);

--A�ADIMOS PRECIO 
ALTER TABLE PRODUCTO ADD PRECIO NUMBER(10, 2);





--UPDATES POR QUE SE ME OLVIDO METER EL NUMERO DE CUENTA Y EL TELEFONO -.-
UPDATE TRABAJADORES
SET NUM_CUENTA = CASE
WHEN DNI = '93603385K' THEN 'ES1234567890123456789012'
WHEN DNI = '09927463L' THEN 'ES9876543210987654321098'
WHEN DNI = '71119803M' THEN 'ES5678901234567890123456'
WHEN DNI = '31290982G' THEN 'ES3456789012345678901234'
WHEN DNI = '71896442T' THEN 'ES2109876543210987654321'
WHEN DNI = '21964788D' THEN 'ES6789012345678901234567'
WHEN DNI = '96884452H' THEN 'ES4567890123456789012345'
WHEN DNI = '71450369F' THEN 'ES7890123456789012345678'
WHEN DNI = '07894125S' THEN 'ES2345678901234567890123'
END;


UPDATE TRABAJADORES
SET NUM_TELEFONO = CASE
WHEN DNI = '93603385K' THEN '612345678'
WHEN DNI = '09927463L' THEN '622345679'
WHEN DNI = '71119803M' THEN '632345680'
WHEN DNI = '31290982G' THEN '642345681'
WHEN DNI = '71896442T' THEN '652345682'
WHEN DNI = '21964788D' THEN '662345683'
WHEN DNI = '96884452H' THEN '672345684'
WHEN DNI = '71450369F' THEN '682345685'
WHEN DNI = '07894125S' THEN '692345686'
END;

--HE USADO UN CASE POR QUE ME PARECIA MUCHO MAS SENCILLO QUE PONER TODOS LOS UPDATES Y APROVECHANDO QUE YA ESTA DADO EN EL TEMA 6 
--------------------------------------------------------------------------------
--INSERTS

INSERT INTO DESCUENTO (CODIGO_DESCUENTO,PORCENTAJE,TIPO_EMPLEADO) VALUES('d022',22,'DOCTOR');
INSERT INTO DESCUENTO (CODIGO_DESCUENTO,PORCENTAJE,TIPO_EMPLEADO) VALUES('e020',20,'ENFERMERO');
INSERT INTO DESCUENTO (CODIGO_DESCUENTO,PORCENTAJE,TIPO_EMPLEADO) VALUES('x020',20,'AUXILIAR ENFERMERIA');
INSERT INTO DESCUENTO (CODIGO_DESCUENTO,PORCENTAJE,TIPO_EMPLEADO) VALUES('a015',15,'ADMINISTRATIVO');
INSERT INTO DESCUENTO (CODIGO_DESCUENTO,PORCENTAJE,TIPO_EMPLEADO) VALUES('c018',18,'CELADOR');

INSERT INTO TRABAJADORES (DNI,NOMBRE,PRAPELLIDO,SGAPELLIDO,NUM_COLEGIADO,COD_DESCUENTO) VALUES('93603385K','BELEN','LOPEZ','DIEZ',NULL,'a015');
INSERT INTO TRABAJADORES (DNI,NOMBRE,PRAPELLIDO,SGAPELLIDO,NUM_COLEGIADO,COD_DESCUENTO) VALUES('09927463L','PEDRO','TORRES',NULL,25641,'d022');
INSERT INTO TRABAJADORES (DNI,NOMBRE,PRAPELLIDO,SGAPELLIDO,NUM_COLEGIADO,COD_DESCUENTO) VALUES('71119803M','LUIS','GONZALEZ','SANCHEZ',NULL,'x020');
INSERT INTO TRABAJADORES (DNI,NOMBRE,PRAPELLIDO,SGAPELLIDO,NUM_COLEGIADO,COD_DESCUENTO) VALUES('31290982G','EVA','MARCOS','GONZALEZ',14587,'d022');
INSERT INTO TRABAJADORES (DNI,NOMBRE,PRAPELLIDO,SGAPELLIDO,NUM_COLEGIADO,COD_DESCUENTO) VALUES('71896442T','JAIME','SANCHEZ','ROMERO',36258,'e020');
INSERT INTO TRABAJADORES (DNI,NOMBRE,PRAPELLIDO,SGAPELLIDO,NUM_COLEGIADO,COD_DESCUENTO) VALUES('21964788D','DANIEL','GARCIA','GIL',NULL,'c018');
INSERT INTO TRABAJADORES (DNI,NOMBRE,PRAPELLIDO,SGAPELLIDO,NUM_COLEGIADO,COD_DESCUENTO) VALUES('96884452H','DAVID','MEDINA','ORTEGA',89345,'d022');
INSERT INTO TRABAJADORES (DNI,NOMBRE,PRAPELLIDO,SGAPELLIDO,NUM_COLEGIADO,COD_DESCUENTO) VALUES('71450369F','MIGUEL','PEREZ','SANZ',NULL,'c018');
INSERT INTO TRABAJADORES (DNI,NOMBRE,PRAPELLIDO,SGAPELLIDO,NUM_COLEGIADO,COD_DESCUENTO) VALUES('07894125S','MARTA','MU�OZ','VILLA',NULL,'a015');

INSERT INTO CAMARERO (CODIGO_CAMARERO,NOMBRE_USUARIO,TIPO_EMPLEADO,NOMBRE) VALUES(1000,'carlos55','ENCARGADO','CARLOS');
INSERT INTO CAMARERO (CODIGO_CAMARERO,NOMBRE_USUARIO,TIPO_EMPLEADO,NOMBRE) VALUES(1001,'javi61','CAMARERO','JAVI');
INSERT INTO CAMARERO (CODIGO_CAMARERO,NOMBRE_USUARIO,TIPO_EMPLEADO,NOMBRE) VALUES(1002,'laura60','JEFE DE TURNO','LAURA');
INSERT INTO CAMARERO (CODIGO_CAMARERO,NOMBRE_USUARIO,TIPO_EMPLEADO,NOMBRE) VALUES(1003,'sonia00','CAMARERO','SONIA');
INSERT INTO CAMARERO (CODIGO_CAMARERO,NOMBRE_USUARIO,TIPO_EMPLEADO,NOMBRE) VALUES(1004,'carmen63','CAMARERO','CARMEN');

INSERT INTO PRODUCTO (CODIGO_PRODUCTO,NOMBRE_PRODUCTO,PRECIO,STOCK,CODPROVEEDOR,ALERGENOS,FECHA_ENVASADO) VALUES(010,'CAFE SOLO',1.0,120,32,NULL,NULL);
INSERT INTO PRODUCTO (CODIGO_PRODUCTO,NOMBRE_PRODUCTO,PRECIO,STOCK,CODPROVEEDOR,ALERGENOS,FECHA_ENVASADO) VALUES(011,'CAPUCHINO',1.2,20,32,'LACTOSA',NULL);
INSERT INTO PRODUCTO (CODIGO_PRODUCTO,NOMBRE_PRODUCTO,PRECIO,STOCK,CODPROVEEDOR,ALERGENOS,FECHA_ENVASADO) VALUES(012,'CROISSANT',0.95,35,26,'GLUTEN',NULL);
INSERT INTO PRODUCTO (CODIGO_PRODUCTO,NOMBRE_PRODUCTO,PRECIO,STOCK,CODPROVEEDOR,ALERGENOS,FECHA_ENVASADO) VALUES(013,'SANDWICH MIXTO',1.75,15,11,'GLUTEN',230524);
INSERT INTO PRODUCTO (CODIGO_PRODUCTO,NOMBRE_PRODUCTO,PRECIO,STOCK,CODPROVEEDOR,ALERGENOS,FECHA_ENVASADO) VALUES(014,'MANZANA',0.85,50,11,NULL,NULL);
INSERT INTO PRODUCTO (CODIGO_PRODUCTO,NOMBRE_PRODUCTO,PRECIO,STOCK,CODPROVEEDOR,ALERGENOS,FECHA_ENVASADO) VALUES(015,'TOSTADAS',2.20,90,26,'GLUTEN',NULL);
INSERT INTO PRODUCTO (CODIGO_PRODUCTO,NOMBRE_PRODUCTO,PRECIO,STOCK,CODPROVEEDOR,ALERGENOS,FECHA_ENVASADO) VALUES(016,'REFRESCO COLA',2.15,25,56,NULL,200424);
INSERT INTO PRODUCTO (CODIGO_PRODUCTO,NOMBRE_PRODUCTO,PRECIO,STOCK,CODPROVEEDOR,ALERGENOS,FECHA_ENVASADO) VALUES(017,'AGUA',0.90,120,12,NULL,130524);
INSERT INTO PRODUCTO (CODIGO_PRODUCTO,NOMBRE_PRODUCTO,PRECIO,STOCK,CODPROVEEDOR,ALERGENOS,FECHA_ENVASADO) VALUES(018,'INFUSION',1.0,60,12,NULL,NULL);
INSERT INTO PRODUCTO (CODIGO_PRODUCTO,NOMBRE_PRODUCTO,PRECIO,STOCK,CODPROVEEDOR,ALERGENOS,FECHA_ENVASADO) VALUES(019,'CERVEZA',1.6,100,56,NULL,120324);
INSERT INTO PRODUCTO (CODIGO_PRODUCTO,NOMBRE_PRODUCTO,PRECIO,STOCK,CODPROVEEDOR,ALERGENOS,FECHA_ENVASADO) VALUES(020,'PATATAS FRITAS',1.35,50,56,NULL,300524);

INSERT INTO PROVEEDOR (CIF,NOMBRE,CODPROVEEDOR,CIUDAD,TELEFONO) VALUES('36422476K','CARREFOUR',11,'VALLADOLID','612345678');
INSERT INTO PROVEEDOR (CIF,NOMBRE,CODPROVEEDOR,CIUDAD,TELEFONO) VALUES('14207080A','SUMINISTROS GARCIA',12,'PALENCIA','622345679');
INSERT INTO PROVEEDOR (CIF,NOMBRE,CODPROVEEDOR,CIUDAD,TELEFONO) VALUES('44129632S','PANADERIA PUEBLA',26,'LEON','632345680');
INSERT INTO PROVEEDOR (CIF,NOMBRE,CODPROVEEDOR,CIUDAD,TELEFONO) VALUES('55503568Z','CAFES DEL MUNDO',32,'VALLADOLID','642345681');
INSERT INTO PROVEEDOR (CIF,NOMBRE,CODPROVEEDOR,CIUDAD,TELEFONO) VALUES('74483896Y','HNOS. RICO',56,'LEON','652345682');
INSERT INTO PROVEEDOR (CIF,NOMBRE,CODPROVEEDOR,CIUDAD,TELEFONO) VALUES('12603532E','HELADOS FRIGO',60,'SEGOVIA','662345683');


--CONSULTAS
--1
SELECT * 
FROM TRABAJADORES 
WHERE NUM_COLEGIADO IS NOT NULL;

--2
SELECT CODIGO_PRODUCTO, ALERGENOS, FECHA_ENVASADO
FROM PRODUCTO
WHERE NOMBRE_PRODUCTO LIKE 'C%';

--3
SELECT T.NOMBRE, D.TIPO_EMPLEADO
FROM TRABAJADORES T
JOIN DESCUENTO D ON T.COD_DESCUENTO = D.CODIGO_DESCUENTO
WHERE D.TIPO_EMPLEADO = 'CELADOR';

--4
SELECT NOMBRE_PRODUCTO
FROM PRODUCTO
WHERE CODPROVEEDOR > 15
AND CODPROVEEDOR <50;

--5
--CON MAX
SELECT *
FROM PRODUCTO
WHERE PRECIO = (SELECT MAX(PRECIO) FROM PRODUCTO);

--CON ALL 
SELECT *
FROM PRODUCTO
WHERE PRECIO  >= ALL (SELECT PRECIO FROM PRODUCTO);

--CON LIMIT 
SELECT *
FROM PRODUCTO
ORDER BY PRECIO DESC
LIMIT 1;

--6
--CON MIN
SELECT CODIGO_PRODUCTO, PRECIO
FROM PRODUCTO
WHERE PRECIO = (SELECT MIN(PRECIO) FROM PRODUCTO);

--CON ALL
SELECT *
FROM PRODUCTO
WHERE PRECIO  <= ALL (SELECT PRECIO FROM PRODUCTO);

--7
SELECT CODIGO_CAMARERO, NOMBRE_USUARIO, TIPO_EMPLEADO
FROM CAMARERO
WHERE NOMBRE_USUARIO LIKE '%0%';

--8
SELECT AVG(PRECIO) 
FROM PRODUCTO P
JOIN PROVEEDOR V ON P.CODPROVEEDOR = V.CODPROVEEDOR
WHERE V.NOMBRE = 'CARREFOUR';

--9

--10
SELECT NOMBRE_PRODUCTO,ALERGENOS,FECHA_ENVASADO,STOCK
FROM PRODUCTO
WHERE STOCK < 50;

--11
SELECT T.NOMBRE, T.PRAPELLIDO, T.SGAPELLIDO
FROM TRABAJADORES T
JOIN DESCUENTO D ON T.COD_DESCUENTO = D.CODIGO_DESCUENTO
WHERE D.PORCENTAJE = 20;

--12
SELECT D.TIPO_EMPLEADO
FROM DESCUENTO D
JOIN TRABAJADORES T ON D.CODIGO_DESCUENTO = T.COD_DESCUENTO
WHERE T.SGAPELLIDO IS NULL;

--13

--14
SELECT T.NOMBRE, T.PRAPELLIDO, T.SGAPELLIDO, T.NUM_COLEGIADO, D.CODIGO_DESCUENTO
FROM DESCUENTO D
JOIN TRABAJADORES T ON D.CODIGO_DESCUENTO = T.COD_DESCUENTO
WHERE D.TIPO_EMPLEADO IN ('ADMINISTRATIVO', 'ENFERMERO')
ORDER BY T.PRAPELLIDO ASC;















