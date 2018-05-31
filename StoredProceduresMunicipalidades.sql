drop procedure insertarDatos
drop procedure verPropiedadesAbonado
drop procedure verRecibosPendientes
go
CREATE PROCEDURE insertarDatos
AS
BEGIN 
	DECLARE @XML XML
	SET @XML = (SELECT * FROM OPENROWSET(BULK 'D:\Users\Yelson\Desktop\II Proyecto Bases\Data4.xml', SINGLE_BLOB) AS data)
	DECLARE @hdoc INT  
	DECLARE @PrepareXmlStatus INT  
	EXEC @PrepareXmlStatus = sp_xml_preparedocument @hdoc OUTPUT, @XML  

	INSERT Municipapilidades(Nombre, DiaEmite, DiaLimite, TasaInteres, ValorMetroCubicoAgua)
	SELECT Nombre, DiaEmite, DiaLimite, TasaInteres, ValorMAgua 
	FROM OPENXML(@hdoc, 'XML/Municipalidades/dbo.Municipalidades') 
	WITH (Nombre varchar(50), DiaEmite int, DiaLimite int, TasaInteres float, ValorMAgua float)

	INSERT TipoServicio(Nombre, Valor, Variable)
	SELECT Nombre, Valor, Variable
	FROM OPENXML(@hdoc, 'XML/TipoServicio/dbo.TipoServicio') 
	WITH (Nombre varchar(50), Valor float, Variable bit)

	INSERT Propiedades(IdMunicipalidad, IdAbonado, Descripcion, Valor, CodigoPostal, NumeroFinca)
	SELECT IdMunicipalidad, IdAbonado, Descripcion, Valor, CodigoPostal, NumeroFinca
	FROM OPENXML(@hdoc, 'XML/Propiedades/dbo.Propiedades') 
	WITH (IdMunicipalidad int, IdAbonado int, Descripcion varchar(100), Valor int, CodigoPostal int, NumeroFinca int)
	
	INSERT Abonado(Nombre)
	SELECT Nombre
	FROM OPENXML(@hdoc, 'XML/Abonado/dbo.Abonado') 
	WITH (Nombre varchar(50))

	DECLARE @ServicioPropiedad table (sec int identity(1,1), NumeroFinca int, IdServicio int, FechaContratacion datetime)
	
	INSERT @ServicioPropiedad(NumeroFinca, IdServicio, FechaContratacion)
	SELECT NumeroFinca, IDServicio, FechaContratacion 
	FROM OPENXML(@hdoc, 'XML/ServicioXPropiedad/dbo.ServicioXPropiedad') 
	WITH (NumeroFinca int, IDServicio int, FechaContratacion datetime)

	INSERT ServicioPropiedad(IdPropiedad, IdServicio, FechaContratacion)
	SELECT p.Id, s.IdServicio, s.FechaContratacion 
	FROM Propiedades p inner join @ServicioPropiedad s on p.NumeroFinca = s.NumeroFinca 
	
	EXEC sp_xml_removedocument @hdoc
END 
GO 
CREATE PROCEDURE verPropiedadesAbonado 
@id int
AS
BEGIN
	SELECT a.Nombre AS Nombre, a.Id AS IdAbonado, p.NumeroFinca AS NumeroFinca 
	FROM Abonado a INNER JOIN Propiedades p ON a.Id = p.IdAbonado
	WHERE a.Id = @id
END 
go

CREATE PROCEDURE verRecibosPendientes
@Id int 
AS
BEGIN
	DECLARE @TRecibo table (sec int identity (1,1), IdRecibo int)
	INSERT @TRecibo(IdRecibo)
	SELECT r.Id
	FROM Recibos r inner join Propiedades p on r.IdPropiedad = p.Id 
	inner join Abonado a on a.Id = p.IdAbonado  
	WHERE a.Id = @Id and r.FechaPagado is NULL 
	ORDER BY (IdPropiedad)
	
	DECLARE @indexRecibo AS int  
	DECLARE @ultimoRecibo AS int
	SELECT @indexRecibo = MIN(tr.sec) FROM @TRecibo tr
	SELECT @ultimoRecibo = MAX(tr.sec) FROM @TRecibo tr
		
	WHILE @indexRecibo <= @ultimoRecibo
	BEGIN 
		DECLARE @IdRecibo int 
		SET @IdRecibo = (SELECT IdRecibo FROM @TRecibo WHERE sec = @indexRecibo) 
		EXEC totalRecibos @IdRecibo
		SET @indexRecibo = @indexRecibo + 1
	END 
	
	SELECT r.Id, r.IdPropiedad, r.TotalPagosSinInteresMoratorio, r.InteresMoratorio, r.TotalPagado, r.FechaLimite
	FROM Recibos r inner join Propiedades p on r.IdPropiedad = p.Id 
	inner join Abonado a on a.Id = p.IdAbonado  
	WHERE a.Id = @Id and r.FechaPagado is NULL 
	ORDER BY (IdPropiedad)
	
	SELECT p.Id, SUM (r.TotalPagado) AS Total
	FROM Recibos r inner join Propiedades p on r.IdPropiedad = p.Id 
	inner join Abonado a on a.Id = p.IdAbonado  
	WHERE a.Id = @Id and r.FechaPagado is NULL 
	GROUP BY (p.Id)
	
