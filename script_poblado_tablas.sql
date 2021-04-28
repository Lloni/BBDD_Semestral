-- SCRIPT POBLADO DE TABLAS

-- POBLADO TABLA ESTADO_CIVIL

INSERT INTO ESTADO_CIVIL VALUES (1,'Casado');
INSERT INTO ESTADO_CIVIL VALUES (2,'Conviviente civil');
INSERT INTO ESTADO_CIVIL VALUES (3,'Soltero');
INSERT INTO ESTADO_CIVIL VALUES (4,'Divorciado');
INSERT INTO ESTADO_CIVIL VALUES (5,'Viudo');
/
 
-- POBLADO TABLA NACIONALIDAD
INSERT INTO NACIONALIDAD VALUES (1, 'Chilena');
INSERT INTO NACIONALIDAD VALUES (2, 'Argentina');
INSERT INTO NACIONALIDAD VALUES (3, 'Canadiense');
INSERT INTO NACIONALIDAD VALUES (4, 'Peruana');
INSERT INTO NACIONALIDAD VALUES (5, 'Boliviana');
/

-- POBLADO TABLA REGION
INSERT INTO REGION VALUES(1, 'de Tarapac�');
INSERT INTO REGION VALUES(2, 'de Antofagasta');
INSERT INTO REGION VALUES(3, 'de Atacama');
INSERT INTO REGION VALUES(4, 'de Coquimbo');
INSERT INTO REGION VALUES(5, 'de Valpara�so');
INSERT INTO REGION VALUES(6, 'de OHiggins');
INSERT INTO REGION VALUES(7, 'del Maule');
INSERT INTO REGION VALUES(8, 'del Biob�o');
INSERT INTO REGION VALUES(9, 'de La Araucan�a');
INSERT INTO REGION VALUES(10, 'de Los Lagos');
INSERT INTO REGION VALUES(11, 'de Ays�n');
INSERT INTO REGION VALUES(12, 'de Magallanes');
INSERT INTO REGION VALUES(13, 'Metropolitana');
INSERT INTO REGION VALUES(14, 'de Los R�os');
INSERT INTO REGION VALUES(15, 'de Arica y Parinacota');
INSERT INTO REGION VALUES(16, 'de �uble');
/

-- POBLADO ENT_FIN, ANTES SE DEBER�A CREAR LA SECUENCIA
INSERT INTO ENT_FIN VALUES(1, 'Banco de Chile');
INSERT INTO ENT_FIN VALUES(2, 'Banco del Desarrollo');
INSERT INTO ENT_FIN VALUES(3, 'Banco Estado');
INSERT INTO ENT_FIN VALUES(4, 'Banco BCI');
INSERT INTO ENT_FIN VALUES(5, 'Banco Consorcio');


-- POBLADO TABLA SUBSIDIO, ANTES SE DEBER�A CREAR LA SECUENCIA
INSERT INTO SUBSIDIO VALUES (1, 'T�tulo I Tramo 1',2000,500,500,280);
INSERT INTO SUBSIDIO VALUES (2, 'T�tulo I Tramo 2',2500,216,500,350);
INSERT INTO SUBSIDIO VALUES (3, 'T�tulo II',3500,125,350,400);

-- POBLADO TABLA TIPO_VIVIENDA, ANTES SE DEBER�A CREAR LA SECUENCIA
INSERT INTO TIPO_VIVIENDA(id_tipo_vivienda, descripcion) VALUES (1, 'Casa');
INSERT INTO TIPO_VIVIENDA(id_tipo_vivienda, descripcion) VALUES (2, 'Departamento');


-- POBLADO TABLA POSTULANTE, ANTES SE DEBER�A CREAR LA SECUENCIA
-- TABLA EXCEL: https://docs.google.com/spreadsheets/d/1UlQSQyCT6tbVRYm2aaDOpCVf4Do5Mw6EfGF6GoHom1g/edit?usp=sharing
CREATE SEQUENCE seq_postulante_id_postulante
INCREMENT BY 1
START WITH 1024
MAXVALUE 99999
NOCACHE
NOCYCLE;

INSERT INTO postulante VALUES (seq_postulante_id_postulante.NEXTVAL,10432342,1,'16/04/1986','Ramon','Perez','Lamarca',1,null,null,1,null,null,null,null,null,'Calle 10 # 5-51',100, null);

INSERT INTO postulante VALUES (seq_postulante_id_postulante.NEXTVAL,11432342,3,'13/04/1986','Victoria','Ulloa','Lanata',1,null,null,1,null,null,null,null,null,'Calle 111',200, null);

INSERT INTO postulante VALUES (seq_postulante_id_postulante.NEXTVAL,12432342,4,'02/02/1979','Carla','Santamaria','Atreides',1,null,null,3,null,null,null,null,null,'Calle Nro 10 60 46 Piso 2',250, null);

INSERT INTO postulante VALUES (seq_postulante_id_postulante.NEXTVAL,13432342,1,'10/11/1989','Tomas','Lleco','Delgado',2,null,null,1,null,null,null,null,null,'Avda 26 Edificio Argos Torre 3 Piso 4',110, null);

