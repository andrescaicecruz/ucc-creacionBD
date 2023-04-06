/*==============================================================*/
/* DBMS name:      ORACLE Version 12c                           */
/* Created on:     3/04/2023 10:01:40 p. m.                     */
/*==============================================================*/


alter table CIUDAD
   drop constraint FK_CIUDAD_REFERENCE_DEPARTAM;

alter table CLASE_PRODUCTO
   drop constraint FK_CLASE_PR_REFERENCE_CREDITO;

alter table CLIENTE
   drop constraint FK_CLIENTE_REFERENCE_TIPO_DOC;

alter table CLIENTE_DIRECCIONES
   drop constraint FK_CLIENTE__DIR_REF_CLIENTE;

alter table CLIENTE_DIRECCIONES
   drop constraint FK_CLIENTE__REFERENCE_CIUDAD;

alter table CLIENTE_EMAILS
   drop constraint FK_CLIENTE_CLI_REF_CLIENTE;

alter table CLIENTE_REDES
   drop constraint FK_CLIENTE_REDES_REF_CLIENTE;

alter table CLIENTE_REDES
   drop constraint FK_CLIENTE__REFERENCE_RED_SOCI;

alter table CLIENTE_TELEFONO
   drop constraint FK_CLIENTE__TEL_REF_CLIENTE;

alter table CLIENTE_TELEFONO
   drop constraint FK_CLIENTE__REFERENCE_PAIS;

alter table CUENTA
   drop constraint FK_CUENTA_REFERENCE_TIPO_CUE;

alter table CUENTA
   drop constraint FK_CUENTA_REFERENCE_PAIS;

alter table CUENTA
   drop constraint FK_CUENTA_REFERENCE_TIPO_EMB;

alter table CUENTA
   drop constraint FK_CUENTA_REFERENCE_CUENTA_E;

alter table CUENTA
   drop constraint FK_CUENTA_REFERENCE_MONEDA;

alter table CUENTA_CLIENTES
   drop constraint FK_CUENTA_C_REFERENCE_CUENTA;

alter table CUENTA_MOVIMIENTO
   drop constraint FK_CUENTA_M_REFERENCE_CUENTA_C;

alter table CUENTA_MOVIMIENTO
   drop constraint FK_CUENTA_M_REFERENCE_CUENTA;

alter table DEPARTAMENTO
   drop constraint FK_DEPARTAM_REFERENCE_PAIS;

alter table MONEDA
   drop constraint FK_MONEDA_REFERENCE_PAIS;

alter table PRODUCTO
   drop constraint FK_PRODUCTO_REFERENCE_CLASE_PR;

alter table TIPO_CUENTA
   drop constraint FK_TIPO_CUE_REFERENCE_CLASE_PR;

alter table USUARIO
   drop constraint FK_USUARIO_REFERENCE_TIPO_ALG;

alter table USUARIO
   drop constraint FK_USUARIO_REFERENCE_TIPO_USU;

drop table CIUDAD cascade constraints;

drop table CLASE_PRODUCTO cascade constraints;

drop table CLIENTE cascade constraints;

drop table CLIENTE_DIRECCIONES cascade constraints;

drop table CLIENTE_EMAILS cascade constraints;

drop table CLIENTE_REDES cascade constraints;

drop table CLIENTE_TELEFONO cascade constraints;

drop table CREDITO cascade constraints;

drop table CUENTA cascade constraints;

drop table CUENTA_CLIENTES cascade constraints;

drop table CUENTA_CONTROL cascade constraints;

drop table CUENTA_ESTADO cascade constraints;

drop table CUENTA_MOVIMIENTO cascade constraints;

drop table DEPARTAMENTO cascade constraints;

drop table MONEDA cascade constraints;

drop table PAIS cascade constraints;

drop table PRODUCTO cascade constraints;

drop table RED_SOCIAL cascade constraints;

drop table TIPO_ALGORITMO cascade constraints;

drop table TIPO_CUENTA cascade constraints;

drop table TIPO_DOCUMENTO cascade constraints;

