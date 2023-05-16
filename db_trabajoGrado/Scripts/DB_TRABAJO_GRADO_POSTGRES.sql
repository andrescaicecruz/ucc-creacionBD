/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     14/05/2023 7:18:59 p. m.                     */
/*==============================================================*/


drop table COMPONENETES_EXTERNOS;

drop table CONSULTA;

drop table CREAR_USUARIO;

drop table DETALLE;

drop table ESTADO;

drop table INICIO_SESION;

drop table MONTACARGAS;

drop table PASWARE;

drop table REGISTRO_CONTENEDORES;

drop table REGISTRO_GENRAL;

drop table TIPO_DOCUMENTO;

drop table TIPO_OPERADOR;

drop table TIPO_USUARIO;

drop table USER_ESTADO;

drop table USUARIO;

/*==============================================================*/
/* Table: COMPONENETES_EXTERNOS                                 */
/*==============================================================*/
create table COMPONENETES_EXTERNOS (
   ID_COMPONENETES_EXTERNOS VARCHAR(10)          not null,
   ID_ESTADO            VARCHAR(1)           null,
   ESPEJOS              VARCHAR(10)          null,
   PINTUA               VARCHAR(10)          null,
   LLANTAS              VARCHAR(10)          null,
   DIRECCIONALES        VARCHAR(10)          null,
   LUCES                VARCHAR(10)          null,
   constraint PK_COMPONENETES_EXTERNOS primary key (ID_COMPONENETES_EXTERNOS)
);

/*==============================================================*/
/* Table: CONSULTA                                              */
/*==============================================================*/
create table CONSULTA (
   ID_CONSULTA          VARCHAR(10)          not null,
   ID_TIPO_USUARIO      VARCHAR(10)          null,
   ID_REGISTRO_GENERAL  VARCHAR(10)          null,
   ID_DETALLE           VARCHAR(10)          null,
   constraint PK_CONSULTA primary key (ID_CONSULTA)
);

/*==============================================================*/
/* Table: CREAR_USUARIO                                         */
/*==============================================================*/
create table CREAR_USUARIO (
   ID_CREAR_USUARIO     VARCHAR(10)          not null,
   ID_USUARIO           VARCHAR(10)          null,
   ID_TIPO_USUARIO      VARCHAR(10)          null,
   ID_PASWARE           VARCHAR(10)          null,
   constraint PK_CREAR_USUARIO primary key (ID_CREAR_USUARIO)
);

/*==============================================================*/
/* Table: DETALLE                                               */
/*==============================================================*/
create table DETALLE (
   ID_DETALLE           VARCHAR(10)          not null,
   ID_REGISTRO_CONTENEDORES VARCHAR(10)          null,
   ID_TIPO_OPERADOR     VARCHAR(10)          null,
   constraint PK_DETALLE primary key (ID_DETALLE)
);

/*==============================================================*/
/* Table: ESTADO                                                */
/*==============================================================*/
create table ESTADO (
   ID_ESTADO            VARCHAR(1)           not null,
   BUENA                VARCHAR(10)          null,
   MALA                 VARCHAR(10)          null,
   constraint PK_ESTADO primary key (ID_ESTADO)
);

/*==============================================================*/
/* Table: INICIO_SESION                                         */
/*==============================================================*/
create table INICIO_SESION (
   ID_TIPO_USUARIO      VARCHAR(10)          null,
   ID_USER_ESTADO       VARCHAR(1)           null,
   ID_INICIO_SESION     VARCHAR(10)          null
);

/*==============================================================*/
/* Table: MONTACARGAS                                           */
/*==============================================================*/
create table MONTACARGAS (
   ID_REGIS_MONTACARGAS VARCHAR(10)          not null,
   ID_ESTADO            VARCHAR(1)           null,
   MARCA                VARCHAR(10)          null,
   TIPO_COMBUSTIBLE     VARCHAR(10)          null,
   constraint PK_MONTACARGAS primary key (ID_REGIS_MONTACARGAS)
);

