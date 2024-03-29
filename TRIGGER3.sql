
/* TRIGGER COM SELECT - ATUALIZAÇÃO EM MASSA*/
CREATE TRIGGER TGR_SALARIO
ON DBO.EMPREGADO
FOR UPDATE AS
IF UPDATE(SALARIO)
BEGIN
	INSERT INTO HIST_SALARIO (IDEMPREGADO, ANTIGOSALARIO, NOVOSALARIO, DATA)
	SELECT D.IDEMPREGADO, D.SALARIO, I.SALARIO, GETDATE()
	FROM deleted D, inserted I
	WHERE D.IDEMPREGADO = I.IDEMPREGADO
END
GO

UPDATE EMPREGADO SET SALARIO = SALARIO * 1.1


