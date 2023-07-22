--LOWER pega um texto e transforma tudo em letra minuscula
--UPPER pega o texto e transforma tudo em letra maiuscula
--INITCAP ele transforma a primeira letra em maiuscula
--CONCAT coloca um monte de informa��es em um campo unico unidas
--LPAD ele vai preencher com caracteres com o tamanho expecificado dos caracteres
--SBSTR para tirar uma parte do texto maior para o menor
--INSTR � fun��o que identificar se exista ou n�o
--LTRIM � uma fun��o que tira os espa�os brancos do caracter sobrados do campo da esquerda
--RTRIM vai tirar os espa�os da direita do campo sobrados
--TRIM vai tirar n�o s� os espa�os brancos da direita mas tamb�m como o da esquerda
--TRANSLATE ela traduz uns caracteres por outros caracteres
--REPLACE ele pode substituir uma coisa por outra
SELECT ENDERECO_1 || '' || BAIRRO || '' || CIDADE || '' || ESTADO || '' || CEP FROM TABELA_DE_CLIENTES;
SELECT NOME_DO_PRODUTO, LPAD(NOME_DO_PRODUTO,70,�*�) FROM TABELA_DE_PRODUTOS;
SELECT NOME_DO_PRODUTO, INSTR(NOME_DO_PRODUTO,�Campo�) FROM TABELA_DE_PRODUTOS;
SELECT NOME_DE_PRODUTO, REPLACE(NOME_DE_PRODUTO, �Litro�, �L�) FROM TABELA_DE_PRODUTOS;
SELECT NOME_DE_PRODUTO, REPLACE(REPLACE(NOME_DE_PRODUTO, �Litro�, �L�), �Ls�, �L�) FROM TABELA_DE_PRODUTOS;

--D - DIA DA SEMANA
--DD - DIA DO MES
-- DDD- NUMERO DO DIA DO ANO
--DAY - DIA POR EXTENSO
--MM - MES DO ANO
--MON -MES ABREVIADO
--MONTH - MES POR EXTENSO
--YYYY- ANO COM 4 DIGITOS
--YY- ANO COM DOIS DIGITOS
--S�MBOLO DE SEPARADOR DA DATA - / * , ; OU UM TEXTO QUALQUER--HH - HORA COM DOIS DIGITOS
--HH12 - HORA DE 0 A 12
--HH24 - HORA DE 0 A 24
--MI - MINUTO
--SS - SEGUNDO
--SYDATE -- GRAVA HORA E O DIA 
--ADD_MONTHS PEGAR UMA DATA E COLOCA O NUMEROS DE MESES NAQUELA TAL DATA PODER SER UM NUMERO POSITIVO OU NEGATIVO
--NEXT_DAY ELE VAI DEVOLVER A DATA DA PROXIMA SEMANA COM TODA A DESCRI��O
--LAST_DAY VAI ME DEVOLVER O ULTIMO MES DAQUELA DATA
--TRUNC ELE VAI PEGAR UMA DATA COM HORAS E CONVERTER S� PARA O DIA
--ROUND ARRENDODASSE AQUELA DATA, TIPO ANTES DO DIA 15 DAQUELE TAL MES ELE VAI PEGA O PRIMEIRO DIA E SE FOR DEPOIS DO DIA 15 ELE VAI PEGAR O ULTIMO DIA DAQUELE TAL MES

SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY HH:MI:SS') FROM DUAL;
SELECT NOME, DATA_DE_NASCIMENTO FROM TABELA_DE_CLIENTES;
SELECT NOME, TO_CHAR(DATA_DE_NASCIMENTO, 'DD MONTH YYYY, DAY') FROM TABELA_DE_CLIENTES;

SELECT SYSDATE + 127 FROM DUAL;
SELECT NOME, IDADE, (SYSDATE - DATA_DE_NASCIMENTO)/365 FROM TABELA_DE_CLIENTES;
SELECT MONTHS_BETWEEN(SYSDATE, DATA_DE_NASCIMENTO) FROM TABELA_DE_CLIENTES;

SELECT ADD_MONTHS(SYSDATE, 10) FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'SEXTA') FROM DUAL;
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;
SELECT SYSDATE + 200, ROUND(SYSDATE + 200, 'YEAR') FROM DUAL;

