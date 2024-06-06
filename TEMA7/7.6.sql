SET SERVEROUTPUT ON;
CREATE TYPE profesor UNDER tobjdatosP (
    fecha_incorporacion DATE);
CREATE TYPE alumno UNDER tobjdatosP (
    calificacion_1trimestre NUMBER,
    calificacion_2trimestre NUMBER,
    calificacion_3trimestre NUMBER,
    calificacion_4trimestre NUMBER);