END

CREATE PROCEDURE totalRecibos
@IdRecibo int 
AS
BEGIN 
	DECLARE @MontoxCobrar AS float
	DECLARE @DiasAtraso AS int 
	DECLARE @TasaInteres AS float
	DECLARE @InteresMoratorio AS float

	SET @MontoxCobrar = (SELECT SUM(Valor) FROM Lineas  where IdRecibo = @IdRecibo)
	SET @DiasAtraso = (DATEDIFF (DAY, (SELECT FechaLimite FROM Recibos WHERE Id = @IdRecibo), GETDATE()))
	SET @TasaInteres = (SELECT m.TasaInteres 
	FROM Recibos r inner join Propiedades p on r.IdPropiedad = p.Id inner join Municipapilidades m on m.Id = p.IdMunicipalidad 
	WHERE r.Id = @IdRecibo )
	SET @InteresMoratorio = (@MontoxCobrar * (@TasaInteres/360) * @DiasAtraso)

	UPDATE Recibos
	SET InteresMoratorio = @InteresMoratorio,
	TotalPagado = (SELECT (TotalPagosSinInteresMoratorio + @InteresMoratorio) FROM Recibos WHERE Id = @IdRecibo)
	WHERE Id = @IdRecibo

END
CREATE PROCEDURE detalleRecibo
@id int
AS
BEGIN
	SELECT t.Nombre, l.Valor FROM Lineas l join TipoServicio t on l.IdTipoServicio = t.Id  WHERE IdRecibo = @id
	SELECT * FROM Recibos WHERE Id =@id
END
GO
-- YELSON__________________________________________________________________
CREATE PROCEDURE iniciarAbonado 
@id int
AS
BEGIN
	SELECT Id, Nombre
	FROM Abonado
	WHERE Id = @id
END 

go
CREATE PROCEDURE iniciarAdministrador
@id int
AS
BEGIN
	SELECT Id, Nombre
	FROM Municipapilidades 
	WHERE Id = @id
END 
go

CREATE PROCEDURE cargarServicios
AS
BEGIN
	SELECT Nombre
	FROM TipoServicio
END 
go

CREATE PROCEDURE cambiarServicio
@servicio varchar(50),
@valorNuevo int
AS
BEGIN
	UPDATE TipoServicio
	SET Valor = @valorNuevo
	FROM TipoServicio
	WHERE Nombre = @servicio
END 

GO

CREATE PROCEDURE configuarEmision
@iDMuni int,
@valor int
AS
BEGIN
	UPDATE Municipapilidades
	SET  DiaEmite = @valor
	FROM Municipapilidades
	WHERE Id = @iDMuni
END 
GO

CREATE PROCEDURE configuarLimite
@iDMuni int,
@valor int
AS
BEGIN
	UPDATE Municipapilidades
	SET  DiaLimite = @valor
	FROM Municipapilidades
	WHERE Id = @iDMuni
END 
GO

CREATE PROCEDURE configuarTasa
@iDMuni int,
@valor int
AS
BEGIN
	UPDATE Municipapilidades
	SET  TasaInteres = @valor
	FROM Municipapilidades
	WHERE Id = @iDMuni
END 
GO

