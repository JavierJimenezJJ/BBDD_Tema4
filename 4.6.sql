CREATE TABLE DIRECTOR (
DNI_DIRECTOR VARCHAR (9) NOT NULL,
NOMBRE_DIRECTOR VARCHAR (30) NOT NULL,
AP1_DIRECTOR VARCHAR (35) NOT NULL,
AP2_DIRECTOR VARCHAR (35) NULL,
DOMICILIO_DIRECTOR VARCHAR (30) NOT NULL,
TELEFONO_DIRECTOR NUMBER (9) NOT NULL,
EMAIL_DIRETOR VARCHAR (40) NULL,
CONSTRAINT DIRECTOR_PK PRIMARY KEY (DNI_DIRECTOR)
);

CREATE TABLE SUPERMERCADO (
COD_SUPER NUMBER (5) NOT NULL,
DIRECCION VARCHAR (30) NOT NULL,
SUPERFICIE NUMBER (5) NOT NULL,
ES_ALQUILER NUMBER(1) NOT NULL,
FECHA DATE NOT NULL,
DNI_DIRECTOR VARCHAR (9) NOT NULL,
CONSTRAINT FK_DIRECTOR FOREIGN KEY (DNI_DIRECTOR) REFERENCES DIRECTOR(DNI_DIRECTOR),
CONSTRAINT SUPERMERCADO_PK PRIMARY KEY (COD_SUPER),
CONSTRAINT CHECK_SUPERFICIE CHECK(SUPERFICIE>0)
);

CREATE TABLE VENDEDOR (
DNI_VERDEDOR VARCHAR (9) NOT NULL,
NOMBRE_VERDEDOR VARCHAR (30) NOT NULL,
AP1_VERDEDOR VARCHAR (35) NOT NULL,
AP2_VERDEDOR VARCHAR (35) NULL,
DOMICILIO_VERDEDOR VARCHAR (30) NOT NULL,
TELEFONO_VERDEDOR NUMBER (9) NOT NULL,
EMAIL_VERDEDOR VARCHAR (40) NULL,
COD_SUPER NUMBER (5) NOT NULL,
CONSTRAINT FK_SUPERMERCADO FOREIGN KEY (COD_SUPER) REFERENCES SUPERMERCADO(COD_SUPER) ON DELETE CASCADE,
CONSTRAINT VERDEDOR_PK PRIMARY KEY (DNI_VERDEDOR)
);

CREATE TABLE CLIENTE (
DNI_CLIENTE VARCHAR (9) NOT NULL,
NOMBRE_CLIENTE VARCHAR (30) NOT NULL,
AP1_CLIENTE VARCHAR (35) NOT NULL,
AP2_CLIENTE VARCHAR (35) NULL,
DOMICILIO_CLIENTE VARCHAR (30) NOT NULL,
TELEFONO_CLIENTE NUMBER (9) NOT NULL,
EMAIL_CLIENTE VARCHAR (40) NULL,
CONSTRAINT CLIENTE_PK PRIMARY KEY (DNI_CLIENTE)
);

CREATE TABLE VENTA (
COD_VENTA NUMBER (8) NOT NULL,
FECHA DATE NOT NULL,
DNI_VENDEDOR VARCHAR (9),
DNI_CLIENTE VARCHAR (9),
CONSTRAINT FK_VENDEDOR FOREIGN KEY (DNI_VENDEDOR) REFERENCES VENDEDOR(DNI_VERDEDOR)ON DELETE CASCADE,
CONSTRAINT FK_CLIENTE FOREIGN KEY (DNI_CLIENTE) REFERENCES CLIENTE(DNI_CLIENTE) ON DELETE CASCADE,
CONSTRAINT VENTA_PK PRIMARY KEY (COD_VENTA)
);

CREATE TABLE PRODUCTO (
COD_PRODUCTO NUMBER (12) NOT NULL,
DESCRIPCION VARCHAR (50) NOT NULL,
FAMILIA VARCHAR (35) NOT NULL,
GENERO VARCHAR (12) NOT NULL,
DESCUENTO NUMBER (2) DEFAULT (0) NULL,
IVA NUMBER (2) NOT NULL,
CONSTRAINT PRODUCTO_PK PRIMARY KEY (COD_PRODUCTO),
CONSTRAINT CHECK_PRODUCTO CHECK(DESCUENTO BETWEEN 0 AND 100),
CONSTRAINT CHECK_IVA CHECK(IVA IN (4,10,21))
);

CREATE TABLE PRECIO (
PRECIO NUMBER (5),
COD_PRODUCTO NUMBER (12),
FECHA DATE,
CONSTRAINT FK_PRODUCTO FOREIGN KEY (COD_PRODUCTO) REFERENCES PRODUCTO(COD_PRODUCTO),
CONSTRAINT PRECIO_PK PRIMARY KEY (FECHA),
CONSTRAINT CHECK_PRECIO CHECK(PRECIO BETWEEN 0.01 AND 9999.99)
);

CREATE TABLE LINEA_VENTA (
NUM_LINEA NUMBER (12) NOT NULL,
COD_VENTA NUMBER (8) NOT NULL,
COD_PRODUCTO NUMBER (12) NOT NULL,
FECHA DATE NOT NULL,
CANTIDAD NUMBER (3) NOT NULL,
CONSTRAINT FK_VENTA FOREIGN KEY (COD_VENTA) REFERENCES VENTA(COD_VENTA),
CONSTRAINT FK_PRODUCTOLV FOREIGN KEY (COD_PRODUCTO) REFERENCES PRODUCTO(COD_PRODUCTO),
CONSTRAINT FK_PRECIO FOREIGN KEY (FECHA) REFERENCES PRECIO(FECHA),
CONSTRAINT LINEA_VENTA_PK PRIMARY KEY (NUM_LINEA),
CONSTRAINT CHECK_CANTIDAD CHECK(CANTIDAD BETWEEN 1 AND 250)
);

CREATE TABLE DEVOLUCION (
FECHA_DEV DATE NOT NULL,
ESTADO VARCHAR (1) NOT NULL,
TIPO_DEV NUMBER (1) NOT NULL, 
NUM_LINEA NUMBER (12) NOT NULL,
COD_VENTA NUMBER (8) NOT NULL,
CONSTRAINT FK_VENTADEV FOREIGN KEY (COD_VENTA) REFERENCES VENTA(COD_VENTA),
CONSTRAINT FK_LINEA_VENTA FOREIGN KEY (NUM_LINEA) REFERENCES LINEA_VENTA(NUM_LINEA),
CONSTRAINT DEVOLUCION_PK PRIMARY KEY (FECHA_DEV),
CONSTRAINT CHECK_ESTADO CHECK(ESTADO IN ('B', 'M', 'F')),
CONSTRAINT CHECK_TIPO CHECK(TIPO_DEV BETWEEN 1 AND 5)
);



