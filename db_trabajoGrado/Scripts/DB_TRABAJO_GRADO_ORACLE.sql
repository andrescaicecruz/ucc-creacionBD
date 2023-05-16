/*==============================================================*/
/* DBMS name:      ORACLE Version 10g                           */
/* Created on:     14/05/2023 6:22:15 p. m.                     */
/*==============================================================*/



/*==============================================================*/
/* Table: COMPONENETES_EXTERNOS                                 */
/*==============================================================*/
create table COMPONENETES_EXTERNOS  (
   ID_COMPONENETES_EXTERNOS VARCHAR2(10)                    not null,
   ID_ESTADO            VARCHAR2(1),
   ESPEJOS              VARCHAR2(10),
   PINTUA               VARCHAR2(10),
   LLANTAS              VARCHAR2(10),
   DIRECCIONALES        VARCHAR2(10),
   LUCES                VARCHAR2(10),
   constraint PK_COMPONENETES_EXTERNOS primary key (ID_COMPONENETES_EXTERNOS)
);

/*==============================================================*/
/* Table: CONSULTA                                              */
/*==============================================================*/
create table CONSULTA  (
   ID_CONSULTA          VARCHAR2(10)                    not null,
   ID_TIPO_USUARIO      VARCHAR2(10),
   ID_REGISTRO_GENERAL  VARCHAR2(10),
   ID_DETALLE           VARCHAR2(10),
   constraint PK_CONSULTA primary key (ID_CONSULTA)
);

/*==============================================================*/
/* Table: CREAR_USUARIO                                         */
/*==============================================================*/
create table CREAR_USUARIO  (
   ID_CREAR_USUARIO     VARCHAR2(10)                    not null,
   ID_USUARIO           VARCHAR2(10),
   ID_TIPO_USUARIO      VARCHAR2(10),
   ID_PASWARE           VARCHAR2(10),
   constraint PK_CREAR_USUARIO primary key (ID_CREAR_USUARIO)
);

/*==============================================================*/
/* Table: DETALLE                                               */
/*==============================================================*/
create table DETALLE  (
   ID_DETALLE           VARCHAR2(10)                    not null,
   ID_REGISTRO_CONTENEDORES VARCHAR2(10),
   ID_TIPO_OPERADOR     VARCHAR2(10),
   constraint PK_DETALLE primary key (ID_DETALLE)
);

/*==============================================================*/
/* Table: ESTADO                                                */
/*==============================================================*/
create table ESTADO  (
   ID_ESTADO            VARCHAR2(1)                     not null,
   BUENA                VARCHAR2(10),
   MALA                 VARCHAR2(10),
   constraint PK_ESTADO primary key (ID_ESTADO)
);

/*==============================================================*/
/* Table: INICIO_SESION                                         */
/*==============================================================*/
create table INICIO_SESION  (
   ID_TIPO_USUARIO      VARCHAR2(10),
   ID_USER_ESTADO       VARCHAR2(1),
   ID_INICIO_SESION     VARCHAR2(10)
);

/*==============================================================*/
/* Table: MONTACARGAS                                           */
/*==============================================================*/
create table MONTACARGAS  (
   ID_REGIS_MONTACARGAS VARCHAR2(10)                    not null,
   ID_ESTADO            VARCHAR2(1),
   MARCA                VARCHAR2(10),
   TIPO_COMBUSTIBLE     VARCHAR2(10),
   constraint PK_MONTACARGAS primary key (ID_REGIS_MONTACARGAS)
);

/*==============================================================*/
/* Table: PASWARE                                               */
/*==============================================================*/
create table PASWARE  (
   ID_PASWARE           VARCHAR2(10)                    not null,
   PASW                 VARCHAR2(10),
   constraint PK_PASWARE primary key (ID_PASWARE)
);

/*==============================================================*/
/* Table: REGISTRO_CONTENEDORES                                 */
/*==============================================================*/
create table REGISTRO_CONTENEDORES  (
   ID_REGISTRO_CONTENEDORES VARCHAR2(10)                    not null,
   ID_ESTADO            VARCHAR2(1),
   CAPACIDAD            VARCHAR2(3),
   CODIGO               NUMBER(10),
   constraint PK_REGISTRO_CONTENEDORES primary key (ID_REGISTRO_CONTENEDORES)
);

/*==============================================================*/
/* Table: REGISTRO_GENRAL                                       */
/*==============================================================*/
create table REGISTRO_GENRAL  (
   ID_REGISTRO_GENERAL  VARCHAR2(10)                    not null,
   ID_REGIS_MONTACARGAS VARCHAR2(10),
   ID_TIPO_OPERADOR     VARCHAR2(10),
   FECHA_HORA           TIMESTAMP,
   constraint PK_REGISTRO_GENRAL primary key (ID_REGISTRO_GENERAL)
);

/*==============================================================*/
/* Table: TIPO_DOCUMENTO                                        */
/*==============================================================*/
create table TIPO_DOCUMENTO  (
   ID_TIPO_DOCUMENTO    VARCHAR2(10)                    not null,
   CEDULA               VARCHAR2(10),
   CEDULA_EXT           VARCHAR2(10),
   constraint PK_TIPO_DOCUMENTO primary key (ID_TIPO_DOCUMENTO)
);

