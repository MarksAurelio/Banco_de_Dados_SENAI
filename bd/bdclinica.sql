create database dbclinica;
use dbclinica;

create table sala(
numero_sala int check(numero_sala > 1 and numero_sala < 50),
andar int not null check(andar < 12),
crm int not null,
constraint PK_Sala primary key(numero_sala),
constraint FK_SalaMedicos foreign key (crm) references medicos(crm));

create table medicos(
crm int,
nome varchar(40) not null,
idade int check(idade > 23),
especialidade varchar(20) not null default('Ortopedia'),
cpf varchar(15) unique not null,
data_admissao date,
constraint PK_Medicos primary key(crm));

create table pacientes(
cpf varchar(11),
nome varchar(40) not null,
data_nascimento date,
cidade varchar(30) default ('Taguatinga'),
doenca varchar(40) not null,
plano_saude varchar(40) not null default ('SUS'),
constraint PK_Pacientes primary key(cpf));

create table funcionarios(
matricula int auto_increment,
nome varchar(40) not null,
data_nascimento date not null,
data_admissao date not null,
cargo varchar(40) not null default ('Assistente Médico'),
salario_decimal decimal(8,2) not null default(1510.00),
constraint PK_Funcionario primary key(matricula));

create table consultas(
codigo_consulta int auto_increment,
data_horario datetime,
cpf varchar(11) not null,
crm int not null,
constraint PK_Consultas primary key(codigo_consulta),
constraint FK_ConsultasMedicos foreign key (crm) references medicos(crm),
constraint FK_ConsultasPacientes foreign key (cpf) references pacientes(cpf));