drop table TIPO_EMBARGO cascade constraints;

drop table TIPO_USUARIO cascade constraints;

drop table USUARIO cascade constraints;

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   ID_CIUDAD            VARCHAR(5)            not null,
   ID_DEPTO             VARCHAR(2)            not null,
   NOMBRE               VARCHAR(20)           not null,
   constraint PK_CIUDAD primary key (ID_CIUDAD)
);

/*==============================================================*/
/* Table: CLASE_PRODUCTO                                        */
/*==============================================================*/
create table CLASE_PRODUCTO (
   ID_CLASE_PRODUCTO    VARCHAR2(2)           not null,
   ID_CREDITO           VARCHAR2(2),
   NOMBRE               VARCHAR2(20),
   ESTADO               VARCHAR2(1),
   constraint PK_CLASE_PRODUCTO primary key (ID_CLASE_PRODUCTO)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           NUMBER(20)            not null,
   ID_TD                VARCHAR(2)            not null,
   NOMBRE               VARCHAR(30)           not null,
   APELLIDOS            VARCHAR(30)           not null,
   FECHA_NACIMIENTO     DATE,
   FECHA_VINVULACION    DATE,
   ESTADO               VARCHAR2(1),
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: CLIENTE_DIRECCIONES                                   */
/*==============================================================*/
create table CLIENTE_DIRECCIONES (
   ID_CLIENTE_DIRECCION NUMBER(20)            not null,
   CLI_ID_CLIENTE       NUMBER(20),
   CIU_ID_CIUDAD        VARCHAR(5),
   ID_CIUDAD            VARCHAR(0)            not null,
   VIA_PRINCIPAL        VARCHAR(20)           not null,
   NOMENCLATURA         VARCHAR(20)           not null,
   COMPLEMENTO          VARCHAR(20)           not null,
   ESTADO               VARCHAR2(1),
   FECHA_REGISTRO       TITIMES TAMP WITH TIME ZONE,
   FECHA_ACTUALIZACION  TITIMES TAMP WITH TIME ZONE,
   ID_USUARIO_LONG      VARCHAR2(5),
   constraint PK_CLIENTE_DIRECCIONES primary key (ID_CLIENTE_DIRECCION)
);

/*==============================================================*/
/* Table: CLIENTE_EMAILS                                        */
/*==============================================================*/
create table CLIENTE_EMAILS (
   ID_CLIENTE_EMAILS    NUMBER(15)            not null,
   ID_CLIENTE           NUMBER(20)            not null,
   EMAIL                VARCHAR2(20)          not null,
   ESTADO               VARCHAR2(1),
   FECHA_REGISTRO       TITIMES TAMP WITH TIME ZONE,
   FECHA_ACTUALIZACION  TITIMES TAMP WITH TIME ZONE,
   ID_USUARIO_LOG       VARCHAR2(5),
   constraint PK_CLIENTE_EMAILS primary key (ID_CLIENTE_EMAILS)
);

/*==============================================================*/
/* Table: CLIENTE_REDES                                         */
/*==============================================================*/
create table CLIENTE_REDES (
   ID_CLIENTE_REDES     NUMBER(15)            not null,
   ID_CLIENTE           NUMBER(20)            not null,
   ID_RED_SOCIAL        VARCHAR(5),
   NOMBRE_PERFIL        VARCHAR(30),
   ESTADO               VARCHAR2(1),
   FECHA_REGISTRO       TITIMES TAMP WITH TIME ZONE,
   FECHA_ACTUALIZACION  TITIMES TAMP WITH TIME ZONE,
   ID_USUARIO_LONG      VARCHAR2(5),
   constraint PK_CLIENTE_REDES primary key (ID_CLIENTE_REDES)
);

/*==============================================================*/
/* Table: CLIENTE_TELEFONO                                      */
/*==============================================================*/
create table CLIENTE_TELEFONO (
   ID_CLIENTE_TELEFONO  NUMBER(20)            not null,
   ID_CLIENTE           NUMBER(20)            not null,
   ID_PAIS              VARCHAR2(3)           not null,
   TELEFONO             VARCHAR2(30),
   ESTADO               VARCHAR2(1),
   FECHA_REGISTRO       TITIMES TAMP WITH TIME ZONE,
   FECHA_ACTUALIZACION  TITIMES TAMP WITH TIME ZONE,
   ID_USUARIO_LOG       VARCHAR2(5),
   constraint PK_CLIENTE_TELEFONO primary key (ID_CLIENTE_TELEFONO)
);

/*==============================================================*/
/* Table: CREDITO                                               */
/*==============================================================*/
create table CREDITO (
   ID_CREDITO           VARCHAR2(2)           not null,
   NOMBRE               VARCHAR2(20),
   ESTADO               VARCHAR2(1),
   constraint PK_CREDITO primary key (ID_CREDITO)
);

/*==============================================================*/
/* Table: CUENTA                                                */
/*==============================================================*/
create table CUENTA (
   ID_CUENTA            NUMBER(15)            not null,
   ID_TIPO_CUENTA       VARCHAR2(2)           not null,
   ID_PAIS              VARCHAR(3)            not null,
   ID_TIPO_EMBARGO      VARCHAR(2)            not null,
   ID_CUENTA_ESTADO     VARCHAR(2)            not null,
   ID_MONEDA            VARCHAR2(2)           not null,
   FECHA_APERTURA       TIMESTAMP WITH TIME ZONE  not null,
   DESCRIPCION          CHAR(10),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE  not null,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE,
   ID_USUARIO_LOG       VARCHAR2(5)           not null,
   constraint PK_CUENTA primary key (ID_CUENTA)
);

/*==============================================================*/
/* Table: CUENTA_CLIENTES                                       */
/*==============================================================*/
create table CUENTA_CLIENTES (
   ID_CUENTA            NUMBER(15)            not null,
   ID_CLIENTE           NUMBER(20)            not null,
   constraint PK_CUENTA_CLIENTES primary key (ID_CUENTA, ID_CLIENTE)
);

/*==============================================================*/
/* Table: CUENTA_CONTROL                                        */
/*==============================================================*/
create table CUENTA_CONTROL (
   ID_CUENTA_MOV_CONTROL NUMBER(5)             not null,
   FECHA                TIMESTAMP WITH TIME ZONE,
   constraint PK_CUENTA_CONTROL primary key (ID_CUENTA_MOV_CONTROL)
);

comment on table CUENTA_CONTROL is
'CONTROL DE NUMERACION';

/*==============================================================*/
/* Table: CUENTA_ESTADO                                         */
/*==============================================================*/
create table CUENTA_ESTADO (
   ID_CUENTA_ESTADO     VARCHAR(2)            not null,
   NOMBRE               VARCHAR(20)           not null,
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_CUENTA_E check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_CUENTA_ESTADO primary key (ID_CUENTA_ESTADO)
);

/*==============================================================*/
/* Table: CUENTA_MOVIMIENTO                                     */
/*==============================================================*/
create table CUENTA_MOVIMIENTO (
   ID_CUENTA_MOV_CONTROL NUMBER(5)             not null,
   ID_CUENTA_MOV        NUMBER(0)             not null,
   ID_CUENTA            NUMBER(15)            not null,
   VALOR                NUMBER(15,2),
   constraint PK_CUENTA_MOVIMIENTO primary key (ID_CUENTA_MOV_CONTROL, ID_CUENTA_MOV)
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO (
   ID_DEPTO             VARCHAR(2)            not null,
   ID_PAIS              VARCHAR(3),
   NOMBRE               VARCHAR(20)           not null,
   constraint PK_DEPARTAMENTO primary key (ID_DEPTO)
);

/*==============================================================*/
/* Table: MONEDA                                                */
/*==============================================================*/
create table MONEDA (
   ID_MONEDA            VARCHAR2(2)           not null,
   ID_PAIS              VARCHAR(3),
   NOMBRE               VARCHAR2(20),
   ESTADO               VARCHAR2(1),
   constraint PK_MONEDA primary key (ID_MONEDA)
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS (
   ID_PAIS              VARCHAR(3)            not null,
   NOMBRE               VARCHAR(20)           not null,
   CODIGO_TELEFONO      VARCHAR2(10),
   constraint PK_PAIS primary key (ID_PAIS)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID_PRODUCTO          VARCHAR2(2)           not null,
   ID_CLASE_PRODUCTO    VARCHAR2(2),
   constraint PK_PRODUCTO primary key (ID_PRODUCTO)
);

/*==============================================================*/
/* Table: RED_SOCIAL                                            */
/*==============================================================*/
create table RED_SOCIAL (
   ID_RED_SOCIAL        VARCHAR(5)            not null,
   NOMBRE               VARCHAR(20)           not null,
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_RED_SOCI check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_RED_SOCIAL primary key (ID_RED_SOCIAL)
);

/*==============================================================*/
/* Table: TIPO_ALGORITMO                                        */
/*==============================================================*/
create table TIPO_ALGORITMO (
   ID_TIPO_ALGORITMO    VARCHAR(2)            not null,
   NOMBRE               VARCHAR(20)           not null,
   SCRIPT_LINE          VARCHAR2(200),
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_TIPO_ALG check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_TIPO_ALGORITMO primary key (ID_TIPO_ALGORITMO)
);

/*==============================================================*/
/* Table: TIPO_CUENTA                                           */
/*==============================================================*/
create table TIPO_CUENTA (
   ID_TIPO_CUENTA       VARCHAR2(2)           not null,
   ID_CLASE_PRODUCTO    VARCHAR2(2),
   NOMBRE               VARCHAR2(20),
   ESTADO               VARCHAR2(1),
   constraint PK_TIPO_CUENTA primary key (ID_TIPO_CUENTA)
);

/*==============================================================*/
/* Table: TIPO_DOCUMENTO                                        */
/*==============================================================*/
create table TIPO_DOCUMENTO (
   ID_TD                VARCHAR(2)            not null,
   NOMBRE               VARCHAR(20)           not null,
   constraint PK_TIPO_DOCUMENTO primary key (ID_TD)
);

/*==============================================================*/
/* Table: TIPO_EMBARGO                                          */
/*==============================================================*/
create table TIPO_EMBARGO (
   ID_TIPO_EMBARGO      VARCHAR(2)            not null,
   NOMBRE               VARCHAR(20)           not null,
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_TIPO_EMB check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_TIPO_EMBARGO primary key (ID_TIPO_EMBARGO)
);

/*==============================================================*/
/* Table: TIPO_USUARIO                                          */
/*==============================================================*/
create table TIPO_USUARIO (
   ID_TIPO_USUARIO      VARCHAR(2)            not null,
   NOMBRE               VARCHAR(20)           not null,
   ESTADO               VARCHAR(1)           default 'A'
      constraint CKC_ESTADO_TIPO_USU check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_TIPO_USUARIO primary key (ID_TIPO_USUARIO)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID_USUARIO           VARCHAR(5)            not null,
   ID_TIPO_USUARIO      VARCHAR(5)            not null,
   NOMBRE               VARCHAR(60)          default 'A'
      constraint CKC_NOMBRE_USUARIO check (NOMBRE is null or (NOMBRE in ('A','I') and NOMBRE = upper(NOMBRE))),
   EMAIL                VARCHAR2(100),
   PASS                 VARCHAR2(100),
   ID_TIPO_ALGORITMO    VARCHAR2(2)           not null,
   HORA_INICIAL         NUMBER(2),
   HORA_FINAN           NUMBER(2),
   ESTADO               VARCHAR2(1),
   FECHA_REGISTRO       TITIMES TAMP WITH TIME ZONE,
   FECHA_ACTUALIZACION  TITIMES TAMP WITH TIME ZONE,
   constraint PK_USUARIO primary key (ID_USUARIO)
);

alter table CIUDAD
   add constraint FK_CIUDAD_REFERENCE_DEPARTAM foreign key (ID_DEPTO)
      references DEPARTAMENTO (ID_DEPTO);

alter table CLASE_PRODUCTO
   add constraint FK_CLASE_PR_REFERENCE_CREDITO foreign key (ID_CREDITO)
      references CREDITO (ID_CREDITO);

alter table CLIENTE
   add constraint FK_CLIENTE_REFERENCE_TIPO_DOC foreign key (ID_TD)
      references TIPO_DOCUMENTO (ID_TD);

alter table CLIENTE_DIRECCIONES
   add constraint FK_CLIENTE__DIR_REF_CLIENTE foreign key (CLI_ID_CLIENTE)
      references CLIENTE (ID_CLIENTE);

alter table CLIENTE_DIRECCIONES
   add constraint FK_CLIENTE__REFERENCE_CIUDAD foreign key (CIU_ID_CIUDAD)
      references CIUDAD (ID_CIUDAD);

alter table CLIENTE_EMAILS
   add constraint FK_CLIENTE_CLI_REF_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE);

alter table CLIENTE_REDES
   add constraint FK_CLIENTE_REDES_REF_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE);

alter table CLIENTE_REDES
   add constraint FK_CLIENTE__REFERENCE_RED_SOCI foreign key (ID_RED_SOCIAL)
      references RED_SOCIAL (ID_RED_SOCIAL);

alter table CLIENTE_TELEFONO
   add constraint FK_CLIENTE__TEL_REF_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE);

