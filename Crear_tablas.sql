--crear database potes
drop database dbGMSisPre;
create database dbGMSisPre;

--usar db potes para las tablas
use dbGMSisPre;

--crear tablas
drop table tb_rol;
create table tb_rol(
id_rol int not null IDENTITY(1,1),
descripcion varchar(50) not null,
constraint pk_id_rol primary key (id_rol)
);

drop table tb_estatus;
create table tb_estatus(
id_estatus int not null IDENTITY(1,1),
descripcion varchar(50) not null,
constraint pk_id_estatus primary key (id_estatus)
);

drop table tb_usuarios; 
create table tb_usuario(
id_usuario int not null IDENTITY(1,1),
id_estatus int not null,
id_rol int not null,
usuario varchar(50),
contrasena varchar(50),
primer_nombre varchar(50) not null,
segundo_nombre varchar(50),
primer_apellido varchar(50) not null,
segundo_apellido varchar(50),
contacto_principal int not null,
contacto_secundario int,
ocupacion varchar(50),
identificacion varchar(20) not null,
nacionalidad varchar(50),
email nchar(90),
fecha_nacimiento date,
registro date not null,
constraint pk_id_usuario primary key (id_usuario),
constraint fk_id_estatus foreign key (id_estatus) references tb_estatus (id_estatus),
constraint fk_id_rol foreign key (id_rol) references tb_rol (id_rol)
);

drop table tb_plazo;
create table tb_plazo(
id_plazo int not null IDENTITY(1,1),
inicio int,
fin int,
constraint pk_id_plazo primary key (id_plazo)
);

drop table tb_prestamo;
create table tb_prestamo(
id_prestamo int not null IDENTITY(1,1),
id_plazo int not null,
monto_prestado money not null,
intereses money not null,
fecha date not null,
constraint pk_id_prestamo primary key (id_prestamo),
constraint fk_id_plazo foreign key (id_plazo) references tb_plazo (id_plazo)
);

drop table tb_atraso;
create table tb_atraso(
id_atraso int not null IDENTITY(1,1),
id_prestamo int not null,
monto_atraso money not null,
descripcion varchar(255),
constraint pk_id_atraso primary key (id_atraso),
constraint fk_id_prestamo foreign key (id_prestamo) references tb_prestamo (id_prestamo)
);

--drop table tb_interes;
--create table tb_interes(
--id_interes int not null IDENTITY(1,1),
--monto_interes money not null,
--descripcion varchar(255),
--constraint pk_id_atraso primary key (id_interes)
--);

--drop table tb_dias;
--create table tb_dias(
--id_plazo int not null IDENTITY(1,1),

--constraint pk_id_plazo primary key (id_plazo)
--);

drop table tb_inversionista;
create table tb_inversionista(
id_inversionista int not null IDENTITY(1,1),
id_usuario int not null,
constraint pk_id_inversionista primary key (id_inversionista),
constraint fk_id_usuario foreign key (id_usuario) references tb_usuario (id_usuario)
);

drop table tb_cliente;
create table tb_cliente(
id_cliente int not null IDENTITY(1,1),
id_usuario int not null,
id_inversionista int not null,
constraint pk_id_cliente primary key (id_cliente),
constraint fk_id_usuario foreign key (id_usuario) references tb_usuario (id_usuario),
constraint fk_id_inversionista foreign key (id_inversionista) references tb_inversionista (id_inversionista)
);

drop table tb_cliente_prestamo;
create table tb_cliente_prestamo(
id_detalle_prestamo int not null IDENTITY(1,1),
id_cliente int not null,
id_prestamo int not null,
constraint pk_id_detalle_prestamo primary key (id_detalle_prestamo),
constraint fk_id_cliente foreign key (id_cliente) references tb_cliente (id_cliente),
constraint fk_id_prestamo foreign key (id_prestamo) references tb_prestamo (id_prestamo)
);