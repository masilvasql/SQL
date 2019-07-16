
/*
	DATEDIFF - Calcula diferen�a entre datas
	GETDATE() - TRAZ DIA E HORA  
*/
SELECT 
	NOMEALUNO, 
	DATEDIFF(day,ALUNO.NASCIMENTO, getdate()) AS IDADE
FROM 
	ALUNO
GO

SELECT 
	NOMEALUNO, 
	DATEDIFF(year,ALUNO.NASCIMENTO, getdate()) AS IDADE
FROM 
	ALUNO
GO



/*-------------------------------------------
	DATENAME com o par�metro MONTH, retorna o m�s por extenso
*/
SELECT 
	NOMEALUNO, 
	DATENAME(MONTH,NASCIMENTO) AS MesNascimento
FROM 
	ALUNO
GO

/*-------------------------------------------
	DATENAME com o par�metro WEEKDAY, retorna o dia da semana por extenso
*/
SELECT 
	NOMEALUNO, 
	DATENAME(WEEKDAY,NASCIMENTO) AS MesNascimento
FROM 
	ALUNO
GO

/*-------------------------------------------
	DATEPART, retorna apenas o parametro desejado, ano, mes, dia (INTEIRO)
*/
SELECT 
	NOMEALUNO, 
	DATEPART(MONTH,NASCIMENTO) AS MesNascimento
FROM 
	ALUNO
GO

/*-------------------------------------------
	DATENAME, retorna o par�metro desejado (por extenso)
*/
SELECT 
	NOMEALUNO, 
	DATEPART(MONTH,NASCIMENTO) AS MesEmNumero,
	DATENAME(MONTH,NASCIMENTO) AS MesExtenso
FROM 
	ALUNO
GO


/*-------------------------------------------
	INCREMENTA um valor na data desejada
*/
SELECT
	DATEADD(DAY,365,NASCIMENTO)
FROM
	ALUNO
