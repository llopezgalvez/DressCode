/*
	Fecha de Creación:
		06-07-2023
	Fecha de Modificaciones:
		06-07-2023
        07-07-2023
        24-08-2023
        25-08-2023
        10-09-2023
        11-09-2023
*/
-- Creación de la base de datos ---------------------
Drop database if exists DBDressCode;
Create database DBDressCode;

Use DBDressCode;

-- select*from empleado;
-- Creación de las tablas ---------------------------
Create table Categoria(
	codigoCategoria int not null auto_increment,
    descripcion varchar(255) not null,
    clasificacion varchar(100) not null,
    tallasDisponibles int not null,
    temporada varchar(100) not null,
    primary key PK_codigoCategoria (codigoCategoria)
);

Create table Proveedor(
	codigoProveedor int not null auto_increment,
    nombreProveedor varchar(100) not null,
    telefonoProveedor varchar(8) not null,
    direccionProveedor varchar(255) not null,
    correoProveedor varchar(100) not null,
    primary key PK_codigoProveedor (codigoProveedor)
);

Create table Usuario(
	codigoUsuario int not null auto_increment,
    nombreUsuario varchar(100) not null,
    apellidoUsuario varchar(100) not null,
    correoUsuario varchar(100) not null,
    username varchar(50) not null,
    contrasena varchar(100) not null,
    foto longblob,
    primary key PK_codigoUsuario (codigoUsuario)
);

-- select * from Usuario;

Create table Empleado(
	codigoEmpleado int not null auto_increment,
    nombreEmpleado varchar(100) not null,
    apellidoEmpleado varchar(100) not null,
    puestoEmpleado varchar(100) not null,
    telefonoEmpleado varchar(8) not null,
	primary key PK_codigoEmpleado (codigoEmpleado)
);

Create table ControlCalidad(
	codigoControlCalidad int not null auto_increment,
    motivo varchar(255) not null,
    descripcionCalidad varchar (255) not null,
    codigoUsuario int not null,
    primary key PK_codigoControlCalidad (codigoControlCalidad)
);

Create table Marca(
	codigoMarca int not null auto_increment,
    nombreMarca varchar(100) not null,
    direccionMarca varchar(255) not null,
    correoMarca varchar(100) not null,
    codigoProveedor int not null,
    primary key PK_codigoMarca (codigoMarca),
    constraint FK_Marca_Proveedor foreign key (codigoProveedor)
		references Proveedor (codigoProveedor)
);

Create table Articulo(
	codigoArticulo int not null auto_increment,
    talla varchar(5) not null,
    colorArticulo varchar(50) not null,
    materialArticulo varchar(100) not null,
    precio decimal(10,2),
    existenciaArticulo int not null,
    codigoCategoria int not null,
    codigoMarca int not null,
    primary key PK_CodigoArticulo (codigoArticulo),
    constraint FK_Articulo_Categoria foreign key (codigoCategoria)
		references Categoria (codigoCategoria),
	constraint FK_Articulo_Marca foreign key (codigoMarca)
		references Marca (codigoMarca)
);

Create table Persona(
	codigoPersona int not null auto_increment,
    nombrePersona varchar(100) not null,
    apellidoPersona varchar(100) not null,
    DPI varchar(13) not null,
    telefonoContacto varchar(8) not null,
	correoPersona varchar(100) not null,
    direccionPersona varchar(255) not null,
    NITPersona varchar(10) not null,
    codigoUsuario int not null,
    primary key PK_codigoPersona (codigoPersona),
	constraint FK_Persona_Usuario foreign key (codigoUsuario)
		references Usuario (codigoUsuario)

);

Create table Compra(
	codigoCompra int not null auto_increment,
    formaDePago varchar(100) not null,
    departamentoEntrega varchar(100) not null,
    direccionEntrega varchar(255) not null,
    horarioEntrega varchar (100) not null,
    telefonoReferencia varchar (8) not null,
    codigoPersona int not null,
    primary key PK_codigoCompra (codigoCompra),
    constraint FK_Compra_Persona foreign key (codigoPersona)
		references Persona (codigoPersona)
);

Create table DetalleArticuloCompra(
	codigoDetalleArticuloCompra int not null auto_increment,
    cantidadCompra int not null,
    precioCompra decimal(10,2) not null,
    codigoCompra int not null,
    codigoArticulo int not null,
    primary key PK_codigoDetalleArticuloCompra (codigoDetalleArticuloCompra),
    constraint FK_DetalleArticuloCompra_Compra foreign key (codigoCompra)
		references Compra (codigoCompra),
	constraint FK_DetalleArticuloCompra_Articulo foreign key (codigoArticulo)
		references Articulo (codigoArticulo)
);

