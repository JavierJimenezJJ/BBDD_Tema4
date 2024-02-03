CREATE TABLE CLIENTE(
DNI_CLIENTE VARCHAR(9) NOT NULL,
NOMBRE_CLIENTE VARCHAR (30) NOT NULL,
AP1_CLIENTE VARCHAR (35) NOT NULL,
AP2_CLIENTE VARCHAR (35) NULL,
DOMICILIO_CLIENTE VARCHAR (20) NOT NULL,
NUMTARJETA NUMBER (18) NOT NULL,
CONSTRAINT CLIENTE_PK PRIMARY KEY(DNI_CLIENTE)
);

CREATE TABLE FABRICANTE (
COD_FABRICANTE NUMBER (10) NOT NULL,
NOMBRE_FABRICANTE VARCHAR(30) NOT NULL,
CONSTRAINT FABRICANTE_PK PRIMARY KEY(COD_FABRICANTE)
);

CREATE TABLE MARCA (
COD_MARCA NUMBER (10) NOT NULL,
NOMBRE_MARCA VARCHAR (30) NOT NULL,
CONSTRAINT MARCA_PK PRIMARY KEY(COD_MARCA)
);


CREATE TABLE VEHICULO (
  COD_VEHICULO NUMBER(10) NOT NULL,
  MODELO VARCHAR2(20) NOT NULL,
  MOTOR VARCHAR2(15) NOT NULL,
  TIPO VARCHAR2(17) NOT NULL,
  COLOR VARCHAR2(15) NOT NULL,
  COD_FABRICANTE NUMBER(10) NOT NULL,
  COD_MARCA NUMBER(10) NOT NULL,
  CONSTRAINT FK_FABRICANTE FOREIGN KEY (COD_FABRICANTE) REFERENCES FABRICANTE(COD_FABRICANTE),
  CONSTRAINT FK_MARCA FOREIGN KEY (COD_MARCA) REFERENCES MARCA(COD_MARCA),
  CONSTRAINT VEHICULO_PK PRIMARY KEY (COD_VEHICULO)
);

CREATE TABLE CURSO (
CODCURSO NUMBER (4),
DESCRIPCION VARCHAR (40),
NUMHORAS NUMBER (3),
FECHA DATE,
CONSTRAINT CURSO_PK PRIMARY KEY (CODCURSO)
);

CREATE TABLE EMPLEADO (
DNIEMPLEADO VARCHAR (9) NOT NULL,
NOMBRE_EMPLEADO VARCHAR (30) NOT NULL,
AP1_EMPLEADO VARCHAR (35) NOT NULL,
AP2_EMPLEADO VARCHAR (35) NULL,
DOMICILIO_EMPLEADO VARCHAR (30) NOT NULL,
CUENTABANCARIA VARCHAR (30) NOT NULL,
CONSTRAINT EMPLEADO_PK PRIMARY KEY (DNIEMPLEADO)
);

CREATE TABLE CURSOEMPLEADO (
CODCURSO NUMBER (4) NOT NULL,
DNIEMPLEADO VARCHAR (9) NOT NULL,
CONSTRAINT FK_CURSO FOREIGN KEY (CODCURSO) REFERENCES CURSO(CODCURSO),
CONSTRAINT FK_EMPLEADO FOREIGN KEY (DNIEMPLEADO) REFERENCES EMPLEADO(DNIEMPLEADO),
CONSTRAINT CURSOEMPLEADO_PK PRIMARY KEY (CODCURSO,DNIEMPLEADO)
);

CREATE TABLE OFICINA (
COD_OFICINA NUMBER (8) NOT NULL,
DIRECCION VARCHAR (30) NOT NULL,
TELEFONO NUMBER (9) NOT NULL,
CONSTRAINT OFICINA_PK PRIMARY KEY (COD_OFICINA)
);

CREATE TABLE ALQUILER (
COD_ALQUILER NUMBER (8) NOT NULL,
FECHA DATE NOT NULL,
NUM_DIAS NUMBER (2) NOT NULL,
KM_ACTUAL NUMBER (6) NOT NULL,
KM_ENTREGA NUMBER (6) NOT NULL,
DNI_CLIENTE VARCHAR (9) NOT NULL,
DNIEMPLEADO VARCHAR (9) NOT NULL,
COD_VEHICULO NUMBER (10) NOT NULL,
CONSTRAINT FK_CLIENTE FOREIGN KEY (DNI_CLIENTE) REFERENCES CLIENTE(DNI_CLIENTE),
CONSTRAINT FK_EMPLEADO2 FOREIGN KEY (DNIEMPLEADO) REFERENCES EMPLEADO(DNIEMPLEADO),
CONSTRAINT FK_VEHICULO FOREIGN KEY (COD_VEHICULO) REFERENCES VEHICULO(COD_VEHICULO),
CONSTRAINT ALQUILER_PK PRIMARY KEY (COD_ALQUILER)
);

CREATE TABLE OFICINAS_ALQUILER (
COD_ALQUILER NUMBER (8)NOT NULL,
COD_OFICINA NUMBER (8) NOT NULL,

CONSTRAINT FK_OFICINA FOREIGN KEY (COD_OFICINA) REFERENCES OFICINA(COD_OFICINA),
CONSTRAINT FK_ALQUILER FOREIGN KEY (COD_ALQUILER) REFERENCES ALQUILER(COD_ALQUILER),
CONSTRAINT OFICINAS_ALQUILER_PK PRIMARY KEY (COD_ALQUILER, COD_OFICINA)
);