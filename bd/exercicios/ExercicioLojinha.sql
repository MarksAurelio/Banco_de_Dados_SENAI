EXERCÍCIOS 
1. Crie um banco de dados denominado lojinha. 
CREATE DATABASE lojinha;

2. Dentro deste banco de dados, crie as seguintes tabelas e insira os seguintes dados: 
USE lojinha;

CREATE TABLE Cliente (
  id INT PRIMARY KEY,
  nome VARCHAR(100)
);

CREATE TABLE EmailCliente (
  id INT PRIMARY KEY,
  email VARCHAR(100),
  idCliente INT,
  FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);

CREATE TABLE Pedido (
  id INT PRIMARY KEY,
  data DATE,
  idCliente INT,
  FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);

CREATE TABLE Produto (
  id INT PRIMARY KEY,
  descricao VARCHAR(100),
  idCategoria INT,
  idFornecedor INT,
  estoque INT,
  FOREIGN KEY (idCategoria) REFERENCES Categoria(id),
  FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(id)
);

CREATE TABLE Categoria (
  id INT PRIMARY KEY,
  nome VARCHAR(100)
);

CREATE TABLE Fornecedor (
  id INT PRIMARY KEY,
  nome VARCHAR(100)
);

CREATE TABLE PedidoProduto (
  id INT PRIMARY KEY,
  idPedido INT,
  idProduto INT,
  quantidade INT,
  FOREIGN KEY (idPedido) REFERENCES Pedido(id),
  FOREIGN KEY (idProduto) REFERENCES Produto(id)
);

INSERT INTO Cliente (id, nome) VALUES
(1, 'Ana'),
(2, 'José'),
(3, 'João');

INSERT INTO EmailCliente (id, email, idCliente) VALUES
(1, 'e1', 1),
(2, 'e2', 1),
(3, 'e3', 2),
(4, 'e4', 2),
(5, 'e5', 3);

INSERT INTO Pedido (id, data, idCliente) VALUES
(1, '2015-10-05', 1),
(2, '2014-12-31', 1),
(3, '2010-09-10', 2),
(4, '2015-03-14', 2),
(5, '2014-07-21', 2);

INSERT INTO Categoria (id, nome) VALUES
(1, 'Ferramenta'),
(2, 'Alimento'),
(3, 'Vestuário');

INSERT INTO Fornecedor (id, nome) VALUES
(1, 'F1'),
(2, 'F2'),
(3, 'F3');

INSERT INTO Produto (id, descricao, idCategoria, idFornecedor, estoque) VALUES
(1, 'Alicate', 1, 1, 10),
(2, 'Leite', 2, 1, 100),
(3, 'Suco', 2, 1, 50),
(4, 'Camisa', 3, 2, 40),
(5, 'Calça', 3, 2, 20);

INSERT INTO PedidoProduto (id, idPedido, idProduto, quantidade) VALUES
(1, 1, 1, 10),
(2, 1, 2, 20),
(3, 2, 3, 5),
(4, 3, 4, 10),
(5, 4, 5, 5);

Responda, através de SQL, as seguintes perguntas: 
a) Mostre todos os clientes com seus e-mails organizados pelo nome do cliente 
SELECT c.nome, ec.email 
FROM Cliente c
INNER JOIN EmailCliente ec ON c.id = ec.idCliente
ORDER BY c.nome;

b) Mostre todos os pedidos realizados entre 2010 e 2014 
SELECT * FROM Pedido
WHERE data BETWEEN '2010-01-01' AND '2014-12-31';

c) Mostre todos os clientes que possuem pedidos entre 2015 e 2016 
SELECT DISTINCT c.nome FROM Cliente c
INNER JOIN Pedido p ON c.id = p.idCliente
WHERE p.data BETWEEN '2015-01-01' AND '2016-12-31';

d) Mostre o nome das categorias que iniciam pela letra f, organizadas pelo nome da categoria de forma descendente, sem valores repetidos 
SELECT DISTINCT nome FROM Categoria
WHERE nome LIKE 'f%'
ORDER BY nome DESC;

e) Apresente o total de produtos que são da categoria Vestuário
SELECT COUNT(*) AS total_produtos FROM Produto
WHERE idCategoria = (SELECT id FROM Categoria WHERE nome = 'Vestuário');

f) Mostre o nome da categoria e o total em estoque de cada produto agrupado por categoria 
SELECT c.nome AS categoria, SUM(p.estoque) AS total_em_estoque FROM Produto p
INNER JOIN Categoria c ON p.idCategoria = c.id
GROUP BY c.nome;

g) Mostre o nome do produto com o nome do respectivo fornecedor 
SELECT p.nome AS produto, f.nome AS fornecedor FROM Produto p
INNER JOIN Fornecedor f ON p.idFornecedor = f.id;

h) Para o cliente com id=01, mostre a data de todos os pedidos efetuados classificados pela data do pedido 
SELECT data_pedido FROM Pedidos
WHERE id_cliente = 01
ORDER BY data_pedido ASC;

i) Liste a descrição e a quantidade pedida de cada produto 
SELECT p.descricao, ip.quantidade FROM Produtos p
INNER JOIN Itens_Pedido ip ON p.id_produto = ip.id_produto;

j) Na tabela produto, insira um novo campo chamado preco do tipo decimal(5,2). Utilize o comando update 
e atribua 10% do valor do estoque do produto para este novo campo (preco), ou seja, para estoque igual a 100, o preco deverá ser de 10.
ALTER TABLE produto
ADD preco DECIMAL(5,2)
UPDATE produto
SET preco = estoque * 0.1
WHERE estoque > 100;

k) Na tabela produto, informe o maior valor de estoque 
SELECT MAX(estoque) AS maior_valor_estoque
FROM produto;