alter table CLIENTE_TELEFONO
   add constraint FK_CLIENTE__REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS);

alter table CUENTA
   add constraint FK_CUENTA_REFERENCE_TIPO_CUE foreign key (ID_TIPO_CUENTA)
      references TIPO_CUENTA (ID_TIPO_CUENTA);

alter table CUENTA
   add constraint FK_CUENTA_REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS);

alter table CUENTA
   add constraint FK_CUENTA_REFERENCE_TIPO_EMB foreign key (ID_TIPO_EMBARGO)
      references TIPO_EMBARGO (ID_TIPO_EMBARGO);

alter table CUENTA
   add constraint FK_CUENTA_REFERENCE_CUENTA_E foreign key (ID_CUENTA_ESTADO)
      references CUENTA_ESTADO (ID_CUENTA_ESTADO);

alter table CUENTA
   add constraint FK_CUENTA_REFERENCE_MONEDA foreign key (ID_MONEDA)
      references MONEDA (ID_MONEDA);

alter table CUENTA_CLIENTES
   add constraint FK_CUENTA_C_REFERENCE_CUENTA foreign key (ID_CUENTA)
      references CUENTA (ID_CUENTA);

alter table CUENTA_MOVIMIENTO
   add constraint FK_CUENTA_M_REFERENCE_CUENTA_C foreign key (ID_CUENTA_MOV_CONTROL)
      references CUENTA_CONTROL (ID_CUENTA_MOV_CONTROL);

alter table CUENTA_MOVIMIENTO
   add constraint FK_CUENTA_M_REFERENCE_CUENTA foreign key (ID_CUENTA)
      references CUENTA (ID_CUENTA);

alter table DEPARTAMENTO
   add constraint FK_DEPARTAM_REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS);

alter table MONEDA
   add constraint FK_MONEDA_REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS);

alter table PRODUCTO
   add constraint FK_PRODUCTO_REFERENCE_CLASE_PR foreign key (ID_CLASE_PRODUCTO)
      references CLASE_PRODUCTO (ID_CLASE_PRODUCTO);

alter table TIPO_CUENTA
   add constraint FK_TIPO_CUE_REFERENCE_CLASE_PR foreign key (ID_CLASE_PRODUCTO)
      references CLASE_PRODUCTO (ID_CLASE_PRODUCTO);

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_TIPO_ALG foreign key (ID_TIPO_ALGORITMO)
      references TIPO_ALGORITMO (ID_TIPO_ALGORITMO);

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_TIPO_USU foreign key (ID_TIPO_USUARIO)
      references TIPO_USUARIO (ID_TIPO_USUARIO);

