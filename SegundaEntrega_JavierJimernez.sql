CREATE TABLE DESCUENTO (
CODIGO_DESCUENTO VARCHAR(4),
PORCENTAJE NUMBER (2),
TIPO_EMPLEADO VARCHAR(30),
CONSTRAINT PK_DESCUENTO PRIMARY KEY (CODIGO_DESCUENTO)
);

CREATE TABLE TRABAJADORES (
DNI VARCHAR(9),
NOMBRE VARCHAR (30),
PRAPELLIDO VARCHAR(30),
SGAPELLIDO VARCHAR(30),
NUM_COLEGIADO NUMBER(5),
NUM_CUENTA VARCHAR(24),
NUM_TELEFONO NUMBER (9),
COD_DESCUENTO VARCHAR (4),
CONSTRAINT PK_TRABAJADORES PRIMARY KEY(DNI),
CONSTRAINT TRABAJADORES_FK FOREIGN KEY (COD_DESCUENTO) REFERENCES DESCUENTO(CODIGO_DESCUENTO)
);

CREATE TABLE CAMARERO (
CODIGO_CAMARERO NUMBER(4),
NOMBRE_USUARIO VARCHAR(30),
TIPO_EMPLEADO VARCHAR(20)CHECK (TIPO_EMPLEADO IN ('JEFE DE TURNO', 'ENCARGADO', 'CAMARERO')),
NOMBRE VARCHAR (30),
CONSTRAINT PK_CAMARERO PRIMARY KEY (CODIGO_CAMARERO)
);


CREATE TABLE PROVEEDOR (
CIF VARCHAR(8),
NOMBRE VARCHAR (30),
CIUDAD VARCHAR (30),
TELEFONO NUMBER (9),

CONSTRAINT PK_PROVEEDOR PRIMARY KEY(CIF)
);

CREATE TABLE PRODUCTO (
CODIGO_PRODUCTO NUMBER(3),
STOCK NUMBER(3),
NOMBRE_PRODUCTO VARCHAR(30),
CIF VARCHAR(8),
ALERGENOS VARCHAR(30) CHECK (ALERGENOS IN ('LACTOSA','GLUTEN','FRUTOS SECOS', 'HUEVO')),
FECHA_ENVASADO NUMBER(30),
CONSTRAINT PK_PRODUCTO PRIMARY KEY (CODIGO_PRODUCTO),
CONSTRAINT PRODUCTO_FK FOREIGN KEY (CIF) REFERENCES PROVEEDOR(CIF)
);

CREATE TABLE VENTA (
CODIGO_VENTA VARCHAR(9),
FECHA_VENTA DATE,
PRECIO NUMBER (4),
NUM_TICKET NUMBER(6),
COD_EMPLEADO NUMBER(4),
DNI VARCHAR(9),
COD_PRODUCTO NUMBER(3),
CANTIDAD NUMBER(6),

CONSTRAINT PK_VENTA PRIMARY KEY (CODIGO_VENTA),
CONSTRAINT VENTA_FK FOREIGN KEY (COD_EMPLEADO) REFERENCES CAMARERO(CODIGO_CAMARERO),
CONSTRAINT VENTA_FK2 FOREIGN KEY (DNI) REFERENCES TRABAJADORES(DNI),
CONSTRAINT VENTA_FK3 FOREIGN KEY (COD_PRODUCTO) REFERENCES PRODUCTO(CODIGO_PRODUCTO)
);
