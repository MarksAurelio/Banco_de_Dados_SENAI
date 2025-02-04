create database lojinha;

use lojinha;

create table cliente(
id int,
nome varchar(100) not null,
constraint PK_cliente primary key (id));

create table email_cliente(
id int,
email varchar(100),
id_cliente int,
constraint PK_email_cliente primary key (id),
constraint FK_id_cliente foreign key (id_cliente) references cliente(id));

create table pedido(
id int,
data date,
id_cliente int,
constraint PK_pedido primary key (id),
constraint FK_pedido_cliente foreign key (id_cliente) references cliente(id));

create table categoria(
id int,
nome varchar(100),
constraint PK_categoria primary key (id));

create table fornecedor(
id int, 
nome varchar(200),
constraint PK_fornecedor primary key (id));

create table produto(
id int, 
descricao varchar(200),
id_categoria int,
id_fornecedor int,
estoque int,
constraint PK_produto primary key (id),
constraint FK_produto_categoria foreign key (id_categoria) references categoria(id),
constraint FK_produto_fornecedor foreign key (id_fornecedor) references fornecedor(id));