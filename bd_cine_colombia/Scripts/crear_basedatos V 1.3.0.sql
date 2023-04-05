/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     5/04/2023 6:22:41 p. m.                      */
/*==============================================================*/


IF EXISTS(SELECT 1 FROM SYS.SYSFOREIGNKEY WHERE ROLE='FK_CINE_REFERENCE_CIUDAD') THEN
    ALTER TABLE CINE
       DELETE FOREIGN KEY FK_CINE_REFERENCE_CIUDAD
END IF;

IF EXISTS(SELECT 1 FROM SYS.SYSFOREIGNKEY WHERE ROLE='FK_CINE_CAR_REFERENCE_CINE') THEN
    ALTER TABLE CINE_CARTELERAS
       DELETE FOREIGN KEY FK_CINE_CAR_REFERENCE_CINE
END IF;

IF EXISTS(SELECT 1 FROM SYS.SYSFOREIGNKEY WHERE ROLE='FK_CINE_SAL_REFERENCE_CINE') THEN
    ALTER TABLE CINE_SALAS
       DELETE FOREIGN KEY FK_CINE_SAL_REFERENCE_CINE
END IF;

IF EXISTS(SELECT 1 FROM SYS.SYSFOREIGNKEY WHERE ROLE='FK_CIUDAD_REFERENCE_DEPARTAM') THEN
    ALTER TABLE CIUDAD
       DELETE FOREIGN KEY FK_CIUDAD_REFERENCE_DEPARTAM
END IF;

IF EXISTS(SELECT 1 FROM SYS.SYSFOREIGNKEY WHERE ROLE='FK_CLIENTE_REFERENCE_TIPO_DOC') THEN
    ALTER TABLE CLIENTE
       DELETE FOREIGN KEY FK_CLIENTE_REFERENCE_TIPO_DOC
END IF;

IF EXISTS(SELECT 1 FROM SYS.SYSFOREIGNKEY WHERE ROLE='FK_CLIENTE__REFERENCE_CIUDAD') THEN
    ALTER TABLE CLIENTE_DIRECCIONES
       DELETE FOREIGN KEY FK_CLIENTE__REFERENCE_CIUDAD
END IF;

IF EXISTS(SELECT 1 FROM SYS.SYSFOREIGNKEY WHERE ROLE='FK_CLIENTE_DIR_REF_CLIENTE') THEN
    ALTER TABLE CLIENTE_DIRECCIONES
       DELETE FOREIGN KEY FK_CLIENTE_DIR_REF_CLIENTE
END IF;

IF EXISTS(SELECT 1 FROM SYS.SYSFOREIGNKEY WHERE ROLE='FK_CLIENTE_EMAILS_REF_CLIENTE') THEN
    ALTER TABLE CLIENTE_EMAILS
       DELETE FOREIGN KEY FK_CLIENTE_EMAILS_REF_CLIENTE
END IF;

IF EXISTS(SELECT 1 FROM SYS.SYSFOREIGNKEY WHERE ROLE='FK_CLIENTE__REFERENCE_RED_SOCI') THEN
    ALTER TABLE CLIENTE_REDES
       DELETE FOREIGN KEY FK_CLIENTE__REFERENCE_RED_SOCI
END IF;

IF EXISTS(SELECT 1 FROM SYS.SYSFOREIGNKEY WHERE ROLE='FK_CLIENTE_REDES_REF_CLIENTE') THEN
    ALTER TABLE CLIENTE_REDES
       DELETE FOREIGN KEY FK_CLIENTE_REDES_REF_CLIENTE
END IF;

IF EXISTS(SELECT 1 FROM SYS.SYSFOREIGNKEY WHERE ROLE='FK_CLIENTE__REFERENCE_PAIS') THEN
    ALTER TABLE CLIENTE_TELEFONOS
       DELETE FOREIGN KEY FK_CLIENTE__REFERENCE_PAIS
END IF;

IF EXISTS(SELECT 1 FROM SYS.SYSFOREIGNKEY WHERE ROLE='FK_CLIENTE_TEL_REF_CLIENTE') THEN
    ALTER TABLE CLIENTE_TELEFONOS
       DELETE FOREIGN KEY FK_CLIENTE_TEL_REF_CLIENTE
END IF;

