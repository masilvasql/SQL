/*
	TSQL -> � um bloco de linguagem de programa��o
*/

--BLOCO DE EXECU��O
BEGIN
	PRINT 'PRIMEIRO BLOCO'
END
GO

/*BLOCO DE ATRIBUI��O DE VARI�VEIS*/
DECLARE 
	@CONTADOR INT
BEGIN
	SET @CONTADOR = 5
	PRINT @CONTADOR
END
GO

/*NO SQL SERVER CADA COLUNA, VARI�VEL, LOCAL, EXPRESS�O E PAR�METRO, TEM UM TIPO*/
DECLARE
	@V_NUMERO NUMERIC(10,2) = 100.52,
	@V_DATA DATETIME = '20190718'
BEGIN
	PRINT 'VALOR NUMERICO -> ' + CAST(@V_NUMERO AS VARCHAR)
	PRINT 'VALOR NUMERICO -> ' + CONVERT(VARCHAR, @V_NUMERO)
	PRINT 'VALOR DE DATA  -> ' + CAST(@V_DATA AS VARCHAR)
	PRINT 'VALOR DE DATA  -> ' + CONVERT(VARCHAR, @V_DATA, 111)
	PRINT 'VALOR DE DATA  -> ' + CONVERT(VARCHAR, @V_DATA, 121)
	PRINT 'VALOR DE DATA  -> ' + CONVERT(VARCHAR, @V_DATA, 105)
END
GO

