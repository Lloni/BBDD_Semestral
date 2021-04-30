-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2021-04-29 19:58:28 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE antecedentes_academicos (
    id_ant_acad     NUMBER(5) NOT NULL,
    tipo_estudio    VARCHAR2(20),
    nom_carrera     VARCHAR2(30) NOT NULL,
    fecha_titulo    DATE NOT NULL,
    nota_titulo     NUMBER(2, 1) NOT NULL,
    id_postulante   NUMBER(10) NOT NULL,
    id_institucion  NUMBER(4) NOT NULL
);

ALTER TABLE antecedentes_academicos
    ADD CONSTRAINT nota_titulo_chk CHECK ( nota_titulo >= 4.0 );

ALTER TABLE antecedentes_academicos ADD CONSTRAINT antecedentes_academicos_pk PRIMARY KEY ( id_ant_acad );

CREATE TABLE ciudad (
    id_ciudad    NUMBER(2) NOT NULL,
    desc_ciudad  VARCHAR2(20) NOT NULL,
    id_pais      NUMBER(3) NOT NULL,
    id_region    NUMBER(2)
);

ALTER TABLE ciudad ADD CONSTRAINT ciudad_pk PRIMARY KEY ( id_ciudad );

CREATE TABLE criterio_evaluacion (
    id_criterio    NUMBER(1) NOT NULL,
    desc_criterio  VARCHAR2(30) NOT NULL,
    porcentaje     NUMBER(2) NOT NULL
);

ALTER TABLE criterio_evaluacion ADD CONSTRAINT criterio_evaluacion_pk PRIMARY KEY ( id_criterio );

CREATE TABLE doc_extranjero (
    id_doc_extranjero  NUMBER(4) NOT NULL,
    pasaporte          VARCHAR2(20) NOT NULL,
    visa               VARCHAR2(20) NOT NULL
);

ALTER TABLE doc_extranjero ADD CONSTRAINT doc_extranjero_pk PRIMARY KEY ( id_doc_extranjero );

CREATE TABLE error_sistema (
    id_error       NUMBER(4) NOT NULL,
    modulo_error   VARCHAR2(50) NOT NULL,
    mensaje_error  VARCHAR2(100) NOT NULL
);

ALTER TABLE error_sistema ADD CONSTRAINT error_sistema_pk PRIMARY KEY ( id_error );

CREATE TABLE estado_civil (
    id_est_civil    NUMBER(1) NOT NULL,
    desc_est_civil  VARCHAR2(20) NOT NULL
);

ALTER TABLE estado_civil ADD CONSTRAINT estado_civil_pk PRIMARY KEY ( id_est_civil );

CREATE TABLE exp_laboral (
    id_exp_laboral      NUMBER(2) NOT NULL,
    nom_empresa         VARCHAR2(30),
    inicio_exp_laboral  DATE NOT NULL,
    fin_exp_laboral     DATE NOT NULL,
    id_postulante       NUMBER(10) NOT NULL
);

ALTER TABLE exp_laboral ADD CONSTRAINT exp_laboral_pk PRIMARY KEY ( id_exp_laboral );

CREATE TABLE institucion (
    id_institucion    NUMBER(4) NOT NULL,
    desc_institucion  VARCHAR2(20) NOT NULL,
    ranking           NUMBER(3) NOT NULL,
    url_institucion   VARCHAR2(50),
    id_ciudad         NUMBER(2) NOT NULL
);

ALTER TABLE institucion ADD CONSTRAINT institucion_pk PRIMARY KEY ( id_institucion );

ALTER TABLE institucion ADD CONSTRAINT institucion_id_institucion_un UNIQUE ( id_institucion );

CREATE TABLE nacionalidad (
    id_nacionalidad  NUMBER(3) NOT NULL,
    nacionalidad     VARCHAR2(30) NOT NULL
);

ALTER TABLE nacionalidad ADD CONSTRAINT nacionalidad_pk PRIMARY KEY ( id_nacionalidad );

CREATE TABLE pais (
    id_pais    NUMBER(3) NOT NULL,
    desc_pais  VARCHAR2(20) NOT NULL
);

ALTER TABLE pais ADD CONSTRAINT pais_pk PRIMARY KEY ( id_pais );

CREATE TABLE postulacion (
    id_postulacion        NUMBER(10) NOT NULL,
    fecha_postulacion     DATE NOT NULL,
    evalua_objetivo       VARCHAR2(15) NOT NULL,
    evalua_retribucion    VARCHAR2(15) NOT NULL,
    evalua_doce_inve      VARCHAR2(15) NOT NULL,
    id_postulante         NUMBER(10) NOT NULL,
    cert_ced_identidad    BLOB NOT NULL,
    cert_perm_definitiva  BLOB NOT NULL,
    cert_titulo_med       BLOB NOT NULL,
    cert_notas_pregrado   BLOB NOT NULL,
    cert_titulo_esp       BLOB NOT NULL,
    cert_laboral          BLOB NOT NULL,
    cert_idioma           BLOB NOT NULL
);

