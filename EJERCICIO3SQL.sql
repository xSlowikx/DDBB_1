create database if not exists practica3sql;

use practica3sql;

create table if not exists vendedor(
	id_empleado int,
    nombre varchar (50) not null,
    apellido varchar (50) not null,
    dni int not null unique,
    constraint pk_vendedor primary key (id_empleado)
	);
    
create table if not exists cliente (
	id_cliente int,
    nombre varchar (50) not null,
    constraint pk_cliente primary key (id_cliente)
	);
    
create table if not exists proveedor (
	id_proveedor int,
    nombre varchar (50) not null,
    cuit int not null unique,
    constraint pk_proveedor primary key (id_proveedor)
	);
    
create table if not exists producto (
	id_producto int,
    descripcion varchar (50) not null,
    estado varchar (50) not null,
    id_proveedor int,
    constraint pk_producto primary key (id_producto),
    constraint fk_id_proveedor foreign key (id_proveedor) references proveedor(id_proveedor)
    );
    
create table if not exists venta (
	nro_factura int,
    id_cliente int not null,
    fecha date not null,
    id_vendedor int not null,
    constraint pk_venta primary key (nro_factura),
    constraint pk_id_cliente foreign key (id_cliente) references cliente(id_cliente),
    constraint pk_id_vendedor foreign key (id_vendedor) references vendedor(id_empleado)
    );
    
create table if not exists detalle_venta (
	nro_factura int,
    nro_detalle int,
    id_producto int not null,
    cantidad int not null,
    precio_unitario decimal (7,2) not null,
    constraint pk_detalle_venta primary key (nro_factura,nro_detalle),
    constraint fk_id_producto foreign key (id_producto) references producto(id_producto)
    );
    