CREATE PROCEDURE pagarRecibo 
@IdPropiedad int 
AS 
BEGIN 
	DECLARE @IdRecibo AS int
	SET @IdRecibo = (SELECT Id FROM Recibos WHERE IdPropiedad = @IdPropiedad  and FechaPagado is NULL and 
	FechaEmision = (SELECT MIN (FechaEmision) FROM Recibos WHERE IdPropiedad = @IdPropiedad and FechaPagado is NULL))

	DECLARE @MontoxCobrar AS float
	DECLARE @DiasAtraso AS int 
	DECLARE @TasaInteres AS float
	DECLARE @InteresMoratorio AS float

	SET @MontoxCobrar = (SELECT SUM(Valor) FROM Lineas  where IdRecibo = @IdRecibo)
	SET @DiasAtraso = (DATEDIFF (DAY, (SELECT FechaLimite FROM Recibos WHERE Id = @IdRecibo), GETDATE()))
	SET @TasaInteres = (SELECT m.TasaInteres 
	FROM Recibos r inner join Propiedades p on r.IdPropiedad = p.Id inner join Municipapilidades m on m.Id = p.IdMunicipalidad 
	WHERE r.Id = @IdRecibo )
	SET @InteresMoratorio = (@MontoxCobrar * (@TasaInteres/360) * @DiasAtraso)

	UPDATE Recibos
	SET InteresMoratorio = @InteresMoratorio, FechaPagado = GETDATE(),
	TotalPagado = (SELECT (TotalPagosSinInteresMoratorio + @InteresMoratorio) FROM Recibos WHERE Id = @IdRecibo)
	WHERE Id = @IdRecibo

END

CREATE PROCEDURE calcularInteresAbonado
AS 
BEGIN 
	DECLARE @indexAbonado AS int  
	DECLARE @ultimoAbonado AS int
	SELECT @indexAbonado = MIN(a.Id) FROM Abonado a
	SELECT @ultimoAbonado = MAX(a.Id) FROM Abonado a
		
	WHILE @indexAbonado <= @ultimoAbonado
	BEGIN 
		EXEC verRecibosPendientes @indexAbonado 
		SET @indexAbonado = @indexAbonado + 1
	END 
END


GO
CREATE PROCEDURE verMorososxMunicipalidad
@idMunicipalidad int 
AS 
BEGIN 
	
	DECLARE @TMorosos table(Id int, TotalMorosidad float, CantidadRecibos int)
	INSERT @TMorosos (Id, TotalMorosidad, CantidadRecibos)
	SELECT p.Id, SUM(r.TotalPagosSinInteresMoratorio) AS total, COUNT(P.Id) from Recibos r inner join Propiedades p on r.IdPropiedad = p.Id
	inner join Municipapilidades m on p.IdMunicipalidad = m.Id 
	WHERE IdMunicipalidad = @idMunicipalidad and FechaPagado is NULL
	GROUP BY (p.Id)
	ORDER BY total DESC

	SELECT a.Id, a.Nombre, m.TotalMorosidad, m.CantidadRecibos  
	FROM @TMorosos m inner join Propiedades p on m.Id = p.Id inner join Abonado a on a.Id = p.IdAbonado
END

CREATE PROCEDURE verHistorialRecibos
@idPropiedad int
as
begin 
	select * from Recibos where IdPropiedad = @idPropiedad and FechaPagado IS NOT NULL
end

CREATE PROCEDURE cambiarNombre
@id int, @Nombre varchar(50)
as
begin 
	Update Abonado
	SET Nombre = @Nombre
	where Id = @id
end

CREATE PROCEDURE corteAgua
@idMuni int
AS 
BEGIN
	SELECT a.Id, a.Nombre, p.CodigoPostal FROM Recibos r inner join Propiedades p on r.IdPropiedad = p.Id 
	inner join Abonado a on p.IdAbonado = a.Id 
	WHERE r.FechaPagado is null and p.CodigoPostal/10000 = @idMuni
	order by (p.CodigoPostal)
END 

CREATE PROCEDURE verDistrito
@idMuni int
AS 
BEGIN
	SELECT a.Id, a.Nombre, p.CodigoPostal, r.TotalPagado as Morosidad FROM Recibos r inner join Propiedades p on r.IdPropiedad = p.Id 
	inner join Abonado a on p.IdAbonado = a.Id 
	WHERE r.FechaPagado is null and p.CodigoPostal/10000 =1 --@idMuni
	order by (r.TotalPagado)
END 

DROP PROCEDURE verMorososxMunicipalidad 
DROP PROCEDURE pagarRecibo
drop procedure cargarServicios
DROP PROCEDURE cambiarServicio

--___________________________________________________________________________________________
exec verRecibosPendientes 1
exec insertarDatos
exec verPropiedadesAbonado

select * from Municipapilidades

exec calcularInteresAbonado