ALTER TABLE postulacion ADD CONSTRAINT postulacion_pk PRIMARY KEY ( id_postulacion );

CREATE TABLE postulante (
    id_postulante      NUMBER(10) NOT NULL,
    ap_paterno         VARCHAR2(20) NOT NULL,
    ap_materno         VARCHAR2(20) NOT NULL,
    pri_nombre         VARCHAR2(20) NOT NULL,
    seg_nombre         VARCHAR2(20),
    num_run            NUMBER(8) NOT NULL,
    dv_run             CHAR(1) NOT NULL,
    fecha_naci         DATE NOT NULL,
    pasaporte          VARCHAR2(20),
    visa               VARCHAR2(20),
    sexo               CHAR(1),
    direccion          VARCHAR2(50) NOT NULL,
    num_hijos          NUMBER(2),
    discap_fisica      CHAR(1) NOT NULL,
    estado_civil       NUMBER(1) NOT NULL,
    pueblo_originario  NUMBER(2),
    id_ciudad          NUMBER(2) NOT NULL,
    id_nacionalidad    NUMBER(3) NOT NULL,
    id_doc_extranjero  NUMBER(4)
);

ALTER TABLE postulante
    ADD CONSTRAINT num_run_chk CHECK ( num_run BETWEEN '0000001' AND '99999999' );

ALTER TABLE postulante
    ADD CONSTRAINT dv_run_chk CHECK ( dv_run IN (
        '1',
        '2',
        '3',
        '4',
        '5',
        '6',
        '7',
        '8',
        '9',
        '0',
        'k',
        'K'
    ) );

ALTER TABLE postulante add constraint sexo_chk check(sexo IN f, m) 
;

ALTER TABLE postulante ADD CONSTRAINT postulante_pk PRIMARY KEY ( id_postulante );

ALTER TABLE postulante ADD CONSTRAINT postulante_num_run_un UNIQUE ( num_run );

CREATE TABLE ptje_act_docencia (
    nivel_act  VARCHAR2(10) NOT NULL,
    puntos     NUMBER(1) NOT NULL
);

ALTER TABLE ptje_act_docencia ADD CONSTRAINT ptje_act_docencia_pk PRIMARY KEY ( nivel_act );

CREATE TABLE ptje_antec_academicos (
    nota_min  NUMBER(2, 1) NOT NULL,
    nota_max  NUMBER(2, 1) NOT NULL,
    puntos    NUMBER(1) NOT NULL
);

ALTER TABLE ptje_antec_academicos ADD CONSTRAINT ptje_antec_academicos_pk PRIMARY KEY ( nota_min );

CREATE TABLE ptje_decl_interes (
    evaluacion  VARCHAR2(15) NOT NULL,
    puntos      NUMBER(1) NOT NULL
);

ALTER TABLE ptje_decl_interes ADD CONSTRAINT ptje_decl_interes_pk PRIMARY KEY ( evaluacion );

CREATE TABLE ptje_edad (
    edad_min  NUMBER(2) NOT NULL,
    edad_max  NUMBER(2) NOT NULL,
    puntos    NUMBER(1) NOT NULL
);

ALTER TABLE ptje_edad ADD CONSTRAINT ptje_edad_pk PRIMARY KEY ( edad_min );

CREATE TABLE ptje_estado_civil (
    desc_estado_civil  VARCHAR2(15) NOT NULL,
    puntos             NUMBER(1) NOT NULL
);

ALTER TABLE ptje_estado_civil ADD CONSTRAINT ptje_estado_civil_pk PRIMARY KEY ( desc_estado_civil );

CREATE TABLE ptje_exp_laboral (
    anos_exp  NUMBER(2) NOT NULL,
    puntos    NUMBER(1) NOT NULL
);

ALTER TABLE ptje_exp_laboral ADD CONSTRAINT ptje_exp_laboral_pk PRIMARY KEY ( anos_exp );

CREATE TABLE ptje_objetivo_est (
    evaluacion  VARCHAR2(15) NOT NULL,
    puntos      NUMBER(1) NOT NULL
);

ALTER TABLE ptje_objetivo_est ADD CONSTRAINT ptje_objetivo_est_pk PRIMARY KEY ( evaluacion );

CREATE TABLE ptje_ranking (
    posicion_min  NUMBER(2) NOT NULL,
    posicion_max  NUMBER(2) NOT NULL,
    puntos        NUMBER(1) NOT NULL
);

ALTER TABLE ptje_ranking ADD CONSTRAINT ptje_ranking_pk PRIMARY KEY ( posicion_min );