/*==============================================================*/
/* Table: PASWARE                                               */
/*==============================================================*/
create table PASWARE (
   ID_PASWARE           VARCHAR(10)          not null,
   PASW                 VARCHAR(10)          null,
   constraint PK_PASWARE primary key (ID_PASWARE)
);

/*==============================================================*/
/* Table: REGISTRO_CONTENEDORES                                 */
/*==============================================================*/
create table REGISTRO_CONTENEDORES (
   ID_REGISTRO_CONTENEDORES VARCHAR(10)          not null,
   ID_ESTADO            VARCHAR(1)           null,
   CAPACIDAD            VARCHAR(3)           null,
   CODIGO               VARCHAR(10)          null,
   constraint PK_REGISTRO_CONTENEDORES primary key (ID_REGISTRO_CONTENEDORES)
);

/*==============================================================*/
/* Table: REGISTRO_GENRAL                                       */
/*==============================================================*/
create table REGISTRO_GENRAL (
   ID_REGISTRO_GENERAL  VARCHAR(10)          not null,
   ID_REGIS_MONTACARGAS VARCHAR(10)          null,
   ID_TIPO_OPERADOR     VARCHAR(10)          null,
   FECHA_HORA           DATE                 null,
   constraint PK_REGISTRO_GENRAL primary key (ID_REGISTRO_GENERAL)
);

/*==============================================================*/
/* Table: TIPO_DOCUMENTO                                        */
/*==============================================================*/
create table TIPO_DOCUMENTO (
   ID_TIPO_DOCUMENTO    VARCHAR(10)          not null,
   CEDULA               VARCHAR(10)          null,
   CEDULA_EXT           VARCHAR(10)          null,
   constraint PK_TIPO_DOCUMENTO primary key (ID_TIPO_DOCUMENTO)
);

/*==============================================================*/
/* Table: TIPO_OPERADOR                                         */
/*==============================================================*/
create table TIPO_OPERADOR (
   ID_TIPO_OPERADOR     VARCHAR(10)          not null,
   ID_TIPO_USUARIO      VARCHAR(10)          null,
   OP_MONTACARGA        VARCHAR(10)          null,
   OP_CONTENEDOR        VARCHAR(10)          null,
   constraint PK_TIPO_OPERADOR primary key (ID_TIPO_OPERADOR)
);

/*==============================================================*/
/* Table: TIPO_USUARIO                                          */
/*==============================================================*/
create table TIPO_USUARIO (
   ID_TIPO_USUARIO      VARCHAR(10)          not null,
   ADMINISTRADOR        VARCHAR(10)          null,
   OPERATIVO            VARCHAR(10)          null,
   ADMINISTRATIVO       VARCHAR(10)          null,
   constraint PK_TIPO_USUARIO primary key (ID_TIPO_USUARIO)
);

/*==============================================================*/
/* Table: USER_ESTADO                                           */
/*==============================================================*/
create table USER_ESTADO (
   ID_USER_ESTADO       VARCHAR2(1)          not null,
   ACTIVO               SMALLINT             null,
   INACTIVO             SMALLINT             null,
   constraint PK_USER_ESTADO primary key (ID_USER_ESTADO)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID_USUARIO           VARCHAR(10)          not null,
   ID_TIPO_DOCUMENTO    VARCHAR(10)          null,
   NOMBRE               VARCHAR(10)          null,
   APLELLIDO            VARCHAR(10)          null,
   FECHA                TIME WITH TIME ZONE  null,
   constraint PK_USUARIO primary key (ID_USUARIO)
);

alter table COMPONENETES_EXTERNOS
   add constraint FK_COMPONEN_REFERENCE_ESTADO foreign key (ID_ESTADO)
      references ESTADO (ID_ESTADO)
      on delete restrict on update restrict;

