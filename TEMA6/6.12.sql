CREATE TABLE departamento(
  id_departamento NUMBER NOT NULL,
  nombre varchar(30),
  presupuesto NUMBER,
  CONSTRAINT pk_departamento PRIMARY KEY (id_departamento)
);


CREATE TABLE empleados(
  id_empleado varchar(8) NOT NULL,
  nombre varchar(30),
  apellidos varchar(30),
  id_departamento NUMBER,
  CONSTRAINT pk_empleados PRIMARY KEY (id_empleado),
  CONSTRAINT empleados_fk FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

CREATE TABLE datospersonales (
  dni varchar(10) NOT NULL,
  oficina varchar(30),
  fecha_alta date,
  contrato varchar(30) ,
  clave_empleado varchar(30) ,
  CONSTRAINT pk_datospersonales PRIMARY KEY (dni),
  CONSTRAINT datospersonales_fk FOREIGN KEY (clave_empleado) REFERENCES empleados(id_empleado)
);

-------
INSERT INTO DATOSPERSONALES(dni,oficina,fecha_alta,contrato,clave_empleado) VALUES ('09562145H','Valladolid','23/01/2010','Indefinido','EMP01');
INSERT INTO DATOSPERSONALES(dni,oficina,fecha_alta,contrato,clave_empleado) VALUES ('11732525R','Madrid Central','22/08/2018','Indefinido','EMP09');
INSERT INTO DATOSPERSONALES(dni,oficina,fecha_alta,contrato,clave_empleado) VALUES ('16220446D','Valladolid','12/12/2021','Practicas','EMP04');
INSERT INTO DATOSPERSONALES(dni,oficina,fecha_alta,contrato,clave_empleado) VALUES ('26135448K','Madrid Central','01/01/2022','Temporal','EMP02');
INSERT INTO DATOSPERSONALES(dni,oficina,fecha_alta,contrato,clave_empleado) VALUES ('44513677P','Valladolid','26/07/2022','Indefinido','EMP07');
INSERT INTO DATOSPERSONALES(dni,oficina,fecha_alta,contrato,clave_empleado) VALUES ('55871366V','Madrid Norte','30/04/2016','Indefinido','EMP06');
INSERT INTO DATOSPERSONALES(dni,oficina,fecha_alta,contrato,clave_empleado) VALUES ('70644119B','Madrid Central','20/02/2020','Temporal','EMP05');
INSERT INTO DATOSPERSONALES(dni,oficina,fecha_alta,contrato,clave_empleado) VALUES ('71039445T','Madrid Sur','01/03/2023','Temporal','EMP08');
INSERT INTO DATOSPERSONALES(dni,oficina,fecha_alta,contrato,clave_empleado) VALUES ('71045896C','Madrid Norte','12/12/2021','Practicas','EMP10');
INSERT INTO DATOSPERSONALES(dni,oficina,fecha_alta,contrato,clave_empleado) VALUES ('71569883M','Madrid Sur','19/07/2002','Indefinido','EMP03');

-----
INSERT INTO DEPARTAMENTO (id_departamento,nombre,presupuesto) VALUES (1,'Personal',80000);
INSERT INTO DEPARTAMENTO (id_departamento,nombre,presupuesto) VALUES (2,'Almacen',70000);
INSERT INTO DEPARTAMENTO (id_departamento,nombre,presupuesto) VALUES (3,'Contabilidad',60000);
INSERT INTO DEPARTAMENTO (id_departamento,nombre,presupuesto) VALUES (4,'Manufactura',50000);
INSERT INTO DEPARTAMENTO (id_departamento,nombre,presupuesto) VALUES (5,'Empaque',30000);
------
INSERT INTO empleados(id_empleado,nombre,apellidos,id_departamento) VALUES ('EMP01','Armando','Lopez',2);
INSERT INTO empleados(id_empleado,nombre,apellidos,id_departamento) VALUES ('EMP02','Tatiana','Vargas',1);
INSERT INTO empleados(id_empleado,nombre,apellidos,id_departamento) VALUES ('EMP03','Laura','Garcia',3);
INSERT INTO empleados(id_empleado,nombre,apellidos,id_departamento) VALUES ('EMP04','Juan','Perez',4);
INSERT INTO empleados(id_empleado,nombre,apellidos,id_departamento) VALUES ('EMP05','Ivan','Lopez',4);
INSERT INTO empleados(id_empleado,nombre,apellidos,id_departamento) VALUES ('EMP06','Margarita','Hernandez',1);
INSERT INTO empleados(id_empleado,nombre,apellidos,id_departamento) VALUES ('EMP07','Jesus','Perez',3);
INSERT INTO empleados(id_empleado,nombre,apellidos,id_departamento) VALUES ('EMP08','Antonio','Flores',2);
INSERT INTO empleados(id_empleado,nombre,apellidos,id_departamento) VALUES ('EMP09','Juan','Medina',4);
INSERT INTO empleados(id_empleado,nombre,apellidos,id_departamento) VALUES ('EMP10','Pedro','Hernandez',5);

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE CAMBIODATOS (NOMBRE_DEP IN VARCHAR) IS
FECHA DATE;
V_ID_EMPLEADO VARCHAR(40);
VMENSAJE VARCHAR(20) :='OK';
BEGIN 

  SELECT E.ID_EMPLEADO, D.FECHA_ALTA
    INTO V_ID_EMPLEADO, FECHA
    FROM EMPLEADOS E
    JOIN DATOSPERSONALES D ON E.ID_EMPLEADO = D.CLAVE_EMPLEADO
    WHERE E.ID_DEPARTAMENTO = (SELECT ID_DEPARTAMENTO FROM DEPARTAMENTO WHERE NOMBRE = NOMBRE_DEP)
    AND D.FECHA_ALTA = (SELECT MIN(D2.FECHA_ALTA)
                        FROM EMPLEADOS E2
                        JOIN DATOSPERSONALES D2 ON E2.ID_EMPLEADO = D2.CLAVE_EMPLEADO
                        WHERE E2.ID_DEPARTAMENTO = E.ID_DEPARTAMENTO);



UPDATE DATOSPERSONALES
SET FECHA_ALTA = SYSDATE
WHERE CLAVE_EMPLEADO = V_ID_EMPLEADO;


DBMS_OUTPUT.PUT_LINE(VMENSAJE);


END;



BEGIN

    CAMBIODATOS('Almacen');
END;
SELECT * FROM DATOSPERSONALES ORDER BY FECHA_ALTA DESC;
