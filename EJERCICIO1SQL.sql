alter table articulo
	modify cod_art int not null,
    modify descripcion varchar(100) not null,
    modify precio decimal(7,2) not null;

/*Ejercicio_1*/

insert into articulo values 
	(1,"Harina",100), 
	(2,"Leche",200),
	(3,"Pan",150),
	(4,"Chocolate",300),
	(5,"Chupetin",25),
	(6,"Arandanos",350),
	(7,"Alpiste",75),
	(8,"Manteca",185),
	(9,"Azucar",130),
	(10,"Arroz",95);

select cod_art from articulo where precio between 100 and 1000 and descripcion like "A%";

/*Ejercicio_2*/

insert into ciudad values 
	(1,"La Plata"),
	(2,"Rosario"),
	(3,"Buenos Aires"),
	(4,"Rawson"),
	(5,"Rio Tercero");

insert into proveedor values 
	(1,"Sancor SA","Suipacha 2741", 1, 20010801),
	(2,"Trio SA", "Brig. Gral. Juan Manuel de Rosas 5584", 3, 20030501),
	(3,"Arcor SA", "Suipacha 6691", 5, 20000301);

select * from proveedor;

/*Ejercicio_3*/
 
 insert into material values
	(1,"Trigo"),
    (2,"Soja"),
    (3,"Bolsa de carton"),
    (9,"Bolsa de arranque"),
    (18,"Maiz");
    
select descripcion from material where cod_mat in (1,3,6,9,18);

/*Ejercicio_4*/

select cod_prov CODIGO_PROVEEDOR, nombre NOMBRE_PROVEEDOR from proveedor where (domicilio like "Suipacha%") and (fecha_alta between 20010101 and 20011231);

/*Ejercicio_5*/

select nom.nombre PROVEEDOR, ciu.nombre ZONA from proveedor nom, ciudad ciu where nom.cod_ciudad = ciu.cod_ciu;

select nom.nombre PROVEEDOR, ciu.nombre ZONA 
from proveedor nom join ciudad ciu on nom.cod_ciudad = ciu.cod_ciu;

/*Ejercicio_6*/

select prov.nombre PROVEEDOR, ciu.nombre ZONA 
from proveedor prov join ciudad ciu on prov.cod_ciudad = ciu.cod_ciu 
and ciu.nombre = "La Plata";

/*Ejercicio_7*/

insert into almacen values 
	(1, "Galpon A", "Jorge"),
    (2, "Galpon B", "Martinez"),
    (3, "Galpon C", "Medrano"),
    (4, "Galpon D", "Silvio"),
    (5, "Galpon E", "Serrano");
    
insert into contiene values 
	(1,1),
    (2,2),
    (1,3),
    (1,4),
    (3,6),
    (3,7),
    (3,9);
    
select distinct cont.nro_almacen NRO_ALMACEN from contiene cont join articulo art on (cont.cod_articulo = art.cod_art) where art.descripcion like "%A%";

/*Ejercicio_8*/

insert into proveedor values (4,"Tricolor","Maipu 5548",2,20050306);

insert into provisto_por values (1,4), (2,4), (9,4), (18,4);

select distinct mat.COD_MAT, mat.DESCRIPCION 
	from material mat join provisto_por prov on (mat.COD_MAT = prov.COD_MATERIAL) 
    join proveedor prvdr on (prov.COD_PROVEEDOR = prvdr.COD_PROV) 
    join ciudad ciu on (prvdr.COD_CIUDAD = ciu.COD_CIU) 
    where ciu.NOMBRE = "Rosario";
    
    
/*Ejercicio_9*/

select prov.nombre PROVEEDOR from proveedor prov 
	join provisto_por provpor on (provpor.COD_PROVEEDOR = prov.COD_PROV)
    join compuesto_por comppor on (provpor.COD_MATERIAL = comppor.COD_MATERIAL)
    join contiene cont on (comppor.COD_ARTICULO = cont.COD_ARTICULO)
    join almacen alm on (alm.NRO = cont.NRO_ALMACEN)
    where alm.RESPONSABLE = "Martin Gomez";
    
/*Ejercicio_10*/

select * from contiene;

insert into contiene values (10,9),(10,6),(10,4),(10,3);

update contiene
	set nro_almacen = 20 where nro_almacen = 10;
    
/*Ejercicio_11*/

insert into proveedor values (25,"Meritocracia","Maipacha 5548",2,20000908);

insert into proveedor values (30, "ABCDARIO", "Pinchocasa 1364", 5, 20101201);

delete from proveedor
	where proveedor.nombre like "%ABC%";
    
select * from proveedor;