alter table CONSULTA
   add constraint FK_CONSULTA_REFERENCE_TIPO_USU foreign key (ID_TIPO_USUARIO)
      references TIPO_USUARIO (ID_TIPO_USUARIO)
      on delete restrict on update restrict;

alter table CONSULTA
   add constraint FK_CONSULTA_REFERENCE_REGISTRO foreign key (ID_REGISTRO_GENERAL)
      references REGISTRO_GENRAL (ID_REGISTRO_GENERAL)
      on delete restrict on update restrict;

alter table CONSULTA
   add constraint FK_CONSULTA_REFERENCE_DETALLE foreign key (ID_DETALLE)
      references DETALLE (ID_DETALLE)
      on delete restrict on update restrict;

alter table CREAR_USUARIO
   add constraint FK_CREAR_US_REFERENCE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO)
      on delete restrict on update restrict;

alter table CREAR_USUARIO
   add constraint FK_CREAR_US_REFERENCE_TIPO_USU foreign key (ID_TIPO_USUARIO)
      references TIPO_USUARIO (ID_TIPO_USUARIO)
      on delete restrict on update restrict;

alter table CREAR_USUARIO
   add constraint FK_CREAR_US_REFERENCE_PASWARE foreign key (ID_PASWARE)
      references PASWARE (ID_PASWARE)
      on delete restrict on update restrict;

alter table DETALLE
   add constraint FK_DETALLE_REFERENCE_REGISTRO foreign key (ID_REGISTRO_CONTENEDORES)
      references REGISTRO_CONTENEDORES (ID_REGISTRO_CONTENEDORES)
      on delete restrict on update restrict;

alter table DETALLE
   add constraint FK_DETALLE_REFERENCE_TIPO_OPE foreign key (ID_TIPO_OPERADOR)
      references TIPO_OPERADOR (ID_TIPO_OPERADOR)
      on delete restrict on update restrict;

alter table INICIO_SESION
   add constraint FK_INICIO_S_REFERENCE_USER_EST foreign key (ID_USER_ESTADO)
      references USER_ESTADO (ID_USER_ESTADO)
      on delete restrict on update restrict;

alter table INICIO_SESION
   add constraint FK_INICIO_S_REFERENCE_TIPO_USU foreign key (ID_TIPO_USUARIO)
      references TIPO_USUARIO (ID_TIPO_USUARIO)
      on delete restrict on update restrict;

alter table MONTACARGAS
   add constraint FK_MONTACAR_REFERENCE_ESTADO foreign key (ID_ESTADO)
      references ESTADO (ID_ESTADO)
      on delete restrict on update restrict;

alter table REGISTRO_CONTENEDORES
   add constraint FK_REGISTRO_REFERENCE_ESTADO foreign key (ID_ESTADO)
      references ESTADO (ID_ESTADO)
      on delete restrict on update restrict;

alter table REGISTRO_GENRAL
   add constraint FK_REGISTRO_REFERENCE_MONTACAR foreign key (ID_REGIS_MONTACARGAS)
      references MONTACARGAS (ID_REGIS_MONTACARGAS)
      on delete restrict on update restrict;

alter table REGISTRO_GENRAL
   add constraint FK_REGISTRO_REFERENCE_TIPO_OPE foreign key (ID_TIPO_OPERADOR)
      references TIPO_OPERADOR (ID_TIPO_OPERADOR)
      on delete restrict on update restrict;

alter table TIPO_OPERADOR
   add constraint FK_TIPO_OPE_REFERENCE_TIPO_USU foreign key (ID_TIPO_USUARIO)
      references TIPO_USUARIO (ID_TIPO_USUARIO)
      on delete restrict on update restrict;

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_TIPO_DOC foreign key (ID_TIPO_DOCUMENTO)
      references TIPO_DOCUMENTO (ID_TIPO_DOCUMENTO)
      on delete restrict on update restrict;

