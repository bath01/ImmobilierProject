/*==============================================================*/
/* Nom de SGBD :  Sybase SQL Anywhere 11                        */
/* Date de création :  09/03/2023 08:59:01                      */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_CONCERN_CONCERN_CONTRACT') then
    alter table CONCERN
       delete foreign key FK_CONCERN_CONCERN_CONTRACT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CONCERN_CONCERN2_USERS') then
    alter table CONCERN
       delete foreign key FK_CONCERN_CONCERN2_USERS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CONCERN_CONCERN3_PROPERTY') then
    alter table CONCERN
       delete foreign key FK_CONCERN_CONCERN3_PROPERTY
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CONTRACT_BIND_TYPEOFCO') then
    alter table CONTRACTS
       delete foreign key FK_CONTRACT_BIND_TYPEOFCO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HAVE_HAVE_ROLE') then
    alter table HAVE
       delete foreign key FK_HAVE_HAVE_ROLE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HAVE_HAVE2_USERS') then
    alter table HAVE
       delete foreign key FK_HAVE_HAVE2_USERS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PROPERTY_CORRESPON_PROPERTY') then
    alter table PROPERTY
       delete foreign key FK_PROPERTY_CORRESPON_PROPERTY
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_VISITREQ_VISITREQU_PROPERTY') then
    alter table VISITREQUEST
       delete foreign key FK_VISITREQ_VISITREQU_PROPERTY
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_VISITREQ_VISITREQU_USERS') then
    alter table VISITREQUEST
       delete foreign key FK_VISITREQ_VISITREQU_USERS
end if;

