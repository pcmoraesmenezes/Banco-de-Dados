-- Funções de Data e Hora

-- No sqlite não existe o tipo date, então como poderiamos utilizar a data?

SELECT DATE(); -- Data atual

SELECT TIME(); -- Ele tras por padrão o horario de algum ponto dos EUA, portanto pode ser invalido

SELECT DATETIME(); -- Data e Hora(Mesmo problema da hora)

SELECT STRFTIME('%d/%m/%Y'); -- Data formatada

SELECT STRFTIME('%H:%M:%S') AS 'Horas'; -- Horas formatada

SELECT STRFTIME('%d/%m/%Y %H:%M:%S'); -- Data e hora formatado

SELECT DATETIME('now', 'localtime'); -- Data e hora local, agora estão corretos!

SELECT TIME('NOW', 'LOCALTIME');

SELECT DATETIME(CURRENT_TIMESTAMP, 'LOCALTIME');