CREATE TABLE ptje_retribucion (
    evaluacion  VARCHAR2(15) NOT NULL,
    putnos      NUMBER(1) NOT NULL
);

ALTER TABLE ptje_retribucion ADD CONSTRAINT ptje_retribucion_pk PRIMARY KEY ( evaluacion );

CREATE TABLE ptje_zona_extrema (
    nom_region  VARCHAR2(20) NOT NULL,
    puntos      NUMBER(1) NOT NULL
);

ALTER TABLE ptje_zona_extrema ADD CONSTRAINT ptje_zona_extrema_pk PRIMARY KEY ( nom_region );

CREATE TABLE pueblo_originario (
    id_pue_ori    NUMBER(2) NOT NULL,
    desc_pue_ori  VARCHAR2(30) NOT NULL
);

ALTER TABLE pueblo_originario ADD CONSTRAINT pueblo_originario_pk PRIMARY KEY ( id_pue_ori );

CREATE TABLE puntaje_asignado (
    id_postulante  NUMBER(10) NOT NULL,
    puntaje        NUMBER(6) NOT NULL
);

ALTER TABLE puntaje_asignado ADD CONSTRAINT puntaje_asignado_pk PRIMARY KEY ( id_postulante );

CREATE TABLE region (
    id_region    NUMBER(2) NOT NULL,
    desc_region  VARCHAR2(20) NOT NULL
);

ALTER TABLE region ADD CONSTRAINT region_pk PRIMARY KEY ( id_region );

CREATE TABLE subespecialidad (
    id_subespecialidad  NUMBER(5) NOT NULL,
    nombre_subesp       VARCHAR2(30) NOT NULL,
    idioma              VARCHAR2(20),
    annos_duracion      NUMBER(2),
    id_postulacion      NUMBER(10) NOT NULL,
    id_institucion      NUMBER(4) NOT NULL
);

ALTER TABLE subespecialidad ADD CONSTRAINT subespecialidad_pk PRIMARY KEY ( id_subespecialidad );

ALTER TABLE antecedentes_academicos
    ADD CONSTRAINT ant_ac_inst_fk FOREIGN KEY ( id_institucion )
        REFERENCES institucion ( id_institucion );

ALTER TABLE antecedentes_academicos
    ADD CONSTRAINT ant_ac_post_fk FOREIGN KEY ( id_postulante )
        REFERENCES postulante ( id_postulante );

ALTER TABLE ciudad
    ADD CONSTRAINT ciudad_pais_fk FOREIGN KEY ( id_pais )
        REFERENCES pais ( id_pais );

ALTER TABLE ciudad
    ADD CONSTRAINT ciudad_region_fk FOREIGN KEY ( id_region )
        REFERENCES region ( id_region );

ALTER TABLE exp_laboral
    ADD CONSTRAINT exp_laboral_postulante_fk FOREIGN KEY ( id_postulante )
        REFERENCES postulante ( id_postulante );

ALTER TABLE institucion
    ADD CONSTRAINT institucion_ciudad_fk FOREIGN KEY ( id_ciudad )
        REFERENCES ciudad ( id_ciudad );

ALTER TABLE postulante
    ADD CONSTRAINT post_doc_fk FOREIGN KEY ( id_doc_extranjero )
        REFERENCES doc_extranjero ( id_doc_extranjero );

ALTER TABLE postulante
    ADD CONSTRAINT post_pue_or_fk FOREIGN KEY ( pueblo_originario )
        REFERENCES pueblo_originario ( id_pue_ori );

ALTER TABLE postulacion
    ADD CONSTRAINT postulacion_postulante_fk FOREIGN KEY ( id_postulante )
        REFERENCES postulante ( id_postulante );

ALTER TABLE postulante
    ADD CONSTRAINT postulante_ciudad_fk FOREIGN KEY ( id_ciudad )
        REFERENCES ciudad ( id_ciudad );

ALTER TABLE postulante
    ADD CONSTRAINT postulante_estado_civil_fk FOREIGN KEY ( estado_civil )
        REFERENCES estado_civil ( id_est_civil );

ALTER TABLE postulante
    ADD CONSTRAINT postulante_nacionalidad_fk FOREIGN KEY ( id_nacionalidad )
        REFERENCES nacionalidad ( id_nacionalidad );

ALTER TABLE puntaje_asignado
    ADD CONSTRAINT punt_asig_post_fk FOREIGN KEY ( id_postulante )
        REFERENCES postulante ( id_postulante );

ALTER TABLE subespecialidad
    ADD CONSTRAINT subespecialidad_institucion_fk FOREIGN KEY ( id_institucion )
        REFERENCES institucion ( id_institucion );

ALTER TABLE subespecialidad
    ADD CONSTRAINT subespecialidad_postulacion_fk FOREIGN KEY ( id_postulacion )
        REFERENCES postulacion ( id_postulacion );

