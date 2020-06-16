USE master
GO
DROP DATABASE DB_FLORES
GO
CREATE DATABASE DB_FLORES
GO
USE DB_FLORES
GO
CREATE TABLE Productos(
	ID bigint not null IDENTITY(1,1),
	Codigo varchar(10) not null,
	Nombre varchar(60) not null,
	Descripcion varchar(150),
	ImagenURL varchar(200),
	Precio money not null,
	Stock bigint not null,
	IDMarca bigint not null,
	IDCategoria int not null,
	Eliminado bit not null
)
GO
CREATE TABLE Marcas(
	ID bigint not null IDENTITY(1,1),
	Codigo varchar(10) not null,
	Nombre varchar(60) not null,
	ImagenURL varchar(200),
	Eliminado bit not null
)
GO
CREATE TABLE Categorias(
	ID int not null IDENTITY(1,1),
	Nombre varchar(60) not null,
	Eliminado bit not null
)
GO
CREATE TABLE Provincias(
	ID int not null IDENTITY(1,1),
	Nombre varchar(50) not null,
)
GO
CREATE TABLE Localidades(
	ID int not null IDENTITY(1,1),
	IDProvincia int,
	Nombre varchar(50) not null,
)
GO
CREATE TABLE Direcciones(
	ID bigint not null IDENTITY(1,1),
	IDUsuario bigint not null,
	IDLocalidad int,
	Calle varchar(50) not null,
	Numero int not null,
	Piso varchar(30),
	Dpto varchar(30),
)
GO
CREATE TABLE Usuarios(
	ID bigint not null IDENTITY(1,1),
	Email varchar(10) not null,
	Clave varchar(10) not null,
	NombreUsuario varchar(150) not null,
	Nombres varchar(100) not null,
	Apellidos varchar(100) not null,
	IDTipo int not null,
	IDDireccion bigint not null,
	Telefono int,
	FechaNac date not null,
	FechaReg date not null,
)
GO
CREATE TABLE TiposUsuario(
	ID int not null IDENTITY(1,1),
	Nombre varchar(50) not null
)
GO
CREATE TABLE Favoritos(
	ID bigint not null IDENTITY(1,1),
	IDUsuario bigint not null,
)
GO
CREATE TABLE Productos_X_Favoritos(
	IDFavoritos bigint not null,
	IDProducto bigint not null,
)
GO
CREATE TABLE Carritos(
	ID bigint not null IDENTITY(1,1),
	IDUsuario bigint not null,
	CarritoVendido bit not null,
)
GO
CREATE TABLE Items_X_Carrito(
	IDCarrito bigint not null,
	IDItem bigint not null
)
GO
CREATE TABLE Items(
	ID bigint not null IDENTITY(1,1),
	Codigo varchar(10) not null,
	Nombre varchar(60) not null,
	Descripcion varchar(150),
	ImagenURL varchar(200),
	Precio decimal not null,
	Eliminado bit not null
)
GO
CREATE TABLE Ventas(
	ID bigint not null IDENTITY(1001,1),
	IDCarrito bigint not null,
	IDUsuario bigint not null,
	Importe money not null,
)
GO

--Primary Keys

ALTER TABLE Productos
ADD CONSTRAINT PK_Producto PRIMARY KEY(ID)
GO
ALTER TABLE Marcas
ADD CONSTRAINT PK_Marca PRIMARY KEY(ID)
GO
ALTER TABLE Categorias
ADD CONSTRAINT PK_Categoria PRIMARY KEY(ID)
GO
ALTER TABLE Provincias
ADD CONSTRAINT PK_Provincia PRIMARY KEY(ID)
GO
ALTER TABLE Localidades
ADD CONSTRAINT PK_Localidad PRIMARY KEY(ID)
GO
ALTER TABLE Direcciones
ADD CONSTRAINT PK_Direccion PRIMARY KEY(ID)
GO
ALTER TABLE Usuarios
ADD CONSTRAINT PK_Usuario PRIMARY KEY(ID)
ALTER TABLE TiposUsuario
ADD CONSTRAINT PK_TipoUsuario PRIMARY KEY(ID)
GO
ALTER TABLE Items
ADD CONSTRAINT PK_Item PRIMARY KEY(ID)
GO
ALTER TABLE Favoritos
ADD CONSTRAINT PK_Favorito PRIMARY KEY(ID)
GO
ALTER TABLE Productos_X_Favoritos
ADD CONSTRAINT PK_Producto_X_Favorito PRIMARY KEY(IDFavoritos,IDProducto)
GO
ALTER TABLE Carritos
ADD CONSTRAINT PK_Carrito PRIMARY KEY(ID)
GO
ALTER TABLE Ventas
ADD CONSTRAINT PK_Venta PRIMARY KEY(ID)
GO

