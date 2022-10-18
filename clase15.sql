create database if not exists clase15;

use clase15;

create table if not exists especialidad (
	cod_esp int,
    descripcion varchar (50) not null,
    constraint pk_especialidad primary key (cod_esp)
    );
    
create table if not exists area (
	cod_area int,
    descripcion varchar (50) not null,
    constraint pk_area primary key (cod_area)
    );

alter table area
	modify cod_area varchar (6);
    
create table if not exists empleado (
	nro int,
    nombre varchar (50) not null,
    cod_esp int not null,
    nro_jefe int,
    sueldo decimal (9,2) not null,
    f_ingreso date not null,
    constraint pk_empleado primary key (nro),
    constraint fk_cod_esp foreign key (cod_esp) references especialidad(cod_esp),
    constraint fk_nro_jefe foreign key (nro_jefe) references empleado (nro)
	);
    
create table trabaja (
	nro_emp int,
    cod_area varchar (6),
    constraint pk_trabaja primary key (nro_emp,cod_area),
    constraint fk_nro_emp foreign key (nro_emp) references empleado(nro),
    constraint fk_cod_area foreign key (cod_area) references area(cod_area)	
    );

insert into especialidad values (1,"Gerente"),(2,"Operario");

insert into area values ("A1","Area 1"),("A2","Area 2");

insert into empleado values 
	(1000,"Juan",1,null,10000,20000101), 
    (1001,"Pedro",2,1000,5000,20080501),
    (1002,"Daniel",2,1000,2000,20091001);
    
insert into trabaja values (1000,"A1"),(1000,"A2"),(1001,"A1"),(1002,"A2");

select cod_esp, min(sueldo) from empleado;

select nombre, cod_esp, min(sueldo) from empleado group by nombre, cod_esp;

select cod_esp, min(sueldo) from empleado where min(sueldo)>3000 group by cod_esp ;

select cod_esp, min(sueldo) from empleado group by cod_esp having min(sueldo) > 3000;

select cod_esp, min(sueldo) from empleado group by cod_esp having count(*) > 5;

update especialidad
	set especialidad.descripcion = "Gerente" where especialidad.descripcion = "Operario";

select esp.cod_esp, esp.descripcion, count(*) 
	from empleado emp join especialidad esp on esp.cod_esp = emp.cod_esp 
    group by esp.cod_esp,esp.descripcion;
    
select nro_jefe, nombre, count(*)
	from empleado
    where nro_jefe is not null
    group by nro_jefe, nombre;
    
select jefe.nombre, count(*)
from empleado emp join empleado jefe 
    on emp.nro_jefe = jefe.nro
group by jefe.nro, jefe.nombre;