CREATE DATABASE GUFI_MANHA
GO

USE GUFI_MANHA

CREATE TABLE tipoUsuario(
	idTipoUsuario int primary key identity (1,1),
	tituloTipopUsuario varchar(30) unique not null,
);
GO

CREATE TABLE tipoEvento(
	idTipoEvento int primary key identity (1,1),
	tituloTipoEvento varchar(50) unique not null,
);
GO

CREATE TABLE instituicao(
	idInstituicao int primary key identity (1,1),
	cnpj varchar(14) unique not null,
	nomeFantasia varchar(100) not null,
	endereco varchar(250) unique not null,
);
GO

CREATE TABLE situacao(
	idSituacao int primary key identity (1,1),
	descricao varchar(50)
);
GO

CREATE TABLE usuario(
	idUsuario int primary key identity (1,1),
	idTipoUsuario int foreign key references tipoUsuario(idTipoUsuario),
	nomeUsuario varchar(50) not null,
	email varchar(200) unique not null,
	senha varchar(10) not null,
);
GO

CREATE TABLE evento(
	idEvento int primary key identity (1,1),
	idTipoEvento int foreign key references tipoEvento(idTipoEvento),
	idInstituicao int foreign key references instituicao(idInstituicao),
	nomeEvento varchar(100) not null,
	descricao varchar(500) not null,
	acessoLivre bit default (1),
	dataEvento datetime not  null,
);
GO

CREATE TABLE presenca(
	idPresenca int primary key identity (1,1),
	idUsuario int foreign key references usuario(idUsuario),
	idEvento int foreign key references evento(idEvento),
	idSituacao int foreign key references situacao(idSituacao),
);
GO