Create table Factura(
	codigoFactura int not null auto_increment,    
    NITEmpresa varchar(10) not null default "123",
    nombreEmpresa varchar(50) not null default "DressCode",
    direccionEmpresa varchar(255) not null default "Ciudad de Guatemala Zona 7, Landívar 10-38",
    telefonoEmpresa varchar(8) not null default "22561245",
    codigoAutorizacion varchar(150) not null,
    fechaEmision datetime not null default now(),
    codigoUsuario int not null,
    codigoCompra int not null,
    codigoEmpleado int not null,
    primary key PK_codigoFactura (codigoFactura),
    constraint FK_Factura_Usuario foreign key (codigoUsuario)
		references Usuario (codigoUsuario),
	constraint FK_Factura_Compra foreign key (codigoCompra)
		references Compra (codigoCompra),
	constraint FK_Factura_Empleado foreign key (codigoEmpleado)
		references Empleado (codigoEmpleado)
);

-- Inserción de datos (Categoría) --------------------------------
Insert into Categoria(descripcion, clasificacion, tallasDisponibles, temporada)
	values('Blusa de botones', 'Adultos', '5', 'Verano');
Insert into Categoria (descripcion, clasificacion, tallasDisponibles, temporada)
	values('Blusa tipo Polo', 'Adultos', '5', 'Verano');
Insert into Categoria (descripcion, clasificacion, tallasDisponibles, temporada)
	values('Top - Fuscia', 'Adultos', '5', 'Vrano');
    
     -- Select * from Categoria;
    
-- Inserción de datos (Proveedor) --------------------------------
Insert into Proveedor(nombreProveedor, telefonoProveedor, direccionProveedor, correoProveedor)
	Values('Textiles CA', 45789765, '19 Avenida 8 - 10 Zona 11', 'texilesCA@gmail.com');
Insert into Proveedor(nombreProveedor, telefonoProveedor, direccionProveedor, correoProveedor)
	values('Fábrica GT', 65124587, 'Calzada Roosevelt Kilómetro 14, 6 - 38 Zona 2 de Mixco, Colonia el Tesoro', 'fabricaGT@gmail.com');
Insert into Proveedor(nombreProveedor, telefonoProveedor, direccionProveedor, correoProveedor)
	values('BodegaPA', 34657890, '7 Av 34 - 12 Zona 8 Guatemala - Guatemala.', 'bodegaPA@gmail.com');

Insert into Usuario(nombreUsuario, apellidoUsuario, correoUsuario, username, contrasena,foto)
	Values('Edgar', 'Lutin', 'elutin@gmail.com', 'elutin', '123','');
    
Insert into Usuario(nombreUsuario, apellidoUsuario, correoUsuario, username, contrasena,foto)
	Values('Pedro', 'Armas', 'parmas@gmail.com', 'parmas', '1234',LOAD_FILE('C:/Users/Dell/Downloads/Proyecto Dresscode/DressCode/web/images/perfil.png'));
  
  
  -- Con el código de load file pueden ingresarse imágenes a través de una ruta completa, sin embargo, se necesita una ruta que no cambie y sea fija.
  Insert into Usuario(nombreUsuario, apellidoUsuario, correoUsuario, username, contrasena,foto)
	Values('Pedro', 'Armas', 'parmas@gmail.com', 'parmas', '1234',load_file('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ProgramadorFP.jpg'));
Insert into Usuario(nombreUsuario, apellidoUsuario, correoUsuario, username, contrasena,foto)
	Values('Edmon', 'Mulet', 'emulet@gmail.com', 'emulet', '12345','');
    

    
    Select * from Usuario;
    
-- Inserción de datos (Empleado) --------------------------------
Insert into Empleado(nombreEmpleado, apellidoEmpleado, puestoEmpleado, telefonoEmpleado)
	values('Brayan', 'Julián', 'Gerente', 23458712);
Insert into Empleado(nombreEmpleado, apellidoEmpleado, puestoEmpleado, telefonoEmpleado)
	Values('Lester', 'López', 'Supervisor', 46796512);
Insert into Empleado(nombreEmpleado, apellidoEmpleado, puestoEmpleado, telefonoEmpleado)
	Values('Oscar', 'Monterroso', 'Programador', 56981234);
    
    Select * from Empleado;

-- Inserción de datos (ControlCalidad) --------------------------------
Insert into ControlCalidad(motivo, descripcionCalidad, codigoUsuario)
	Values('Buenas prendas', 'Me gustaron muchas las prendas ', 1);
Insert into ControlCalidad(motivo, descripcionCalidad, codigoUsuario)
	Values('Mal servicio', 'No me gusto la atención al cliente', 2);
Insert into ControlCalidad(motivo, descripcionCalidad, codigoUsuario)
	Values('Bonitas instalaciones', 'Quede encantado con las instalaciones', 3);
