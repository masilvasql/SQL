/*TRIGGER*/

CREATE TABLE PRODUTOS(
	IDPRODUTO INT IDENTITY PRIMARY KEY,
	NOMEPRODUTO VARCHAR (50) NOT NULL,
	CATEGORIAPRODUTO VARCHAR(30) NOT NULL,
	PRECO NUMERIC(10,2) NOT NULL
)
GO


CREATE TABLE HISTORICO_PRODUTOS(
	IDOPERACAO INT IDENTITY NOT NULL,
	NOMEPRODUTO VARCHAR(50) NOT NULL,
	CATEGORIAPRODUTO VARCHAR(30) NOT NULL,
	PRECOANTIGO NUMERIC(10,2) NOT NULL,
	PRECONOVO NUMERIC(10,2) NOT NULL,
	DATA DATETIME,
	USUARIO VARCHAR(30),
	MENSAGEM VARCHAR(100)
)
GO

INSERT INTO PRODUTOS VALUES('LIVRO SQL SERVER', 'LIVRO', 98.00)
INSERT INTO PRODUTOS VALUES('LIVRO ORCALE', 'LIVRO', 50.00)
INSERT INTO PRODUTOS VALUES('LICENCA POWER CENTER', 'SOFTWARE', 45000.00)
INSERT INTO PRODUTOS VALUES('NOTEBOOK I7', 'COMPUTADORES', 3150.00)
INSERT INTO PRODUTOS VALUES('LIVRO BI', 'LIVRO', 90.00)
GO

SELECT * FROM PRODUTOS
GO

SELECT * FROM HISTORICO_PRODUTOS
GO

/*VERIFICANDO O USUARIO DO BANCO*/
SELECT SUSER_NAME()
GO

/*TRIGGER DE DADOS - DML (DATA MANIPULATION LANGUAGE)*/
CREATE TRIGGER TRG_ATUALIZA_PRECO
ON DBO.PRODUTOS
FOR UPDATE AS

	IF UPDATE(PRECO) -- S� EXECTUA A TRIGGER, SE O UPDATE FOR NA COLUNA PRECO COMANDO TSQL (TRANSACTIONAL SQL) 
	BEGIN
		DECLARE @IDPRODUTO INT
		DECLARE @PRODUTO VARCHAR (30)
		DECLARE @CATEGORIA VARCHAR (10)
		DECLARE @PRECOANTIGO NUMERIC (10,2)
		DECLARE @PRECONOVO NUMERIC (10,2)
		DECLARE @DATA DATETIME 
		DECLARE @USUARIO VARCHAR(30)
		DECLARE @ACAO VARCHAR(100)

		/*1� Bloco*/
		SELECT @IDPRODUTO = IDPRODUTO FROM inserted
		SELECT @PRODUTO = NOMEPRODUTO FROM inserted
		SELECT @CATEGORIA = CATEGORIAPRODUTO FROM inserted
		SELECT @PRECOANTIGO = PRECO FROM deleted
		SELECT @PRECONOVO = PRECO FROM inserted
	
		/*2� Bloco*/
		SET @DATA = GETDATE()
		SET @USUARIO = SUSER_NAME()
		SET @ACAO = 'VALOR INSERIDO PELA TRIGGER TRG_ATUALIZA_PRECO'

		/*POR BOA PR�TICA, VALORES VINDO DE TABELAS, UTILIZAR O "SELECT"
		OUTROS VALORES (FUN��ES OU VALORES LITERAIS), USAR "SET"
		*/

		INSERT INTO HISTORICO_PRODUTOS (IDPRODUTO, NOMEPRODUTO, CATEGORIAPRODUTO, PRECOANTIGO, PRECONOVO, DATA, USUARIO, MENSAGEM)
		VALUES(@IDPRODUTO, @PRODUTO, @CATEGORIA, @PRECOANTIGO, @PRECONOVO, @DATA, @USUARIO, @ACAO)

		PRINT 'TRIGGER EXECUTADA COM SUCESSO'
	END
GO