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


ALTER TABLE PROFESORES ADD CONSTRAINT FK_DATOS_PERSONALES1 FOREIGN KEY (DNI) REFERENCES DATOS_PERSONALES(DNI);
