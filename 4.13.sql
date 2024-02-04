CREATE TABLE PROFESORES (
    DNI VARCHAR(9) NOT NULL,
    NOMBRE VARCHAR(30) NOT NULL,
    APELLIDO1 VARCHAR(35) NOT NULL,
    APELLIDO2 VARCHAR(35) NULL,
    DIRECCION VARCHAR(30) NOT NULL,
    CUENTA_BANCARIA VARCHAR(20) NOT NULL,
    TELEFONO NUMBER (9) NOT NULL,
    CONSTRAINT PROFESORES_PK PRIMARY KEY (DNI)
);

CREATE TABLE CICLOFORM(
CODCICLO NUMBER (3),
NOMBRE VARCHAR (20),
TIPO VARCHAR (20),
CONSTRAINT CICLOFORM_PK PRIMARY KEY (CODCICLO)
);

CREATE TABLE ASIGNATURA (
CODASIG NUMBER (3) NOT NULL,
NOMBRE VARCHAR (20) NOT NULL,
NUMHORAS NUMBER(3) NOT NULL,
DNI VARCHAR (9) NOT NULL,
CODCICLO NUMBER (3) NOT NULL,
CONSTRAINT FK_PROFESORES
FOREIGN KEY (DNI)
REFERENCES PROFESORES(DNI),
CONSTRAINT FK_CICLOFORM
FOREIGN KEY (CODCICLO)
REFERENCES CICLOFORM(CODCICLO),
CONSTRAINT ASIGNATURA_PK PRIMARY KEY (CODASIG)
);

CREATE TABLE IDIOMA (
    CODIDIOMA NUMBER(3),
    DESCRIPCION VARCHAR (20),
    CONSTRAINT IDIOMA_PK PRIMARY KEY (CODIDIOMA)
);

CREATE TABLE ALUMNO(
    DNI VARCHAR(9) NOT NULL,
    NOMBRE VARCHAR(30) NOT NULL,
    APELLIDO1 VARCHAR(35) NOT NULL,
    APELLIDO2 VARCHAR(35) NULL,
    DIRECCION VARCHAR(30) NOT NULL,
    EMAIL VARCHAR(30) NOT NULL,
    TELEFONO NUMBER (9) NOT NULL,
    CODIDIOMA NUMBER(3) NULL,
    CONSTRAINT FK_IDIOMA
    FOREIGN KEY (CODIDIOMA)
    REFERENCES IDIOMA(CODIDIOMA),
    CONSTRAINT ALUMNO_PK PRIMARY KEY (DNI)
);

CREATE TABLE MATRICULA (
    DNI VARCHAR (9) NOT NULL,
    CODASIG NUMBER(3)NOT NULL,
    CONSTRAINT FK_ALUMNO
    FOREIGN KEY (DNI)
    REFERENCES ALUMNO(DNI),
    CONSTRAINT FK_ASIGNATURA
    FOREIGN KEY (CODASIG)
    REFERENCES ASIGNATURA(CODASIG),
    CONSTRAINT MATRICULA_PK PRIMARY KEY (DNI,CODASIG) 
);

CREATE TABLE IDIOMASPROF (
    DNI VARCHAR (9),
    CODIDIOMA NUMBER (3),
    CONSTRAINT FK_DPROFESORES
    FOREIGN KEY (DNI)
    REFERENCES PROFESORES(DNI),
    CONSTRAINT FK_DIDIOMA
    FOREIGN KEY (CODIDIOMA)
    REFERENCES IDIOMA(CODIDIOMA),
    CONSTRAINT IDIOMASPROF_PK PRIMARY KEY (DNI,CODIDIOMA)
);

CREATE TABLE DATOS_PERSONALES(
DNI VARCHAR (9) NOT NULL,
NOMBRE VARCHAR (30) NOT NULL,
AP1 VARCHAR (35) NOT NULL,
AP2 VARCHAR (35) NULL,
EMAIL VARCHAR (40) NULL,
TELEFONO NUMBER (9),
CONSTRAINT DATOS_PERSONALES_PK PRIMARY KEY (DNI)
);


CREATE TABLE GRADOS

ALTER TABLE PROFESORES ADD CONSTRAINT FK_DATOS_PERSONALES1 FOREIGN KEY (DNI) REFERENCES DATOS_PERSONALES(DNI);


INSERT INTO ALUMNO (DNI,NOMBRE,APELLIDO1,APELLIDO2,DIRECCION,TELEFONO, EMAIL) VALUES ('71654896M','MARTA','MARTIN', 'RODRIGUEZ','MIRAVILLA',983652148, 'marta.mr@gmail.com');
INSERT INTO ALUMNO (DNI,NOMBRE,APELLIDO1,APELLIDO2,DIRECCION,TELEFONO, EMAIL) VALUES ('44103779F','JESUS','LOPEZ', 'ANTON','LOPEZ GOMEZ',44103779F, 'pedro.dh@gmail.com');
INSERT INTO ALUMNO (DNI,NOMBRE,APELLIDO1,APELLIDO2,DIRECCION,TELEFONO, EMAIL) VALUES ('45986321N','ANDREA','RIVAS', 'ALONSO','SALUC',622254789, 'andrea.ra@gmail.com');
INSERT INTO ALUMNO (DNI,NOMBRE,APELLIDO1,APELLIDO2,DIRECCION,TELEFONO, EMAIL) VALUES ('71056984D','MIRIAM','ALONSO', 'BERODAS','PASEO ZORRILLA',645897123, 'miriam.ab@gmail.com');

