create database if not exists practica2sql;

use practica2sql;

create table if not exists tipoDeAvion (
	id int,
    descripcion varchar (50) not null,
    CONSTRAINT pk_tipodeavion primary key (id)
    );

create table if not exists modeloAvion (
	id int,
    descripcion varchar (50) not null,
    CONSTRAINT pk_modeloavion primary key (id)
	); 

create table if not exists avion (
	nro_avion int,
    tipo_avion int not null,
    modelo_avion int not null,
    constraint pk_avion primary key (nro_avion),
    constraint fk_tipo_avion foreign key (tipo_avion) references tipodeavion (id),
    constraint fk_modelo_avion foreign key (modelo_avion) references modeloavion (id)
    );

create table if not exists ubicaciones (
	id int,
    pais varchar (50) not null,
    constraint pk_ubicaciones primary key (id)
    );

create table if not exists vuelo (
	nro_vuelo int,
    desde int not null,
    hasta int not null,
    fecha date not null,
    nro_avion int not null,
    constraint pk_vuelo primary key (nro_vuelo),
    constraint fk_nro_avion foreign key (nro_avion) references avion (nro_avion)
    );
    
create table if not exists pasajero (
	nro_vuelo int,
    documento int,
    nombre varchar (50) not null,
    constraint pk_pasajero primary key (nro_vuelo,documento),
	constraint fk_nro_vuelo foreign key (nro_vuelo) references vuelo(nro_vuelo)
    );

/*Ejercicio_1*/

insert into tipodeavion values (1,"Nacional"),(2,"Internacional"),(3,"Privado"),(4,"Avioneta"),(5,"Militar");

insert into modeloavion values (1,"Boeing"),(2,"F-37"),(3,"JetMax"),(4,"Acrobatic 45"),(5,"LowCost");

insert into ubicaciones values (1,"A"),(2,"B"),(3,"C"),(4,"D"),(5,"E"),(6,"F");

insert into avion values (1,2,1),(2,1,5),(3,2,1),(4,3,3),(5,5,2);

insert into vuelo values 
	(1,1,6,20220501,1),
    (2,1,3,20220823,2),
    (3,1,6,20220715,5)
    ;
    
select nro_vuelo NUMERO_VUELO from vuelo where desde = 1 and hasta = 6;

/*Ejercicio_2*/

insert into vuelo values 
	(4,1,4,20200625,1),
    (5,1,4,20210928,5),
    (6,1,4,20220314,4);

insert into pasajero values 
	(4,41823462,"Pedro"),
	(4,54879654,"Jorge"),
    (5,546987254,"Ana"),
    (6,65421548,"Anastacio");
    
insert into pasajero values 
	(4,4182346,"Pedro Picapiedra"),
	(4,5487964,"Jorgelin"),
    (3,54698254,"Ana Laura"),
    (1,6542548,"Anastacio Anestesia");
    
select pas.nro_vuelo, pas.nombre 
	from pasajero pas join vuelo vlo on pas.nro_vuelo = vlo.nro_vuelo 
    where vlo.desde = 1 and vlo.hasta = 4;
    
/*Ejercicio_3*/

insert into ubicaciones values (8,"H");

insert into vuelo values 
	(7,3,8,20200625,1),
    (8,3,5,20210928,5),
    (9,2,8,20220314,4),
    (10,3,1,20220314,4);
    
select tav.descripcion TIPO_DE_AVION
	from tipodeavion tav join avion av on tav.id = av.tipo_avion 
	join vuelo vlo on av.nro_avion = vlo.nro_avion
    join ubicaciones ubi on vlo.desde = ubi.id where ubi.pais = "C";

/*Ejercicio_4*/

select tav.descripcion TIPO_DE_AVION , av.nro_avion NRO_DE_AVION
 from tipodeavion tav join avion av on tav.id = av.tipo_avion
 join vuelo vlo on av.nro_avion = vlo.nro_avion
 join ubicaciones ubi on vlo.hasta = ubi.id where ubi.pais = "H";
 
 select * from vuelo;