Insert into ControlCalidad(motivo, descripcionCalidad, codigoUsuario)
	Values('Me trataron mal', 'Mal servicio', 1);
    
    Select * from ControlCalidad;
    
-- Inserción de datos (Marca) ------------------------------------------
Insert into Marca(nombreMarca, direccionMarca, correoMarca, codigoProveedor)
	Values('Adidas', 'Boulevar Proceres 18-41 Zona 10', 'adidas@gmail.com', 1);
Insert into Marca(nombreMarca, direccionMarca, correoMarca, codigoProveedor)
	Values('Nike', '1 Cl 18-92 Z 1 Guatemala - Guatemala.', 'nike@gmail.com', 2);
Insert into Marca(nombreMarca, direccionMarca, correoMarca, codigoProveedor)
	Values('Zara', '5ta avenida 0-15 zona 4 Mixco, Guatemala. Calzada San Juan.', 'zara@gmail.com', 3);
    
    Select * from Marca;

-- Inserción de datos (Articulo) ----------------------------------------
Insert into Articulo(talla, colorArticulo, materialArticulo, precio, existenciaArticulo, codigoCategoria, codigoMarca)
	Values('S', 'Azul', 'Tela Piqué', 159.99, '25', 1, 1);
Insert into Articulo(talla, colorArticulo, materialArticulo, precio, existenciaArticulo, codigoCategoria, codigoMarca)
	Values('S', 'Celeste', 'Algodón', 120.00, '100', 2, 2);
Insert into Articulo(talla, colorArticulo, materialArticulo, precio, existenciaArticulo, codigoCategoria, codigoMarca)
	Values('S', 'Fucsia', 'Seda', 50.00, '0', 3, 3);
    
    Select * from Articulo;
    
-- Inserción de datos (Persona) ------------------------------------------
Insert into Persona(nombrePersona, apellidoPersona, DPI, telefonoContacto, correoPersona, direccionPersona, NITPersona, codigoUsuario)
	Values('Franco', 'Paiz', 2320556340103, 34765434, 'fpaiz@gmail.com', '12 Calle "A" - Zona 7. Col Verbena', 85907-8, 1);
Insert into Persona(nombrePersona, apellidoPersona, DPI, telefonoContacto, correoPersona, direccionPersona, NITPersona, codigoUsuario)
	Values('Antonio', 'Martínez', 2646676110101, 45543412, 'amartinez@gmail.com', '13 Calle "C" - Zona 7. Col Castillo Lara', 5480627-1, 2);
Insert into Persona(nombrePersona, apellidoPersona, DPI, telefonoContacto, correoPersona, direccionPersona, NITPersona, codigoUsuario)
	Values('Luis', 'Martínez', 2349313450808, 49450090, 'lmartinez@gmail.com', '13 Calle "C - Zona 7. Col Casitillo Lara', 45789012-3, 3);
    
    Select * from Persona;
    
-- Inserción de datos (Compra) ------------------------------------------  
Insert into Compra(codigoPersona, formaDePago, departamentoEntrega, direccionEntrega, horarioEntrega, telefonoReferencia)
	Values(1,'Efectivo', 'Quiché', 'Zona 1, 11 Calle "B"', 'Lunes', '78521495');
Insert into Compra(codigoPersona, formaDePago, departamentoEntrega, direccionEntrega,horarioEntrega, telefonoReferencia)  
	Values(2,'Por tarjeta', 'Ciudad de Guatemala', 'Zona 7 11 Calle "A" Col. Kaminal Juyú','Martes','22109845');
Insert into Compra(codigoPersona, formaDePago, departamentoEntrega, direccionEntrega, horarioEntrega, telefonoReferencia)
	Values(3,'En efectivo', 'San Marcos', 'Zona 5 12 calle "B" Col. Landívar','Miercoles','40845216');
    
    Select * from Compra;
  
-- Inserción de datos (DetalleArticuloCompra) ------------------------------------------
Insert into DetalleArticuloCompra(codigoCompra, codigoArticulo, cantidadCompra, precioCompra)
	Values(1, 1, 2, 159.99);
Insert into DetalleArticuloCompra(codigoCompra, codigoArticulo, cantidadCompra, precioCompra)
	Values(2, 2, 3, 50.00);
Insert into DetalleArticuloCompra(codigoCompra, codigoArticulo, cantidadCompra, precioCompra)
	Values(3, 3, 5, 120.00);
    
    Select * from DetalleArticuloCompra;
    
-- Inserción de datos (Factura) -------------------------------------------------------
Insert into Factura(codigoAutorizacion,fechaEmision,codigoUsuario,codigoCompra, codigoEmpleado)
	values('569',now(),3,3,3);
    
    Insert into Factura(codigoAutorizacion,fechaEmision,codigoUsuario,codigoCompra, codigoEmpleado)
	values('8777',now(),2,3,1);

    Select * from Factura;