INSERT INTO postulante VALUES (seq_postulante_id_postulante.NEXTVAL,14432342,3,'10/11/1989','Raquel','Marinez','Parks',2,null,null,1,null,null,null,null,null,'Calle 9 # 9� 62, Leticia, Barrio Centro',200, null);




-- POBLADO TABLA FORMULARIO, ANTES SE DEBER�A CREAR LA SECUENCIA
CREATE SEQUENCE seq_formulario_id_formulario
INCREMENT BY 5
START WITH 1000
MAXVALUE 99999
NOCACHE
NOCYCLE;

INSERT INTO FORMULARIO VALUES (seq_formulario_id_formulario.NEXTVAL,100,'25/05/2019','Juan P�rez',1,5000,1024);
INSERT INTO FORMULARIO VALUES (seq_formulario_id_formulario.NEXTVAL,101,'12/05/2019','Juana Solis',1,5000,1025);
INSERT INTO FORMULARIO VALUES (seq_formulario_id_formulario.NEXTVAL,102,'30/06/2019','Marcelo Mu�oz',1,5000,1026);
INSERT INTO FORMULARIO VALUES (seq_formulario_id_formulario.NEXTVAL,103,'25/08/2020','Pedro Correa',1,5000,1027);
INSERT INTO FORMULARIO VALUES (seq_formulario_id_formulario.NEXTVAL,104,'20/11/2020','Andrea Toloza',1,5000,1028);

-- POBLADO TABLA VIVIENDA, ANTES SE DEBER�A CREAR LA SECUENCIA
CREATE SEQUENCE seq_vivienda_id_vivienda
INCREMENT BY 5
START WITH 10
MAXVALUE 99999
NOCACHE
NOCYCLE;

INSERT INTO VIVIENDA VALUES(seq_vivienda_id_vivienda.NEXTVAL, 'Avenida La Paz',5000,null,null,null,null,140,1,1000);
INSERT INTO VIVIENDA VALUES(seq_vivienda_id_vivienda.NEXTVAL, 'Avenida La Alegr�a',3300,null,null,null,null,210,1,1005);
INSERT INTO VIVIENDA VALUES(seq_vivienda_id_vivienda.NEXTVAL, 'Avenida La Luz',1500,null,null,null,null,170,2,1010);
INSERT INTO VIVIENDA VALUES(seq_vivienda_id_vivienda.NEXTVAL, 'Avenida  Los Lagos',2200,null,null,null,null,120,1,1015);
INSERT INTO VIVIENDA VALUES(seq_vivienda_id_vivienda.NEXTVAL, 'Avenida La Esperanza',1000,null,null,null,null,200,2,1020);



--POBLADO TABLA ACREDITACIONES, ANTES SE DEBER�A CREAR LA SECUENCIA
INSERT INTO ACREDITACIONES VALUES (1,1024,'N',null,null,null,1,'Profesor',null,null,null);
INSERT INTO ACREDITACIONES VALUES (2,1025,'N',null,null,null,1,'M�dico',null,null,null);
INSERT INTO ACREDITACIONES VALUES (3,1026,'S','Rapa nui',null,null,1,'Asistente Social',null,null,null);
INSERT INTO ACREDITACIONES VALUES (4,1027,'N',null,null,null,2,'Analista Programador',null,null,null);
INSERT INTO ACREDITACIONES VALUES (5,1028,'N',null,null,null,0,'Sastre',null,null,null);



-- POBLADO TABLA CUENTA_AHORRO, ANTES SE DEBER�A CREAR LA SECUENCIA
CREATE SEQUENCE seq_cuenta_ahorro_nro_cuenta
INCREMENT BY 1
START WITH 1000
MAXVALUE 99999
NOCACHE
NOCYCLE;

INSERT INTO CUENTA_AHORRO VALUES (seq_cuenta_ahorro_nro_cuenta.NEXTVAL,'Cuenta de Ahorro',1,'02/02/2009',10000000,1024);
INSERT INTO CUENTA_AHORRO VALUES (seq_cuenta_ahorro_nro_cuenta.NEXTVAL,'Cuenta de Ahorro',1,'13/06/2017',8000000,1025);
INSERT INTO CUENTA_AHORRO VALUES (seq_cuenta_ahorro_nro_cuenta.NEXTVAL,'Cuenta de Ahorro',1,'02/08/2018',7600000,1026);
INSERT INTO CUENTA_AHORRO VALUES (seq_cuenta_ahorro_nro_cuenta.NEXTVAL,'Cuenta de Ahorro',1,'03/07/2011',12000000,1027);
INSERT INTO CUENTA_AHORRO VALUES (seq_cuenta_ahorro_nro_cuenta.NEXTVAL,'Cuenta de Ahorro',1,'02/06/2010',8500000,1028);

