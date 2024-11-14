/*
O operador SQL IN
O INoperador permite que você especifique vários valores em uma WHEREcláusula.
O INoperador é uma abreviação para múltiplas ORcondições.
*/
SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');
/*
Função MySQL SUBSTR()
Extraia uma substring de uma string (comece na posição 5, extraia 3 caracteres)
*/
SELECT SUBSTR("SQL Tutorial", 5, 3) AS ExtractString;
/*
Extraia uma substring de uma string (comece do final, na posição -5, extraia 5 caracteres):
*/
SELECT SUBSTR("SQL Tutorial", -5, 5) AS ExtractString;
/*
A cláusula SQL SELECT LIMIT 
A SELECT LIMIT cláusula é usada para especificar o número de registros a serem retornados.
A SELECT LIMIT cláusula é útil em tabelas grandes com milhares de registros. Retornar um grande número de registros pode impactar o desempenho.
*/
SELECT * FROM Customers LIMIT 5;
/*
Funções de agregação SQL
Uma função agregada é uma função que executa um cálculo em um conjunto de valores e retorna um único valor.
Funções agregadas são frequentemente usadas com a GROUP BYcláusula da SELECT instrução. A GROUP BYcláusula divide o conjunto de resultados em grupos de valores e a função agregada pode ser usada para retornar um único valor para cada grupo.
As funções de agregação SQL mais comumente usadas são:
MIN()- retorna o menor valor dentro da coluna selecionada
MAX()- retorna o maior valor dentro da coluna selecionada
COUNT()- retorna o número de linhas em um conjunto
SUM()- retorna a soma total de uma coluna numérica
AVG()- retorna o valor médio de uma coluna numérica
Funções de agregação ignoram valores nulos (exceto para COUNT()).
*/

SELECT MIN(Price), MAX(Price), COUNT(*), SUM(Price), AVG(Price) FROM Products;