IF EXISTS(SELECT 1 FROM SYS.SYSFOREIGNKEY WHERE ROLE='FK_DEPARTAM_REFERENCE_PAIS') THEN
    ALTER TABLE DEPARTAMENTO
       DELETE FOREIGN KEY FK_DEPARTAM_REFERENCE_PAIS
END IF;

IF EXISTS(SELECT 1 FROM SYS.SYSFOREIGNKEY WHERE ROLE='FK_PELICULA_REFERENCE_CINE_CAR') THEN
    ALTER TABLE PELICULA_CARTELERA
       DELETE FOREIGN KEY FK_PELICULA_REFERENCE_CINE_CAR
END IF;

IF EXISTS(SELECT 1 FROM SYS.SYSFOREIGNKEY WHERE ROLE='FK_PELICULA_REFERENCE_PELICULA') THEN
    ALTER TABLE PELICULA_CARTELERA
       DELETE FOREIGN KEY FK_PELICULA_REFERENCE_PELICULA
END IF;

IF EXISTS(SELECT 1 FROM SYS.SYSFOREIGNKEY WHERE ROLE='FK_USUARIO_REFERENCE_TIPO_USU') THEN
    ALTER TABLE USUARIO
       DELETE FOREIGN KEY FK_USUARIO_REFERENCE_TIPO_USU
END IF;

IF EXISTS(SELECT 1 FROM SYS.SYSFOREIGNKEY WHERE ROLE='FK_USUARIO_REFERENCE_TIPO_ALG') THEN
    ALTER TABLE USUARIO
       DELETE FOREIGN KEY FK_USUARIO_REFERENCE_TIPO_ALG
END IF;

IF EXISTS(SELECT 1 FROM SYS.SYSFOREIGNKEY WHERE ROLE='FK_USUARIO__REFERENCE_USUARIO') THEN
    ALTER TABLE USUARIO_CINE
       DELETE FOREIGN KEY FK_USUARIO__REFERENCE_USUARIO
END IF;

IF EXISTS(SELECT 1 FROM SYS.SYSFOREIGNKEY WHERE ROLE='FK_USUARIO__REFERENCE_CINE') THEN
    ALTER TABLE USUARIO_CINE
       DELETE FOREIGN KEY FK_USUARIO__REFERENCE_CINE
END IF;

DROP TABLE IF EXISTS CINE;

DROP TABLE IF EXISTS CINE_CARTELERAS;

DROP TABLE IF EXISTS CINE_SALAS;

DROP TABLE IF EXISTS CIUDAD;

DROP TABLE IF EXISTS CLIENTE;

DROP TABLE IF EXISTS CLIENTE_DIRECCIONES;

DROP TABLE IF EXISTS CLIENTE_EMAILS;

DROP TABLE IF EXISTS CLIENTE_REDES;

DROP TABLE IF EXISTS CLIENTE_TELEFONOS;

DROP TABLE IF EXISTS DEPARTAMENTO;

DROP TABLE IF EXISTS PAIS;

DROP TABLE IF EXISTS PELICULA;

DROP TABLE IF EXISTS PELICULA_CARTELERA;

DROP TABLE IF EXISTS RED_SOCIAL;

DROP TABLE IF EXISTS TIPO_ALGORITMO;

DROP TABLE IF EXISTS TIPO_DOCUMENTO;

DROP TABLE IF EXISTS TIPO_USUARIO;

DROP TABLE IF EXISTS USUARIO;

DROP TABLE IF EXISTS USUARIO_CINE;

/*==============================================================*/
/* Table: CINE                                                  */
/*==============================================================*/
CREATE TABLE CINE 
(
   ID_CINE              VARCHAR(5)                     NOT NULL,
   ID_CIUDAD            VARCHAR(5)                     NOT NULL,
   NOMBRE               VARCHAR(40)                    NOT NULL,
   DIRECCION            VARCHAR(50)                    NOT NULL,
   TELEFONO_ADMIN       VARCHAR(30)                    NULL,
   TELEFONO_CLIENTES    VARCHAR(30)                    NULL,
   ESTADO               VARCHAR(1)                     NULL DEFAULT A
   	CONSTRAINT CKC_ESTADO_CINE CHECK (ESTADO IS NULL OR (ESTADO IN ('A','I') AND ESTADO = UPPER(ESTADO))),
   CONSTRAINT PK_CINE PRIMARY KEY (ID_CINE)
);