CREATE SEQUENCE antecedentes_academicos_id_ant START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER antecedentes_academicos_id_ant BEFORE
    INSERT ON antecedentes_academicos
    FOR EACH ROW
    WHEN ( new.id_ant_acad IS NULL )
BEGIN
    :new.id_ant_acad := antecedentes_academicos_id_ant.nextval;
END;
/

CREATE SEQUENCE ciudad_id_ciudad_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER ciudad_id_ciudad_trg BEFORE
    INSERT ON ciudad
    FOR EACH ROW
    WHEN ( new.id_ciudad IS NULL )
BEGIN
    :new.id_ciudad := ciudad_id_ciudad_seq.nextval;
END;
/

CREATE SEQUENCE criterio_evaluacion_id_criteri START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER criterio_evaluacion_id_criteri BEFORE
    INSERT ON criterio_evaluacion
    FOR EACH ROW
    WHEN ( new.id_criterio IS NULL )
BEGIN
    :new.id_criterio := criterio_evaluacion_id_criteri.nextval;
END;
/

CREATE SEQUENCE error_sistema_id_error_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER error_sistema_id_error_trg BEFORE
    INSERT ON error_sistema
    FOR EACH ROW
    WHEN ( new.id_error IS NULL )
BEGIN
    :new.id_error := error_sistema_id_error_seq.nextval;
END;
/

CREATE SEQUENCE estado_civil_id_est_civil_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER estado_civil_id_est_civil_trg BEFORE
    INSERT ON estado_civil
    FOR EACH ROW
    WHEN ( new.id_est_civil IS NULL )
BEGIN
    :new.id_est_civil := estado_civil_id_est_civil_seq.nextval;
END;
/

CREATE SEQUENCE exp_laboral_id_exp_laboral_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER exp_laboral_id_exp_laboral_trg BEFORE
    INSERT ON exp_laboral
    FOR EACH ROW
    WHEN ( new.id_exp_laboral IS NULL )
BEGIN
    :new.id_exp_laboral := exp_laboral_id_exp_laboral_seq.nextval;
END;
/

CREATE SEQUENCE institucion_id_institucion_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER institucion_id_institucion_trg BEFORE
    INSERT ON institucion
    FOR EACH ROW
    WHEN ( new.id_institucion IS NULL )
BEGIN
    :new.id_institucion := institucion_id_institucion_seq.nextval;
END;
/

CREATE SEQUENCE nacionalidad_id_nacionalidad START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER nacionalidad_id_nacionalidad BEFORE
    INSERT ON nacionalidad
    FOR EACH ROW
    WHEN ( new.id_nacionalidad IS NULL )
BEGIN
    :new.id_nacionalidad := nacionalidad_id_nacionalidad.nextval;
END;
/

CREATE SEQUENCE pais_id_pais_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER pais_id_pais_trg BEFORE
    INSERT ON pais
    FOR EACH ROW
    WHEN ( new.id_pais IS NULL )
BEGIN
    :new.id_pais := pais_id_pais_seq.nextval;
END;
/

CREATE SEQUENCE postulacion_id_postulacion_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER postulacion_id_postulacion_trg BEFORE
    INSERT ON postulacion
    FOR EACH ROW
    WHEN ( new.id_postulacion IS NULL )
BEGIN
    :new.id_postulacion := postulacion_id_postulacion_seq.nextval;
END;
/

CREATE SEQUENCE postulante_id_postulante_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER postulante_id_postulante_trg BEFORE
    INSERT ON postulante
    FOR EACH ROW
    WHEN ( new.id_postulante IS NULL )
BEGIN
    :new.id_postulante := postulante_id_postulante_seq.nextval;
END;
/

CREATE SEQUENCE pueblo_originario_id_pue_ori START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER pueblo_originario_id_pue_ori BEFORE
    INSERT ON pueblo_originario
    FOR EACH ROW
    WHEN ( new.id_pue_ori IS NULL )
BEGIN
    :new.id_pue_ori := pueblo_originario_id_pue_ori.nextval;
END;
/

CREATE SEQUENCE region_id_region_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER region_id_region_trg BEFORE
    INSERT ON region
    FOR EACH ROW
    WHEN ( new.id_region IS NULL )
BEGIN
    :new.id_region := region_id_region_seq.nextval;
END;
/

CREATE SEQUENCE subespecialidad_id_subespecial START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER subespecialidad_id_subespecial BEFORE
    INSERT ON subespecialidad
    FOR EACH ROW
    WHEN ( new.id_subespecialidad IS NULL )
BEGIN
    :new.id_subespecialidad := subespecialidad_id_subespecial.nextval;
END;
/



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            26
-- CREATE INDEX                             0
-- ALTER TABLE                             47
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          14
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                         14
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
