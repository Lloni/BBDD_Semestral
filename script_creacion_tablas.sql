--BORRAR TABLAS

DROP TABLE antecedentes_academicos CASCADE CONSTRAINTS;

DROP TABLE ciudad CASCADE CONSTRAINTS;

DROP TABLE criterio_evaluacion CASCADE CONSTRAINTS;

DROP TABLE doc_extranjero CASCADE CONSTRAINTS;

DROP TABLE error_sistema CASCADE CONSTRAINTS;

DROP TABLE estado_civil CASCADE CONSTRAINTS;

DROP TABLE exp_laboral CASCADE CONSTRAINTS;

DROP TABLE institucion CASCADE CONSTRAINTS;

DROP TABLE nacionalidad CASCADE CONSTRAINTS;

DROP TABLE pais CASCADE CONSTRAINTS;

DROP TABLE postulacion CASCADE CONSTRAINTS;

DROP TABLE postulante CASCADE CONSTRAINTS;

DROP TABLE ptje_act_docencia CASCADE CONSTRAINTS;

DROP TABLE ptje_antec_academicos CASCADE CONSTRAINTS;

DROP TABLE ptje_decl_interes CASCADE CONSTRAINTS;

DROP TABLE ptje_edad CASCADE CONSTRAINTS;

DROP TABLE ptje_estado_civil CASCADE CONSTRAINTS;

DROP TABLE ptje_exp_laboral CASCADE CONSTRAINTS;

DROP TABLE ptje_objetivo_est CASCADE CONSTRAINTS;

DROP TABLE ptje_ranking CASCADE CONSTRAINTS;

DROP TABLE ptje_retribucion CASCADE CONSTRAINTS;

DROP TABLE ptje_zona_extrema CASCADE CONSTRAINTS;

DROP TABLE pueblo_originario CASCADE CONSTRAINTS;

DROP TABLE puntaje_asignado CASCADE CONSTRAINTS;

DROP TABLE region CASCADE CONSTRAINTS;

DROP TABLE subespecialidad CASCADE CONSTRAINTS;

--BORRAR SECUENCIAS

DROP SEQUENCE SEQ_ESTADO_CIVIL;
DROP SEQUENCE SEQ_PUEBLO_ORIGINARIO;
DROP SEQUENCE SEQ_NACIONALIDAD;
DROP SEQUENCE SEQ_PAIS;
DROP SEQUENCE SEQ_REGION;
DROP SEQUENCE SEQ_ERROR;

--CREAR SECUENCIAS

CREATE SEQUENCE SEQ_ESTADO_CIVIL;
CREATE SEQUENCE SEQ_PUEBLO_ORIGINARIO;
CREATE SEQUENCE SEQ_NACIONALIDAD;
CREATE SEQUENCE SEQ_PAIS;
CREATE SEQUENCE SEQ_REGION;
CREATE SEQUENCE SEQ_ERROR;

--CREAR TABLAS

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
    id_criterio    NUMBER(2) NOT NULL,
    desc_criterio  VARCHAR2(60) NOT NULL,
    porcentaje     NUMBER(2) NOT NULL
);

ALTER TABLE criterio_evaluacion ADD CONSTRAINT criterio_evaluacion_pk PRIMARY KEY ( id_criterio );

CREATE TABLE doc_extranjero (
    id_doc_extranjero  NUMBER(4) NOT NULL,
    pasaporte          VARCHAR2(9) NOT NULL,
    visa               NUMBER(8) NOT NULL
);

ALTER TABLE doc_extranjero ADD CONSTRAINT doc_extranjero_pk PRIMARY KEY ( id_doc_extranjero );

CREATE TABLE error_sistema (
    id_error       NUMBER(4) NOT NULL,
    modulo_error   VARCHAR2(100) NOT NULL,
    mensaje_error  VARCHAR2(150) NOT NULL
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
    desc_institucion  VARCHAR2(30) NOT NULL,
    ranking           NUMBER(3) NOT NULL,
    url_institucion   VARCHAR2(50),
    id_ciudad         NUMBER(2) NOT NULL
);

ALTER TABLE institucion ADD CONSTRAINT institucion_pk PRIMARY KEY ( id_institucion );

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
    evalua_interes        VARCHAR2(15) NOT NULL,
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
    sexo               CHAR(1),
    direccion          VARCHAR2(50) NOT NULL,
    num_hijos          NUMBER(2),
    discap_fisica      CHAR(1) NOT NULL,
    id_est_civil       NUMBER(1) NOT NULL,
    id_pue_ori         NUMBER(2),
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

ALTER TABLE postulante
    ADD CONSTRAINT sexo_chk CHECK ( sexo IN (
        'F',
        'M'
    ) );

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
    edad_max  NUMBER(3) NOT NULL,
    puntos    NUMBER(1) NOT NULL
);

ALTER TABLE ptje_edad ADD CONSTRAINT ptje_edad_pk PRIMARY KEY ( edad_min );

CREATE TABLE ptje_estado_civil (
    desc_estado_civil  VARCHAR2(20) NOT NULL,
    puntos             NUMBER(1) NOT NULL
);

ALTER TABLE ptje_estado_civil ADD CONSTRAINT ptje_estado_civil_pk PRIMARY KEY ( desc_estado_civil );

CREATE TABLE ptje_exp_laboral (
    anos_min  NUMBER(2, 1) NOT NULL,
    anos_max  NUMBER(3, 1) NOT NULL,
    puntos    NUMBER(1) NOT NULL
);

ALTER TABLE ptje_exp_laboral ADD CONSTRAINT ptje_exp_laboral_pk PRIMARY KEY ( anos_min );

CREATE TABLE ptje_objetivo_est (
    evaluacion  VARCHAR2(15) NOT NULL,
    puntos      NUMBER(1) NOT NULL
);

ALTER TABLE ptje_objetivo_est ADD CONSTRAINT ptje_objetivo_est_pk PRIMARY KEY ( evaluacion );

CREATE TABLE ptje_ranking (
    posicion_min  NUMBER(2) NOT NULL,
    posicion_max  NUMBER(4) NOT NULL,
    puntos        NUMBER(1) NOT NULL
);

ALTER TABLE ptje_ranking ADD CONSTRAINT ptje_ranking_pk PRIMARY KEY ( posicion_min );

CREATE TABLE ptje_retribucion (
    evaluacion  VARCHAR2(15) NOT NULL,
    puntos      NUMBER(1) NOT NULL
);

ALTER TABLE ptje_retribucion ADD CONSTRAINT ptje_retribucion_pk PRIMARY KEY ( evaluacion );

CREATE TABLE ptje_zona_extrema (
    nom_region  VARCHAR2(50) NOT NULL,
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
    desc_region  VARCHAR2(50) NOT NULL
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
    ADD CONSTRAINT post_pue_or_fk FOREIGN KEY ( id_pue_ori )
        REFERENCES pueblo_originario ( id_pue_ori );

ALTER TABLE postulacion
    ADD CONSTRAINT postulacion_postulante_fk FOREIGN KEY ( id_postulante )
        REFERENCES postulante ( id_postulante );

ALTER TABLE postulante
    ADD CONSTRAINT postulante_ciudad_fk FOREIGN KEY ( id_ciudad )
        REFERENCES ciudad ( id_ciudad );

ALTER TABLE postulante
    ADD CONSTRAINT postulante_estado_civil_fk FOREIGN KEY ( id_est_civil )
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