-- POBLADO TABLA CARGA_FAMILIAR, ANTES SE DEBER�A CREAR LA SECUENCIA
CREATE SEQUENCE seq_carga_familiar_id_carga
INCREMENT BY 1
START WITH 100
MAXVALUE 99999
NOCACHE
NOCYCLE;

INSERT INTO CARGA_FAMILIAR VALUES (seq_carga_familiar_id_carga.NEXTVAL,18224343,'4','P�rez','D�az','Mar�a',1024,'Hija');
INSERT INTO CARGA_FAMILIAR VALUES (seq_carga_familiar_id_carga.NEXTVAL,19424343,'6','Mu�oz','Garc�a','Jose',1025,'Hijo');
INSERT INTO CARGA_FAMILIAR VALUES (seq_carga_familiar_id_carga.NEXTVAL,18224443,'2','Rios','Puebla','Andrea',1026,'Hija');
INSERT INTO CARGA_FAMILIAR VALUES (seq_carga_familiar_id_carga.NEXTVAL,17214343,'1','Pacheco','Donoso','Martina',1027,'Hija');
INSERT INTO CARGA_FAMILIAR VALUES (seq_carga_familiar_id_carga.NEXTVAL,20244343,'7','Contreras','D�az','Diana',1028,'Hija');



-- POBLADO PUNTAJE_EDAD
INSERT INTO PUNTAJE_EDAD VALUES (1, 0, 29, 200);
INSERT INTO PUNTAJE_EDAD VALUES (2, 30, 40, 150);
INSERT INTO PUNTAJE_EDAD VALUES (3, 41, 200, 100);


-- POBLADO PUNTAJE_CARGA
INSERT INTO PUNTAJE_CARGA VALUES (1, 5, 100, 200);
INSERT INTO PUNTAJE_CARGA VALUES (2, 2, 4, 100);
INSERT INTO PUNTAJE_CARGA VALUES (3, 1, 1, 50);

--POBLADO PUNTAJE_AHORRO
INSERT INTO PUNTAJE_AHORRO VALUES (1, 8000000, 8999999, 200, 29070);
INSERT INTO PUNTAJE_AHORRO VALUES (2, 9000000, 10000000, 400, 29070);
INSERT INTO PUNTAJE_AHORRO VALUES (3, 10000001, 999999999, 500, 29070);

-- POBLADO PUNTAJE_ESTADO_CIVIL
INSERT INTO PUNTAJE_ESTADO_CIVIL VALUES(1, 'Casado', 100);
INSERT INTO PUNTAJE_ESTADO_CIVIL VALUES(2, 'Conviviente civil', 80);
INSERT INTO PUNTAJE_ESTADO_CIVIL VALUES(3, 'Soltero', 60);
INSERT INTO PUNTAJE_ESTADO_CIVIL VALUES(4, 'Divorciado', 40);
INSERT INTO PUNTAJE_ESTADO_CIVIL VALUES(5, 'Viudo', 20);


-- POBLADO PUNTAJE_TITULO
INSERT INTO PUNTAJE_TITULO VALUES(1, 'Posee t�tulo profesional', 200);
INSERT INTO PUNTAJE_TITULO VALUES(2, 'Posee t�tulo t�cnico', 100);


-- POBLADO PUNTAJE_REGION
INSERT INTO PUNTAJE_REGION VALUES(1, 30);
INSERT INTO PUNTAJE_REGION VALUES(2, 0);
INSERT INTO PUNTAJE_REGION VALUES(3, 0);
INSERT INTO PUNTAJE_REGION VALUES(4, 0);
INSERT INTO PUNTAJE_REGION VALUES(5, 0);
INSERT INTO PUNTAJE_REGION VALUES(6, 0);
INSERT INTO PUNTAJE_REGION VALUES(7, 0);
INSERT INTO PUNTAJE_REGION VALUES(8, 0);
INSERT INTO PUNTAJE_REGION VALUES(9, 0);
INSERT INTO PUNTAJE_REGION VALUES(10, 0);
INSERT INTO PUNTAJE_REGION VALUES(11, 100);
INSERT INTO PUNTAJE_REGION VALUES(12, 130);
INSERT INTO PUNTAJE_REGION VALUES(13, 0);
INSERT INTO PUNTAJE_REGION VALUES(14, 0);
INSERT INTO PUNTAJE_REGION VALUES(15, 50);

-- POBLADO ESTADO_POSTULACION
INSERT INTO ESTADO_POSTULACION VALUES(1, 'Beneficiado por el Subsidio', 'El postulante obtuvo un puntaje total mayor al puntaje promedio y ha sido beneficiado con el subsidio');
INSERT INTO ESTADO_POSTULACION VALUES(2, 'En espera por el Subsidio', 'El postulante obtuvo hasta 400 menos del puntaje promedio y queda en lista de espera. En el caso de que alguno de los beneficiados por el subsidio renuncie a �l, entonces ser� asignado a alguno de los postulantes en espera por el subsidio.');
INSERT INTO ESTADO_POSTULACION VALUES(3, 'No beneficiado por el Subsidio', 'El postulante obtuvo m�s de 400 por debajo del puntaje promedio.');