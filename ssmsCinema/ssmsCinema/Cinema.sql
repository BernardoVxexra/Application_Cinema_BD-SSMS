--Criando o Banco com o nome Cinema
CREATE DATABASE Cinema;

-- Abrir o banco cinema
use Cinema;
SELECT 
FROM   Papel INNER JOIN
             Ator INNER JOIN
             Filme_Ator ON Ator.Cod_ator = Filme_Ator.Cod_ator INNER JOIN
             Filme ON Filme_Ator.Cod_filme = Filme.Cod_filme INNER JOIN
             Genero ON Filme.Cod_genero = Genero.Cod_genero ON Papel.Cod_papel = Filme_Ator.Cod_papel INNER JOIN
             Sessao ON Filme.Cod_filme = Sessao.Cod_filme INNER JOIN
             Ingresso INNER JOIN
             Funcionario ON Ingresso.Cod_funcionario = Funcionario.Cod_funcionario INNER JOIN
             Cliente ON Ingresso.Cod_cliente = Cliente.Cod_cliente ON Sessao.Cod_sessao = Ingresso.Cod_sessao INNER JOIN
             Sala ON Sessao.Cod_sala = Sala.Cod_sala INNER JOIN
             Tipo ON Ingresso.Cod_tipo = Tipo.Cod_tipo
--Criando a tabela sala
 CREATE TABLE Sala (
    Cod_sala int identity,
    Capacidade int NOT NULL,
    Descricao varchar (30) NULL,
    PRIMARY KEY (Cod_sala) --Definição de PK
 );SELECT 
FROM   Papel INNER JOIN
             Ator INNER JOIN
             Filme_Ator ON Ator.Cod_ator = Filme_Ator.Cod_ator INNER JOIN
             Filme ON Filme_Ator.Cod_filme = Filme.Cod_filme INNER JOIN
             Genero ON Filme.Cod_genero = Genero.Cod_genero ON Papel.Cod_papel = Filme_Ator.Cod_papel INNER JOIN
             Sessao ON Filme.Cod_filme = Sessao.Cod_filme INNER JOIN
             Ingresso INNER JOIN
             Funcionario ON Ingresso.Cod_funcionario = Funcionario.Cod_funcionario INNER JOIN
             Cliente ON Ingresso.Cod_cliente = Cliente.Cod_cliente ON Sessao.Cod_sessao = Ingresso.Cod_sessao INNER JOIN
             Sala ON Sessao.Cod_sala = Sala.Cod_sala INNER JOIN
             Tipo ON Ingresso.Cod_tipo = Tipo.Cod_tipo

  CREATE TABLE Genero (
    Cod_genero int identity,
    Descricao varchar (100),
    PRIMARY KEY (Cod_genero) --Definição de PK
 );

  CREATE TABLE Filme(
    Cod_filme int identity,
    Titulo varchar (30) NOT NULL,
    duracao time, 
    Cod_genero int,
    PRIMARY KEY (Cod_filme),--Definição de PK
    foreign key (Cod_genero) references Genero --Definição de FK
 );

 CREATE TABLE Sessao (
    Cod_sessao int identity,
    Cod_sala int,
    Horario time,
    Cod_filme int,
    PRIMARY KEY (Cod_sessao),
    foreign key(Cod_sala) references Sala, --Definição de FK
    foreign key(Cod_filme) references Filme
 );

 CREATE TABLE Cliente (
    Cod_cliente int identity,
    Nome varchar (30) NOT NULL,
    Telefone varchar (13) NOT NULL,
    DataNasc date,
    RG varchar (10) NULL,
    PRIMARY KEY (Cod_cliente)
 );



 CREATE TABLE Funcionario(
    Cod_funcionario int identity,
    Nome varchar (30) NOT NULL,
    Telefone varchar (11) NOT NULL,
    Endereco varchar (50)NOT NULL,
    RG varchar (10)NOT NULL,
    PRIMARY KEY (Cod_funcionario)
 );

 CREATE TABLE Tipo ( --Tipo de Ingresso
        Cod_tipo int identity,
        Descricao varchar (25) NOT NULL,
        PRIMARY KEY (Cod_tipo)
 );

 CREATE TABLE Ingresso (
    Cod_ingresso int identity,
    Cod_sessao int,
    Cod_cliente int,
    Cod_tipo int,
    Cod_funcionario int,
    PRIMARY KEY (Cod_ingresso), --Definição de PK
    --Definições de FK
    foreign key (Cod_sessao) references Sessao,
    foreign key (Cod_cliente) references Cliente,
    foreign key (Cod_tipo) references Tipo, --Tipo de Ingresso
    foreign key (Cod_funcionario) references Funcionario

 );


 CREATE TABLE Papel (
    Cod_papel int identity ,
    Descricao varchar(100) NOT NULL,
    PRIMARY KEY (Cod_papel)
 );

 CREATE TABLE Ator (
    Cod_ator int identity,
    Nome varchar (30) NOT NULL,
    Genero varchar (20) NOT NULL,
    Telefone varchar (13) NOT NULL,
    RG varchar(11) NOT NULL,
    CPF varchar(11) NOT NULL,
    PRIMARY KEY (Cod_ator)
 );

 CREATE TABLE Filme_Ator (
    Cod_filme_ator int identity,
    Cod_ator int, 
    Cod_filme int,
    Cod_papel int,
    PRIMARY KEY (Cod_filme_ator), --Definição de PK
    foreign key (Cod_ator) references Ator,
    foreign key (Cod_filme) references Filme,
    foreign key (Cod_papel) references Papel
 );