/*==============================================================*/
/* Table: TIPO_OPERADOR                                         */
/*==============================================================*/
create table TIPO_OPERADOR  (
   ID_TIPO_OPERADOR     VARCHAR2(10)                    not null,
   ID_TIPO_USUARIO      VARCHAR2(10),
   OP_MONTACARGA        VARCHAR2(10),
   OP_CONTENEDOR        VARCHAR2(10),
   constraint PK_TIPO_OPERADOR primary key (ID_TIPO_OPERADOR)
);

/*==============================================================*/
/* Table: TIPO_USUARIO                                          */
/*==============================================================*/
create table TIPO_USUARIO  (
   ID_TIPO_USUARIO      VARCHAR2(10)                    not null,
   ADMINISTRADOR        VARCHAR2(10),
   OPERATIVO            VARCHAR2(10),
   ADMINISTRATIVO       VARCHAR2(10),
   constraint PK_TIPO_USUARIO primary key (ID_TIPO_USUARIO)
);

/*==============================================================*/
/* Table: USER_ESTADO                                           */
/*==============================================================*/
create table USER_ESTADO  (
   ID_USER_ESTADO       VARCHAR2(1)                     not null,
   ACTIVO               SMALLINT,
   INACTIVO             SMALLINT,
   constraint PK_USER_ESTADO primary key (ID_USER_ESTADO)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO  (
   ID_USUARIO           VARCHAR2(10)                    not null,
   ID_TIPO_DOCUMENTO    VARCHAR2(10),
   NOMBRE               VARCHAR2(10),
   APLELLIDO            VARCHAR2(10),
   FECHA                DATE,
   constraint PK_USUARIO primary key (ID_USUARIO)
);

alter table COMPONENETES_EXTERNOS
   add constraint FK_COMPONEN_REFERENCE_ESTADO foreign key (ID_ESTADO)
      references ESTADO (ID_ESTADO);

alter table CONSULTA
   add constraint FK_CONSULTA_REFERENCE_TIPO_USU foreign key (ID_TIPO_USUARIO)
      references TIPO_USUARIO (ID_TIPO_USUARIO);

alter table CONSULTA
   add constraint FK_CONSULTA_REFERENCE_REGISTRO foreign key (ID_REGISTRO_GENERAL)
      references REGISTRO_GENRAL (ID_REGISTRO_GENERAL);

alter table CONSULTA
   add constraint FK_CONSULTA_REFERENCE_DETALLE foreign key (ID_DETALLE)
      references DETALLE (ID_DETALLE);

alter table CREAR_USUARIO
   add constraint FK_CREAR_US_REFERENCE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO);

alter table CREAR_USUARIO
   add constraint FK_CREAR_US_REFERENCE_TIPO_USU foreign key (ID_TIPO_USUARIO)
      references TIPO_USUARIO (ID_TIPO_USUARIO);

alter table CREAR_USUARIO
   add constraint FK_CREAR_US_REFERENCE_PASWARE foreign key (ID_PASWARE)
      references PASWARE (ID_PASWARE);

alter table DETALLE
   add constraint FK_DETALLE_REFERENCE_REGISTRO foreign key (ID_REGISTRO_CONTENEDORES)
      references REGISTRO_CONTENEDORES (ID_REGISTRO_CONTENEDORES);

alter table DETALLE
   add constraint FK_DETALLE_REFERENCE_TIPO_OPE foreign key (ID_TIPO_OPERADOR)
      references TIPO_OPERADOR (ID_TIPO_OPERADOR);

alter table INICIO_SESION
   add constraint FK_INICIO_S_REFERENCE_USER_EST foreign key (ID_USER_ESTADO)
      references USER_ESTADO (ID_USER_ESTADO);

alter table INICIO_SESION
   add constraint FK_INICIO_S_REFERENCE_TIPO_USU foreign key (ID_TIPO_USUARIO)
      references TIPO_USUARIO (ID_TIPO_USUARIO);

alter table MONTACARGAS
   add constraint FK_MONTACAR_REFERENCE_ESTADO foreign key (ID_ESTADO)
      references ESTADO (ID_ESTADO);

alter table REGISTRO_CONTENEDORES
   add constraint FK_REGISTRO_REFERENCE_ESTADO foreign key (ID_ESTADO)
      references ESTADO (ID_ESTADO);

alter table REGISTRO_GENRAL
   add constraint FK_REGISTRO_REFERENCE_MONTACAR foreign key (ID_REGIS_MONTACARGAS)
      references MONTACARGAS (ID_REGIS_MONTACARGAS);

alter table REGISTRO_GENRAL
   add constraint FK_REGISTRO_REFERENCE_TIPO_OPE foreign key (ID_TIPO_OPERADOR)
      references TIPO_OPERADOR (ID_TIPO_OPERADOR);

alter table TIPO_OPERADOR
   add constraint FK_TIPO_OPE_REFERENCE_TIPO_USU foreign key (ID_TIPO_USUARIO)
      references TIPO_USUARIO (ID_TIPO_USUARIO);

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_TIPO_DOC foreign key (ID_TIPO_DOCUMENTO)
      references TIPO_DOCUMENTO (ID_TIPO_DOCUMENTO);