/*==============================================================*/
/* Table: CINE_CARTELERAS                                       */
/*==============================================================*/
CREATE TABLE CINE_CARTELERAS 
(
   ID_CARTELERA         VARCHAR(10)                    NOT NULL,
   ID_CINE              VARCHAR(5)                     NOT NULL,
   ESTADO               VARCHAR(1)                     NULL DEFAULT A
   	CONSTRAINT CKC_ESTADO_CINE_CAR CHECK (ESTADO IS NULL OR (ESTADO IN ('A','I') AND ESTADO = UPPER(ESTADO))),
   CONSTRAINT PK_CINE_CARTELERAS PRIMARY KEY (ID_CARTELERA)
);

/*==============================================================*/
/* Table: CINE_SALAS                                            */
/*==============================================================*/
CREATE TABLE CINE_SALAS 
(
   ID_SALA              VARCHAR(5)                     NOT NULL,
   ID_CINE              VARCHAR(5)                     NOT NULL,
   NOMBRE               VARCHAR(30)                    NULL,
   ESTADO               VARCHAR(1)                     NULL DEFAULT A
   	CONSTRAINT CKC_ESTADO_CINE_SAL CHECK (ESTADO IS NULL OR (ESTADO IN ('A','I') AND ESTADO = UPPER(ESTADO))),
   CONSTRAINT PK_CINE_SALAS PRIMARY KEY (ID_SALA)
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
CREATE TABLE CIUDAD 
(
   ID_CIUDAD            VARCHAR(5)                     NOT NULL,
   ID_DEPTO             VARCHAR(2)                     NOT NULL,
   NOMBRE               VARCHAR(20)                    NOT NULL,
   CONSTRAINT PK_CIUDAD PRIMARY KEY (ID_CIUDAD)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
CREATE TABLE CLIENTE 
(
   ID_CLIENTE           NUMBER(20)                     NOT NULL,
   ID_TD                VARCHAR(2)                     NOT NULL,
   DOCUMENTO            VARCHAR(20)                    NOT NULL,
   NOMBRE               VARCHAR(30)                    NOT NULL,
   APELLIDOS            VARCHAR(30)                    NOT NULL,
   FECHA_NACIMIENTO     DATE                           NULL,
   FECHA_VINCULACION    DATE                           NULL,
   ESTADO               VARCHAR(1)                     NULL DEFAULT A
   	CONSTRAINT CKC_ESTADO_CLIENTE CHECK (ESTADO IS NULL OR (ESTADO IN ('A','I') AND ESTADO = UPPER(ESTADO))),
   CONSTRAINT PK_CLIENTE PRIMARY KEY (ID_CLIENTE)
);

/*==============================================================*/
/* Table: CLIENTE_DIRECCIONES                                   */
/*==============================================================*/
CREATE TABLE CLIENTE_DIRECCIONES 
(
   ID_CLIENTE_DIRECCION NUMBER(15)                     NOT NULL,
   ID_CLIENTE           NUMBER(20)                     NOT NULL,
   ID_CIUDAD            VARCHAR(5)                     NOT NULL,
   VIA_PRINCIPAL        VARCHAR(20)                    NOT NULL,
   NOMENCLATURA         VARCHAR(20)                    NOT NULL,
   COMPLEMENTO          VARCHAR(20)                    NULL,
   ESTADO               VARCHAR(1)                     NULL DEFAULT A
   	CONSTRAINT CKC_ESTADO_CLI_DIRS CHECK (ESTADO IS NULL OR (ESTADO IN ('A','I') AND ESTADO = UPPER(ESTADO))),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE       NULL,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE       NULL,
   ID_USUARIO_LOG       VARCHAR(5)                     NOT NULL,
   CONSTRAINT PK_CLIENTE_DIRECCIONES PRIMARY KEY (ID_CLIENTE_DIRECCION)
);

/*==============================================================*/
/* Table: CLIENTE_EMAILS                                        */
/*==============================================================*/
CREATE TABLE CLIENTE_EMAILS 
(
   ID_CLIENTE_EMAIL     NUMBER(15)                     NOT NULL,
   ID_CLIENTE           NUMBER(20)                     NOT NULL,
   EMAIL                VARCHAR(100)                   NULL,
   ESTADO               VARCHAR(1)                     NULL DEFAULT A
   	CONSTRAINT CKC_ESTADO_CLI_EMAILS CHECK (ESTADO IS NULL OR (ESTADO IN ('A','I') AND ESTADO = UPPER(ESTADO))),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE       NULL,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE       NULL,
   ID_USUARIO_LOG       VARCHAR(5)                     NOT NULL,
   CONSTRAINT PK_CLIENTE_EMAILS PRIMARY KEY (ID_CLIENTE_EMAIL)
);

/*==============================================================*/
/* Table: CLIENTE_REDES                                         */
/*==============================================================*/
CREATE TABLE CLIENTE_REDES 
(
   ID_CLIENTE_REDES     NUMBER(15)                     NOT NULL,
   ID_CLIENTE           NUMBER(20)                     NOT NULL,
   ID_RED_SOCIAL        VARCHAR(5)                     NULL,
   NOMBRE_PERFIL        VARCHAR(30)                    NULL,
   ESTADO               VARCHAR(1)                     NULL DEFAULT A
   	CONSTRAINT CKC_ESTADO_REDES CHECK (ESTADO IS NULL OR (ESTADO IN ('A','I') AND ESTADO = UPPER(ESTADO))),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE       NULL,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE       NULL,
   ID_USUARIO_LOG       VARCHAR(5)                     NOT NULL,
   CONSTRAINT PK_CLIENTE_REDES PRIMARY KEY (ID_CLIENTE_REDES)
);

/*==============================================================*/
/* Table: CLIENTE_TELEFONOS                                     */
/*==============================================================*/
CREATE TABLE CLIENTE_TELEFONOS 
(
   ID_CLIENTE_TELEFONO  NUMBER(15)                     NOT NULL,
   ID_CLIENTE           NUMBER(20)                     NOT NULL,
   ID_PAIS              VARCHAR(3)                     NULL,
   TELEFONO             VARCHAR(30)                    NULL,
   ESTADO               VARCHAR(1)                     NULL DEFAULT A
   	CONSTRAINT CKC_ESTADO_CLI_TEL CHECK (ESTADO IS NULL OR (ESTADO IN ('A','I') AND ESTADO = UPPER(ESTADO))),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE       NULL,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE       NULL,
   ID_USUARIO_LOG       VARCHAR(5)                     NOT NULL,
   CONSTRAINT PK_CLIENTE_TELEFONOS PRIMARY KEY (ID_CLIENTE_TELEFONO)
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
CREATE TABLE DEPARTAMENTO 
(
   ID_DEPTO             VARCHAR(2)                     NOT NULL,
   ID_PAIS              VARCHAR(3)                     NOT NULL,
   NOMBRE               VARCHAR(20)                    NOT NULL,
   CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (ID_DEPTO)
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
CREATE TABLE PAIS 
(
   ID_PAIS              VARCHAR(3)                     NOT NULL,
   NOMBRE               VARCHAR(20)                    NOT NULL,
   CODIGO_TELEFONICO    VARCHAR(10)                    NULL,
   CONSTRAINT PK_PAIS PRIMARY KEY (ID_PAIS)
);

/*==============================================================*/
/* Table: PELICULA                                              */
/*==============================================================*/
CREATE TABLE PELICULA 
(
   ID_PELICULA          VARCHAR(10)                    NOT NULL,
   NOMBRE               VARCHAR(100)                   NOT NULL,
   ESTADO               VARCHAR(1)                     NULL DEFAULT A
   	CONSTRAINT CKC_ESTADO_PELICULA CHECK (ESTADO IS NULL OR (ESTADO IN ('A','I') AND ESTADO = UPPER(ESTADO))),
   CONSTRAINT PK_PELICULA PRIMARY KEY (ID_PELICULA)
);

/*==============================================================*/
/* Table: PELICULA_CARTELERA                                    */
/*==============================================================*/
CREATE TABLE PELICULA_CARTELERA 
(
   ID_CARTELERA         VARCHAR(10)                    NOT NULL,
   ID_PELICULA          VARCHAR(10)                    NOT NULL,
   CONSTRAINT PK_PELICULA_CARTELERA PRIMARY KEY (ID_CARTELERA, ID_PELICULA)
);

/*==============================================================*/
/* Table: RED_SOCIAL                                            */
/*==============================================================*/
CREATE TABLE RED_SOCIAL 
(
   ID_RED_SOCIAL        VARCHAR(5)                     NOT NULL,
   NOMBRE               VARCHAR(20)                    NOT NULL,
   ESTADO               VARCHAR(1)                     NULL DEFAULT A
   	CONSTRAINT CKC_ESTADO_RED_SOCI CHECK (ESTADO IS NULL OR (ESTADO IN ('A','I') AND ESTADO = UPPER(ESTADO))),
   CONSTRAINT PK_RED_SOCIAL PRIMARY KEY (ID_RED_SOCIAL)
);

/*==============================================================*/
/* Table: TIPO_ALGORITMO                                        */
/*==============================================================*/
CREATE TABLE TIPO_ALGORITMO 
(
   ID_TIPO_ALGORITMO    VARCHAR(2)                     NOT NULL,
   NOMBRE               VARCHAR(20)                    NOT NULL,
   SCRIPT_LINE          VARCHAR(200)                   NOT NULL,
   ESTADO               VARCHAR(1)                     NULL DEFAULT A
   	CONSTRAINT CKC_ESTADO_TIPO_ALG CHECK (ESTADO IS NULL OR (ESTADO IN ('A','I') AND ESTADO = UPPER(ESTADO))),
   CONSTRAINT PK_TIPO_ALGORITMO PRIMARY KEY (ID_TIPO_ALGORITMO)
);

/*==============================================================*/
/* Table: TIPO_DOCUMENTO                                        */
/*==============================================================*/
CREATE TABLE TIPO_DOCUMENTO 
(
   ID_TD                VARCHAR(2)                     NOT NULL,
   NOMBRE               VARCHAR(20)                    NOT NULL,
   CONSTRAINT PK_TIPO_DOCUMENTO PRIMARY KEY (ID_TD)
);

/*==============================================================*/
/* Table: TIPO_USUARIO                                          */
/*==============================================================*/
CREATE TABLE TIPO_USUARIO 
(
   ID_TIPO_USUARIO      VARCHAR(2)                     NOT NULL,
   NOMBRE               VARCHAR(20)                    NOT NULL,
   ESTADO               VARCHAR(1)                     NULL DEFAULT A
   	CONSTRAINT CKC_ESTADO_TIPO_USU CHECK (ESTADO IS NULL OR (ESTADO IN ('A','I') AND ESTADO = UPPER(ESTADO))),
   CONSTRAINT PK_TIPO_USUARIO PRIMARY KEY (ID_TIPO_USUARIO)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
CREATE TABLE USUARIO 
(
   ID_USUARIO           VARCHAR(5)                     NOT NULL,
   ID_TIPO_USUARIO      VARCHAR(2)                     NOT NULL,
   NOMBRE               VARCHAR(50)                    NOT NULL,
   EMAIL                VARCHAR(100)                   NOT NULL,
   PASS                 VARCHAR(100)                   NOT NULL,
   ID_TIPO_ALGORITMO    VARCHAR(2)                     NULL,
   HORA_INICIAL         NUMERIC(2)                     NOT NULL,
   HORA_FINAL           NUMERIC(2)                     NOT NULL,
   ESTADO               VARCHAR(1)                     NULL DEFAULT A
   	CONSTRAINT CKC_ESTADO_USUARIO CHECK (ESTADO IS NULL OR (ESTADO IN ('A','I') AND ESTADO = UPPER(ESTADO))),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE       NULL,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE       NULL,
   CONSTRAINT PK_USUARIO PRIMARY KEY (ID_USUARIO)
);

/*==============================================================*/
/* Table: USUARIO_CINE                                          */
/*==============================================================*/
CREATE TABLE USUARIO_CINE 
(
   ID_USUARIO           VARCHAR(5)                     NOT NULL,
   ID_CINE              VARCHAR(5)                     NOT NULL,
   ESTADO               VARCHAR(1)                     NOT NULL DEFAULT A
   	CONSTRAINT CKC_ESTADO_USUARIO_ CHECK (ESTADO IN ('A','I') AND ESTADO = UPPER(ESTADO)),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE       NOT NULL,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE       NULL,
   ID_USUARIO_LOG       VARCHAR(5)                     NOT NULL,
   CONSTRAINT PK_USUARIO_CINE PRIMARY KEY (ID_USUARIO, ID_CINE)
);

ALTER TABLE CINE
   ADD CONSTRAINT FK_CINE_REFERENCE_CIUDAD FOREIGN KEY (ID_CIUDAD)
      REFERENCES CIUDAD (ID_CIUDAD)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

ALTER TABLE CINE_CARTELERAS
   ADD CONSTRAINT FK_CINE_CAR_REFERENCE_CINE FOREIGN KEY (ID_CINE)
      REFERENCES CINE (ID_CINE)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

ALTER TABLE CINE_SALAS
   ADD CONSTRAINT FK_CINE_SAL_REFERENCE_CINE FOREIGN KEY (ID_CINE)
      REFERENCES CINE (ID_CINE)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

ALTER TABLE CIUDAD
   ADD CONSTRAINT FK_CIUDAD_REFERENCE_DEPARTAM FOREIGN KEY (ID_DEPTO)
      REFERENCES DEPARTAMENTO (ID_DEPTO)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

ALTER TABLE CLIENTE
   ADD CONSTRAINT FK_CLIENTE_REFERENCE_TIPO_DOC FOREIGN KEY (ID_TD)
      REFERENCES TIPO_DOCUMENTO (ID_TD)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

ALTER TABLE CLIENTE_DIRECCIONES
   ADD CONSTRAINT FK_CLIENTE__REFERENCE_CIUDAD FOREIGN KEY (ID_CIUDAD)
      REFERENCES CIUDAD (ID_CIUDAD)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

ALTER TABLE CLIENTE_DIRECCIONES
   ADD CONSTRAINT FK_CLIENTE_DIR_REF_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

ALTER TABLE CLIENTE_EMAILS
   ADD CONSTRAINT FK_CLIENTE_EMAILS_REF_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

ALTER TABLE CLIENTE_REDES
   ADD CONSTRAINT FK_CLIENTE__REFERENCE_RED_SOCI FOREIGN KEY (ID_RED_SOCIAL)
      REFERENCES RED_SOCIAL (ID_RED_SOCIAL)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

ALTER TABLE CLIENTE_REDES
   ADD CONSTRAINT FK_CLIENTE_REDES_REF_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

ALTER TABLE CLIENTE_TELEFONOS
   ADD CONSTRAINT FK_CLIENTE__REFERENCE_PAIS FOREIGN KEY (ID_PAIS)
      REFERENCES PAIS (ID_PAIS)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

ALTER TABLE CLIENTE_TELEFONOS
   ADD CONSTRAINT FK_CLIENTE_TEL_REF_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

ALTER TABLE DEPARTAMENTO
   ADD CONSTRAINT FK_DEPARTAM_REFERENCE_PAIS FOREIGN KEY (ID_PAIS)
      REFERENCES PAIS (ID_PAIS)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

ALTER TABLE PELICULA_CARTELERA
   ADD CONSTRAINT FK_PELICULA_REFERENCE_CINE_CAR FOREIGN KEY (ID_CARTELERA)
      REFERENCES CINE_CARTELERAS (ID_CARTELERA)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

ALTER TABLE PELICULA_CARTELERA
   ADD CONSTRAINT FK_PELICULA_REFERENCE_PELICULA FOREIGN KEY (ID_PELICULA)
      REFERENCES PELICULA (ID_PELICULA)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

ALTER TABLE USUARIO
   ADD CONSTRAINT FK_USUARIO_REFERENCE_TIPO_USU FOREIGN KEY (ID_TIPO_USUARIO)
      REFERENCES TIPO_USUARIO (ID_TIPO_USUARIO)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

ALTER TABLE USUARIO
   ADD CONSTRAINT FK_USUARIO_REFERENCE_TIPO_ALG FOREIGN KEY (ID_TIPO_ALGORITMO)
      REFERENCES TIPO_ALGORITMO (ID_TIPO_ALGORITMO)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

ALTER TABLE USUARIO_CINE
   ADD CONSTRAINT FK_USUARIO__REFERENCE_USUARIO FOREIGN KEY (ID_USUARIO)
      REFERENCES USUARIO (ID_USUARIO)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

ALTER TABLE USUARIO_CINE
   ADD CONSTRAINT FK_USUARIO__REFERENCE_CINE FOREIGN KEY (ID_CINE)
      REFERENCES CINE (ID_CINE)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