INSERT INTO DATOS_PERSONALES (DNI,NOMBRE,AP1,AP2,TELEFONO) VALUES ('11526987G','PEDRO','DIAZ', 'HERNANDEZ',698741236);
INSERT INTO DATOS_PERSONALES (DNI,NOMBRE,AP1,AP2,TELEFONO) VALUES ('89621477A','LUIS','VILA', 'GOMEZ',654710236);

INSERT INTO IDIOMA (CODIDIOMA,DESCRIPCION) VALUES (20,'INGLES');
INSERT INTO IDIOMA (CODIDIOMA,DESCRIPCION) VALUES (30,'ESPA�OL');

INSERT INTO CICLOFORM (CODCICLO,NOMBRE,TIPO) VALUES (156,'DAM', 'GS');
INSERT INTO CICLOFORM (CODCICLO,NOMBRE,TIPO) VALUES (259,'SMR', 'GM');
INSERT INTO CICLOFORM (CODCICLO,NOMBRE,TIPO) VALUES (148,'ARI', 'GS');

INSERT INTO PROFESORES (DNI, CUENTA_BANCARIA) VALUES ('11526987G','ES200239934839609');

INSERT INTO ASIGNATURA (CODASIG,NOMBRE,NUMHORAS,DNI,CODCICLO) VALUES (1,'EMPRESA',128,'11526987G', 156);
INSERT INTO ASIGNATURA (CODASIG,NOMBRE,NUMHORAS,DNI,CODCICLO) VALUES (2,'INFORMATICAINDUST',269,'11526987G', 156);
INSERT INTO ASIGNATURA (CODASIG,NOMBRE,NUMHORAS,DNI,CODCICLO) VALUES (3,'APLICACIONES WEB',200,'89621477A', 259);
INSERT INTO ASIGNATURA (CODASIG,NOMBRE,NUMHORAS,DNI,CODCICLO) VALUES (4,'EMPRESA',128,'89621477A', 148);
INSERT INTO ASIGNATURA (CODASIG,NOMBRE,NUMHORAS,DNI,CODCICLO) VALUES (5,'EMPRESA',128,'89621477A', 259);

INSERT INTO IDIOMASPROF (DNI,CODIDIOMA) VALUES ('11526987G','30');
INSERT INTO IDIOMASPROF (DNI,CODIDIOMA) VALUES ('89621477A','20');
INSERT INTO IDIOMASPROF (DNI,CODIDIOMA) VALUES ('89621477A','30');

INSERT INTO MATRICULA (DNI,CODASIG) VALUES ('71654896M','1');
INSERT INTO MATRICULA (DNI,CODASIG) VALUES ('44103779F','2');
INSERT INTO MATRICULA (DNI,CODASIG) VALUES ('45986321N','3');
INSERT INTO MATRICULA (DNI,CODASIG) VALUES ('71056984D','4');
INSERT INTO MATRICULA (DNI,CODASIG) VALUES ('71654896M','5');
INSERT INTO MATRICULA (DNI,CODASIG) VALUES ('44103779F','1');


SELECT NOMBRE, APELLIDO
FROM PROFESORES
WHERE CODIDIOMA = 'ESPA�OL';

SELECT *
FROM ASIGNATURA
WHERE CODCICLO = 156;

SELECT DNI,CUENTA_BANCARIA
FROM PROFESORES;

SELECT * 
FROM ALUMNO;

SELECT P.*
FROM PROFESORES P
JOIN DATOS_PERSONALES DP ON P.DNI = DP.DNI;

SELECT *
FROM CICLOFORM
WHERE TIPO = 'GS';

SELECT NOMBRE,CODCICLO 
FROM CICLOFORM;

SELECT NUMHORAS
FROM ASIGNATURA
WHERE NUMHORAS<200;

UPDATE ALUMNO
SET APELLIDO2 = NULL,
    NOMBRE = 'Andrea'
WHERE NOMBRE = 'Andrea' AND APELLIDO2 IS NOT NULL;



UPDATE ASIGNATURA
SET NOMBRE = 'BBDD'
WHERE NOMBRE = 'EMPRESA';

INSERT INTO CICLOFORM (CODCICLO, NOMBRE)
VALUES (636, 'ELEC');


INSERT INTO ASIGNATURA (NOMBRE, NUMHORAS, CODASIG,DNI,CODCICLO) VALUES ('CIRCUITOS', 100,123, '11526987G',156);

INSERT INTO IDIOMA (CODIDIOMA, DESCRIPCION)
VALUES (50, 'ALEMAN');






