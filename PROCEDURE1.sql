/*PROCEDURES*/
CREATE PROCEDURE SOMA
AS
	SELECT 10 + 10 AS SOMA
GO

EXEC SOMA 
GO

/*PROCEDURES COM PAR�METROS
	@ = VARI�VEL LOCAL
	@@ = VARI�VEL GLOBAL
*/

CREATE PROCEDURE CONTA (@NUM1 INT, @NUM2 INT)
AS
	SELECT @NUM1 + @NUM2 AS RESULTADO
GO

EXEC CONTA 2,10
GO

/*
	DROPAR PROCEDURE = DROP + NomeProcedure
*/
DROP PROCEDURE CONTA GO

/*PROCEDURES EM TABELA*/
CREATE PROCEDURE TELEFONES (@TIPO CHAR(3))
AS
SELECT 
	NOMEALUNO, 
	NUMERO
FROM 
	ALUNO
	INNER JOIN TELEFONE ON (ALUNO.IDALUNO = TELEFONE.ID_ALUNO)
WHERE
	TELEFONE.TIPO = @TIPO
GO

EXEC TELEFONES 'COM'
GO

EXEC TELEFONES 'CEL'
GO

/*PAR�METROS DE SA�DA*/
CREATE PROCEDURE GETTIPO (@TIPO CHAR(3), @CONTADOR INT OUTPUT)
AS
SELECT 
	@CONTADOR = COUNT(*) 
FROM 
	TELEFONE
WHERE 
	TIPO = @TIPO
GO

/*
	EXECU��O COM PAR�METRO DE SA�DA
	TRANSACTION SQL -> LINGUAGEM QUE O SQL SERVER TRABALHA
*/

DECLARE @SAIDA INT 
EXEC GETTIPO 'COM', @CONTADOR = @SAIDA OUTPUT
SELECT @SAIDA
GO



