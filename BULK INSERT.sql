/*BULK INSERT - IMPORTACAO DE ARQUIVOS

	\t = tecla TAB

*/

BULK INSERT LANCAMENTO_CONTABIL
FROM 'C:\cursosUdemy\SQL\CONTAS.txt'
WITH(
	FIRSTROW = 2,
	DATAFILETYPE = 'char',
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n'
)