---ROUND - BASICAMENTE ELE ARREDONDA O NUMERO OU PRA CIMA OU PARA BAIXO
--TRUNC -- VAI ARREDONDAR PARA BAIXO
--CEIL -- VAI ARRENDONDAR PARA CIMA
--O FLOOR pega o primeiro n�mero inteiro antes da casa decimal, ou seja, funciona assim como o TRUNC.
--O POWER retorna o valor da express�o especificada para a pot�ncia indicada. Sendo assim, se tivermos POWER (10, 2) teremos 10�.
--A fun��o EXP retorna e elevado � en�sima pot�ncia, de forma com que e = 2,71828183... . A fun��o retorna um valor do mesmo tipo do argumento.
--O SQRT retorna a raiz quadrada de n.
--O SIGN retorna tr�s valores diferente. Se o n�mero for negativo ele devolve -1, se for n�lo devolve 0 e se o n�mero for positivo devolve 1.
--A fun��o ABS sempre deixa o n�mero positivo. Isso significa que o valor absoluto de 10 � 10 e o valor absoluto de -10 tamb�m � 10.
--O MOD retorna o restante de n2 dividido por n1 e se n1 for 0 retorna n2.
SELECT 3.4 FROM DUAL;

SELECT ROUND(3.4) FROM DUAL;

SELECT ROUND(3.6) FROM DUAL;

SELECT ROUND(3.5) FROM DUAL;

SELECT TRUNC(3.4) FROM DUAL;

SELECT TRUNC(3.6) FROM DUAL;

SELECT TRUNC(3.5) FROM DUAL;


SELECT CEIL(3.4) FROM DUAL;

SELECT CEIL(3.6) FROM DUAL;

SELECT CEIL(3.5) FROM DUAL;

SELECT FLOOR(3.4) FROM DUAL;

SELECT FLOOR(3.6) FROM DUAL;

SELECT FLOOR(3.5) FROM DUAL;


SELECT POWER(10,4) FROM DUAL;
SELECT POWER(34,4) FROM DUAL;
SELECT EXP(4) FROM DUAL;

SELECT SQRT(144) FROM DUAL;

SELECT ABS(10) FROM DUAL;

SELECT MOD(10, 6) FROM DUAL;

--Outra fun��o bem importante � a EXTRACT. Ela extrai um peda�o da data, que pode ser o ano, m�s, dia, hora, minuto e assim por diante.
--Ele converte um texto string em n�mero.
--A fun��o NVL testa se o valor � nulo. Se for, ele converte o resultado em um determinado valor.
--No caso do GREATEST, se tivermos uma s�rie de n�meros separados por v�rgula ele vai dizer qual � o n�mero maior.

SELECT EXTRACT(MONTH FROM TO_DATE('12/11/2019','DD/MM/YYYY')) FROM DUAL;
SELECT EXTRACT(MONTH FROM TO_DATE('12/11/2019','MM/DD/YYYY')) FROM DUAL;
SELECT '10' + 10 FROM DUAL;
SELECT TO_NUMBER('10') + 10 FROM DUAL;
SELECT TO_CHAR(1234.123, '9999') FROM DUAL;
SELECT TO_CHAR(1234.123, '9999.999') FROM DUAL;
SELECT TO_CHAR(1234.123, '9999,999') FROM DUAL;
SELECT NVL(10,0) FROM DUAL;
SELECT NVL(null,0) FROM DUAL;

SELECT
TV.NOME AS NOME_VENDEDOR,
TV.BAIRRO AS NOME_BAIRRO_VENDEDOR,
TC.NOME AS NOME_CLIENTE,
TC.BAIRRO AS NOME_BAIRRO_CLIENTE
FROM
TABELA_DE_VENDEDORES TV
FULL JOIN
TABELA_DE_CLIENTES TC
ON TV.BAIRRO = TC.BAIRRO;

SELECT
NVL(TV.NOME,'N�O ENCONTRADO') AS NOME_VENDEDOR,
NVL(TV.BAIRRO,'N�O ENCONTRADO') AS NOME_BAIRRO_VENDEDOR,
NVL(TC.NOME,'N�O ENCONTRADO') AS NOME_CLIENTE,
NVL(TC.BAIRRO,'N�O ENCONTRADO') AS NOME_BAIRRO_CLIENTE
FROM
TABELA_DE_VENDEDORES TV
FULL JOIN
TABELA_DE_CLIENTES TC
ON TV.BAIRRO = TC.BAIRRO;