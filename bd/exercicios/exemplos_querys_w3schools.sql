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

SELECT o.OrderID, c.CustomerName, o.OrderDate
FROM Orders AS o
INNER JOIN Customers AS c ON o.CustomerID = c.CustomerID;
INNER JOIN Customers AS c ON o.CustomerID = c.CustomerID;
/*
Diferentes tipos de SQL JOINs
Aqui estão os diferentes tipos de JOINs em SQL:
(INNER) JOIN: Retorna registros que possuem valores correspondentes em ambas as tabelas
(LEFT)  JOIN: Retorna todos os registros da tabela da esquerda e os registros correspondentes da tabela da direita
(RIGHT) JOIN: Retorna todos os registros da tabela da direita e os registros correspondentes da tabela da esquerda
(FULL)  JOIN: Retorna todos os registros quando há uma correspondência na tabela esquerda ou direita
*/
-- Junte produtos e categorias com a palavra-chave INNER JOIN:
SELECT ProductID, ProductName, CategoryName FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;
-- JOIN a três tabelas
-- A seguinte instrução SQL seleciona todos os pedidos com informações do cliente e do remetente:
SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);
-- SELECT * FROM Customers , Orders WHERE Customers.CustomerID = Orders.CustomerID;
-- Exemplo de SQL LEFT JOIN
-- A seguinte instrução SQL selecionará todos os clientes e quaisquer pedidos que eles possam ter:
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;
-- A seguinte instrução SQL retornará todos os funcionários e quaisquer pedidos que eles possam ter feito:
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;
