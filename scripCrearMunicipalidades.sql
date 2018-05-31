create database ControlMunicipalidades;

use ControlMunicipalidades;

drop table Municipapilidades
CREATE TABLE Municipapilidades 
(Id int identity (1,1) not null PRIMARY KEY,Nombre varchar(50), DiaEmite int, DiaLimite int, TasaInteres float, ValorMetroCubicoAgua float );

drop table TipoServicio
CREATE TABLE TipoServicio 
(Id integer identity (1,1) not null PRIMARY KEY, Nombre varchar(50), Valor float, Variable bit);

drop table Propiedades
CREATE TABLE Propiedades 
(Id integer identity (1,1) not null PRIMARY KEY, IdMunicipalidad int, IdAbonado int, Descripcion varchar(100), Valor int, CodigoPostal int, NumeroFinca int);

drop table Abonado
CREATE TABLE Abonado 
(Id integer identity (1,1) not null PRIMARY KEY, Nombre varchar(50));

drop table ServicioPropiedad
CREATE TABLE ServicioPropiedad 
(Id integer identity (1,1) not null PRIMARY KEY, IdPropiedad int, IdServicio int,	FechaContratacion datetime,);

drop table ConsumoAgua
CREATE TABLE ConsumoAgua 
(Id integer identity (1,1) not null PRIMARY KEY, IdPropiedad int, FechaLectura datetime, Qm3 int);

drop table Recibos
CREATE TABLE Recibos
(Id integer identity (1,1) not null PRIMARY KEY, IdPropiedad int, FechaEmision datetime, TotalPagosSinInteresMoratorio float, InteresMoratorio int, TotalPagado int, FechaLimite datetime, FechaPagado datetime);

drop table Lineas
CREATE TABLE Lineas
(Id integer identity (1,1) not null PRIMARY KEY, IdRecibo int, IdTipoServicio int, Valor int);

SELECT * FROM ConsumoAgua
SELECT * FROM Abonado
SELECT * FROM Lineas
SELECT * FROM Municipapilidades
SELECT * FROM TipoServicio
SELECT * FROM Propiedades
SELECT * FROM Abonado
SELECT * FROM Municipapilidades
SELECT * FROM Recibos