if exists(
   select 1 from sys.systable 
   where table_name='CONCERN'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table CONCERN
end if;

if exists(
   select 1 from sys.systable 
   where table_name='CONTRACTS'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table CONTRACTS
end if;

if exists(
   select 1 from sys.systable 
   where table_name='HAVE'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table HAVE
end if;

if exists(
   select 1 from sys.systable 
   where table_name='PROPERTY'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table PROPERTY
end if;

if exists(
   select 1 from sys.systable 
   where table_name='PROPERTYTYPE'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table PROPERTYTYPE
end if;

if exists(
   select 1 from sys.systable 
   where table_name='ROLE'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table ROLE
end if;

if exists(
   select 1 from sys.systable 
   where table_name='TYPEOFCONTRAT'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table TYPEOFCONTRAT
end if;

if exists(
   select 1 from sys.systable 
   where table_name='USERS'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table USERS
end if;

if exists(
   select 1 from sys.systable 
   where table_name='VISITREQUEST'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table VISITREQUEST
end if;

/*==============================================================*/
/* Table : CONCERN                                              */
/*==============================================================*/
create table CONCERN 
(
   IDUSER               integer                        not null,
   IDPROPERTY           integer                        not null,
   NUMCONT              char(10)                       not null,
   DATESTARTCONCERN     date                           null,
   DATEENDCONCERN       date                           null,
   constraint PK_CONCERN primary key (IDUSER, IDPROPERTY, NUMCONT)
);

/*==============================================================*/
/* Table : CONTRACTS                                            */
/*==============================================================*/
create table CONTRACTS 
(
   NUMCONT              char(10)                       not null,
   IDTYPECONT           integer                        not null,
   DATESTARTCONT        date                           null,
   DATEENDCONT          date                           null,
   PRICECONT            char(10)                       null,
   constraint PK_CONTRACTS primary key (NUMCONT)
);

/*==============================================================*/
/* Table : HAVE                                                 */
/*==============================================================*/
create table HAVE 
(
   IDUSER               integer                        not null,
   IDROLE               integer                        not null,
   constraint PK_HAVE primary key (IDUSER, IDROLE)
);

/*==============================================================*/
/* Table : PROPERTY                                             */
/*==============================================================*/
create table PROPERTY 
(
   IDPROPERTY           integer                        not null,
   IDTYPEPROP           integer                        not null,
   LABELPROPERTY        char(100)                      null,
   BUILDDATEPROPERTY    date                           null,
   MAPPROPERTY          char(50)                       null,
   SURFACEPROPERTY      char(10)                       null,
   STATUSPROPERTY       smallint                       null,
   PRICEPROPERTY        char(10)                       null,
   constraint PK_PROPERTY primary key (IDPROPERTY)
);

/*==============================================================*/
/* Table : PROPERTYTYPE                                         */
/*==============================================================*/
create table PROPERTYTYPE 
(
   IDTYPEPROP           integer                        not null,
   LABELTYPEPROP        char(50)                       null,
   constraint PK_PROPERTYTYPE primary key (IDTYPEPROP)
);

/*==============================================================*/
/* Table : ROLE                                                 */
/*==============================================================*/
create table ROLE 
(
   IDROLE               integer                        not null,
   LABELROLE            char(10)                       null,
   constraint PK_ROLE primary key (IDROLE)
);

/*==============================================================*/
/* Table : TYPEOFCONTRAT                                        */
/*==============================================================*/
create table TYPEOFCONTRAT 
(
   IDTYPECONT           integer                        not null,
   LABELTYPECONT        char(15)                       null,
   constraint PK_TYPEOFCONTRAT primary key (IDTYPECONT)
);

/*==============================================================*/
/* Table : USERS                                                */
/*==============================================================*/
create table USERS 
(
   IDUSER               integer                        not null,
   LASTNAMEUSER         char(50)                       null,
   FIRSTNAMEUSER        char(100)                      null,
   NUMUSER              char(10)                       null,
   BIRTHDAYUSER         date                           null,
   constraint PK_USERS primary key (IDUSER)
);

/*==============================================================*/
/* Table : VISITREQUEST                                         */
/*==============================================================*/
create table VISITREQUEST 
(
   IDUSER               integer                        not null,
   IDPROPERTY           integer                        not null,
   STATUSVISITREQUEST   char(15)                       null,
   DATEVISITREQUEST     date                           null,
   constraint PK_VISITREQUEST primary key (IDUSER, IDPROPERTY)
);

alter table CONCERN
   add constraint FK_CONCERN_CONCERN_CONTRACT foreign key (NUMCONT)
      references CONTRACTS (NUMCONT)
      on update restrict
      on delete restrict;

alter table CONCERN
   add constraint FK_CONCERN_CONCERN2_USERS foreign key (IDUSER)
      references USERS (IDUSER)
      on update restrict
      on delete restrict;

alter table CONCERN
   add constraint FK_CONCERN_CONCERN3_PROPERTY foreign key (IDPROPERTY)
      references PROPERTY (IDPROPERTY)
      on update restrict
      on delete restrict;

alter table CONTRACTS
   add constraint FK_CONTRACT_BIND_TYPEOFCO foreign key (IDTYPECONT)
      references TYPEOFCONTRAT (IDTYPECONT)
      on update restrict
      on delete restrict;

alter table HAVE
   add constraint FK_HAVE_HAVE_ROLE foreign key (IDROLE)
      references ROLE (IDROLE)
      on update restrict
      on delete restrict;

alter table HAVE
   add constraint FK_HAVE_HAVE2_USERS foreign key (IDUSER)
      references USERS (IDUSER)
      on update restrict
      on delete restrict;

alter table PROPERTY
   add constraint FK_PROPERTY_CORRESPON_PROPERTY foreign key (IDTYPEPROP)
      references PROPERTYTYPE (IDTYPEPROP)
      on update restrict
      on delete restrict;

alter table VISITREQUEST
   add constraint FK_VISITREQ_VISITREQU_PROPERTY foreign key (IDPROPERTY)
      references PROPERTY (IDPROPERTY)
      on update restrict
      on delete restrict;

alter table VISITREQUEST
   add constraint FK_VISITREQ_VISITREQU_USERS foreign key (IDUSER)
      references USERS (IDUSER)
      on update restrict
      on delete restrict;

