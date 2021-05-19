-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!
/* para sql server - remoto - produção */
CREATE TABLE leitura (
  id INT IDENTITY,
  temperatura DECIMAL,
  umidade DECIMAL,
  momento DATETIME,
  fkcaminhao INT
);
CREATE TABLE usuario (
  id INT IDENTITY,
  nome VARCHAR(50),
  login VARCHAR(50),
  senha VARCHAR(50)
);
/* para workbench - local - desenvolvimento */
create database FreshDragonFruit;
use FreshDragonFruit;
create table tbClientes(
  idCliente int primary key auto_increment,
  nome varchar(25),
  sobrenome varchar(35),
  cpf varchar(12),
  email varchar(60),
  telefone varchar(15),
  usuario varchar(20),
  senha varchar(30)
) auto_increment = 1;


create table tbUsuarios(
  idUsuario int primary key auto_increment,
  nome varchar(25),
  usuario varchar(20),
  cpf varchar(12),
  email varchar(60),
  senha varchar(30),
  telefone varchar(15),
  nvlAcesso char(1),
  check (
    nvlAcesso = 'A'
    or nvlAcesso = 'B'
    or nvlAcesso = 'C'
  ),
  fkCliente int,
  foreign key (fkCliente) references tbClientes (idCliente)
) auto_increment = 1001;


create table tbPlantacoes(
  idPlantacao int primary key auto_increment,
  hectares int,
  qtdPes int,
  cep varchar(10),
  endereco varchar(45),
  fkCliente int,
  foreign key (fkCliente) references tbClientes (idCliente)
) auto_increment = 2001;


create table tbSensores(
  idSensor int primary key auto_increment,
  modelo varchar(30),
  coordenadas varchar(20),
  dtInstalacao date,
  fkPlantacao int,
  foreign key (fkPlantacao) references tbPlantacoes (idPlantacao)
) auto_increment = 3001;


create table tbRegistros(
  idRegistro int primary key auto_increment,
  temperatura float,
  nvlAlerta int,
  dtMedicao datetime,
  check (
    nvlAlerta = 1
    or nvlAlerta = 2
    or nvlAlerta = 3
    or nvlAlerta = 4
    or nvlAlerta = 5
    or nvlAlerta = 6
    or nvlAlerta = 7
  ),
  fkSensor int,
  foreign key (fkSensor) references tbSensores (idSensor)
) auto_increment = 4001;