/*==============================================================*/


/*==============================================================*/
/* Table: BEBIDA                                                */
/*==============================================================*/
create table BEBIDA 
(
   NOMBRE               long varchar                   not null,
   DESCRIPCION          long varchar                   not null,
   NUMERO_PEDIDO        numeric(200)                   null,
   MESA                 numeric(40)                    null,
   HORA_INICIO          time                           null,
   HORA_FIN             time                           null,
   ESTADO               smallint                       null,
   PRECIO               numeric(100)                   null,
   constraint PK_BEBIDA primary key clustered (NOMBRE, DESCRIPCION)
);

/*==============================================================*/
/* Table: ESTADO_MESA                                           */
/*==============================================================*/
create table ESTADO_MESA 
(
   DISPONIBLE           smallint                       not null,
   OCUPADO              smallint                       not null,
   PROCESO_ASEO         smallint                       not null,
   constraint PK_ESTADO_MESA primary key clustered (DISPONIBLE, OCUPADO, PROCESO_ASEO)
);

/*==============================================================*/
/* Table: ESTADO_PEDIDO                                         */
/*==============================================================*/
create table ESTADO_PEDIDO 
(
   EN_PROCESO           smallint                       not null,
   TERMINADO            smallint                       not null,
   MONTO_TOTAL          numeric(100)                   not null,
   constraint PK_ESTADO_PEDIDO primary key clustered (EN_PROCESO, TERMINADO, MONTO_TOTAL)
);

/*==============================================================*/
/* Table: MESA                                                  */
/*==============================================================*/
create table MESA 
(
   NUMERO_MESA          numeric(40)                    not null,
   CAPACIDAD_CLIENTES   numeric(15)                    not null,
   ESTADO               smallint                       not null,
   DISPONIBLE           smallint                       null,
   OCUPADO              smallint                       null,
   PROCESO_ASEO         smallint                       null,
   NUMERO_PEDIDO        numeric(200)                   null,
   MESA                 numeric(40)                    null,
   HORA_INICIO          time                           null,
   HORA_FIN             time                           null,
   constraint PK_MESA primary key clustered (NUMERO_MESA, CAPACIDAD_CLIENTES, ESTADO)
);

/*==============================================================*/
/* Table: MESERO                                                */
/*==============================================================*/
create table MESERO 
(
   NOMBRE               char(20)                       not null,
   NUMERO_ID            numeric(15)                    not null,
   NUMERO_MESA          numeric(40)                    null,
   CAPACIDAD_CLIENTES   numeric(15)                    null,
   ESTADO               smallint                       null,
   constraint PK_MESERO primary key clustered (NOMBRE, NUMERO_ID)
);

/*==============================================================*/
/* Table: PEDIDO                                                */
/*==============================================================*/
create table PEDIDO 
(
   NUMERO_PEDIDO        numeric(200)                   not null,
   MESA                 numeric(40)                    not null,
   HORA_INICIO          time                           not null,
   HORA_FIN             time                           not null,
   ESTADO               smallint                       not null,
   EN_PROCESO           smallint                       null,
   TERMINADO            smallint                       null,
   MONTO_TOTAL          numeric(100)                   null,
   constraint PK_PEDIDO primary key clustered (NUMERO_PEDIDO, MESA, HORA_INICIO, HORA_FIN, ESTADO)
);

/*==============================================================*/
/* Table: PLATILLO                                              */
/*==============================================================*/
create table PLATILLO 
(
   NOMBRE               char(20)                       not null,
   DESCRIPCION          char(100)                      not null,
   PRECIO               numeric(100)                   not null,
   NUMERO_PEDIDO        numeric(200)                   null,
   MESA                 numeric(40)                    null,
   HORA_INICIO          time                           null,
   HORA_FIN             time                           null,
   ESTADO               smallint                       null,
   constraint PK_PLATILLO primary key clustered (NOMBRE, DESCRIPCION, PRECIO)
);

/*==============================================================*/
/* Table: TICKET                                                */
/*==============================================================*/
create table TICKET 
(
   NUMERO_TICKET        numeric(200)                   not null,
   FECHA                date                           not null,
   HORA                 time                           not null,
   MESA                 numeric(40)                    not null,
   HORA_INICIO          time                           null,
   HORA_FIN             time                           null,
   ESTADO               smallint                       null,
   MESERO               char(20)                       not null,
   MONTO_TOTAL          numeric(20)                    not null,
   NUMERO_PEDIDO        numeric(200)                   null,
   constraint PK_TICKET primary key clustered (NUMERO_TICKET, FECHA, HORA, MESA, MESERO, MONTO_TOTAL)
);

alter table BEBIDA
   add constraint FK_BEBIDA_REFERENCE_PEDIDO foreign key (NUMERO_PEDIDO, MESA, HORA_INICIO, HORA_FIN, ESTADO)
      references PEDIDO (NUMERO_PEDIDO, MESA, HORA_INICIO, HORA_FIN, ESTADO)
      on update restrict
      on delete restrict;

alter table MESA
   add constraint FK_MESA_REFERENCE_ESTADO_M foreign key (DISPONIBLE, OCUPADO, PROCESO_ASEO)
      references ESTADO_MESA (DISPONIBLE, OCUPADO, PROCESO_ASEO)
      on update restrict
      on delete restrict;

alter table MESA
   add constraint FK_MESA_REFERENCE_PEDIDO foreign key (NUMERO_PEDIDO, MESA, HORA_INICIO, HORA_FIN, ESTADO)
      references PEDIDO (NUMERO_PEDIDO, MESA, HORA_INICIO, HORA_FIN, ESTADO)
      on update restrict
      on delete restrict;

alter table MESERO
   add constraint FK_MESERO_REFERENCE_MESA foreign key (NUMERO_MESA, CAPACIDAD_CLIENTES, ESTADO)
      references MESA (NUMERO_MESA, CAPACIDAD_CLIENTES, ESTADO)
      on update restrict
      on delete restrict;

alter table PEDIDO
   add constraint FK_PEDIDO_REFERENCE_ESTADO_P foreign key (EN_PROCESO, TERMINADO, MONTO_TOTAL)
      references ESTADO_PEDIDO (EN_PROCESO, TERMINADO, MONTO_TOTAL)
      on update restrict
      on delete restrict;

alter table PLATILLO
   add constraint FK_PLATILLO_REFERENCE_PEDIDO foreign key (NUMERO_PEDIDO, MESA, HORA_INICIO, HORA_FIN, ESTADO)
      references PEDIDO (NUMERO_PEDIDO, MESA, HORA_INICIO, HORA_FIN, ESTADO)
      on update restrict
      on delete restrict;

alter table TICKET
   add constraint FK_TICKET_REFERENCE_PEDIDO foreign key (NUMERO_PEDIDO, MESA, HORA_INICIO, HORA_FIN, ESTADO)
      references PEDIDO (NUMERO_PEDIDO, MESA, HORA_INICIO, HORA_FIN, ESTADO)
      on update restrict
      on delete restrict;

