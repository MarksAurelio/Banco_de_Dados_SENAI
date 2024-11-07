create database dbmaternidade;
use dbmaternidade;

create table mae(
id_mae int auto_increment not null,
rg varchar(10),
endereco varchar(200),
telefone varchar(20),
data_nascimento date,
constraint PK_Mae primary key (id_mae));



create table medico(
crm int not null,
nome varchar(120),
telefone varchar(20),
especialidade varchar(100),
constraint PK_Medico primary key (crm));

create table bebe(
id_bebe int auto_increment not null,
nome varchar(100),
data_nascimento date,
peso float(5,2),
altura int,
crm int not null,
id_mae int not null,
constraint PK_Bebe primary key (id_bebe),
constraint FK_BebeMae foreign key (id_mae) references mae(id_mae),
constraint FK_BebeMedico foreign key (crm) references medico(crm));