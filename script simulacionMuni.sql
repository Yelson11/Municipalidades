DECLARE @XML XML
SET @XML = (SELECT * FROM OPENROWSET(BULK 'D:\Users\Yelson\Desktop\II Proyecto Bases\Data4.xml', SINGLE_BLOB) AS data)

DECLARE @hdoc INT  
DECLARE @PrepareXmlStatus INT  

EXEC @PrepareXmlStatus= sp_xml_preparedocument @hdoc OUTPUT, @XML  

DECLARE @TConsumoAgua table (sec int identity (1,1), NumeroFinca int, FechaLectura datetime, Qm3 int)
DECLARE @TRecibos table (sec int identity (1,1), NumeroFinca int, FechaEmision datetime, FechaLimite datetime);
DECLARE @TPagos table (sec int identity(1,1), NumeroFinca int, FechaPago datetime)

INSERT @TConsumoAgua(NumeroFinca, FechaLectura, QM3 )
SELECT NumeroFinca, FechaLectura, QM3
FROM OPENXML(@hdoc, 'XML/ConsumoAgua/dbo.ConsumoAgua') 
WITH (NumeroFinca int, FechaLectura datetime, QM3 int)

INSERT @TRecibos(NumeroFinca, FechaEmision, FechaLimite)
SELECT NumeroFinca, FechaEmision, FechaLimite 
FROM OPENXML(@hdoc, 'XML/Recibos/dbo.Recibos') 
WITH (NumeroFinca int, FechaEmision datetime, FechaLimite datetime)

INSERT @TPagos(NumeroFinca, FechaPago)
SELECT NumeroFinca, FechaPago 
FROM OPENXML(@hdoc, 'XML/Pagos/pagos') 
WITH (NumeroFinca int, FechaPago datetime)

DECLARE @fechaInicio AS datetime
DECLARE @fechaFinal AS datetime 

SET @FechaInicio = (SELECT MIN(FechaLectura) FROM @TConsumoAgua)
SET @FechaFinal = (SELECT MAX(FechaLectura) FROM @TConsumoAgua)

DECLARE @TPagosDiarios table (sec int identity(1,1), IdPropiedad int, FechaPago datetime)
DECLARE @TRecibosDiarios table (sec int identity (1,1), IdPropiedad int, FechaEmision datetime, FechaLimite datetime)

--CREATE PROCEDURE Simulacion @fechaInicio datetime, @fechaFinal datetime 
--AS
--BEGIN 
	WHILE @fechaInicio <= @fechaFinal 
	BEGIN  
		INSERT ConsumoAgua(IdPropiedad, FechaLectura, Qm3)
		SELECT p.Id, c.FechaLectura, c.QM3
		FROM Propiedades p inner join @TConsumoAgua c on p.NumeroFinca = c.NumeroFinca
		WHERE CONVERT(DATE,c.FechaLectura) = CONVERT(DATE, @fechaInicio)
													
		INSERT @TPagosDiarios(IdPropiedad, FechaPago)
		SELECT p.Id, tp.FechaPago 
		FROM @TPagos tp inner join Propiedades p on p.NumeroFinca = tp.NumeroFinca
		WHERE CONVERT(DATE,tp.FechaPago) = CONVERT(DATE, @fechaInicio)
		
		DECLARE @indexPago AS int  
		DECLARE @ultimoPago AS int
		SELECT @indexPago = MIN(t.sec) FROM @TPagosDiarios t
		SELECT @ultimoPago = MAX(t.sec) FROM @TPagosDiarios t
		WHILE @indexPago <= @ultimoPago 
		BEGIN
			--de esta manera se paga el recibo mas viejo por pagar
			DECLARE @Id int 
			set @Id = (SELECT IdPropiedad FROM @TPagosDiarios WHERE sec = @indexPago)
			UPDATE Recibos
			SET FechaPagado = (SELECT FechaPago FROM @TPagosDiarios WHERE sec = @indexPago)
			WHERE IdPropiedad = @Id
			and FechaPagado is NULL and CONVERT(DATE, FechaEmision) = CONVERT(DATE, (select MIN (FechaEmision) from Recibos where IdPropiedad =  @Id  and FechaPagado is NULL))
		
			SET @indexPago = @indexPago + 1
	
		END 
		
		DELETE FROM @TPagosDiarios

		INSERT @TRecibosDiarios(IdPropiedad, FechaEmision, FechaLimite)
		SELECT p.Id, c.FechaEmision, c.FechaLimite 
		FROM Propiedades p inner join @TRecibos c on p.NumeroFinca = c.NumeroFinca
		WHERE CONVERT(DATE, c.FechaEmision) = CONVERT(DATE, @fechaInicio) 
		
		DECLARE @indexRecibo AS int  
		DECLARE @ultimoRecibo AS int
		SELECT @indexRecibo = MIN(tr.sec) FROM @TRecibosDiarios tr
		SELECT @ultimoRecibo = MAX(tr.sec) FROM @TRecibosDiarios tr
		WHILE @indexRecibo <= @ultimoRecibo
		BEGIN
			DECLARE @IdPropiedad as int
			SET @IdPropiedad = (SELECT IdPropiedad FROM @TRecibosDiarios WHERE sec = @indexRecibo)
			
			INSERT INTO Lineas(IdRecibo, IdTipoServicio, Valor)
			VALUES	(@indexRecibo, 1, (SELECT Valor FROM TipoServicio WHERE Id = 1)*
				(SELECT Qm3 FROM ConsumoAgua WHERE CONVERT(DATE, FechaLectura) = CONVERT(DATE, @fechaInicio) and IdPropiedad = @IdPropiedad )), 
					(@indexRecibo, 2, (SELECT Valor FROM TipoServicio WHERE Id = 2)),
					(@indexRecibo, 3, (SELECT Valor FROM TipoServicio WHERE Id = 3)),
					(@indexRecibo, 4, (SELECT Valor FROM TipoServicio WHERE Id = 4)),
					(@indexRecibo, 5, (SELECT Valor FROM TipoServicio WHERE Id = 5));

			INSERT Recibos(IdPropiedad, FechaEmision, FechaLimite)
			SELECT IdPropiedad, FechaEmision, FechaLimite 
			FROM  @TRecibosDiarios 
			WHERE CONVERT(DATE, FechaEmision) = CONVERT(DATE, @fechaInicio) and sec = @indexRecibo
			
			UPDATE Recibos
			SET TotalPagosSinInteresMoratorio = (SELECT SUM(l.Valor) FROM Lineas l where l.IdRecibo = @indexRecibo)
			WHERE Id = @indexRecibo

			SET @indexRecibo = @indexRecibo + 1

		END 
		DELETE FROM @TRecibosDiarios

		SET @FechaInicio = DATEADD(DAY,1,@FechaInicio)

	END

--END

SELECT * FROM Recibos