--Unique Keys
ALTER TABLE Usuarios
ADD CONSTRAINT UQ_Usuario UNIQUE(Email)
GO
ALTER TABLE Favoritos
ADD CONSTRAINT UQ_UsuarioFavoritos UNIQUE(IDUsuario)
GO
--PUEDE HABER MAS DE UN CARRITO POR USUARIO
/*ALTER TABLE Carritos
ADD CONSTRAINT UQ_UsuarioCarritos UNIQUE(IDUsuario)
GO
*/

--Foreing Keys
ALTER TABLE Productos
ADD CONSTRAINT FK_ProductosMarca FOREIGN KEY(IDMarca) REFERENCES Marcas(ID)
GO
ALTER TABLE Productos
ADD CONSTRAINT FK_ProductosCategoria FOREIGN KEY(IDCategoria) REFERENCES Categorias(ID)
GO
ALTER TABLE Usuarios
ADD CONSTRAINT FK_UsuariosDireccion FOREIGN KEY(IDDireccion) REFERENCES Direcciones(ID)
GO
ALTER TABLE Usuarios
ADD CONSTRAINT FK_UsuariosTipo FOREIGN KEY(IDTipo) REFERENCES TiposUsuario(ID)
GO
ALTER TABLE Direcciones
ADD CONSTRAINT FK_DireccionesLocalidad FOREIGN KEY(IDLocalidad) REFERENCES Localidades(ID)
GO
ALTER TABLE Localidades
ADD CONSTRAINT FK_LocalidadesProvinca FOREIGN KEY(IDProvincia) REFERENCES Provincias(ID)
GO
ALTER TABLE Favoritos
ADD CONSTRAINT FK_FavoritosUsuario FOREIGN KEY(IDUsuario) REFERENCES Usuarios(ID)
GO
ALTER TABLE Productos_X_Favoritos
ADD CONSTRAINT FK_PxF_Favoritos FOREIGN KEY(IDFavoritos) REFERENCES Favoritos(ID)
GO
ALTER TABLE Productos_X_Favoritos
ADD CONSTRAINT FK_PxF_Producto FOREIGN KEY(IDProducto) REFERENCES Productos(ID)
GO
ALTER TABLE Carritos
ADD CONSTRAINT FK_CarritosUsuario FOREIGN KEY(IDUsuario) REFERENCES Usuarios(ID)
GO
ALTER TABLE Items_X_Carrito
ADD CONSTRAINT FK_IxC_Carrito FOREIGN KEY(IDCarrito) REFERENCES Carritos(ID)
GO
ALTER TABLE Items_X_Carrito
ADD CONSTRAINT FK_IxC_Items FOREIGN KEY(IDItem) REFERENCES Items(ID)
GO
ALTER TABLE Ventas
ADD CONSTRAINT FK_VentasCarrito FOREIGN KEY(IDCarrito) REFERENCES Carritos(ID)
go

