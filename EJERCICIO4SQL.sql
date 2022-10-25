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

alter table empresa
	add column nombre varchar (50);

insert into empresa values (3,2,"Jujuy 55",1);

update empresa set nombre = "Banelco" where nro_empresa  = 1;
update empresa set nombre = "Paulinas" where nro_empresa  = 2;
update empresa set nombre = "Tecnosur" where nro_empresa  = 3;

insert into trabaja values (1,1,25000.0,20010531), (2,1,30000.0,20030501),(3,2,150000.0,20050325);

select per.nombre NOMBRE, ciu.descripcion CIUDAD 
	from ciudad ciu join persona per on ciu.id = per.ciudad
    left join trabaja trab on per.nro_persona = trab.nro_persona
	join empresa emp on trab.nro_empresa = emp.nro_empresa
    where emp.nombre = "Banelco"
    group by per.nro_persona, per.nombre, per.ciudad;

/*Ejercicio_2*/

select per.nombre, per.calle, ciu.descripcion 
	from ciudad ciu join persona per on ciu.id = per.ciudad
    left join trabaja trab on trab.nro_persona = per.nro_persona
    join empresa emp on trab.nro_empresa = emp.nro_empresa
    where emp.nombre = "Paulinas"
    group by per.nro_persona, per.nombre, per.calle, ciu.descripcion;
    
/*Ejercicio_3*/

select per.nombre 