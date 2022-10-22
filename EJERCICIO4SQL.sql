create database if not exists practica4sql;

use practica4sql;

create table if not exists razon_social(
	id int,
    descripcion varchar (50) not null unique,
    constraint pk_razon_social primary key (id)
    );

create table if not exists ciudad(
	id int,
    descripcion varchar (50) not null unique,
    constraint pk_ciudad primary key (id)
	);

create table if not exists empresa (
	nro_empresa int,
    razon_social int,
    calle varchar (100) not null,
    ciudad int,
    constraint pk_empresa primary key (nro_empresa),
    constraint fk_razon_social foreign key (razon_social) references razon_social(id),
    constraint fk_ciudad foreign key (ciudad) references ciudad(id)
    );
    
create table if not exists persona (
	nro_persona int,
    nombre varchar (50) not null,
    calle varchar (100) not null,
    ciudad int not null,
    nro_supervisor int,
    constraint pk_persona primary key (nro_persona),
    constraint fk_nro_supervisor foreign key (nro_supervisor) references persona(nro_persona)
    );
    
create table if not exists trabaja (
	nro_persona int,
    nro_empresa int,
    salario decimal (8,2) not null,
    fecha_ingreso date not null,
    constraint pk_trabaja primary key (nro_persona,nro_empresa),
    constraint fk_nro_persona foreign key (nro_persona) references persona(nro_persona),
    constraint fk_nro_empresa foreign key (nro_empresa) references empresa(nro_empresa)
	);
    
insert into razon_social values (1,"COOPERATIVA"),
	(2,"SA"),
    (3,"SRL"),
    (4,"MUTUAL");
    
insert into ciudad values (1,"Buenos Aires"),
	(2,"La Plata"),
    (3,"Rosario"),
    (4,"Bahia Blanca"),
    (5,"Misiones");
    
/*Ejercicio_1*/

insert into persona values 
	(1,"Jorge","Lafayette 2214",1,null),
    (2,"Pedro","Albornoz 5497",1,null),
    (3,"Juan","Jujuy 6459",3,1),
    (4,"Roberto","Tokyo 6645",3,1),
    (5,"Mauricio","Sarratea 548",1,null);
    
insert into empresa values 
	(1,2,"Albornoz 2000",1),
    (2,1,"Filete 554",3);
    
insert into empresa values (3,2,"Jujuy 55",1);