--Datos
INSERT INTO Categorias
VALUES('Guitarras',0)
GO
INSERT INTO Categorias
VALUES('Bajos',0)
GO
INSERT INTO Categorias
VALUES('Baterias',0)
GO
INSERT INTO Categorias
VALUES('Teclados',0)
GO
INSERT INTO Categorias
VALUES('Discos',0)
GO
INSERT INTO Categorias
VALUES('Interfaces Audio',0)
GO
INSERT INTO Marcas
VALUES('FEN','Fender','https://i.pinimg.com/originals/57/d1/4d/57d14d025160fd803433a58ec7f789d6.jpg',0)
GO
INSERT INTO Marcas
VALUES('PEA','Pearl','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxy4jFVxsGEMBsBR7gSEzHv0w9QykK7hIPIRI50W8LXWN4l6-GvA&s',0)
GO
INSERT INTO Productos
VALUES('GTR01','Fender American Standard Stratocaster','Guitarra Electrica Fender. Año:1991. Color: Sunburn','https://images.reverb.com/image/upload/s--NuzTkvA5--/f_auto,t_large/v1552081106/aeuselsn0fx3rwezmf4u.jpg',199999.90,1,1,1,0)
GO
INSERT INTO Productos
VALUES('BAS01','Fender Jazz Bass','Bajo Electrico Fender. Año:2005. Color: Wood','https://www.doctorbass.net/imagftp/IMm2_Fender-Am-Dlx-JBV-Nat-1.jpg',153231.31,4,1,2,0)
GO
-- PROVINCIAS
INSERT INTO [Provincias] VALUES('BUENOS AIRES')
INSERT INTO [Provincias] VALUES('CATAMARCA')
INSERT INTO [Provincias] VALUES('CHACO')
INSERT INTO [Provincias] VALUES('CHUBUT')
INSERT INTO [Provincias] VALUES('CORDOBA')
INSERT INTO [Provincias] VALUES('CORRIENTES')
INSERT INTO [Provincias] VALUES('ENTRE RIOS')
INSERT INTO [Provincias] VALUES('FORMOSA')
INSERT INTO [Provincias] VALUES('JUJUY')
INSERT INTO [Provincias] VALUES('LA PAMPA')
INSERT INTO [Provincias] VALUES('LA RIOJA')
INSERT INTO [Provincias] VALUES('MENDOZA')
INSERT INTO [Provincias] VALUES('MISIONES')
INSERT INTO [Provincias] VALUES('NEUQUEN')
INSERT INTO [Provincias] VALUES('RIO NEGRO')
INSERT INTO [Provincias] VALUES('SALTA')
INSERT INTO [Provincias] VALUES('SAN JUAN')
INSERT INTO [Provincias] VALUES('SAN LUIS')
INSERT INTO [Provincias] VALUES('SANTA CRUZ')
INSERT INTO [Provincias] VALUES('SANTA FE')
INSERT INTO [Provincias] VALUES('SANTIAGO DEL ESTERO')
INSERT INTO [Provincias] VALUES('TIERRA DEL FUEGO')
INSERT INTO [Provincias] VALUES('TUCUMAN')

--Views
CREATE VIEW VW_ProductosLista AS
SELECT P.*, M.ID AS Marca_ID, M.Codigo AS Marca_Codigo, M.Nombre AS Marca_Nombre, M.ImagenURL AS Marca_ImagenURL, M.Eliminado AS Marca_Eliminado,
 C.ID AS Categoria_ID, C.Nombre AS Categoria_Nombre, C.Eliminado AS Categoria_Eliminado
FROM Productos AS P
INNER JOIN Marcas AS M ON P.IDMarca = M.ID
INNER JOIN Categorias as C ON P.IDCategoria = C.ID
GO

--Store Procedures
CREATE PROCEDURE SP_AltaProducto (
	@Codigo varchar(10),
	@Nombre varchar(60),
	@Descripcion varchar(150),
	@ImagenURL varchar(200),
	@Precio money,
	@Stock bigint,
	@IDMarca bigint,
	@IDCategoria int,
	@Eliminado bit ) AS
BEGIN
INSERT INTO Productos VALUES(@Codigo,@Nombre,@Descripcion,@ImagenURL,@Precio,@Stock,@IDMarca,@IDCategoria,@Eliminado)
END




