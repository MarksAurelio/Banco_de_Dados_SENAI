create database dbloja;
use dbloja;

create table categoria(
id_categoria int auto_increment not null,
nome varchar(100),
constraint PK_Categoria primary key (id_categoria));

create table produto(
id_produto int auto_increment not null,
nome varchar(100),
preco float(5.2),
id_categoria int not null,
constraint PK_Produto primary key (id_produto),
constraint FK_ProdutoCategoria foreign key (id_categoria) references categoria(id_categoria));

create table rl_pedido_produto(
id_pedido int not null,
id_produto int not null,
quantidade int,
constraint PK_PedidoProduto primary key (id_produto, id_pedido),
constraint FK_PedidoRlPedidoProduto foreign key (id_pedido) references pedido(id_pedido),
constraint FK_ProdutoRlPedidoProduto foreign key (id_produto) references produto(id_produto));

create table pedido(
id_pedido int auto_increment not null,
data_pedido date,
total_pedido float(5.2),
id_cliente int not null,
constraint PK_Pedido primary key (id_pedido),
constraint FK_Cliente foreign key (id_cliente) references cliente(id_cliente));

create table cliente(
id_cliente int auto_increment not null,
nome varchar(100),
limite_credito float(5.2),
status_cliente varchar(10),
cep varchar(10),
logradouro varchar(200),
numero int,
constraint PK_Cliente primary key (id_cliente));

